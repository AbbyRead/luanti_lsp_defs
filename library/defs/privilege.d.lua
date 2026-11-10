---@meta _

-- luanti/doc/lua_api.md: Definition tables > Privilege definition

-- ------------------------------ PrivilegeSet ------------------------------ --

--[[
Name of a built-in privilege, or any custom privilege registered with
`core.register_privilege`.
]]
---@alias core.PrivilegeSet.keys
--- | "shout"
--- | "interact"
--- | "fast"
--- | "fly"
--- | "noclip"
--- | "teleport"
--- | "bring"
--- | "give"
--- | "settime"
--- | "debug"
--- | "privs"
--- | "basic_privs"
--- | "kick"
--- | "ban"
--- | "password"
--- | "protection_bypass"
--- | "server"
--- | "rollback"
--- | string

--[[
Set of privileges: keys are privilege names, values are `true`.

Privileges provide a means for server administrators to give certain players
access to special abilities in the engine, games or mods. Built-in privileges
are listed per field below. Basic privileges (`shout`, `interact`) are
normally granted to all players. Mods should only register privileges that
strictly increase the abilities of the user.
]]
---@class core.PrivilegeSet : {[string]:boolean?}
--[[
Basic privilege: can communicate using the in-game chat.
]]
---@field shout boolean?
--[[
Basic privilege: can modify the world by digging, building and interacting
with the nodes, entities and other players. Players without it can only
travel and observe the world.
]]
---@field interact boolean?
--[[
Advanced privilege: can use "fast mode" to move with maximum speed.
]]
---@field fast boolean?
--[[
Advanced privilege: can use "fly mode" to move freely above the ground without falling.
]]
---@field fly boolean?
--[[
Advanced privilege: can use "noclip mode" to fly through solid nodes (e.g. walls).
]]
---@field noclip boolean?
--[[
Advanced privilege: can use the `/teleport` command to move to any point in the world.
]]
---@field teleport boolean?
--[[
Advanced privilege: can teleport other players to oneself.
]]
---@field bring boolean?
--[[
Advanced privilege: can use the `/give` and `/giveme` commands to give any item in the game to oneself or others.
]]
---@field give boolean?
--[[
Advanced privilege: can use the `/time` command to change the current in-game time.
]]
---@field settime boolean?
--[[
Advanced privilege: can enable wireframe rendering mode.
]]
---@field debug boolean?
--[[
Security privilege: can modify privileges of the players using the `/grant[me]` and `/revoke[me]` commands.
]]
---@field privs boolean?
--[[
Security privilege: can grant and revoke basic privileges as defined by the `basic_privs` setting.
]]
---@field basic_privs boolean?
--[[
Security privilege: can kick other players from the server using the `/kick` command.
]]
---@field kick boolean?
--[[
Security privilege: can ban other players using the `/ban` command.
]]
---@field ban boolean?
--[[
Security privilege: can use the `/setpassword` and `/clearpassword` commands to manage players' passwords.
]]
---@field password boolean?
--[[
Security privilege: can bypass node protection. Note that the engine does not
act upon this privilege, it is only an implementation suggestion for games.
]]
---@field protection_bypass boolean?
--[[
Administrative privilege: can use the `/fixlight`, `/deleteblocks` and
`/deleteobjects` commands, and can clear the inventory of other players using
`/clearinv`.
]]
---@field server boolean?
--[[
Administrative privilege: can use the `/rollback_check` and `/rollback` commands.
]]
---@field rollback boolean?

-- ------------------------------ PrivilegeDef ------------------------------ --

--[[
Called when the privilege is given to player `name` by `granter_name`
(`nil` if granted by a mod).
]]
---@alias core.PrivilegeDef.on_grant fun(name:string, granter_name:string?): boolean?

--[[
Called when the privilege is taken from player `name` by `revoker_name`
(`nil` if revoked by a mod).
]]
---@alias core.PrivilegeDef.on_revoke fun(name:string, revoker_name:string?): boolean?

--[[
Privilege definition

Used by `core.register_privilege`.
]]
---@class core.PrivilegeDef
--[[
Privilege description.
]]
---@field description string?
--[[
Whether to grant the privilege to singleplayer.
]]
---@field give_to_singleplayer boolean?
--[[
Whether to grant the privilege to the server admin.
Uses value of 'give_to_singleplayer' by default.
]]
---@field give_to_admin boolean?
--[[
Called when given to player `name` by `granter_name`.
`granter_name` will be nil if the priv was granted by a mod.

Note that `on_grant` and `on_revoke` will be called twice if a player is
responsible, once with the player name, and then with a nil player name.
Return true to stop register_on_priv_grant being called.
]]
---@field on_grant core.PrivilegeDef.on_grant?
--[[
Called when taken from player `name` by `revoker_name`.
`revoker_name` will be nil if the priv was revoked by a mod.

Note that `on_grant` and `on_revoke` will be called twice if a player is
responsible, once with the player name, and then with a nil player name.
Return true to stop register_on_priv_revoke being called.
]]
---@field on_revoke core.PrivilegeDef.on_revoke?