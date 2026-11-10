---@meta _

-- luanti/doc/lua_api.md: Helper functions

--[[
Result of `core.get_dig_params` for a node that cannot be dug.
]]
---@class core.DigParams.not_diggable
--[[
False if the node cannot be dug with the given tool.
`time` and `wear` are meaningless in this case.
]]
---@field diggable false

--[[
Result for a diggable node, for an item that is not a tool (no wear).
]]
---@class core.DigParams.item.diggable
--[[
True if the node can be dug.
]]
---@field diggable true
--[[
Time it would take to dig the node, in seconds.
]]
---@field time number

--[[
Result for a diggable node, for a tool.
]]
---@class core.DigParams.tool.diggable : core.DigParams.item.diggable
--[[
How much wear would be added to the tool (ignored for non-tools).
]]
---@field wear core.Tool.wear

--[[
Result of `core.get_dig_params`.
]]
---@alias core.DigParams
--- | core.DigParams.not_diggable
--- | core.DigParams.item.diggable
--- | core.DigParams.tool.diggable

-- ---------------------------- core.* functions ---------------------------- --

--[[
Simulates an item that digs a node.

* `groups`: node groups of the node that would be dug
* `tool_capabilities`: tool capabilities table of the item
* `wear`: amount of wear the tool starts with. Default: 0
]]
---@nodiscard
---@param groups core.Groups.node
---@param tool_capabilities core.ToolCapabilities
---@param wear core.Tool.wear?
---@return core.DigParams
function core.get_dig_params(groups, tool_capabilities, wear) end