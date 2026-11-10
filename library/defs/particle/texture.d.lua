---@meta _

-- luanti/doc/lua_api.md: Definition tables > `ParticleSpawner` definition

--[[
Blend mode of a particle texture.

* `"alpha"`: (default) blend transparent pixels by the source alpha channel.
  Particles are not transparency-sorted and may render incorrectly with
  translucent nodes.
* `"clip"`: pixels are fully opaque or fully transparent depending on whether
  alpha is above or below 50%. Faster; prefer it if semi-transparency is not
  needed.
* `"add"`: add pixel values to those underneath (modulo source alpha). Useful
  for bright light effects such as sparks or fire.
* `"screen"`: like `"add"` but less bright. NOT equivalent to the image editor
  "screen" effect, as it ignores the alpha channel of the blended image.
* `"sub"`: inverse of `"add"`: subtract the source pixel from the one
  underneath. White turns the background black, black is "transparent".
]]
---@alias core.ParticleTexture.blend
--- | "alpha"
--- | "clip"
--- | "add"
--- | "screen"
--- | "sub"

--[[
Table format of a particle texture (v5.6.0+).
]]
---@class core.ParticleTexture.tablefmt
--[[
Texture specification string.
]]
---@field  name core.Texture
--[[
Visibility: `1.0` is fully visible, `0` is invisible.
]]
---@field  alpha number?
--[[
Animates `alpha` over the particle's lifetime, e.g. `{1, 0}` fades the
particle out. Can be used instead of `alpha`.
]]
---@field  alpha_tween core.ParticleSpawner.tween.float?
--[[
Scales the texture onscreen. A number scales both axes.
]]
---@field  scale core.ParticleSpawner.vec2?
--[[
Animates `scale` over the particle's lifetime, e.g. `{{x=1, y=1}, {x=0, y=1}}`
shrinks the particle along one axis until it disappears.
]]
---@field  scale_tween core.ParticleSpawner.tween.vec2?
--[[
Blend mode. Defaults to `"alpha"`.
]]
---@field  blend core.ParticleTexture.blend?
--[[
Overrides the particle spawner's global `animation` for this texture only.
]]
---@field  animation core.TileAnimationDef?

--[[
Plain texture specification string (the only format before v5.6.0).
]]
---@class core.ParticleTexture.stringfmt : string

--[[
Particle texture: a texture string or a table with extra options such as
alpha, scale, blend mode and animation (v5.6.0+).
]]
---@alias core.ParticleTexture
--- | core.ParticleTexture.tablefmt
--- | core.ParticleTexture.stringfmt