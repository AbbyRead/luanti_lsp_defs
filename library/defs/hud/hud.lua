---@meta _

-- luanti/doc/lua_api.md: HUD
-- luanti/doc/lua_api.md: Definition tables > HUD Definition

--[[
Numeric ID of a HUD element, as returned by `ObjectRef:hud_add`.
]]
---@alias core.HUDID int

--[[
Keys of a HUD element that can be changed with `ObjectRef:hud_change`.
Since most values have multiple different functions, see the HUD section of
the docs for the use of each field per element type.
]]
---@alias core.HUDDef.keys
--- | "position"
--- | "name"
--- | "scale"
--- | "text"
--- | "text2"
--- | "number"
--- | "item"
--- | "direction"
--- | "alignment"
--- | "offset"
--- | "world_pos"
--- | "size"
--- | "z_index"
--- | "style"
--- | "precision"

-- ------------------------------ HUDDef.__base ----------------------------- --

---@class _.HUDDef.__base
--[[
Type of element, can be "compass", "hotbar" (46 *), "image",
"image_waypoint", "inventory", "minimap" (44 *), "statbar", "text" or
"waypoint". If undefined "text" is used.
(*) minimal protocol version for client-side support
]]
---@field  type "image"
--[[
Not yet used, but should contain a description of what the HUD element
represents.
]]
---@field  name string
--[[
Pixel offset from the position, `{ x = <number>, y = <number> }`. Fractional
values can be used. Contrary to position, the offset is not scaled to screen
size, which allows precisely positioned items. It does adapt to screen DPI and
the user defined scaling factor.
]]
---@field offset vec2?
--[[
Integer [s16] that specifies the order of HUD elements from back to front.
Lower z-index elements are displayed behind higher ones; elements with the
same z-index are displayed in an arbitrary order. Recommended values:

* -400: graphical effects, such as vignette
* -300: name tags, waypoints
* -200: wieldhand
* -100: things that block the player's view, e.g. masks
* 0: default; standard in-game HUD elements (crosshair, hotbar, minimap,
  builtin statbars, etc.)
* 100: temporary text messages or notification icons
* 1000: full-screen effects such as a full-black screen or credits

If an element doesn't fit into any category, pick an integer between the
suggested values.
]]
---@field  z_index int? Default 0
--[[
If `false`, players cannot hide the element (e.g. to obstruct their view).
Has no effect for clients older than version 5.17. Default true.
]]
---@field  hideable boolean?

-- ----------------------------- HUDDef partials ---------------------------- --

---@class _.HUDDef.position
--[[
Top left corner position of element
]]
---@field position vec2

--[[
Direction in which something is drawn: `0` left to right, `1` right to left,
`2` top to bottom, `3` bottom to top.
]]
---@alias core.HUDDef.direction
--- | 0
--- | 1
--- | 2
--- | 3

---@class _.HUDDef.direction
--[[
Direction in which something is drawn: 0 left-right, 1 right-left, 2 top-bottom, 3 bottom-top.
]]
---@field direction core.HUDDef.direction?

---@class _.HUDDef.alignment
--[[
How the element is aligned. `x` and `y` are numbers in range [-1.0, 1.0],
with `0` being central, `-1` moved to the left/up and `1` to the right/down.
Fractional values can be used.
]]
---@field alignment vec2?

---@class _.HUDDef.world_pos
--[[
World position of the element (used by waypoint element types).
]]
---@field world_pos vec?

-- --------------------------------- HUDDef --------------------------------- --

--[[
Definition of a HUD element.

Used by `ObjectRef:hud_add`. Returned by `ObjectRef:hud_get`. Fields not
listed for an element type are ignored.
]]
---@alias core.HUDDef
--- | core.HUDDef.image
--- | core.HUDDef.text
--- | core.HUDDef.statbar
--- | core.HUDDef.inventory
--- | core.HUDDef.hotbar
--- | core.HUDDef.waypoint
--- | core.HUDDef.image_waypoint
--- | core.HUDDef.compass
--- | core.HUDDef.minimap