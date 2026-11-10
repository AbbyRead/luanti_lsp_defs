---@meta _

-- luanti/doc/lua_api.md: Registered entities

-- ------------------------- Entity.collision.__base ------------------------ --

---@class _.Entity.collision.__base
--[[
Axis of the collision.
]]
---@field  axis "x"|"y"|"z"
--[[
The position of the entity when the collision occurred.
Available since feature "moveresult_new_pos".
]]
---@field  new_pos vec
--[[
Entity velocity before the collision.
]]
---@field  old_velocity vec
--[[
Entity velocity after the collision.
]]
---@field  new_velocity vec

-- -------------------------- Entity.collision.node ------------------------- --

--[[
Collision with a node. `collisions` does not contain data of unloaded
mapblock collisions or collisions where the velocity changes are negligibly
small.
]]
---@class core.Entity.collision.node : _.Entity.collision.__base
--[[
Collision type.
]]
---@field  type "node"
--[[
Position of the node that was collided with.
]]
---@field  node_pos ivec

-- ------------------------- Entity.collision.object ------------------------ --

--[[
Collision with an object. `collisions` does not contain data of unloaded
mapblock collisions or collisions where the velocity changes are negligibly
small.
]]
---@class core.Entity.collision.object : _.Entity.collision.__base
--[[
Collision type.
]]
---@field  type "object"
--[[
Object that was collided with.
]]
---@field  object core.ObjectRef

-- ---------------------------- Entity.collision ---------------------------- --

--[[
Collision info entry of `moveresult.collisions`: with a node or an object.
]]
---@alias core.Entity.collision
--- | core.Entity.collision.node
--- | core.Entity.collision.object