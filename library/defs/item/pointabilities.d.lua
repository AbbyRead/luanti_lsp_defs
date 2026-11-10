---@meta _

-- luanti/doc/lua_api.md: Definition tables > Item definition

-- ------------------------- ItemDef.pointabilities ------------------------- --

--[[
Override value for the `pointable` property of a node or object:
* `true`: pointable
* `false`: not pointable
* `"blocking"`: not pointable, but blocks the pointing ray
]]
---@alias core.ItemDef.pointabilities.value
--- | boolean
--- | "blocking"

--[[
Lists to override the `pointable` property of nodes and objects.
The index can be a node/entity name or a group with the prefix `"group:"`.
(For objects `armor_groups` are used and for players the entity name is
irrelevant.)

If multiple fields fit, the following priority order is applied:
1. value of matching node/entity name
2. `true` for any group
3. `false` for any group
4. `"blocking"` for any group
5. `liquids_pointable` if it is a liquid node
6. `pointable` property of the node or object

Also accepted by `core.raycast` and `Raycast` (`pointabilities` argument).
Available since 5.9.0 (see `core.features.item_specific_pointabilities`).
]]
---@class core.ItemDef.pointabilities
--[[
Overrides for nodes, indexed by node name or `"group:<name>"`.
E.g. `["default:stone"] = "blocking"`, `["group:leaves"] = false`.
]]
---@field nodes table<core.Node.namelike, core.ItemDef.pointabilities.value>?
--[[
Overrides for objects, indexed by entity name or `"group:<armor group>"`.
E.g. `["modname:entityname"] = true`, `["group:ghosty"] = true`.
]]
---@field objects table<core.Entity.namelike, core.ItemDef.pointabilities.value>?


-- ----------------------------- ItemDef fields ----------------------------- --

---@class core.ItemDef
--[[
Contains lists to override the `pointable` property of nodes and objects.
See `core.ItemDef.pointabilities` for the index format and priority order.
]]
---@field pointabilities? core.ItemDef.pointabilities