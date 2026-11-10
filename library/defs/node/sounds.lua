---@meta _

-- luanti/doc/lua_api.md: Definition tables > Node definition

-- ----------------------------- NodeDef.sounds ----------------------------- --

--[[
Node sounds to be played at various events.
All fields in this table are optional.
]]
---@class core.NodeDef.sounds
--[[
Played when an object walks on the node, if it is walkable. If the node is
climbable or a liquid, played when an object moves through it.
Played at the base of the object's collision box. Gain is multiplied by `0.6`.
For the local player, it is played position-less with normal gain.
]]
---@field footstep core.SimpleSoundSpec?
--[[
Played while digging the node.
If `"__group"`, the sound is `{name = "default_dig_<groupname>", gain = 0.5}`,
where `<groupname>` is the name of the item's digging group with the fastest
digging time. In case of a tie, one of the sounds is played (unpredictably).
Default is `"__group"`.
]]
---@field dig core.SimpleSoundSpec|"__group"?
--[[
Played when the node was dug.
]]
---@field dug core.SimpleSoundSpec?
--[[
Played when the node was placed. Also played after falling.
]]
---@field place core.SimpleSoundSpec?
--[[
Played when node placement failed.
Note: this happens if the _built-in_ node placement failed. The sound is still
played if the node is placed in the `on_place` callback manually.
]]
---@field place_failed core.SimpleSoundSpec?
--[[
Played when the node starts to fall or is detached.
]]
---@field fall core.SimpleSoundSpec?

-- ----------------------------- NodeDef fields ----------------------------- --

---@class core.NodeDef
--[[
Definition of node sounds to be played at various events.
All fields in the table are optional.
]]
---@field sounds core.NodeDef.sounds?