---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
### `hotbar`

Fields `direction`, `offset` and `alignment` are inherited. `alignment` is the
alignment of the inventory. Minimal client protocol version: 46.
]]
---@class core.HUDDef.hotbar : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.direction, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field type "hotbar"