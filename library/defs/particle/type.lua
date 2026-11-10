---@meta _

-- luanti/doc/lua_api.md: Definition tables > `ParticleSpawner` definition

-- -------------------------- ParticleSpawner.vec2 -------------------------- --

--[[
2D vector used by particle spawner properties (v5.6.0+).
A single number sets both components to that value.
]]
---@alias core.ParticleSpawner.vec2
--- | vec2
--- | number

-- -------------------------- ParticleSpawner.vec3 -------------------------- --

--[[
3D vector used by particle spawner properties (v5.6.0+).
A single number sets all components to that value.
]]
---@alias core.ParticleSpawner.vec3
--- | vector
--- | number

-- ----------------------- ParticleSpawner.float_range ---------------------- --

---@class _.ParticleSpawner.float_range
--[[
Minimum value this property can be set to in spawned particles.
]]
---@field min number
--[[
Maximum value this property can be set to in spawned particles.
]]
---@field max number

--[[
A float range: a table `{min = A, max = B}`, or a plain number for a fixed
value. Each spawned particle gets a random value within the range.
]]
---@alias core.ParticleSpawner.float_range
--- | _.ParticleSpawner.float_range
--- | number

-- ----------------------- ParticleSpawner.vec2_range ----------------------- --

---@class _.ParticleSpawner.vec2_range
--[[
Minimum value this property can be set to in spawned particles.
]]
---@field min vec2
--[[
Maximum value this property can be set to in spawned particles.
]]
---@field max vec2
--[[
Distribution bias. `0` makes all values equally likely. Positive values
favor the minimum end of the range (higher is stronger), negative values
favor the maximum end. The curve is exponential and unbounded.
]]
---@field bias number?

--[[
A vec2 range: a `{min, max, bias?}` table, a single vec2, or a number that
sets all components.
]]
---@alias core.ParticleSpawner.vec2_range
--- | _.ParticleSpawner.vec2_range
--- | core.ParticleSpawner.vec2

-- ----------------------- ParticleSpawner.vec3_range ----------------------- --

---@class _.ParticleSpawner.vec3_range
--[[
Minimum value this property can be set to in spawned particles.
]]
---@field min vector|number
--[[
Maximum value this property can be set to in spawned particles.
]]
---@field max vector|number
--[[
Distribution bias. `0` makes all values equally likely. Positive values
favor the minimum end of the range (higher is stronger), negative values
favor the maximum end. The curve is exponential and unbounded.
]]
---@field bias number?

--[[
A vec3 range: a `{min, max, bias?}` table (values picked at random within the
cubic range), a single vec3 (fixed value), or a number that sets all
components.
]]
---@alias core.ParticleSpawner.vec3_range
--- | _.ParticleSpawner.vec3_range
--- | core.ParticleSpawner.vec3

-- -------------------------- ParticleSpawner.tween ------------------------- --

--[[
Tween interpolation style.

* `"fwd"`: linear, first frame to last frame (default)
* `"rev"`: linear, last frame to first frame
* `"pulse"`: linear, first to last, then back to first
* `"flicker"`: like `"pulse"`, with slight randomization for stutter
]]
---@alias core.ParticleSpawner.tween.style
--- | "fwd"
--- | "rev"
--- | "pulse"
--- | "flicker"

---@class _.ParticleSpawner.tween.__base
--[[
Interpolation style. Defaults to `"fwd"`.
]]
---@field  style core.ParticleSpawner.tween.style?
--[[
Number of times the animation plays over the lifespan.
Range: [1, 65535].
]]
---@field  reps number?
--[[
Point in the lifespan at which the animation begins: `0` is the very
beginning, `1` is the very end.
]]
---@field  start number?

--[[
Tween of floats. A list of frames plus the optional fields `style`, `reps`
and `start` (see `_.ParticleSpawner.tween.__base`).

Spawner tween tables use the spawner's lifespan as time reference. Texture
tweens (`alpha_tween`, `scale_tween`) use the particle's lifetime.
Currently only the first and last frames are used; extra frames are accepted
for forward compatibility.
]]
---@class core.ParticleSpawner.tween.float : {[int]:number}, _.ParticleSpawner.tween.__base

--[[
Tween of vec2s. See `core.ParticleSpawner.tween.float` for the shared fields
and frame handling.
]]
---@class core.ParticleSpawner.tween.vec2 : {[int]:core.ParticleSpawner.vec2}, _.ParticleSpawner.tween.__base

--[[
Tween of vec3s. See `core.ParticleSpawner.tween.float` for the shared fields
and frame handling.
]]
---@class core.ParticleSpawner.tween.vec3 : {[int]:core.ParticleSpawner.vec3}, _.ParticleSpawner.tween.__base

--[[
Tween of float ranges. See `core.ParticleSpawner.tween.float` for the shared
fields and frame handling.
]]
---@class core.ParticleSpawner.tween.float_range : {[int]:core.ParticleSpawner.float_range},  _.ParticleSpawner.tween.__base

--[[
Tween of vec3 ranges. Frames may be mixed, e.g. a number followed by a range.
See `core.ParticleSpawner.tween.float` for the shared fields and frame
handling.
]]
---@class core.ParticleSpawner.tween.vec3_range : {[int]:core.ParticleSpawner.vec3_range}, _.ParticleSpawner.tween.__base