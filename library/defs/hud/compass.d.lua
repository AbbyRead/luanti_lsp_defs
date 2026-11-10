---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Rotating compass directions: 0 rotates as heading direction, 1 rotates in reverse direction.
]]
---@alias core.HUDDef.compass.regular.direction
--- | 0
--- | 1

--[[
Translating compass directions: 2 translates as landscape direction, 3 translates in reverse direction.
]]
---@alias core.HUDDef.compass.scalable.direction
--- | 2
--- | 3

--[[
Displays an image oriented or translated according to the current heading
direction. This variant rotates the image (`direction` 0 or 1).
]]
---@class core.HUDDef.compass.regular : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field  type "compass"
--[[
* `direction`: How the image is rotated/translated:
  * 0 - Rotate as heading direction
  * 1 - Rotate in reverse direction
  * 2 - Translate as landscape direction
  * 3 - Translate in reverse direction

If translation is chosen, texture is repeated horizontally to fill the whole element.
]]
---@field direction core.HUDDef.compass.regular.direction?
--[[
The name of the texture to use.
]]
---@field text string
--[[
The size of this element. Positive values represent pixels, negative values
represent percentage of the screen; e.g. `x = -100` means 100% (width).
Integers in range [s32].
]]
---@field size vec2

--[[
Compass variant that translates the image (`direction` 2 or 3). The texture
is repeated horizontally to fill the whole element.
]]
---@class core.HUDDef.compass.scalable
--[[
Scale of the translated image. Used only for `direction = 2` or `direction = 3`.
]]
---@field scale vec2?
--[[
How the image is translated: 2 translates as landscape direction, 3
translates in reverse direction.
]]
---@field direction core.HUDDef.compass.scalable.direction

--[[
Compass HUD element: either the rotating or the translating variant.
]]
---@alias core.HUDDef.compass
--- | core.HUDDef.compass.regular
--- | core.HUDDef.compass.scalable