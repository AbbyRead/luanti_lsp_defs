---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Mapgen environment

--[[
* `core.register_mapgen_script(path)`:
    * Register a path to a Lua file to be imported when a mapgen environment
      is initialized. Run in order of registration.

The map generator threads, which also contain the mapgen Lua environment, are
initialized after all mods have been loaded by the server. After that the
registered scripts (not all mods!) are run during initialization of the mapgen
environment. After that only callbacks happen. The mapgen env does not have a
global step or timer.
]]
---@param path core.Path
function core.register_mapgen_script(path) end

--[[
APIs available in the mapgen environment ("emerge environment"), which runs the
map generator on separate threads. Its primary purpose is to allow mods to
operate on newly generated parts of the map to e.g. generate custom structures.
It is isolated like the async environment (see `corelib.async`).

Classes:

* `AreaStore`, `ItemStack`, `ValueNoise`, `ValueNoiseMap`, `PseudoRandom`,
  `PcgRandom`, `SecureRandom`, `VoxelArea`, `Settings`
* `VoxelManip`: only given by callbacks; cannot access rest of map

Functions:

* Standalone helpers such as logging, filesystem, encoding, hashing or
  compression APIs
* `core.get_biome_id`, `get_biome_name`, `get_heat`, `get_humidity`,
  `get_biome_data`, `get_mapgen_object`, `get_mapgen_params`,
  `get_mapgen_edges`, `get_mapgen_setting`, `get_noiseparams`,
  `get_decoration_id` and more
* `core.get_node`, `set_node`, `find_node_near`, `find_nodes_in_area`,
  `spawn_tree` and similar; these only operate on the current chunk (if inside
  a callback)
* IPC
]]
---@class corelib.mapgen : corelib.async
local mapgen = {
    get_biome_id = core.get_biome_id,
    get_biome_name = core.get_biome_name,
    get_heat = core.get_heat,
    get_humidity = core.get_humidity,
    get_biome_data = core.get_biome_data,
    get_mapgen_object = core.get_mapgen_object,
    ---@diagnostic disable-next-line: deprecated
    get_mapgen_params = core.get_mapgen_params,
    get_mapgen_edges = core.get_mapgen_edges,
    get_mapgen_setting = core.get_mapgen_setting,
    get_noiseparams = core.get_noiseparams,
    get_decoration_id = core.get_decoration_id,
-- TODO ... and more. it would have been nice if they just list everything that's available

    -- TODO each needs a disclaimer that it operates only in the current chunk. separate this later
    get_node = core.get_node,
    set_node = core.set_node,
    find_node_near = core.find_node_near,
    find_nodes_in_area = core.find_nodes_in_area,
    spawn_tree = core.spawn_tree,
-- TODO ... and more. it would have been nice if they just list everything that's available

    settings = core.settings,

-- TODO async registered_* has functions and userdata set to true instead
    registered_items = core.registered_items,
    registered_nodes = core.registered_nodes,
    registered_tools = core.registered_tools,
    registered_craftitems = core.registered_craftitems,
    registered_aliases = core.registered_aliases,
-- TODO ... and more. it would have been nice if they just list everything that's available
    registered_biomes = core.registered_biomes,
    registered_ores = core.registered_ores,
    registered_decorations = core.registered_decorations,
}

--[[
Callback for `register_on_generated`. Called after the engine mapgen finishes a
chunk but before it is written to the map.

* Chunk data resides in `vmanip`. Other parts of the map are not accessible.
* The area of the chunk is comprised of `minp` and `maxp`; note that it is
  smaller than the emerged area of the VoxelManip.
* Calling `read_from_map()` or `write_to_map()` on the VoxelManip is not
  necessary and is disallowed.
* `blockseed`: integer seed used for this chunk with range [u32]; derived from
  the block position (using integer coordinates in the range [-2048, 2047])
  and the world seed ([u64]) in a mapgen-specific way.
]]
---@alias mapgen.fn.on_generated fun(vmanip:core.VoxelManip, minp:ivec, maxp:ivec, blockseed:int)

--[[
* `core.register_on_generated(function(vmanip, minp, maxp, blockseed))`
    * Called after the engine mapgen finishes a chunk but before it is written to
      the map. See `mapgen.fn.on_generated`.
]]
---@param f mapgen.fn.on_generated
function mapgen.register_on_generated(f) end

--[[
* `core.save_gen_notify(id, data)`
    * Saves data for retrieval using the gennotify mechanism (see
      `core.get_mapgen_object("gennotify")`).
    * Data is bound to the chunk that is currently being processed, so this function
      only makes sense inside the `on_generated` callback.
    * `id`: user-defined ID (a string)
      By convention these should be the mod name with an optional
      colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`
    * `data`: any Lua object (will be serialized, no userdata allowed)
    * returns `true` if the data was remembered. That is if `core.set_gen_notify`
      was called with the same user-defined ID before.
]]
---@param id string
---@param data core.Serializable
---@return true?
function mapgen.save_gen_notify(id, data) end