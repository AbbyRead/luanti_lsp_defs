---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

-- ------------------ ObjectProperties.collisionbox.strict ------------------ --

--[[
Collision box as `{ xmin, ymin, zmin, xmax, ymax, zmax }` in nodes from the
object position.
Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
]]
---@class core.ObjectProperties.collisionbox.strict
--[[
Minimum X.
]]
---@field [1] number
--[[
Minimum Y.
]]
---@field [2] number
--[[
Minimum Z.
]]
---@field [3] number
--[[
Maximum X.
]]
---@field [4] number
--[[
Maximum Y.
]]
---@field [5] number
--[[
Maximum Z.
]]
---@field [6] number

--[[
Collision box, `{ xmin, ymin, zmin, xmax, ymax, zmax }` in nodes from the
object position. Default is `{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }`.
]]
---@alias core.ObjectProperties.collisionbox
--- | core.ObjectProperties.collisionbox.strict
--- | number[]

-- ------------------ ObjectProperties.selectionbox.strict ------------------ --

--[[
Selection box to set: the six box values plus an optional `rotate` flag.
If not set, the selection box copies the collision box and will not rotate.
--]]
---@class core.ObjectProperties.selectionbox.strict.set : core.ObjectProperties.collisionbox.strict
--[[
If `false`, the selection box does not rotate with the object, remaining
fixed to the axes. If `true`, it matches the object's rotation and any
attachment rotations.
Raycasts use the selection box and the object's rotation, but do *not* obey
attachment rotations.
]]
---@field rotate boolean?

--[[
Selection box as returned by the engine: the six box values plus `rotate`.
--]]
---@class core.ObjectProperties.selectionbox.strict.get : core.ObjectProperties.collisionbox.strict
--[[
If `false`, the selection box does not rotate with the object, remaining
fixed to the axes. If `true`, it matches the object's rotation and any
attachment rotations.
]]
---@field rotate boolean

--[[
Selection box to set, `{ xmin, ymin, zmin, xmax, ymax, zmax }` in nodes from
the object position, optionally with `rotate`.
For server-side raycasts to work correctly, the selection box should extend
at most 5 units in each direction.
]]
---@alias core.ObjectProperties.selectionbox.set
--- | core.ObjectProperties.selectionbox.get
--- | core.ObjectProperties.selectionbox.strict.set
--- | number[]

--[[
Selection box as returned by the engine, `{ xmin, ymin, zmin, xmax, ymax,
zmax }` in nodes from the object position, optionally with `rotate`.
]]
---@alias core.ObjectProperties.selectionbox.get
--- | core.ObjectProperties.selectionbox.strict.get
--- | number[]

-- ----------------------- ObjectPropertiesBase fields ---------------------- --

---@class _.ObjectProperties.__base.set
--[[
{ xmin, ymin, zmin, xmax, ymax, zmax } in nodes from object position.
Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
If not set, the selection box copies the collision box, and will also not rotate.
]]
---@field collisionbox core.ObjectProperties.collisionbox?
--[[
If `rotate = false`, the selection box will not rotate with the object itself, remaining fixed to the axes.
If `rotate = true`, it will match the object's rotation and any attachment rotations.
Raycasts use the selection box and object's rotation, but do *not* obey attachment rotations.
For server-side raycasts to work correctly,
the selection box should extend at most 5 units in each direction.
]]
---@field selectionbox core.ObjectProperties.selectionbox.set?

---@class _.ObjectProperties.__base.get
--[[
{ xmin, ymin, zmin, xmax, ymax, zmax } in nodes from object position.
Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
If not set, the selection box copies the collision box, and will also not rotate.
]]
---@field collisionbox core.ObjectProperties.collisionbox
--[[
If `rotate = false`, the selection box will not rotate with the object itself, remaining fixed to the axes.
If `rotate = true`, it will match the object's rotation and any attachment rotations.
Raycasts use the selection box and object's rotation, but do *not* obey attachment rotations.
For server-side raycasts to work correctly,
the selection box should extend at most 5 units in each direction.
]]
---@field selectionbox core.ObjectProperties.selectionbox.get