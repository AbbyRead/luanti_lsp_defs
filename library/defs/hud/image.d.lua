---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Displays an image on the HUD. Fields `alignment` and `offset` are inherited.
]]
---@class core.HUDDef.image : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.alignment
--[[
Type of the HUD element.
]]
---@field  type "image"
--[[
The scale of the image, with `{x = 1, y = 1}` being the original texture
size. The `x` and `y` fields are numbers and apply to the respective axes.
Positive values scale the source image. Negative values represent percentages
relative to screen dimensions. Example: `{x = -20, y = 3}` means the image
will be drawn 20% of screen width wide, and 3 times as high as the source
image is.
]]
---@field scale vec2?
--[[
The name of the texture that is displayed.
]]
---@field text string