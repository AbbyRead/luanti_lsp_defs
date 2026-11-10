---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global callback registration functions

-- ---------------------- server step, start, shutdown ---------------------- --

--[[
Callback for `core.register_globalstep`. `dtime` is the time since last execution in seconds.
]]
---@alias core.fn.globalstep fun(dtime:number)

--[[
* Called every server step, usually interval of 0.1s.
* `dtime` is the time since last execution in seconds.
]]
---@param f core.fn.globalstep
function core.register_globalstep(f) end

--[[
Callback for `core.register_on_mods_loaded`.
]]
---@alias core.fn.on_mods_loaded fun()

--[[
* Called after all mods have finished loading and before the media is cached
  or aliases are handled.
]]
---@param f core.fn.on_mods_loaded
function core.register_on_mods_loaded(f) end

--[[
Callback for `core.register_on_shutdown`.
]]
---@alias core.fn.on_shutdown fun()

--[[
* Called during server shutdown before players are kicked.
* **Warning**: If the server terminates abnormally (i.e. crashes), the
  registered callbacks will likely **not run**. Data should be saved at
  semi-frequent intervals as well as on server shutdown.
]]
---@param f core.fn.on_shutdown
function core.register_on_shutdown(f) end

-- ------------------------------- node events ------------------------------ --

--[[
Callback for `core.register_on_placenode`. Return `true` to take no item from `itemstack`.
]]
---@alias core.fn.on_placenode fun(pos:ivec, newnode:core.Node.get, placer:core.ObjectRef?, oldnode:core.Node.get, itemstack:core.ItemStack, pointed_thing:core.PointedThing):boolean?

--[[
* Called after a node has been placed.
* If `true` is returned no item is taken from `itemstack`
* `placer` may be any valid ObjectRef or nil.
* **Not recommended**; use `on_construct` or `after_place_node` in node
  definition whenever possible.
]]
---@param f core.fn.on_placenode
function core.register_on_placenode(f) end

--[[
Callback for `core.register_on_dignode`.
]]
---@alias core.fn.on_dignode fun(pos:ivec, oldnode:core.Node.get, digger:core.ObjectRef?)

--[[
* Called after a node has been dug.
* **Not recommended**; Use `on_destruct` or `after_dig_node` in node
  definition whenever possible.
]]
---@param f core.fn.on_dignode
---@return nil
function core.register_on_dignode(f) end

--[[
Callback for `core.register_on_punchnode`.
]]
---@alias core.fn.on_punchnode fun(pos:ivec, node:core.Node.get, puncher:core.ObjectRef?, pointed_thing:core.PointedThing)

--[[
* Called after a node is punched
]]
---@param f core.fn.on_punchnode
---@return nil
function core.register_on_punchnode(f) end

--[[
Callback for `core.register_on_generated`.
]]
---@alias core.fn.on_generated fun(minp:ivec, maxp:ivec, blockseed:int)

