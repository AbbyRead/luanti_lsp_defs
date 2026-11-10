---@meta _

-- luanti/doc/lua_api.md: Nodes > Node boxes

-- ------------------------------- NodeBox.box ------------------------------ --

--[[
A box in the form `{x1, y1, z1, x2, y2, z2}`.
Strict tuple form; see `core.NodeBox.box`.
]]
---@class core.NodeBox.box.strict
--[[
X coordinate of the first corner.
]]
---@field [1] number
--[[
Y coordinate of the first corner.
]]
---@field [2] number
--[[
Z coordinate of the first corner.
]]
---@field [3] number
--[[
X coordinate of the opposite corner.
]]
---@field [4] number
--[[
Y coordinate of the opposite corner.
]]
---@field [5] number
--[[
Z coordinate of the opposite corner.
]]
---@field [6] number

--[[
A box `{x1, y1, z1, x2, y2, z2}`.
A regular node's box is `{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}`.
To avoid collision issues, keep each value within [-1.45, 1.45]. This also
applies to leveled nodeboxes, where the final height shall not exceed this
soft limit.
]]
---@alias core.NodeBox.box
--- | number[]
--- | core.NodeBox.box.strict

--[[
A single box or a list of boxes.
]]
---@alias core.NodeBox.boxes
--- | core.NodeBox.box
--- | core.NodeBox.box[]

-- ----------------------------- NodeBox.regular ---------------------------- --

--[[
A normal cube; the default in most things.
]]
---@class core.NodeBox.regular
--[[
Always `"regular"`; may be omitted.
]]
---@field type "regular"?


-- ------------------------------ NodeBox.fixed ----------------------------- --

--[[
A fixed box (or boxes); the facedir `param2` is used, if applicable.
Type `"leveled"` is a variable height box (or boxes) with the top face
position defined by the node field `leveled`, or by `param2` if
`paramtype2 == "leveled"`. Other faces are defined by `fixed` as with
`"fixed"`.
]]
---@class core.NodeBox.fixed
--[[
`"fixed"` or `"leveled"`.
]]
---@field type "fixed"|"leveled"
--[[
Box or boxes making up the node.
]]
---@field fixed core.NodeBox.boxes

-- --------------------------- NodeBox.wallmounted -------------------------- --

--[[
A box like the selection box for torches; the wallmounted `param2` is used,
if applicable.
]]
---@class core.NodeBox.wallmounted
--[[
Always `"wallmounted"`.
]]
---@field type "wallmounted"
--[[
Box used when mounted to the ceiling.
]]
---@field wall_top core.NodeBox.box
--[[
Box used when mounted to the floor.
]]
---@field wall_bottom core.NodeBox.box
--[[
Box used when mounted to a wall.
]]
---@field wall_side core.NodeBox.box


-- ---------------------------- NodeBox.connected --------------------------- --

--[[
A node that has optional boxes depending on neighboring nodes' presence and
type. See also `NodeDef.connects_to`.
]]
---@class core.NodeBox.connected
--[[
Always `"connected"`.
]]
---@field type "connected"
--[[
Box or boxes always present.
]]
---@field fixed core.NodeBox.boxes
--[[
Box or boxes drawn when connected to a neighbor above.
]]
---@field connect_top core.NodeBox.boxes?
--[[
Box or boxes drawn when connected to a neighbor below.
]]
---@field connect_bottom core.NodeBox.boxes?
--[[
Box or boxes drawn when connected to a neighbor in front.
]]
---@field connect_front core.NodeBox.boxes?
--[[
Box or boxes drawn when connected to a neighbor on the left.
]]
---@field connect_left core.NodeBox.boxes?
--[[
Box or boxes drawn when connected to a neighbor behind.
]]
---@field connect_back core.NodeBox.boxes?
--[[
Box or boxes drawn when connected to a neighbor on the right.
]]
---@field connect_right core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor above.
]]
---@field disconnected_top core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor below.
]]
---@field disconnected_bottom core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor in front.
]]
---@field disconnected_front core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor on the left.
]]
---@field disconnected_left core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor behind.
]]
---@field disconnected_back core.NodeBox.boxes?
--[[
Box or boxes drawn when there is no suitable neighbor on the right.
]]
---@field disconnected_right core.NodeBox.boxes?
--[[
Box or boxes drawn when there is *no* neighbor at all.
]]
---@field disconnected core.NodeBox.boxes?
--[[
Box or boxes drawn when there are *no* neighbors to the sides.
]]
---@field disconnected_sides core.NodeBox.boxes?


-- --------------------------------- NodeBox -------------------------------- --

--[[
Node box, used for the `nodebox` drawtype, selection boxes and collision
boxes. See the `type` field of each variant.
]]
---@alias core.NodeBox
--- | core.NodeBox.regular
--- | core.NodeBox.fixed
--- | core.NodeBox.wallmounted
--- | core.NodeBox.connected