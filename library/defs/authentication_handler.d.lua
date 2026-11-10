---@meta _

-- luanti/doc/lua_api.md: Definition tables > Authentication handler definition

-- --------------------------- AuthenticationData --------------------------- --

--[[
Authentication data of a player, as returned by `get_auth`.
]]
---@class core.AuthenticationData
--[[
Not plain-text, but an arbitrary representation decided by the engine.
]]
---@field password string
--[[
Privileges in table form: keys are privilege names, values are `true`.
]]
---@field privileges core.PrivilegeSet
--[[
Time of the last login, if any.
]]
---@field last_login number?

-- ------------------------ AuthenticationHandlerDef ------------------------ --

--[[
Get authentication data for existing player `name` (`nil` if player
doesn't exist).
]]
---@alias core.AuthenticationHandlerDef.get_auth fun(name:string?):core.AuthenticationData?

--[[
Create new auth data for player `name`.
`password` is not plain-text but an arbitrary representation decided by the
engine.
]]
---@alias core.AuthenticationHandlerDef.create_auth fun(name:string, password:string)

--[[
Delete auth data of player `name`.
Returns whether it succeeded (false if player is nonexistent).
]]
---@alias core.AuthenticationHandlerDef.delete_auth fun(name:string): boolean

--[[
Set password of player `name` to `password`.
Auth data should be created if not present.
]]
---@alias core.AuthenticationHandlerDef.set_password fun(name:string, password:string)

--[[
Set privileges of player `name`.
`privileges` is in table form: keys are privilege names, values are `true`.
Auth data should be created if not present.
]]
---@alias core.AuthenticationHandlerDef.set_privileges fun(name:string?, privileges:core.PrivilegeSet?)

--[[
Reload authentication data from the storage location.
Returns whether it succeeded.
]]
---@alias core.AuthenticationHandlerDef.reload fun():boolean

--[[
Called when a player joins, used for keeping track of `last_login`.
]]
---@alias core.AuthenticationHandlerDef.record_login fun(name:string)

--[[
Iterator function returning the next player name, or `nil` when done.
]]
---@alias _.AuthenticationHandlerDef.iterate fun():string?

--[[
Returns an iterator (use with `for` loops) for all player names
currently in the auth database.
]]
---@alias core.AuthenticationHandlerDef.iterate fun():_.AuthenticationHandlerDef.iterate

--[[
Authentication handler definition

Used by `core.register_authentication_handler`. The active handler is
returned by `core.get_auth_handler()` (call it after load time). The handler
must call `core.notify_authentication_modified(name)` for privilege changes.
]]
---@class core.AuthenticationHandlerDef
--[[
Get authentication data for a player.
]]
---@field get_auth core.AuthenticationHandlerDef.get_auth
--[[
Create new auth data for a player.
]]
---@field create_auth core.AuthenticationHandlerDef.create_auth
--[[
Delete auth data of a player.
]]
---@field delete_auth core.AuthenticationHandlerDef.delete_auth
--[[
Set the password of a player.
]]
---@field set_password core.AuthenticationHandlerDef.set_password
--[[
Set the privileges of a player.
]]
---@field set_privileges core.AuthenticationHandlerDef.set_privileges
--[[
Reload authentication data from the storage location.
]]
---@field reload core.AuthenticationHandlerDef.reload
--[[
Called when a player joins.
]]
---@field record_login core.AuthenticationHandlerDef.record_login
--[[
Iterate over all player names in the auth database.
]]
---@field iterate core.AuthenticationHandlerDef.iterate