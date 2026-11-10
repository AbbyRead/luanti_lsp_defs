---@meta _

-- builtin/game/register.lua
-- src/script/cpp_api/s_env.cpp

-- ------------------------------- PlayerEvent ------------------------------ --

--[[
Kind of change to a player that triggers `core.register_playerevent` callbacks.
(Not described in lua_api.md.)

* `hud_changed`: a HUD element or flag changed
* `properties_changed`: object properties changed
* `health_changed`: HP changed
* `breath_changed`: breath changed
]]
---@alias core.PlayerEvent
--- | "hud_changed"
--- | "properties_changed"
--- | "health_changed"
--- | "breath_changed"

-- ---------------------------- core.* functions ---------------------------- --

--[[
Callback for `core.register_playerevent`.
]]
---@alias core.fn.playerevent fun(player:core.PlayerRef, event:core.PlayerEvent)

--[[
Registers a callback called when a player-related event occurs; see `core.PlayerEvent`.
]]
---@param f core.fn.playerevent
function core.register_playerevent(f) end