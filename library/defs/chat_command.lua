---@meta _

-- luanti/doc/lua_api.md: Definition tables > Chat command definition

--[[
Name of a chat command. Lists the builtin commands; any other string is
allowed for commands registered by mods (see `core.registered_chatcommands`).
]]
---@alias core.ChatCommandDef.keys
--- | "pulverize"
--- | "fixlight"
--- | "dump"
--- | "grantme"
--- | "rollback_check"
--- | "mods"
--- | "days"
--- | "last-login"
--- | "help"
--- | "privs"
--- | "clearinv"
--- | "status"
--- | "msg"
--- | "shutdown"
--- | "revokeme"
--- | "grant"
--- | "revoke"
--- | "admin"
--- | "ban"
--- | "kick"
--- | "giveme"
--- | "remove_player"
--- | "unban"
--- | "haspriv"
--- | "kill"
--- | "set"
--- | "rollback"
--- | "auth_reload"
--- | "clearobjects"
--- | "setpassword"
--- | "me"
--- | "emergeblocks"
--- | "teleport"
--- | "give"
--- | "time"
--- | "spawnentity"
--- | "clearpassword"
--- | "deleteblocks"
--- | string

--[[
Called when the command is run.

* `name` is the name of the player who issued the command.
* `param` is a string with the full arguments to the command.

Returns a boolean for success and a string value. The string is shown to the
issuing player upon exit of `func` or, if `func` returns `false` and no string,
the help message is shown.
]]
---@alias core.ChatCommandDef.func fun(name:string, param:string): boolean?, string?

--[[
Chat command definition

Used by `core.register_chatcommand`.

Specifies the function to be called and the privileges required when a player
issues the command. A help message that is the concatenation of the params and
description fields is shown when the "/help" chatcommand is issued.
]]
---@class core.ChatCommandDef
--[[
Short parameter description.

Note that in params, the conventional use of symbols is as follows:

* `<>` signifies a placeholder to be replaced when the command is used. For
  example, when a player name is needed: `<name>`
* `[]` signifies param is optional and not required when the command is used.
  For example, if you require param1 but param2 is optional:
  `<param1> [<param2>]`
* `|` signifies exclusive or. The command requires one param from the options
  provided. For example: `<param1> | <param2>`
* `()` signifies grouping. For example, when param1 and param2 are both
  required, or only param3 is required: `(<param1> <param2>) | <param3>`
]]
---@field params string?
--[[
General description of the command's purpose.
]]
---@field description string?
--[[
Required privileges to run. See `core.check_player_privs()` for the format
and see Privileges for an overview of privileges.
]]
---@field privs core.PrivilegeSet?
--[[
Called when the command is run.
]]
---@field func core.ChatCommandDef.func

--[[
Redefinition table for `core.override_chatcommand`. Overrides fields of a
chatcommand registered with `core.register_chatcommand`; fields left out are
kept.
]]
---@class core.ChatCommandDef.override
--[[
Replacement function.
]]
---@field func core.ChatCommandDef.func?