---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Displays a minimap on the HUD. Fields `alignment` and `offset` are inherited. Minimal client protocol version: 44.
]]
---@class core.HUDDef.minimap : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field  type "minimap"
--[[
Size of the minimap to display. Should be a square to avoid distortion.
Syntax: `{ x = <integer>, y = <integer> }`, integers in range [s32].
Negative values represent percentages of the screen (supported starting with
protocol version 45). If either `x` or `y` is specified as a percentage, the
resulting pixel size is used for both `x` and `y`. Example: on a 1920x1080
screen, `{x = 0, y = -25}` results in a 270x270 minimap.
]]
---@field size vec2?