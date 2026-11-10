---@meta _

-- luanti/doc/lua_api.md: Definition tables > `ParticleSpawner` definition

--[[
Kind of attractor shape particles are oriented towards.

* `"none"`: no attractor; the `attract` table is ignored
* `"point"`: attracted to a point. Combine with `radius` for a sphere-like
  effect.
* `"line"`: attracted to an infinite line through `origin` with direction
  `direction` (e.g. beacon or energy beam effects)
* `"plane"`: attracted to an infinite plane containing `origin` with surface
  normal `direction` (e.g. portals)
]]
---@alias core.ParticleSpawner.kind
--- | "none"
--- | "point"
--- | "line"
--- | "plane"

--[[
Sets the birth orientation of particles relative to a shape in world space.
Alternative to setting velocity: particles can emerge from or enter an
entity or node. The calculated velocity is **added** to `vel` if set, so
`vel` should usually be 0. Can be animated with `*_tween` fields.
]]
---@class core.ParticleSpawner.attract
--[[
Selects the attractor shape.
]]
---@field  kind core.ParticleSpawner.kind
--[[
Speed factor towards the attractor. Negative values move particles away.
Actual speed is this value times the particle's initial distance from the
attractor's origin.
]]
---@field  strength core.ParticleSpawner.float_range
--[[
Animates `strength`.
]]
---@field  strength_tween core.ParticleSpawner.tween.float_range?
--[[
Origin point of the attractor shape. Acts as an offset if `origin_attached`
is set.
]]
---@field  origin core.ParticleSpawner.vec3?
--[[
Animates `origin`.
]]
---@field  origin_tween core.ParticleSpawner.tween.vec3?
--[[
Direction the attractor shape faces. For lines, the line's angle (e.g.
`(0,1,0)` is a vertical line through `origin`). For planes, the surface
normal. Acts as an offset if `direction_attached` is set.
]]
---@field  direction core.ParticleSpawner.vec3?
--[[
Animates `direction`.
]]
---@field  direction_tween core.ParticleSpawner.tween.vec3?
--[[
Specify `origin` as an offset from this object's position instead of a world
coordinate.
]]
---@field  origin_attached core.ObjectRef?
--[[
Specify `direction` as an offset from this object's position instead of a
world coordinate.
]]
---@field  direction_attached core.ObjectRef?
--[[
If true (default), particle lifetimes are adjusted so they die as they cross
the attractor threshold. Set to false to let particles live out their natural
lives.
]]
---@field  die_on_contact boolean?