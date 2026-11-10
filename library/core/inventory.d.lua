---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Inventory

-- ---------------------------- InventoryLocation --------------------------- --

--[[
Location of a node inventory, e.g. `{type="node", pos={x=, y=, z=}}`.
]]
---@class core.InventoryLocation.node
--[[
Location type.
]]
---@field type "node"
--[[
Position of the node.
]]
---@field pos ivec

--[[
Location of a player inventory, e.g. `{type="player", name="celeron55"}`.
]]
---@class core.InventoryLocation.player
--[[
Location type.
]]
---@field type "player"
--[[
Player name.
]]
---@field name string

--[[
Location of a detached inventory, e.g. `{type="detached", name="creative"}`.
]]
---@class core.InventoryLocation.detached
--[[
Location type.
]]
---@field type "detached"
--[[
Name of the detached inventory.
]]
---@field name string

--[[
Location of an inventory, as accepted by `core.get_inventory`.
]]
---@alias core.InventoryLocation
--- | core.InventoryLocation.node
--- | core.InventoryLocation.player
--- | core.InventoryLocation.detached

--[[
Location of an inventory whose location is not defined.
]]
---@class core.InventoryLocation.undefined
--[[
Location type.
]]
---@field type "undefined"

-- ---------------------------- core.* functions ---------------------------- --

--[[
`core.get_inventory(location)`: returns an `InvRef`

* `location` = e.g.
    * `{type="player", name="celeron55"}`
    * `{type="node", pos={x=, y=, z=}}`
    * `{type="detached", name="creative"}`
]]
---@param location core.InventoryLocation
---@return core.InvRef
function core.get_inventory(location) end

--[[
* `core.create_detached_inventory(name, callbacks, [player_name])`: returns
  an `InvRef`.
    * `callbacks`: See [Detached inventory callbacks](#detached-inventory-callbacks)
    * `player_name`: Make detached inventory available to one player
      exclusively, by default they will be sent to every player (even if not
      used).
      Note that this parameter is mostly just a workaround and will be removed
      in future releases.
    * Creates a detached inventory. If it already exists, it is cleared.
]]
---@nodiscard
---@param name string
---@param callbacks core.DetachedInventoryCallbacks
---@param player_name string?
---@return core.InvRef
function core.create_detached_inventory(name, callbacks, player_name) end

--[[
* `core.remove_detached_inventory(name)`
    * Returns a `boolean` indicating whether the removal succeeded.
]]
---@param name string
---@return boolean
function core.remove_detached_inventory(name) end