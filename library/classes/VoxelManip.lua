---@meta _

-- luanti/doc/lua_api.md: Map terminology and coordinates
-- luanti/doc/lua_api.md: Lua Voxel Manipulator
-- luanti/doc/lua_api.md: 'core' namespace reference > Environment access
-- luanti/doc/lua_api.md: Class reference > `VoxelManip`

--[[
Size of a mapblock in nodes (a mapblock is 16x16x16 nodes).
]]
core.MAP_BLOCKSIZE = 16

--[[
A Content ID is a unique integer identifier for a specific node type.
These IDs are used by VoxelManip in place of the node name string for
`VoxelManip:get_data()` and `VoxelManip:set_data()`. You can use
`core.get_content_id()` to look up the Content ID for the specified node
name, and `core.get_name_from_content_id()` to look up the node name string
for a given Content ID.
After registration of a node, its Content ID will remain the same throughout
execution of the mod.
Note that the node being queried needs to have already been been registered.
]]
---@alias core.ContentID int

--[[
Content ID of "unknown" nodes.
]]
---@type core.ContentID
core.CONTENT_UNKNOWN = 125

--[[
Content ID of "air" nodes.
]]
---@type core.ContentID
core.CONTENT_AIR = 126

--[[
Content ID of "ignore" nodes.
]]
---@type core.ContentID
core.CONTENT_IGNORE = 127

-- ---------------------------- VoxelManip.light ---------------------------- --

--[[
Uniform lighting value for `VoxelManip:set_lighting`: `{day=<0...15>, night=<0...15>}`.
]]
---@class core.VoxelManip.light
local VoxelManipLight = {}

--[[
Day light value, `0` to `15`.
]]
---@type core.Light.part
VoxelManipLight.day = nil

--[[
Night light value, `0` to `15`.
]]
---@type core.Light.part
VoxelManipLight.night = nil

-- ------------------------------- constructor ------------------------------ --

--[[
* `VoxelManip([p1, p2])`: creates a `VoxelManip` object.
    * If the optional position parameters are present, the specified region
      will be pre-loaded into the VoxelManip object on creation.
    * Otherwise, the area of map you wish to manipulate must first be loaded
      with `VoxelManip:read_from_map()`, or an empty one created with
      `VoxelManip:initialize()`.
]]
---@nodiscard
---@param p1 ivector?
---@param p2 ivector?
---@return core.VoxelManip
function VoxelManip(p1, p2) end

--[[
* `core.get_voxel_manip([pos1, pos2])`
    * Return voxel manipulator object.
    * Loads the manipulator from the map if positions are passed.
]]
---@nodiscard
---@param p1 ivector?
---@param p2 ivector?
---@return core.VoxelManip
function core.get_voxel_manip(p1, p2) end

-- ------------------------------- VoxelManip ------------------------------- --

--[[
`VoxelManip`
-------------

VoxelManip is a scripting interface to the internal 'Map Voxel Manipulator'
facility. The purpose of this object is for fast, low-level, bulk access to
reading and writing Map content. As such, setting map nodes through VoxelManip
will lack many of the higher level features and concepts you may be used to
with other methods of setting nodes. For example, nodes will not have their
construction and destruction callbacks run, and no rollback information is
logged.

It is important to note that VoxelManip is designed for speed, and *not* ease
of use or flexibility. If your mod requires a map manipulation facility that
will handle 100% of all edge cases, or the use of high level node placement
features, perhaps `core.set_node()` is better suited for the job.

In addition, VoxelManip might not be faster, or could even be slower, for your
specific use case. VoxelManip is most effective when setting large areas of map
at once - for example, if only setting a 3x3x3 node area, a
`core.set_node()` loop may be more optimal. Always profile code using both
methods of map manipulation to determine which is most appropriate for your
usage.

A recent simple test of setting cubic areas showed that `core.set_node()`
is faster than a VoxelManip for a 3x3x3 node cube or smaller.

### Using VoxelManip

Load map data with `read_from_map()` (or `initialize()`), read it in bulk with
`get_data()`, `get_light_data()` and `get_param2_data()` (or a single node with
the slow `get_node_at()`), edit it, set it back with `set_data()`,
`set_light_data()` and `set_param2_data()`, then commit it with
`write_to_map()`.

The tables returned by the bulk getters are a snapshot of the VoxelManip's
internal state at the time of the call; they do not update themselves if
another function modifies the VoxelManip. Any functions that modify a
VoxelManip's contents work on its internal state unless otherwise stated.
The parameter to each bulk setter can be any table in the same flat array
format, not necessarily one retrieved from a getter.

### Flat array format

Let `Nx = p2.X - p1.X + 1`, `Ny = p2.Y - p1.Y + 1` and `Nz = p2.Z - p1.Z + 1`.
For a loaded region p1..p2 the array ranges from `1` up to and including
`Nx * Ny * Nz`. Positions offset from p1 are ordered x first, then y, then z.
The array index for a position p completely inside p1..p2 is:

`(p.Z - p1.Z) * Ny * Nx + (p.Y - p1.Y) * Nx + (p.X - p1.X) + 1`

This is the same "flat 3D array" format as `ValueNoiseMap:get_3d_map_flat()`.
`VoxelArea` can be used to simplify the index calculation.

### Mapgen VoxelManip objects

Inside of `on_generated()` callbacks, the VoxelManip used by the Mapgen can be
retrieved with `core.get_mapgen_object("voxelmanip")`.

* It already has the region of map just generated loaded; it's not necessary
  to call `read_from_map()`. The loaded region is NOT THE SAME as the `minp`,
  `maxp` parameters of `on_generated()`. You still need to call
  `write_to_map()` when done.
* `core.add_node()`, `core.set_node()` and `core.swap_node()` also update the
  Mapgen VoxelManip's internal state active on the current thread.
* After modifying its internal buffer, it may be necessary to update lighting
  using `calc_lighting()` or `set_lighting()`.

### Notes

* Reading data before the map is read gives a zero-length array from
  `get_data()` and an "ignore" node from `get_node_at()`.
* Reading a generated but unloaded region loads it from disk, like
  `core.load_area`.
* Regions not yet generated or outside the map boundaries are filled with
  "ignore" nodes. Writing to not yet generated regions may result in
  unexpected behavior. Use `core.emerge_area` to make sure the area is
  generated.
* Other mods, or the engine itself, could modify the area currently loaded into
  a VoxelManip; except for Mapgen VoxelManips the internal buffers are not
  updated. Complete the usage of a VoxelManip in the same callback it was
  created.
* If a VoxelManip is used often (e.g. in `on_generated()`), pass a file-scoped
  table as the `buffer` parameter of `get_data()` to avoid allocating a new
  table each call.
]]
---@class core.VoxelManip
local VoxelManip = {}

