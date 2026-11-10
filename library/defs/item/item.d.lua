---@meta _

-- luanti/doc/lua_api.md: Items

--[[
Name of a tool item, e.g. `"default:pick_wood"`.
]]
---@alias core.Tool.name
--- | string

--[[
Item name (the item's full identifier). `""` is the player's hand (empty
stack). Special items: `"unknown"` (represents every item that has not been
registered), `"air"` and `"ignore"` (nodes).
]]
---@alias core.Item.name
--- | ""
--- | core.Tool.name
--- | core.Node.name

--[[
Item name, or a group table, where either is accepted (e.g. in crafting
recipes, `"group:<name>"` selects items by group).
]]
---@alias core.Item.namelike
--- | core.Groups.item
--- | core.Groups.tool
--- | core.Item.name

--[[
Wear (damage) value of a tool, integer ranging from 0 to 65535. 0 is the
default and is used for unworn tools; 1 to 65535 are used for worn tools,
where a higher value stands for a higher wear. Non-tools technically also
have a wear property, but it is always 0.
]]
---@alias core.Tool.wear int

--[[
Table format of an item or item stack, e.g.
`{name="default:pick_wood", count=1, wear=21323, metadata={}}`.
Empty stacks (name `""`) are always initialized with count = 0.
]]
---@class core.Item.tablefmt
--[[
Full item identifier ("item name").
]]
---@field name core.Item.name
--[[
Amount, between 0 and 65535. Defaults to 1. Tool item stacks cannot have an amount greater than 1.
]]
---@field count int?
--[[
Wear value, see `core.Tool.wear`. Defaults to 0.
]]
---@field wear core.Tool.wear?
--[[
Item metadata (the docs show both `""` and `{}` as empty values).
]]
---@field metadata string|table?

--[=[
Serialized item format, called "itemstring". A simple string with 1-4
components separated by exactly one space character:

`<identifier>[ <amount>[ <wear>[ <metadata>]]]`

Examples: `""` (empty stack), `"default:apple"` (1 apple), `"default:dirt 5"`,
`"default:pick_wood 1 21323"` (a wooden pickaxe, ca. 1/3 worn out).
Ideally use the `ItemStack` format to build complex item strings (especially
with item metadata); `core.itemstring_with_palette` and
`core.itemstring_with_color` can create item strings encoding color
information in their metadata.
]=]
---@alias core.Item.stringfmt string

--[[
Item in itemstring or table format (not as an `ItemStack`).
]]
---@alias core.Item.simple
--- | core.Item.tablefmt
--- | core.Item.stringfmt

--[[
An item or item stack in any of the three formats (itemstring, table format
or `ItemStack`). When an item must be passed to a function, it can usually be
in any of these formats.
]]
---@alias core.Item
--- | core.Item.simple
--- | core.ItemStack