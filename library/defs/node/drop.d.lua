---@meta _

-- luanti/doc/lua_api.md: Definition tables > Node definition

-- --------------------------- NodeDef.drop.items --------------------------- --

--[[
One entry of the `items` list of a drop table.
Filtering is applied first, then the chance of drop; if both succeed, the
entire `items` list is dropped.
]]
---@class core.NodeDef.drop.item
--[[
Drops with a 1 in `rarity` chance. Positive integer.
Default is `1`.
]]
---@field rarity int?
--[[
The item list to drop.
]]
---@field items core.Item.name[]?
--[[
Only drop if the used item's name is identical to one of these.
A name prefixed with `~` matches any item whose name contains the rest of the
string (e.g. `"~default:shovel_"`).

* @deprecated 5.X Use `tool_groups` instead
]]
---@field tools core.Tool.name[]?
--[[
Only drop if the used item is in one of these groups. Each entry is a group
name, or a list of group names that must all match, e.g.
`{"magicwand", {"pickaxe", "lucky"}}`.
]]
---@field tool_groups OneOrMany<core.Groups.tool>[]?
--[[
Whether all items in the dropped item list inherit the palette color of the
dug node. Default is `false`.
]]
---@field inherit_color boolean?

-- ------------------------------ NodeDef.drop ------------------------------ --

--[[
Table form of `NodeDef.drop`, allowing multiple items, drop chances and item
filtering.
]]
---@class core.NodeDef.drop.tablefmt
--[[
Maximum number of item lists to drop.
The entries in `items` are processed in order, and processing continues until
the number of dropped item lists equals `max_items`.
Therefore, entries should progress from low to high drop chance.
]]
---@field max_items int?
--[[
Entries processed in order. For each: item filtering is applied, then the
chance of drop.
]]
---@field items core.NodeDef.drop.item?

--[[
Name of the dropped item when dug (item string), or a drop table.
Default dropped item is the node itself.
]]
---@alias core.NodeDef.drop
--- | core.NodeDef.drop.tablefmt
--- | core.Item.stringfmt

-- ----------------------------- NodeDef fields ----------------------------- --

---@class core.NodeDef
--[[
Name of the dropped item when dug, or a drop table for multiple items, drop
chances and item filtering.
Default dropped item is the node itself.
To transfer the palette color to a special drop, a drop table with
`inherit_color` is needed.
]]
---@field drop core.NodeDef.drop?