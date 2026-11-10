---@meta _

-- luanti/doc/lua_api.md: Representations of simple things
-- luanti/doc/lua_api.md: 'core' namespace reference > Environment access
-- luanti/doc/lua_api.md: Class reference > `Raycast`

-- ------------------------------- constructor ------------------------------ --

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects false
---@param liquids boolean?
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.nodes
function Raycast(pos1, pos2, objects, liquids, pointabilities) end

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects true?
---@param liquids boolean?
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.all
function Raycast(pos1, pos2, objects, liquids, pointabilities) end

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects true?
---@param liquids true
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.all
function Raycast(pos1, pos2, objects, liquids, pointabilities) end

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects false
---@param liquids boolean?
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.nodes
function core.raycast(pos1, pos2, objects, liquids, pointabilities) end

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects true?
---@param liquids boolean?
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.all
function core.raycast(pos1, pos2, objects, liquids, pointabilities) end

--[[
* `core.raycast(pos1, pos2, objects, liquids, pointabilities)`: returns `Raycast`
    * Creates a `Raycast` object.
    * `pos1`: start of the ray
    * `pos2`: end of the ray
    * `objects`: if false, only nodes will be returned. Default is `true`.
    * `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be
                 returned. Default is `false`.
    * `pointabilities`: Allows overriding the `pointable` property of
      nodes and objects. Uses the same format as the `pointabilities` property
      of item definitions. Default is `nil`.
]]
---@nodiscard
---@param pos1 vector
---@param pos2 vector
---@param objects true?
---@param liquids true
---@param pointabilities core.ItemDef.pointabilities?
---@return core.Raycast.all
function core.raycast(pos1, pos2, objects, liquids, pointabilities) end

-- --------------------------------- Raycast -------------------------------- --

--[[
`Raycast`
---------

A raycast on the map. It works with selection boxes.
Can be used as an iterator in a for loop as:

```lua
local ray = Raycast(...)
for pointed_thing in ray do
    ...
end
```

The map is loaded as the ray advances. If the map is modified after the
`Raycast` is created, the changes may or may not have an effect on the object.

It can be created via `Raycast(pos1, pos2, objects, liquids, pointabilities)`
or `core.raycast(pos1, pos2, objects, liquids, pointabilities)`.

### Limitations

Raycasts don't always work properly for attached objects as the server has no
knowledge of models & bones.

**Rotated selectionboxes paired with `automatic_rotate` are not reliable**
either since the server can't reliably know the total rotation of the objects
on different clients (which may differ on a per-client basis).
The server calculates the total rotation incurred through `automatic_rotate` as
a "best guess" assuming the object was active & rotating on the client all the
time since its creation. This may be significantly out of sync with what
clients see. Additionally, network latency and delayed property sending may
create a mismatch of client- & server rotations.

In singleplayer mode, raycasts on objects with rotated selectionboxes &
automatic rotate will usually only be slightly off; toggling automatic
rotation may however cause errors to add up.

In multiplayer mode, the error may be arbitrarily large.

Raycast over nodes only (`objects == false`).
]]
---@class core.Raycast.nodes
---@overload fun():core.PointedThing.raycast.node
local RaycastNodes = {}

--[[
* `next()`: returns a `pointed_thing` with exact pointing location
    * Returns the next thing pointed by the ray or nil.
]]
---@nodiscard
---@return core.PointedThing.raycast.node?
function RaycastNodes:next() end

--[[
Raycast over objects only.
]]
---@class core.Raycast.objects
---@overload fun():core.PointedThing.raycast.object
local RaycastObjects = {}

--[[
* `next()`: returns a `pointed_thing` with exact pointing location
    * Returns the next thing pointed by the ray or nil.
]]
---@nodiscard
---@return core.PointedThing.raycast.object?
function RaycastObjects:next() end

--[[
Raycast over both nodes and objects.
]]
---@class core.Raycast.all
---@overload fun():core.PointedThing.raycast.all
local RaycastAll = {}

--[[
* `next()`: returns a `pointed_thing` with exact pointing location
    * Returns the next thing pointed by the ray or nil.
]]
---@nodiscard
---@return core.PointedThing.raycast.all?
function RaycastAll:next() end