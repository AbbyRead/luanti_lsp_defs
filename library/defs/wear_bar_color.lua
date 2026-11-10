---@meta _

-- luanti/doc/lua_api.md: Definition tables > Wear Bar Color

--[[
Table form of the wear bar color. 'Wear Bar' is a property of items that
defines the coloring of the bar that appears under damaged tools.
]]
---@class core.WearBarColor.tablefmt
--[[
`"linear"` blends smoothly between each defined color point; `"constant"`
(also used if `nil`) makes each color start at its defined point and continue
up to the next point.
]]
---@field  blend "linear"|"constant"?
--[[
`ColorSpec` color values assigned to float durability keys. "Durability" is
defined as `1 - (wear / 65535)`.
]]
---@field  color_stops table<number, core.ColorSpec>

--[[
Wear bar color: a table, or a single `ColorSpec` as a shortcut. If it is
absent, the default behavior of green-yellow-red is used.
]]
---@alias core.WearBarColor
--- | core.ColorSpec
--- | core.WearBarColor.tablefmt