---@meta _

-- luanti/doc/lua_api.md: Map terminology and coordinates
-- luanti/doc/lua_api.md: Lua Voxel Manipulator
-- luanti/doc/lua_api.md: Class reference > `VoxelArea`

-- ------------------------------- constructor ------------------------------ --

--[[
`VoxelArea(pmin, pmax)`: creates a `VoxelArea`.
    * `pmin` and `pmax` are vectors for the minimum and maximum coordinates of
      the bounding box (inclusive).
    * Only integer coordinates (range: [s16]) may be used here.
]]
---@nodiscard
---@param pmin ivector
---@param pmax ivector
---@return VoxelArea
function VoxelArea(pmin, pmax) end

--[[
`VoxelArea:new({MinEdge = pmin, MaxEdge = pmax})`: same as `VoxelArea(pmin, pmax)`.
]]
---@nodiscard
---@param arg {MinEdge:ivector, MaxEdge:ivector}
---@return VoxelArea
function VoxelArea:new(arg) end

-- -------------------------------- VoxelArea ------------------------------- --

--[[
`VoxelArea`
-----------

A helper class for voxel areas.
It can be created via `VoxelArea(pmin, pmax)` or
`VoxelArea:new({MinEdge = pmin, MaxEdge = pmax})`,
where `pmin` and `pmax` are vectors for the minimum
and maximum coordinates of the bounding box (inclusive).
Only integer coordinates (range: [s16]) may be used here.

All numbers used in the methods must be integers.

### Y stride and z stride of a flat array

For a particular position in a voxel area, whose flat array index is known,
it is often useful to know the index of a neighboring or nearby position.
The table below shows the changes of index required for 1 node movements along
the axes in a voxel area:

    Movement    Change of index
    +x          +1
    -x          -1
    +y          +ystride
    -y          -ystride
    +z          +zstride
    -z          -zstride

If, for example:

    local area = VoxelArea(emin, emax)

The values of `ystride` and `zstride` can be obtained using `area.ystride` and
`area.zstride`.
]]
---@class VoxelArea
--[[
Minimum corner of the area (inclusive).
]]
---@field MinEdge ivec
--[[
Maximum corner of the area (inclusive).
]]
---@field MaxEdge ivec
--[[
Change of index for a +1 move along y (see "Y stride and z stride" above).
]]
---@field ystride int
--[[
Change of index for a +1 move along z (see "Y stride and z stride" above).
]]
---@field zstride int
VoxelArea = {}

--[[
* `getExtent()`: returns a 3D vector containing the size of the area formed by
  `MinEdge` and `MaxEdge`.
]]
---@nodiscard
---@return ivec
function VoxelArea:getExtent() end

--[[
* `getVolume()`: returns the volume of the area formed by `MinEdge` and
  `MaxEdge`.
]]
---@nodiscard
---@return int
function VoxelArea:getVolume() end

--[[
* `index(x, y, z)`: returns the index of an absolute position in a flat array
  starting at `1`.
    * `x`, `y` and `z` must be integers to avoid an incorrect index result.
    * The position (x, y, z) is not checked for being inside the area volume,
      being outside can cause an incorrect index result.
    * Useful for things like `VoxelManip`, raw Schematic specifiers,
      `ValueNoiseMap:get2d`/`3dMap`, and so on.
]]
---@nodiscard
---@param x int
---@param y int
---@param z int
---@return int i
function VoxelArea:index(x, y, z) end

--[[
* `indexp(p)`: same functionality as `index(x, y, z)` but takes a vector.
    * As with `index(x, y, z)`, the components of `p` must be integers, and `p`
      is not checked for being inside the area volume.
]]
---@nodiscard
---@param p ivector
---@return int i
function VoxelArea:indexp(p) end

--[[
* `position(i)`: returns the absolute position vector corresponding to index
  `i`.
]]
---@nodiscard
---@param i int
---@return ivec p
function VoxelArea:position(i) end

--[[
* `contains(x, y, z)`: check if (`x`,`y`,`z`) is inside area formed by
  `MinEdge` and `MaxEdge`.
]]
---@nodiscard
---@param x int
---@param y int
---@param z int
---@return boolean
function VoxelArea:contains(x, y, z) end

--[[
* `containsp(p)`: same as `contains`, except takes a vector
]]
---@nodiscard
---@param p ivector
---@return boolean
function VoxelArea:containsp(p) end

--[[
* `containsi(i)`: same as `contains`, except takes an index `i`
]]
---@nodiscard
---@param i int
---@return boolean
function VoxelArea:containsi(i) end

--[=[
* `iter(minx, miny, minz, maxx, maxy, maxz)`: returns an iterator that returns
  indices.
    * from (`minx`,`miny`,`minz`) to (`maxx`,`maxy`,`maxz`) in the order of
      `[z [y [x]]]`.
]=]
---@nodiscard
---@param minx int
---@param miny int
---@param minz int
---@param maxx int
---@param maxy int
---@param maxz int
---@return fun():int?
function VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz) end

--[[
* `iterp(minp, maxp)`: same as `iter`, except takes vectors
]]
---@nodiscard
---@param minp ivector
---@param maxp ivector
---@return fun():int?
function VoxelArea:iterp(minp, maxp) end