---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

--[[
Object properties to set for the `item` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.item.set
--- | core.ObjectProperties.item.get
--- | _.ObjectProperties.item.set

---@class _.ObjectProperties.item.set : _.ObjectProperties.item.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `item`
visual.
]]
---@class core.ObjectProperties.item.get : _.ObjectProperties.item.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.item.__partial
--[[
Similar to `"wielditem"` but ignores the `wield_image` parameter.
Used to show an item; see `"wielditem"` for details.
]]
---@field visual "item"