--[[
* Called after a piece of world between `minp` and `maxp` has been
  generated and written into the map.
* **Avoid using this** whenever possible. As with other callbacks this blocks
  the main thread and is prone to introduce noticeable latency/lag.
  Consider [Mapgen environment](#mapgen-environment) as an alternative.
]]
---@deprecated
---@param f core.fn.on_generated
function core.register_on_generated(f) end

-- ------------------------------ player events ----------------------------- --

--[[
Callback for `core.register_on_newplayer`.
]]
---@alias core.fn.on_newplayer fun(ObjectRef:core.PlayerRef)

--[[
* Called when a new player enters the world for the first time
* `player`: ObjectRef
]]
---@param f core.fn.on_newplayer
function core.register_on_newplayer(f) end

--[[
Callback for `core.register_on_punchplayer`. Return `true` to prevent the default damage mechanism.
]]
---@alias core.fn.on_punchplayer fun(player:core.PlayerRef, hitter:core.PlayerRef?, time_from_last_punch:number?, tool_capabilities:core.ToolCapabilities?, dir:vec, damage: int):boolean?

--[[
* Called when a player is punched
* Note: This callback is invoked even if the punched player is dead.
* `player`: ObjectRef - Player that was punched
* `hitter`: ObjectRef - Player that hit. Can be nil.
* `time_from_last_punch`: Meant for disallowing spamming of clicks
  (can be nil).
* `tool_capabilities`: Capability table of used item (can be nil)
* `dir`: Unit vector of direction of punch. Always defined. Points from
  the puncher to the punched.
* `damage`: Number that represents the damage calculated by the engine
* should return `true` to prevent the default damage mechanism
]]
---@param f core.fn.on_punchplayer
function core.register_on_punchplayer(f) end

--[[
Callback for `core.register_on_rightclickplayer`.
]]
---@alias core.fn.on_rightclickplayer fun(player:core.PlayerRef, clicker:core.PlayerRef)

--[[
* Called when the 'place/use' key was used while pointing a player
  (not necessarily an actual rightclick)
* `player`: ObjectRef - Player that is acted upon
* `clicker`: ObjectRef - Object that acted upon `player`, may or may not be a player
]]
---@param f core.fn.on_rightclickplayer
function core.register_on_rightclickplayer(f) end

--[[ core.register_on_player_hpchange() .. core.register_on_dieplayer() split off into ./hpchange.lua ]]--

--[[
Callback for `core.register_on_respawnplayer`. Return `true` to disable regular player placement.
]]
---@alias core.fn.on_respawnplayer fun(ObjectRef:core.PlayerRef):boolean?

--[[
Called when a player is to be respawned, _before_ repositioning of the player occurs.
Return `true` in the function to disable regular player placement.
]]
---@param f core.fn.on_respawnplayer
function core.register_on_respawnplayer(f) end

--[[
Callback for `core.register_on_prejoinplayer`. Return a string to disconnect the client with that string as reason.
]]
---@alias core.fn.on_prejoinplayer fun(name:string, ip:string):string?

--[[
Called when a client connects to the server, prior to authentication.
If it returns a string, the client is disconnected with that string as reason.
]]
---@param f core.fn.on_prejoinplayer
function core.register_on_prejoinplayer(f) end

--[[
Callback for `core.register_on_joinplayer`. `last_login` is the timestamp of the previous login, or nil if the player is new.
]]
---@alias core.fn.on_joinplayer fun(ObjectRef:core.PlayerRef, last_login:int?)

--[[
Called when a player joins the game.
`last_login`: the timestamp of the previous login, or nil if the player is new.
]]
---@param f core.fn.on_joinplayer
function core.register_on_joinplayer(f) end

--[[
Callback for `core.register_on_leaveplayer`. `timed_out` is true for timeout, false for other reasons.
]]
---@alias core.fn.on_leaveplayer fun(ObjectRef:core.PlayerRef, timed_out:boolean)

--[[
Called when a player leaves the game. Does not get executed for connected players on
shutdown.
`timed_out`: true for timeout, false for other reasons.
]]
---@param f core.fn.on_leaveplayer
function core.register_on_leaveplayer(f) end

--[[
Callback for `core.register_on_authplayer`.
]]
---@alias core.fn.on_authplayer fun(name:string, ip:string, is_success:boolean)

--[[
* Called when a client attempts to log into an account.
* `name`: The name of the account being authenticated.
* `ip`: The IP address of the client
* `is_success`: Whether the client was successfully authenticated
* For newly registered accounts, `is_success` will always be true
]]
---@param f core.fn.on_authplayer
function core.register_on_authplayer(f) end

--[[
Callback for `core.register_on_auth_fail`.
]]
---@alias core.fn.on_auth_fail fun(name:string, ip:string)

--[[
* Deprecated: use `core.register_on_authplayer(name, ip, is_success)` instead.
]]
---@deprecated
---@param f core.fn.on_auth_fail
function core.register_on_auth_fail(f) end

--[[ core.register_on_cheat() split into ./cheat.lua ]]--

--[[ core.register_playerevent() split into ./playerevent.lua ]]--

-- ---------------------------------- chat ---------------------------------- --

--[[
Callback for `core.register_on_chat_message`. Return `true` to mark the message as handled.
]]
---@alias core.fn.on_chat_message fun(name:string, message:string):boolean?

--[[
* Called always when a player says something
* Return `true` to mark the message as handled, which means that it will
  not be sent to other players.
]]
---@param f core.fn.on_chat_message
function core.register_on_chat_message(f) end

--[[
Callback for `core.register_on_chatcommand`. Return `true` to mark the command as handled.
]]
---@alias core.fn.on_chatcommand fun(name:string, command:string, params:string)

--[[
* Called always when a chatcommand is triggered, before `core.registered_chatcommands`
  is checked to see if the command exists, but after the input is parsed.
* Return `true` to mark the command as handled, which means that the default
  handlers will be prevented.
]]
---@param f core.fn.on_chatcommand
function core.register_on_chatcommand(f) end

-- -------------------------------- formspec -------------------------------- --

--[[ core.register_on_player_receive_fields() split off into ./player_receive_fields.lua ]]--

--[[
Callback for `core.register_on_craft`. Return an `ItemStack` to replace the output, or `nil` to leave it.
]]
---@alias core.fn.on_craft fun(itemstack:core.ItemStack, player:core.PlayerRef, old_crafting_grid:core.Item.name[][], craft_inv:core.InvRef):core.ItemStack?

--[[
* Called when `player` crafts something
* `itemstack` is the output
* `old_craft_grid` contains the recipe (Note: the one in the inventory is
  cleared).
* `craft_inv` is the inventory with the crafting grid
* Return either an `ItemStack`, to replace the output, or `nil`, to not
  modify it.
]]
---@param f core.fn.on_craft
function core.register_on_craft(f) end

--[[
Callback for `core.register_craft_predict`. Return an `ItemStack` to replace the predicted output, or `nil` to leave it.
]]
---@alias core.fn.craft_predict fun(itemstack:core.ItemStack, player:core.PlayerRef, old_crafting_grid:core.Item.name[][], craft_inv:core.InvRef):core.ItemStack?

--[[
* The same as before, except that it is called before the player crafts, to
  make craft prediction, and it should not change anything.
]]
---@param f core.fn.craft_predict
function core.register_craft_predict(f) end

--[[ core.register_allow_player_inventory_action() .. core.register_on_player_inventory_action() split off into ./inventory_action.lua ]]--

-- ------------------------------- protection ------------------------------- --

--[[
Callback for `core.register_on_protection_violation`.
]]
---@alias core.fn.on_protection_violation fun(pos:ivec, name:string)

--[[
* Called by `builtin` and mods when a player violates protection at a
  position (eg, digs a node or punches a protected entity).
* The registered functions can be called using
  `core.record_protection_violation`.
* The provided function should check that the position is protected by the
  mod calling this function before it prints a message, if it does, to
  allow for multiple protection mods.
]]
---@param f core.fn.on_protection_violation
function core.register_on_protection_violation(f) end

-- ------------------------------- item events ------------------------------ --

--[[
Callback for `core.register_on_item_eat`. Return `itemstack` to cancel the default item eat response.
]]
---@alias core.fn.on_item_eat fun(hp_change:int, replace_with_item:core.ItemStack?, itemstack:core.ItemStack, user:core.PlayerRef, pointed_thing:core.PointedThing):core.ItemStack?

--[[
* Called when an item is eaten, by `core.item_eat`
* Return `itemstack` to cancel the default item eat response (i.e.: hp increase).
]]
---@param f core.fn.on_item_eat
function core.register_on_item_eat(f) end

--[[
Callback for `core.register_on_item_pickup`. Return an itemstack to cancel the default item pick-up response.
]]
---@alias core.fn.on_item_pickup fun(itemstack:core.ItemStack, picker:core.PlayerRef?, pointed_thing:core.PointedThing?, time_from_last_punch:number?, direction:vec?, damage:int?):core.ItemStack?

--[[
* Called by `core.item_pickup` before an item is picked up.
* Function is added to `core.registered_on_item_pickups`.
* Oldest functions are called first.
* Parameters are the same as in the `on_pickup` callback.
* Return an itemstack to cancel the default item pick-up response (i.e.: adding
  the item into inventory).
]]
---@param f core.ItemDef.on_pickup
function core.register_on_item_pickup(f) end

-- ------------------------------- privileges ------------------------------- --

--[[
Callback for `core.register_on_priv_grant`.
]]
---@alias core.fn.on_priv_grant fun(name:string, granter:core.PlayerRef?, priv:core.PrivilegeSet.keys)

--[[
* Called when `granter` grants the priv `priv` to `name`.
* Note that the callback will be called twice if it's done by a player,
  once with granter being the player name, and again with granter being nil.
]]
---@param f core.fn.on_priv_grant
function core.register_on_priv_grant(f) end

--[[
Callback for `core.register_on_priv_revoke`.
]]
---@alias core.fn.on_priv_revoke fun(name:string, revoker:core.PlayerRef?, priv:core.PrivilegeSet.keys)

--[[
* Called when `revoker` revokes the priv `priv` from `name`.
* Note that the callback will be called twice if it's done by a player,
  once with revoker being the player name, and again with revoker being nil.
]]
---@param f core.fn.on_priv_revoke
function core.register_on_priv_revoke(f) end

-- -------------------------------------------------------------------------- --

--[[
Callback for `core.register_can_bypass_userlimit`. Return `true` to bypass the player limit.
]]
---@alias core.fn.can_bypass_userlimit fun(name:string, ip:string):boolean?

--[[
* Called when `name` user connects with `ip`.
* Return `true` to by pass the player limit
]]
---@param f core.fn.can_bypass_userlimit
function core.register_can_bypass_userlimit(f) end

--[[
Callback for `core.register_on_modchannel_message`.
]]
---@alias core.fn.on_modchannel_message fun(channel_name:string, sender:string, message:string)

--[[
Called when an incoming mod channel message is received. You should have joined
some channels to receive events. If the message comes from a server mod, `sender` is
an empty string.
]]
---@param f core.fn.on_modchannel_message
function core.register_on_modchannel_message(f) end

-- ------------------------------- map events ------------------------------- --

--[[
Callback for `core.register_on_liquid_transformed`.
]]
---@alias core.fn.on_liquid_transform fun(pos_list: ivec[], node_list: core.Node.get[])

--[[
* Called after liquid nodes (`liquidtype ~= "none"`) are modified by the
  engine's liquid transformation process.
* `pos_list` is an array of all modified positions.
* `node_list` is an array of the old node that was previously at the position
  with the corresponding index in pos_list.
]]
---@param f core.fn.on_liquid_transform
function core.register_on_liquid_transformed(f) end

--[[
Callback for `core.register_on_mapblocks_changed`.
]]
---@alias core.fn.on_mapblocks_changed fun(modified_blocks:table<core.PosHash,true>, modified_block_count:int)

--[[
* Called soon after any nodes or node metadata have been modified. No
  modifications will be missed, but there may be false positives.
* Will never be called more than once per server step.
* `modified_blocks` is the set of modified mapblock position hashes. These
  are in the same format as those produced by `core.hash_node_position`,
  and can be converted to positions with `core.get_position_from_hash`.
  The set is a table where the keys are hashes and the values are `true`.
* `modified_block_count` is the number of entries in the set.
* Note: callbacks must be registered at mod load time.
]]
---@param f core.fn.on_mapblocks_changed
function core.register_on_mapblocks_changed(f) end