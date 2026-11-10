---@meta _

-- luanti/doc/lua_api.md: Inventory
-- luanti/doc/lua_api.md: Class reference > `InvRef`
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- ------------------------------ InventoryList ----------------------------- --

--[[
Name of an inventory list. Lists of a player inventory:

* `main`: list containing the default inventory
* `craft`: list containing the craft input
* `craftpreview`: list containing the craft prediction
* `craftresult`: list containing the crafted output
* `hand`: list containing an override for the empty hand. Not created
  automatically, use `InvRef:set_size`. Players use the first item in this
  list as their hand; it behaves as if the default hand `""` has been
  overridden for this specific player.

Custom lists can be added and deleted with `InvRef:set_size(name, size)` like
in any other inventory.
]]
---@alias core.InventoryList
--- | "main"
--- | "craft"
--- | "craftpreview"
--- | "craftresult"
--- | "hand"
--- | string

-- -------------------------------- InventoryTable -------------------------------- --

--[[
Table form of a whole inventory (as used by `InvRef:get_lists` and
`InvRef:set_lists`): maps list names to lists of items given in itemstring
format.
]]
---@alias core.InventoryTable.stringfmt table<core.InventoryList, SparseList<core.Item.stringfmt>>

--[[
Table form of a whole inventory (as used by `InvRef:get_lists` and
`InvRef:set_lists`): maps list names to lists of `ItemStack`s.
]]
---@alias core.InventoryTable.ItemStack table<core.InventoryList, SparseList<core.ItemStack>>

--[[
Table form of a whole inventory (as used by `InvRef:get_lists` and
`InvRef:set_lists`): maps list names to lists of items in any item format.
]]
---@alias core.InventoryTable table<core.InventoryList, SparseList<core.Item>>