--[[
* `read_from_map(p1, p2)`: Loads a part of the map into the VoxelManip object
  containing the region formed by `p1` and `p2`.
    * returns actual emerged `pmin`, actual emerged `pmax` (MapBlock-aligned)
    * Note that calling this multiple times will *add* to the area loaded in the
      VoxelManip, and not reset it.
]]
---@nodiscard
---@param p1 ivector
---@param p2 ivector
---@return ivec pmin
---@return ivec pmax
function VoxelManip:read_from_map(p1, p2) end

--[[
* `initialize(p1, p2, [node])`: Clears and resizes the VoxelManip object to
  comprise the region formed by `p1` and `p2`.
   * **No data** is read from the map, so you can use this to treat `VoxelManip`
     objects as general containers of node data.
   * `node`: if present the data will be filled with this node; if not it will
     be uninitialized
   * returns actual emerged `pmin`, actual emerged `pmax` (MapBlock-aligned)
   * (introduced in 5.13.0)
]]
---@nodiscard
---@param p1 ivector
---@param p2 ivector
---@param node core.Node.set?
---@return ivec pmin
---@return ivec pmax
function VoxelManip:initialize(p1, p2, node) end

--[[
* `write_to_map([light])`: Writes the data loaded from the `VoxelManip` back to
  the map.
    * **important**: you should call `set_data()` before this, or nothing will change.
    * if `light` is true, then lighting is automatically recalculated.
      The default value is true.
      If `light` is false, no light calculations happen, and you should correct
      all modified blocks with `core.fix_light()` as soon as possible.
      Keep in mind that modifying the map where light is incorrect can cause
      more lighting bugs.
]]
---@param light boolean?
function VoxelManip:write_to_map(light) end

--[[
* `get_node_at(pos)`: Returns a `MapNode` table of the node currently loaded in
  the `VoxelManip` at that position. Simplest but slowest way to read a node.
]]
---@nodiscard
---@param pos ivector
---@return core.Node.get
function VoxelManip:get_node_at(pos) end

--[[
* `set_node_at(pos, node)`: Sets a specific `MapNode` in the `VoxelManip` at
  that position.
]]
---@param pos ivector
---@param node core.Node.set
function VoxelManip:set_node_at(pos, node) end

--[[
* `get_data([buffer])`: Retrieves the node content data loaded into the
  `VoxelManip` object.
    * returns raw node data in the form of an array of node content IDs
    * if the param `buffer` is present, this table will be used to store the
      result instead.
]]
---@param data core.ContentID[]
---@return nil
function VoxelManip:get_data(data) end

--[[
* `get_data([buffer])`: Retrieves the node content data loaded into the
  `VoxelManip` object and returns it as a new array of node content IDs.
    * Passing a `buffer` avoids allocating a new table.
]]
---@nodiscard
---@return core.ContentID[] data
function VoxelManip:get_data() end

--[[
* `set_data(data)`: Sets the data contents of the `VoxelManip` object
]]
---@param data core.ContentID[]
---@return nil
function VoxelManip:set_data(data) end

