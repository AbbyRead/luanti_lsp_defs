---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global callback registration functions

-- ---------------------------------- Cheat --------------------------------- --

--[[
Kind of cheat detected by the engine.

* `moved_too_fast`: player moved faster than allowed
* `interacted_too_far`: interacted with something out of range
* `interacted_with_self`: interacted with themselves
* `interacted_while_dead`: interacted while dead
* `finished_unknown_dig`: finished digging a node that was not being dug
* `dug_unbreakable`: dug a node that cannot be dug
* `dug_too_fast`: dug faster than possible
]]
---@alias core.Cheat.type
--- | "moved_too_fast"
--- | "interacted_too_far"
--- | "interacted_with_self"
--- | "interacted_while_dead"
--- | "finished_unknown_dig"
--- | "dug_unbreakable"
--- | "dug_too_fast"

--[[
Cheat info passed to `core.register_on_cheat` callbacks.
]]
---@class core.Cheat
--[[
Kind of cheat.
]]
---@field type core.Cheat.type

-- ---------------------------- core.* functions ---------------------------- --

--[[
Callback for `core.register_on_cheat`; receives the cheating player and the
cheat info.
]]
---@alias core.fn.on_cheat fun(ObjectRef:core.PlayerRef, cheat:core.Cheat)

--[[
Called when a player cheats. `cheat` is `{type=<cheat_type>}`; see
`core.Cheat.type` for the possible values.
]]
---@param f core.fn.on_cheat
function core.register_on_cheat(f) end