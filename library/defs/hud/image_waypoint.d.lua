---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

-- NOTE: while it *might* look like image_waypoint should derive from waypoint,
-- that is false. It's instead derived from image

--[[
Same as `image`, but does not accept a `position`; the position is instead
determined by `world_pos`, the world position of the waypoint. Fields
`alignment`, `offset` and `world_pos` are inherited.
]]
---@class core.HUDDef.image_waypoint : _.HUDDef.__base, _.HUDDef.alignment, _.HUDDef.world_pos
--[[
Type of the HUD element.
]]
---@field  type "image_waypoint"
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