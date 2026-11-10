---@meta _

-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

--[[
Numeric ID of a registered ore, as returned by `core.register_ore`.
]]
---@alias core.OreID int

-- ------------------------------ OreDef.__base ----------------------------- --

---@class _.OreDef.__base
--[[
If set, `core.registered_ores[name]` returns this definition.
]]
---@field name string?
--[[
Ore node to place
]]
---@field  ore core.Node.name
--[[
Param2 to set for ore (e.g. facedir rotation)
]]
---@field ore_param2 core.Param2?
--[[
Node to place ore in. Multiple are possible by passing a list.
]]
---@field  wherein OneOrMany<core.Node.name>
--[[
Lower limit for ore (inclusive). Integer [s16], default `-31000`.
]]
---@field y_min int?
--[[
Upper limit for ore (inclusive). Integer [s16], default `31000`.
]]
---@field y_max int?
--[[
List of biomes in which this ore occurs.
Occurs in all biomes if this is omitted, and ignored if the Mapgen
being used does not support biomes.
Can be a list of (or a single) biome names, IDs, or definitions.
]]
---@field biomes OneOrMany<string>?

-- --------------------------------- OreDef --------------------------------- --

--[[
Ore definition, as passed to `core.register_ore`.
The `ore_type` field selects the variant: `"scatter"`, `"sheet"`, `"puff"`,
`"blob"`, `"vein"` or `"stratum"`. See the "Ores" section for the
behavior of each type and which common parameters it ignores.
]]
---@alias core.OreDef
--- | core.OreDef.scatter.uniform
--- | core.OreDef.scatter.nonuniform
--- | core.OreDef.sheet
--- | core.OreDef.puff
--- | core.OreDef.blob
--- | core.OreDef.vein
--- | core.OreDef.stratum