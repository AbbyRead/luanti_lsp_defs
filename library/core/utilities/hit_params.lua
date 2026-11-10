---@meta _

-- luanti/doc/lua_api.md: Helper functions

--[[
Result of `core.get_hit_params` for an item that is not a tool (no wear).
]]
---@class core.HitParams.item
--[[
How much damage the punch would cause; integer in range [-65535, 65535].
]]
---@field hp int

--[[
Result of `core.get_hit_params` for a tool.
]]
---@class core.HitParams.tool : core.HitParams.item
--[[
How much wear would be added to the tool (ignored for non-tools).
]]
---@field wear core.Tool.wear

--[[
Result of `core.get_hit_params`.
]]
---@alias core.HitParams
--- | core.HitParams.item
--- | core.HitParams.tool

-- ---------------------------- core.* functions ---------------------------- --

--[[
Simulates an item that punches an object.

* `groups`: damage groups of the object
* `tool_capabilities`: tool capabilities table of the item
* `time_from_last_punch`: time in seconds since last punch action (can be `nil`)
* `wear`: amount of wear the item starts with. Default: 0
]]
---@nodiscard
---@param groups core.Groups.armor
---@param tool_capabilities core.ToolCapabilities
---@param time_from_last_punch number?
---@param wear core.Tool.wear?
---@return core.HitParams
function core.get_hit_params(groups, tool_capabilities, time_from_last_punch, wear) end