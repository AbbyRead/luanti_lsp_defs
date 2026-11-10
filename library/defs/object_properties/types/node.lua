---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

--[[
Object properties to set for the `node` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.node.set
--- | core.ObjectProperties.node.get
--- | _.ObjectProperties.node.set

---@class _.ObjectProperties.node.set : _.ObjectProperties.node.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `node`
visual.
]]
---@class core.ObjectProperties.node.get : _.ObjectProperties.node.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.node.set.__partial
--[[
Looks exactly like a node in-world (supported since 5.12.0).
Visual effects like waving or liquid reflections do not work.
]]
---@field visual "node"
--[[
Node to show when using the "node" visual
]]
---@field node core.Node.set?

---@class _.ObjectProperties.node.get.__partial
--[[
Looks exactly like a node in-world (supported since 5.12.0).
Visual effects like waving or liquid reflections do not work.
]]
---@field visual "node"
--[[
Node to show when using the "node" visual
]]
---@field node core.Node.get