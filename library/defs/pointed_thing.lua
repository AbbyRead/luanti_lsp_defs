---@meta _

-- luanti/doc/lua_api.md: Representations of simple things

-- -------------------------- PointedThing.nothing -------------------------- --

--[[
`{type="nothing"}`: the player is not pointing at anything.
]]
---@class core.PointedThing.nothing
--[[
Type of pointed thing.
]]
---@field type "nothing"

-- ---------------------------- PointedThing.node --------------------------- --

--[[
`{type="node", under=pos, above=pos}`: indicates a pointed node selection
box.
]]
---@class core.PointedThing.node
--[[
Type of pointed thing.
]]
---@field type "node"
--[[
Node position behind the pointed face.
]]
---@field under ivec
--[[
Node position in front of the pointed face.
]]
---@field above ivec

-- --------------------------- PointedThing.object -------------------------- --

--[[
`{type="object", ref=ObjectRef}`: a pointed object.
]]
---@class core.PointedThing.object
--[[
Type of pointed thing.
]]
---@field type "object"
--[[
The pointed object.
]]
---@field ref core.ObjectRef

--[[
A pointed thing, as passed to item callbacks: nothing, a node or an object.
Exact pointing location fields exist only when it comes from a `Raycast`.
]]
---@alias core.PointedThing
--- | core.PointedThing.nothing
--- | core.PointedThing.node
--- | core.PointedThing.object

-- -------------------------- PointedThing.raycast -------------------------- --

---@class _.PointedThing.raycast.__partial
--[[
Only raycast supports this
* `pointed_thing.intersection_point`: The absolute world coordinates of the
  point on the selection box which is pointed at. May be in the selection box
  if the pointer is in the box too.
]]
---@field intersection_point vec
--[[
Only raycast supports this
* `pointed_thing.box_id`: The ID of the pointed selection box (counting starts
  from 1).
]]
---@field box_id int
--[[
Only raycast supports this
* `pointed_thing.intersection_normal`: Unit vector, points outwards of the
  selected selection box. This specifies which face is pointed at.
  Is a null vector `vector.zero()` when the pointer is inside the selection box.
  For entities with rotated selection boxes, this will be rotated properly
  by the entity's rotation - it will always be in absolute world space.
]]
---@field intersection_normal vec

--[[
Pointed node from a `Raycast`, with exact pointing location.
]]
---@class core.PointedThing.raycast.node : core.PointedThing.node, _.PointedThing.raycast.__partial

--[[
Pointed object from a `Raycast`, with exact pointing location.
]]
---@class core.PointedThing.raycast.object : core.PointedThing.object, _.PointedThing.raycast.__partial

--[[
Pointed thing from a `Raycast`: a node or an object with exact pointing location.
]]
---@alias core.PointedThing.raycast.all
--- | core.PointedThing.raycast.node
--- | core.PointedThing.raycast.object