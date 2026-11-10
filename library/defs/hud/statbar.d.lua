---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Displays a horizontal bar made up of half-images with an optional
background. Field `direction` is inherited (direction the images extend to),
as is `offset`.
]]
---@class core.HUDDef.statbar : _.HUDDef.__base, _.HUDDef.position, _.HUDDef.direction
--[[
Type of the HUD element.
]]
---@field  type "statbar"
--[[
The name of the texture to use.
]]
---@field text string
--[[
Optional texture name to enable a background / "off state" texture (useful
to visualize the maximal value). Both textures must have the same size.
]]
---@field text2 string?
--[[
The amount of half-textures that are displayed. If odd, will end with a
vertically center-split texture. Integer in range [u32].
]]
---@field number int
--[[
Same as `number` but for the "off state" texture. Integer in range [u32].
]]
---@field item int
--[[
If used, will force the full-image size to this value (override texture pack
image size). Syntax: `{x = <integer>, y = <integer>}`, where both integers are
in range [1, 2^31-1].
]]
---@field size vec2?