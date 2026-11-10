---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Displays distance to a selected world position. Fields `alignment`,
`offset` and `world_pos` are inherited.
]]
---@class core.HUDDef.waypoint : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.alignment, _.HUDDef.world_pos
--[[
Type of the HUD element.
]]
---@field  type "waypoint"
--[[
Distance suffix. Can be blank.
]]
---@field text string?
--[[
Waypoint precision, integer in range [u32]. Defaults to 10. If set to 0,
distance is not shown. Shown value is `floor(distance*precision)/precision`.
When the precision is an integer multiple of 10, there will be
`log_10(precision)` digits after the decimal point; e.g. `precision = 1000`
shows 3 decimal places (`0.999`). In general `precision = n` shows multiples
of `1/n` (`precision = 2` shows multiples of `0.5`).
]]
---@field precision int?
--[[
Integer that specifies an RGB color in 24 bits, with each color component
red, green and blue taking one byte. `0xFF0000` is red, `0x00FF00` is green
and `0x0000FF` is blue.
]]
---@field number int?