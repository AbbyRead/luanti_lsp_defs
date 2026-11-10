---@meta _

-- luanti/doc/lua_api.md: Nodes
-- luanti/doc/lua_api.md: Nodes > Node paramtypes

--[[
Name of a node.
Special nodes:
* `"unknown"`: represents every item which has not been registered
* `"air"`: appears everywhere no other node is
* `"ignore"`: unloaded mapblocks, nodes not yet set by the map generator and
  everything outside the map boundary. Loaded areas can contain it too.
]]
---@alias core.Node.name
--- | "unknown"
--- | "air"
--- | "ignore"
--- | string

--[[
A node name or a group (`"group:<name>"`).
]]
---@alias core.Node.namelike
--- | core.Groups.node
--- | core.Node.name

-- ------------------------------- Node.param1 ------------------------------ --

--[[
Light value in the range [0, 15].
]]
---@alias core.Light int

--[[
One of the two light parts stored in `param1` (4 bits each), in the range
[0, 15].
]]
---@alias core.Light.part int

--[[
Amount of light emitted by a node, in the range [0, `core.LIGHT_MAX`] (14).
Values outside this range cause undefined behavior.
]]
---@alias core.Light.source int

--[[
Node `param1`, an 8-bit integer [0, 255].
Reserved for the engine when `paramtype ~= "none"`.
With `paramtype = "light"` the lower 4 bits store light without sun and the
upper 4 bits store light with sun.
Otherwise free to store arbitrary values.
]]
---@alias core.Param1 int

-- ------------------------------- Node.param2 ------------------------------ --

--[[
`paramtype2 = "wallmounted"`: integer [0, 7], the direction the node is
mounted to:
0 = y+, 1 = y-, 2 = x+, 3 = x-, 4 = z+, 5 = z-,
6 = y+ rotated by 90 degrees, 7 = y- rotated by -90 degrees.
Values 6 and 7 are only set on placement with `wallmounted_rotate_vertical`.
Create with `core.dir_to_wallmounted()`.
]]
---@alias core.Param2.wallmounted int

--[[
`paramtype2 = "facedir"`: integer [0, 23], 24 rotations in total.
`facedir / 4` is the axis direction:
0 = y+, 1 = z+, 2 = z-, 3 = x+, 4 = x-, 5 = y-.
`facedir % 4` is the left-handed rotation around that axis in 90 degree steps.
Placement sets the horizontal looking direction (0-3).
Connected nodeboxes do not rotate, only the textures do.
Create with `core.dir_to_facedir()`.
]]
---@alias core.Param2.facedir int

--[[
`paramtype2 = "4dir"`: integer [0, 3], horizontal rotation only.
Otherwise identical to `facedir`. Create with `core.dir_to_fourdir()`.
]]
---@alias core.Param2.4dir int

--[[
`paramtype2 = "leveled"`: height of the node.
* Leveled nodebox: top face height is `param2 / 64` nodes, range [0, 127].
* Rooted plantlike: plantlike height is `param2 / 16` nodes, full range.
]]
---@alias core.Param2.leveled int

--[[
`paramtype2 = "leveled"` with the `plantlike_rooted` drawtype.
The plantlike height is `param2 / 16` nodes; the full range [0, 255] is usable.
]]
---@alias core.Param2.leveled.rooted_plantlike int

--[[
`paramtype2 = "degrotate"`: integer [0, 239].
The actual rotation in degrees is the value multiplied by 1.5.
Valid for `plantlike` and `mesh` drawtypes.
]]
---@alias core.Param2.degrotate int

--[[
`paramtype2 = "meshoptions"` (`plantlike` drawtype only), a bitfield.
Bits 0-2 select the shape (use one):
0 = "x" shaped, 1 = "+" shaped, 2 = "*" shaped (3 faces),
3 = "#" shaped (4 faces), 4 = "#" shaped with faces leaning outwards.
5-7 are reserved.
Bits 3-7 enable optional modifiers (add the values):
8 = slight random horizontal offset, 16 = mesh 1.4x larger,
32 = faces randomly moved down a bit (1/8 max). 64 and 128 are reserved.
Example: `17` is a "+" shaped plant, 1.4x larger.
]]
---@alias core.Param2.meshoptions.plantlike int

--[[
`paramtype2 = "colorfacedir"`: same as `facedir`, but with colors.
The 3 most significant bits select the palette color (8 pixel palette), the
5 least significant bits hold the `facedir` value.
]]
---@alias core.Param2.facedir.color int

--[[
`paramtype2 = "color4dir"`: same as `4dir`, but with colors.
The 6 most significant bits select the palette color (64 pixel palette), the
2 least significant bits hold the `4dir` rotation.
]]
---@alias core.Param2.4dir.color int

--[[
`paramtype2 = "colorwallmounted"`: same as `wallmounted`, but with colors.
The 5 most significant bits select the palette color (32 pixel palette), the
3 least significant bits hold the `wallmounted` value.
]]
---@alias core.Param2.wallmounted.color int

--[[
Internal liquid level of a `glasslikeliquidlevel` node, bits 0-5:
64 levels, 0 is empty and 63 is full.
]]
---@alias core.Param2.glasslikeliquidlevel.liquid int

--[[
Frame appearance modifiers of a `glasslikeliquidlevel` node, bits 6-7
(add the values):
64 = do not connect with neighbors above or below,
128 = do not connect with neighbors to the sides.
]]
---@alias core.Param2.glasslikeliquidlevel.frame int

--[[
`paramtype2 = "glasslikeliquidlevel"`: liquid level (bits 0-5) combined with
frame modifiers (bits 6-7).
Only valid for `glasslike_framed` and `glasslike_framed_optional` drawtypes
(the latter only if the "Connected Glass" setting is enabled).
The liquid texture is defined with `special_tiles`.
]]
---@alias core.Param2.glasslikeliquidlevel int

--[[
`paramtype2 = "colordegrotate"`: same as `degrotate`, but with colors.
The 3 most significant bits select the palette color (8 pixel palette), the
5 least significant bits hold the rotation in range [0, 23] in 15 degree steps.
]]
---@alias core.Param2.degrotate.color int

--[[
Node `param2`, an 8-bit integer [0, 255].
Its function is determined by `paramtype2`; it is reserved for the engine when
`paramtype2 ~= "none"`. With `"none"` it can store arbitrary values.
Also used for `flowingliquid` (bits 0-2: level 0-7, bit 3: flowing downwards)
and `color` (palette index, 256 pixel palette).
]]
---@alias core.Param2 int

-- ---------------------------------- Node ---------------------------------- --

--[[
Node table as returned by the engine. Nodes are passed by value.
]]
---@class core.Node.get
--[[
Name of the node.
]]
---@field name string
--[[
First parameter, see `paramtype`.
]]
---@field param1 core.Param1
--[[
Second parameter, see `paramtype2`.
]]
---@field param2 core.Param2

--[[
Node table accepted by the engine. `param1` and `param2` default to 0.
]]
---@alias core.Node.set
--- | core.Node.get
--- | _.Node.set

---@class _.Node.set
--[[
Name of the node.
]]
---@field name string
--[[
First parameter, see `paramtype`.
]]
---@field param1 core.Param1?
--[[
Second parameter, see `paramtype2`.
]]
---@field param2 core.Param2?