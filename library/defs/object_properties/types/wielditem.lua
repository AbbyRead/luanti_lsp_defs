---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

-- --------------- ObjectProperties.wielditem.textures.strict --------------- --

--[[
Textures of a `wielditem` visual (deprecated): `{itemname}`.
]]
---@class core.ObjectProperties.wielditem.textures.strict
--[[
Item name. Deprecated; use `wield_item` instead.
]]
---@field [1] core.Item.name

--[[
Textures of a `wielditem` visual (deprecated): `{itemname}`.
]]
---@alias core.ObjectProperties.wielditem.textures
--- | core.ObjectProperties.wielditem.textures.strict
--- | string[]

-- ----------------------- ObjectProperties.wielditem ----------------------- --

--[[
Object properties to set for the `wielditem` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.wielditem.set
--- | core.ObjectProperties.wielditem.get
--- | _.ObjectProperties.wielditem.set

---@class _.ObjectProperties.wielditem.set : _.ObjectProperties.wielditem.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `wielditem` visual.
]]
---@class core.ObjectProperties.wielditem.get : _.ObjectProperties.wielditem.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.wielditem.set.__partial
--[[
Used for dropped items (see `builtin/game/item_entity.lua`).
If the item has a `wield_image`, the object is an extrusion of that,
otherwise:
* a cubic node or nodebox looks identical to the item
* a plantlike node is an extrusion of its texture
* any other item is an extrusion of its `inventory_image`
Item image animations are not played.
Wielditems are scaled a bit; use `0.667` in `visual_size` to make one appear
as large as a node.
]]
---@field visual "wielditem"
--[[
Item to show. If the name contains a ColorString or palette index (e.g. from
`core.itemstring_with_palette()`), the entity inherits the color.
]]
---@field wield_item core.Item.name
--[[
Deprecated usage: `textures = {itemname}` has the same effect as
`wield_item = itemname`.

* @deprecated
]]
---@field textures core.ObjectProperties.wielditem.textures?

---@class _.ObjectProperties.wielditem.get.__partial
--[[
Used for dropped items (see `builtin/game/item_entity.lua`).
If the item has a `wield_image`, the object is an extrusion of that,
otherwise:
* a cubic node or nodebox looks identical to the item
* a plantlike node is an extrusion of its texture
* any other item is an extrusion of its `inventory_image`
Item image animations are not played.
Wielditems are scaled a bit; use `0.667` in `visual_size` to make one appear
as large as a node.
]]
---@field visual "wielditem"
--[[
Item to show. If the name contains a ColorString or palette index (e.g. from
`core.itemstring_with_palette()`), the entity inherits the color.
]]
---@field wield_item core.Item.name
--[[
Deprecated usage: `textures = {itemname}` has the same effect as
`wield_item = itemname`.

* @deprecated 5.X
]]
---@field textures core.ObjectProperties.wielditem.textures