---@meta _

-- luanti/doc/lua_api.md: Definition tables > `ParticleSpawner` definition

-- NOTE: only the modern ParticleSpawner definition is annotated. However,
-- interested contributors seeking to additionally annotate the legacy
-- ParticleSpawner definition is welcome to submit a complete PR/patch

--[[
ID of a particle spawner, as returned by `core.add_particlespawner`.
]]
---@alias core.ParticleSpawnerID int

-- ----------------------- ParticleSpawnerDef.regular ----------------------- --

--[[
Particle spawner definition used by `core.add_particlespawner`.

Before v5.6.0 a different, more limited syntax was used. The legacy fields
(`minpos`, `maxpos`, `minvel`, `maxvel`, `minacc`, `maxacc`, `minexptime`,
`maxexptime`, `minsize`, `maxsize`) can be combined with the modern ones to
support older servers: newer servers let the modern fields override them.

Modern properties (v5.6.0+) can be set as an absolute number, a single
vector, a `{min, max, bias?}` range, or animated with a `<name>_tween`
table. If several forms are present, the highest-precedence one is used:
legacy < number < vec3 < range < tween.
]]
---@class core.ParticleSpawnerDef.regular
--[[
Number of particles spawned over the time period `time`.
Range: [u16]
]]
---@field  amount int
--[[
Lifespan of spawner in seconds.
If time is 0 spawner has infinite lifespan and spawns the `amount` on
a per-second basis.
]]
---@field  time number
--[[
If true collide with `walkable` nodes and, depending on the
`object_collision` field, objects too.
]]
---@field  collisiondetection boolean?
--[[
If true particles are removed when they collide.
Requires collisiondetection = true to have any effect.
]]
---@field  collision_removal boolean?
--[[
If true particles collide with objects that are defined as
`physical = true,` and `collide_with_objects = true,`.
Requires collisiondetection = true to have any effect.
]]
---@field  object_collision boolean?
--[[
If defined, particle positions, velocities and accelerations are
relative to this object's position and yaw
]]
---@field attached core.ObjectRef?
--[[
If true face player using y axis only
]]
---@field  vertical boolean?
--[[
The texture of the particle
v5.6.0 and later: also supports the table format described in the
following section.
]]
---@field  texture core.ParticleTexture?
-- TODO separate both fields
--[[
Optional, if specified spawns particles only for this player
Can't be used together with `exclude_player`.
]]
---@field  playername string?
-- TODO separate both fields
--[[
Optional, if specified spawns particles not for this player
Added in v5.14.0. Can't be used together with `playername`.
]]
---@field  exclude_player string?
--[[
Optional, specifies how to animate the particles' texture
v5.6.0 and later: set length to -1 to synchronize the length
of the animation with the expiration time of individual particles.
(-2 causes the animation to be played twice, and so on)
]]
---@field  animation core.TileAnimationDef?
--[[
Optional, specify particle self-luminescence in darkness.
Integer in range [0, 14].
]]
---@field  glow core.Light.source?

-- -------------------- modern ParticleSpawner properties ------------------- --

---@class core.ParticleSpawnerDef.regular
--[[
Position at which particles can appear.
]]
---@field  pos core.ParticleSpawner.vec3_range?
--[[
Animates `pos` over the spawner's lifespan.
]]
---@field  pos_tween core.ParticleSpawner.tween.vec3_range?
--[[
Initial velocity of the particle.
]]
---@field  vel core.ParticleSpawner.vec3_range?
--[[
Animates `vel` over the spawner's lifespan.
]]
---@field  vel_tween core.ParticleSpawner.tween.vec3_range?
--[[
Direction and speed with which the particle accelerates.
]]
---@field  acc core.ParticleSpawner.vec3_range?
--[[
Animates `acc` over the spawner's lifespan.
]]
---@field  acc_tween core.ParticleSpawner.tween.vec3_range?
--[[
Scales the visual size of the particle texture.
If `node` is set, this can be set to 0 to spawn randomly-sized particles
(just like actual node dig particles).
]]
---@field  size core.ParticleSpawner.float_range?
--[[
Animates `size` over the spawner's lifespan.
]]
---@field  size_tween core.ParticleSpawner.tween.float_range?
--[[
Offsets the velocity of each particle by a random amount within the range
every frame. Used to create Brownian motion.
]]
---@field  jitter core.ParticleSpawner.vec3_range?
--[[
Animates `jitter` over the spawner's lifespan.
]]
---@field  jitter_tween core.ParticleSpawner.tween.vec3_range?
--[[
Amount by which absolute particle velocity along each axis decreases per
second. `1.0` slows a particle to a stop over a second; `-1.0` doubles its
speed every second. Use a vector like `vector.new(1,0,1)` to avoid
interfering with gravity provided by `acc`.
]]
---@field  drag core.ParticleSpawner.vec3_range?
--[[
Animates `drag` over the spawner's lifespan.
]]
---@field  drag_tween core.ParticleSpawner.tween.vec3_range?
--[[
Bounciness when `collisiondetection` is on. Values <= 0 disable bouncing;
`1` bounces without losing velocity; `2` doubles velocity with every bounce.
Unbounded, but values much larger than `1.0` are probably not useful.
]]
---@field  bounce core.ParticleSpawner.float_range?
--[[
Animates `bounce` over the spawner's lifespan.
]]
---@field  bounce_tween core.ParticleSpawner.tween.float_range?
--[[
Number of seconds after which the particle disappears.
]]
---@field  exptime core.ParticleSpawner.float_range?
--[[
Animates `exptime` over the spawner's lifespan.
]]
---@field  exptime_tween core.ParticleSpawner.tween.float_range?
--[[
Sets the birth orientation of particles relative to a shape in world space.
]]
---@field  attract core.ParticleSpawner.attract?
--[[
If set, arranges particles in a sphere around `pos`. A constant creates a
spherical shell, a vector an ovoid shell, and a range a volume, e.g.
`{min = 0.5, max = 1, bias = 1}` appears 0.5-1 nodes from `pos`, clustered
towards the center. Usually `pos` should be a single point.
]]
---@field  radius core.ParticleSpawner.vec3_range?
--[[
Animates `radius` over the spawner's lifespan.
]]
---@field  radius_tween core.ParticleSpawner.tween.vec3_range?
--[[
List of possible particle textures. One is picked at random for each spawned
particle. A `texture` may also be given; it is ignored by v5.6.0+ clients
and only sent to older clients that do not support texpools.
]]
---@field texpool core.ParticleTexture[]?

-- ------------------------- ParticleSpawnerDef.node ------------------------ --

--[[
Particle spawner whose particles look like node dig particles.
]]
---@class core.ParticleSpawnerDef.node
--[[
Optional, if specified the particles will have the same appearance as
node dig particles for the given node.
`texture` and `animation` will be ignored if this is set.
]]
---@field  node core.Node.set?
--[[
Optional, only valid in combination with `node`
If set to a valid integer in range [1, 6], specifies the tile from which the
particle texture is picked.
Otherwise, the default behavior is used. (currently: any random tile)
]]
---@field  node_tile int?

-- ----------------------------- ParticleSpawner ---------------------------- --

--[[
Particle spawner definition used by `core.add_particlespawner`: either a
regular spawner or one that looks like node dig particles (`node` set).
]]
---@alias core.ParticleSpawnerDef
--- | core.ParticleSpawnerDef.regular
--- | core.ParticleSpawnerDef.node