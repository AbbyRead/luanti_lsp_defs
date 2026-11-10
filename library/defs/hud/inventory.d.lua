---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Displays an inventory list on the HUD. Fields `direction`, `offset` and
`alignment` are inherited. `alignment` is the alignment of the inventory;
aligned at the top left corner if not specified.
]]
---@class core.HUDDef.inventory : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.direction, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field  type "inventory"
--[[
The name of the inventory list to be displayed.
]]
---@field text string
--[[
Amount of item slots in the inventory to be displayed. Integer in range [u16].
]]
---@field number int?
--[[
The slot at this index is rendered as if it were selected using the texture
set by `player:hud_set_hotbar_selected_image(texturename)`. Integer in range
[u16].
]]
---@field item int?