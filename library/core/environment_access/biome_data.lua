---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Environment access

--[[
Result of `core.get_biome_data`.
]]
---@class core.BiomeData
--[[
The biome id of the biome at that position.
]]
---@field biome core.BiomeID
--[[
The heat at the position.
]]
---@field heat number
--[[
The humidity at the position.
]]
---@field humidity number

--[[
* `core.get_biome_data(pos)`
    * Returns a table containing:
        * `biome` the biome id of the biome at that position
        * `heat` the heat at the position
        * `humidity` the humidity at the position
    * Or returns `nil` on failure.
]]
---@nodiscard
---@param pos ivector
---@return core.BiomeData?
function core.get_biome_data(pos) end