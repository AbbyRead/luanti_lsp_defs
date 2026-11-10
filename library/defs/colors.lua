---@meta _

-- luanti/doc/lua_api.md: Colors

--[[
Table form of a `ColorSpec`: each element ranges from 0..255.
If `a` is absent, it defaults to 255.
Example: `{a=255, r=0, g=255, b=0}`
]]
---@class core.ColorSpec.tablefmt
--[[
Alpha channel, 0..255. Defaults to 255 if absent.
]]
---@field a int?
--[[
Red channel, 0..255.
]]
---@field r int?
--[[
Green channel, 0..255.
]]
---@field g int?
--[[
Blue channel, 0..255.
]]
---@field b int?

--[[
Result of `core.colorspec_to_table`: all channels are always present.
]]
---@class core.ColorSpec.tablefmt.full: core.ColorSpec.tablefmt
---@field r int
---@field g int
---@field b int
---@field a int

--[[
Named colors, equivalent to
[CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-color).
]]
---@alias core.ColorString.CSSColors
--- | "aliceblue"
--- | "antiquewhite"
--- | "aqua"
--- | "aquamarine"
--- | "azure"
--- | "beige"
--- | "bisque"
--- | "black"
--- | "blanchedalmond"
--- | "blue"
--- | "blueviolet"
--- | "brown"
--- | "burlywood"
--- | "cadetblue"
--- | "chartreuse"
--- | "chocolate"
--- | "coral"
--- | "cornflowerblue"
--- | "cornsilk"
--- | "crimson"
--- | "cyan"
--- | "darkblue"
--- | "darkcyan"
--- | "darkgoldenrod"
--- | "darkgray"
--- | "darkgreen"
--- | "darkgrey"
--- | "darkkhaki"
--- | "darkmagenta"
--- | "darkolivegreen"
--- | "darkorange"
--- | "darkorchid"
--- | "darkred"
--- | "darksalmon"
--- | "darkseagreen"
--- | "darkslateblue"
--- | "darkslategray"
--- | "darkslategrey"
--- | "darkturquoise"
--- | "darkviolet"
--- | "deeppink"
--- | "deepskyblue"
--- | "dimgray"
--- | "dimgrey"
--- | "dodgerblue"
--- | "firebrick"
--- | "floralwhite"
--- | "forestgreen"
--- | "fuchsia"
--- | "gainsboro"
--- | "ghostwhite"
--- | "gold"
--- | "goldenrod"
--- | "gray"
--- | "green"
--- | "greenyellow"
--- | "grey"
--- | "honeydew"
--- | "hotpink"
--- | "indianred"
--- | "indigo"
--- | "ivory"
--- | "khaki"
--- | "lavender"
--- | "lavenderblush"
--- | "lawngreen"
--- | "lemonchiffon"
--- | "lightblue"
--- | "lightcoral"
--- | "lightcyan"
--- | "lightgoldenrodyellow"
--- | "lightgray"
--- | "lightgreen"
--- | "lightgrey"
--- | "lightpink"
--- | "lightsalmon"
--- | "lightseagreen"
--- | "lightskyblue"
--- | "lightslategray"
--- | "lightslategrey"
--- | "lightsteelblue"
--- | "lightyellow"
--- | "lime"
--- | "limegreen"
--- | "linen"
--- | "magenta"
--- | "maroon"
--- | "mediumaquamarine"
--- | "mediumblue"
--- | "mediumorchid"
--- | "mediumpurple"
--- | "mediumseagreen"
--- | "mediumslateblue"
--- | "mediumspringgreen"
--- | "mediumturquoise"
--- | "mediumvioletred"
--- | "midnightblue"
--- | "mintcream"
--- | "mistyrose"
--- | "moccasin"
--- | "navajowhite"
--- | "navy"
--- | "oldlace"
--- | "olive"
--- | "olivedrab"
--- | "orange"
--- | "orangered"
--- | "orchid"
--- | "palegoldenrod"
--- | "palegreen"
--- | "paleturquoise"
--- | "palevioletred"
--- | "papayawhip"
--- | "peachpuff"
--- | "peru"
--- | "pink"
--- | "plum"
--- | "powderblue"
--- | "purple"
--- | "rebeccapurple"
--- | "red"
--- | "rosybrown"
--- | "royalblue"
--- | "saddlebrown"
--- | "salmon"
--- | "sandybrown"
--- | "seagreen"
--- | "seashell"
--- | "sienna"
--- | "silver"
--- | "skyblue"
--- | "slateblue"
--- | "slategray"
--- | "slategrey"
--- | "snow"
--- | "springgreen"
--- | "steelblue"
--- | "tan"
--- | "teal"
--- | "thistle"
--- | "tomato"
--- | "turquoise"
--- | "violet"
--- | "wheat"
--- | "white"
--- | "whitesmoke"
--- | "yellow"
--- | "yellowgreen"

--[[
`"#RGB"` defines a color in hexadecimal format, fully opaque.

`"#RGBA"` defines a color in hexadecimal format, with an alpha channel.

`"#RRGGBB"` defines a color in hexadecimal format, fully opaque.

`"#RRGGBBAA"` defines a color in hexadecimal format, with an alpha channel.

Named colors are also supported and are equivalent to
[CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-color).
To specify the value of the alpha channel, append `#A` or `#AA` to the end of
the color name (e.g. `"darkgreen#08"`).
]]
---@alias core.ColorString
--- | string
--- | core.ColorString.CSSColors

--[[
Numerical form of a `ColorSpec`: the raw integer value of an ARGB8 quad.
Example: `0xFF00FF00`
]]
---@alias core.ColorSpec.numberfmt int

--[[
A ColorSpec specifies a 32-bit color. It can be written in table form
(`{a=255, r=0, g=255, b=0}`), numerical form (`0xFF00FF00`, raw ARGB8) or
string form (a ColorString, e.g. `"green"`).
]]
---@alias core.ColorSpec
--- | core.ColorSpec.tablefmt
--- | core.ColorString
--- | core.ColorSpec.numberfmt