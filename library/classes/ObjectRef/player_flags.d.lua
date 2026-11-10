---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- ------------------------------- PlayerFlags ------------------------------ --

--[[
Player flags, as returned by `PlayerRef:get_flags`.
]]
---@class core.PlayerFlags.get
--[[
Whether breathing (regaining air) is enabled. Default `true`.
]]
---@field breathing boolean
--[[
Whether drowning (losing air) is enabled. Default `true`.
]]
---@field drowning boolean
--[[
Whether the player takes damage from nodes. Default `true`.
]]
---@field node_damage boolean

--[[
Player flags accepted by `PlayerRef:set_flags`. Same format as returned by
`get_flags`; absent fields are left unchanged.
]]
---@alias core.PlayerFlags.set
--- | core.PlayerFlags.get
--- | _.PlayerFlags.set

---@class _.PlayerFlags.set
--[[
Whether breathing (regaining air) is enabled.
]]
---@field breathing boolean?
--[[
Whether drowning (losing air) is enabled.
]]
---@field drowning boolean?
--[[
Whether the player takes damage from nodes.
]]
---@field node_damage boolean?


-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `get_flags()`: returns a table of player flags (the following boolean fields):
  * `breathing`: Whether breathing (regaining air) is enabled, default `true`.
  * `drowning`: Whether drowning (losing air) is enabled, default `true`.
  * `node_damage`: Whether the player takes damage from nodes, default `true`.
]]
---@nodiscard
---@return core.PlayerFlags.get flags
function PlayerRef:get_flags() end

--[[
* `set_flags(flags)`: sets flags
  * takes a table in the same format as returned by `get_flags`
  * absent fields are left unchanged
]]
---@param flags core.PlayerFlags.set
function PlayerRef:set_flags(flags) end