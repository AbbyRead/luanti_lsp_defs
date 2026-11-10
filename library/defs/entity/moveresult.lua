---@meta _

-- luanti/doc/lua_api.md: Registered entities

-- ---------------------------- Entity.moveresult --------------------------- --

--[[
Collision info passed to `on_step` (`moveresult` argument). Only available if
`physical = true`.
]]
---@class core.Entity.moveresult
--[[
Only true if the entity was moving and collided with ground.
]]
---@field  touching_ground boolean
--[[
Whether the entity collided with anything.
]]
---@field  collides boolean
--[[
Whether the entity is standing on an object.
]]
---@field  standing_on_object boolean
--[[
Collisions that happened during the step. Does not contain data of unloaded
mapblock collisions or when the velocity changes are negligibly small.
]]
---@field  collisions core.Entity.collision[]