---@meta _

-- luanti/doc/lua_api.md: Definition tables > Detached inventory callbacks

--[[
Called when a player wants to move items inside the inventory.
Return value: amount of items allowed to move.
]]
---@alias core.DetachedInventoryCallbacks.allow_move fun(inv:core.InvRef, from_list:core.InventoryList, from_index:int, to_list:core.InventoryList, to_index:int, count:int, player:core.PlayerRef):int?

--[[
Called when a player wants to put something into the inventory.
Return value: amount of items allowed to put.
Return value -1: Allow and don't modify destination item.
]]
---@alias core.DetachedInventoryCallbacks.allow_put fun(inv:core.InvRef, listname:core.InventoryList, index:int, stack:core.ItemStack, player:core.PlayerRef):int?

--[[
Called when a player wants to take something out of the inventory.
Return value: amount of items allowed to take.
Return value -1: Allow and don't modify source item.
]]
---@alias core.DetachedInventoryCallbacks.allow_take fun(inv:core.InvRef, listname:core.InventoryList, index:int, stack:core.ItemStack, player:core.PlayerRef):int?

--[[
Called after the move happened, according to what was allowed.
No return value.
]]
---@alias core.DetachedInventoryCallbacks.on_move fun(inv:core.InvRef, from_list:core.InventoryList, from_index:int, to_list:core.InventoryList, to_index:int, count:int, player:core.PlayerRef)

--[[
Called after the put happened, according to what was allowed.
No return value.
]]
---@alias core.DetachedInventoryCallbacks.on_put fun(inv:core.InvRef, listname:core.InventoryList, index:int, stack:core.ItemStack, player:core.PlayerRef)

--[[
Called after the take happened, according to what was allowed.
No return value.
]]
---@alias core.DetachedInventoryCallbacks.on_take fun(inv:core.InvRef, listname:core.InventoryList, index:int, stack:core.ItemStack, player:core.PlayerRef)

--[[
Detached inventory callbacks

Used by `core.create_detached_inventory`.
]]
---@class core.DetachedInventoryCallbacks
--[[
See `core.DetachedInventoryCallbacks.allow_move`.
]]
---@field allow_move core.DetachedInventoryCallbacks.allow_move?
--[[
See `core.DetachedInventoryCallbacks.allow_put`.
]]
---@field allow_put core.DetachedInventoryCallbacks.allow_put?
--[[
See `core.DetachedInventoryCallbacks.allow_take`.
]]
---@field allow_take core.DetachedInventoryCallbacks.allow_take?
--[[
See `core.DetachedInventoryCallbacks.on_move`.
]]
---@field on_move core.DetachedInventoryCallbacks.on_move?
--[[
See `core.DetachedInventoryCallbacks.on_put`.
]]
---@field on_put core.DetachedInventoryCallbacks.on_put?
--[[
See `core.DetachedInventoryCallbacks.on_take`.
]]
---@field on_take core.DetachedInventoryCallbacks.on_take?