--[[
* `update_map()`: Does nothing, kept for compatibility.
]]
---@deprecated
function VoxelManip:update_map() end

--[[
* `set_lighting(light, [p1, p2])`: Set the lighting within the `VoxelManip` to
  a uniform value.
    * `light` is a table, `{day=<0...15>, night=<0...15>}`
    * To be used only by a `VoxelManip` object from
      `core.get_mapgen_object`.
    * (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
      area if left out.
]]
---@param light core.VoxelManip.light
---@param p1 ivector?
---@param p2 ivector?
function VoxelManip:set_lighting(light, p1, p2) end

--[[
* `get_light_data([buffer])`: Gets the light data read into the
  `VoxelManip` object
    * Returns an array (indices 1 to volume) of integers ranging from `0` to
      `255`.
    * Each value is the bitwise combination of day and night light values
      (`0` to `15` each).
    * `light = day + (night * 16)`
    * If the param `buffer` is present, this table will be used to store the
      result instead.
]]
---@param buffer core.Light[]
---@return nil
function VoxelManip:get_light_data(buffer) end

--[[
* `get_light_data([buffer])`: Gets the light data read into the
  `VoxelManip` object
    * Returns an array (indices 1 to volume) of integers ranging from `0` to
      `255`.
    * Each value is the bitwise combination of day and night light values
      (`0` to `15` each).
    * `light = day + (night * 16)`
    * If the param `buffer` is present, this table will be used to store the
      result instead.
]]
---@nodiscard
---@return core.Light[] light_data
function VoxelManip:get_light_data() end

--[[
* `set_light_data(light_data)`: Sets the `param1` (light) contents of each node
  in the `VoxelManip`.
    * expects lighting data in the same format that `get_light_data()` returns
]]
---@param light_data core.Light[]
function VoxelManip:set_light_data(light_data) end

--[[
* `get_param2_data([buffer])`: Gets the raw `param2` data read into the
  `VoxelManip` object.
    * Returns an array (indices 1 to volume) of integers ranging from `0` to
      `255`.
    * If the param `buffer` is present, this table will be used to store the
      result instead.
]]
---@param buffer core.Param2[]
---@return nil
function VoxelManip:get_param2_data(buffer) end

--[[
* `get_param2_data([buffer])`: Gets the raw `param2` data read into the
  `VoxelManip` object.
    * Returns an array (indices 1 to volume) of integers ranging from `0` to
      `255`.
]]
---@nodiscard
---@return core.Param2[] param2_data
function VoxelManip:get_param2_data() end

--[[
* `set_param2_data(param2_data)`: Sets the `param2` contents of each node in
  the `VoxelManip`.
]]
---@param param2_data core.Param2[]
function VoxelManip:set_param2_data(param2_data) end

--[[
* `calc_lighting([p1, p2], [propagate_shadow])`:  Calculate lighting within the
  `VoxelManip`.
    * To be used only with a `VoxelManip` object from `core.get_mapgen_object`.
    * (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
      area if left out or nil. For almost all uses these should be left out
      or nil to use the default.
    * `propagate_shadow` is an optional boolean deciding whether shadows in a
      generated mapchunk above are propagated down into the mapchunk, defaults
      to `true` if left out.
]]
---@param p1 vector?
---@param p2 vector?
---@param propagate_shadow boolean?
function VoxelManip:calc_lighting(p1, p2, propagate_shadow) end

--[[
* `update_liquids()`: Update liquid flow
    * Must be called for liquid nodes (`liquidtype ~= "none"`) set in the
      VoxelManip to begin flowing. Call it after having written all buffered
      data back to the VoxelManip object.
]]
function VoxelManip:update_liquids() end

--[[
* `was_modified()`: Returns `true` if the data in the VoxelManip has been modified
   since it was last read from the map. This means you have to call `get_data()` again.
   This only applies to a `VoxelManip` object from `core.get_mapgen_object`,
   where the engine will keep the map and the VM in sync automatically.
   * Note: this doesn't do what you think it does and is subject to removal. Don't use it!
]]
---@deprecated
---@nodiscard
---@return boolean
function VoxelManip:was_modified() end

--[[
* `get_emerged_area()`: Returns actual emerged minimum and maximum positions.
* "Emerged" does not imply that this region was actually loaded from the map,
   if `initialize()` has been used.
]]
---@nodiscard
---@return ivec emin
---@return ivec emax
function VoxelManip:get_emerged_area() end

--[[
* `close()`: Frees the data buffers associated with the VoxelManip object.
   It will become empty.
   * Since Lua's garbage collector is not aware of the potentially significant
     memory behind a VoxelManip, frequent VoxelManip usage can cause the server to
     run out of RAM. Therefore it's recommend to call this method once you're done
     with the VoxelManip.
   * (introduced in 5.13.0)
]]
function VoxelManip:close() end