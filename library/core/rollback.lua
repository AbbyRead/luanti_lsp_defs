---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Rollback

--[[
Entry returned by `core.rollback_get_node_actions`, as an array
`{actor, pos, time, oldnode, newnode}`.
]]
---@class core.RollbackNodeAction
--[[
`actor`: `"player:<name>"`, also `"liquid"`.
]]
---@field [1] string
--[[
Position of the node.
]]
---@field [2] ivec
--[[
Time of the action.
]]
---@field [3] number
--[[
Node before the action.
]]
---@field [4] core.Node.get
--[[
Node after the action.
]]
---@field [5] core.Node.get

--[[
* `core.rollback_get_node_actions(pos, range, seconds, limit)`:
  returns `{{actor, pos, time, oldnode, newnode}, ...}`
    * Find who has done something to a node, or near a node
    * `actor`: `"player:<name>"`, also `"liquid"`.
]]
---@nodiscard
---@param pos ivector
---@param range int
---@param seconds number
---@param limit number
---@return core.RollbackNodeAction[]
function core.rollback_get_node_actions(pos, range, seconds, limit) end

--[[
* `core.rollback_revert_actions_by(actor, seconds)`: returns
  `boolean, log_messages`.
    * Revert latest actions of someone
    * `actor`: `"player:<name>"`, also `"liquid"`.
]]
---@param actor string|"liquid"
---@param seconds number
---@return boolean success, string[] log_messages
function core.rollback_revert_actions_by(actor, seconds) end