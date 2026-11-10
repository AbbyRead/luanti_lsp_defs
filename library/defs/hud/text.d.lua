---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Font style bitfield: 1 = bold, 2 = italic, 4 = monospace. Combine by adding the values.
]]
---@alias core.HUDDef.text.style
--- | 0
--- | 1
--- | 2
--- | 3
--- | 4
--- | 5
--- | 6
--- | 7

--[[
Displays text on the HUD. Fields `alignment` and `offset` are inherited.
]]
---@class core.HUDDef.text : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field  type "text"
--[[
Do not use. Previous versions of the documentation claimed this field sets
a "bounding rectangle" for the text, but it never worked.
]]
---@field scale vec2
--[[
The text to be displayed in the HUD element. Supports `core.translate`
(always) and `core.colorize` (since protocol version 44).
]]
---@field text string
--[[
Integer containing the (A)RGB value of the color used to draw the text.
Specify `0xFFFFFF` for white text, `0x80FF0000` for semi-transparent red, and
so on. Alpha only works on Luanti 5.15+ clients; older clients see the text as
opaque. To completely hide a text, set `text` to `""`; setting the alpha value
to `00` will not work for compatibility reasons (it is treated as `FF`).
]]
---@field number int?
--[[
Size of the text. Syntax: `{ x = <number> }`. The player-set font size is
multiplied by `size.x`. Float values are supported by clients >= 5.16.0; older
clients receive a rounded down integer value.
]]
---@field size vec2?
--[[
Determines the font style (bitfield: 1 = bold, 2 = italic, 4 = monospace).
]]
---@field style core.HUDDef.text.style?