---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global callback registration functions

-- ------------------------------ InventoryInfo ----------------------------- --

--[[
Kind of player inventory action.

* `move`: item was moved within the player inventory
* `put`: item was put into the player inventory from another inventory
* `take`: item was taken from the player inventory and put into another inventory
]]
---@alias core.InventoryInfo.actions
--- | "move"
--- | "put"
--- | "take"

--[[
`inventory_info` for the `move` action.
]]
---@class core.InventoryInfo.move
--[[
Source list name.
]]
---@field from_list core.InventoryList
--[[
Destination list name.
]]
---@field to_list core.InventoryList
--[[
Index in the source list.
]]
---@field from_index int
--[[
Index in the destination list.
]]
---@field to_index int
--[[
Number of items moved.
]]
---@field count int

--[[
`inventory_info` for the `put` and `take` actions.
]]
---@class core.InventoryInfo.put_or_take
--[[
Name of the list put into or taken from.
]]
---@field listname core.InventoryList
--[[
Index in the list.
]]
---@field index int
--[[
The stack put or taken.
]]
---@field stack core.ItemStack

--[[
`inventory_info` table; contents depend on the action.
]]
---@alias core.InventoryInfo core.InventoryInfo.move | core.InventoryInfo.put_or_take

-- ---------------------------- core.* functions ---------------------------- --

--[[
Returns how many items may be taken, put or moved; see `core.register_allow_player_inventory_action`.
]]
---@alias core.fn.allow_player_inventory_action fun(player:core.PlayerRef, action:core.InventoryInfo.actions, inventory:core.InvRef, inventory_info:core.InventoryInfo):int

--[[
Determines how much of a stack may be taken, put or moved to a player inventory.
Function arguments: see `core.register_on_player_inventory_action`.

The return value behaves like the respective `allow_metadata_inventory_*` item
callback: a numeric value limits the amount of items to be taken, put or moved.
A value of `-1` for `take` makes the source stack infinite.
]]
---@param f core.fn.allow_player_inventory_action
function core.register_allow_player_inventory_action(f) end

--[[
Callback for `core.register_on_player_inventory_action`. Return values are ignored.
]]
---@alias core.fn.on_player_inventory_action fun(player:core.PlayerRef, action:core.InventoryInfo.actions, inventory:core.InvRef, inventory_info:core.InventoryInfo)

--[[
Called after an item take, put or move event from/to/in a player inventory.
`player` is the player who modified the inventory `inventory`. Does not accept or
handle any return value.
]]
---@param f core.fn.on_player_inventory_action
function core.register_on_player_inventory_action(f) end