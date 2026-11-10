---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

-- ------------- ObjectProperties.upright_sprite.textures.strict ------------ --

--[[
Textures of an `upright_sprite` visual: `{front, back}`.
]]
---@class core.ObjectProperties.upright_sprite.textures.strict
--[[
Texture of the front side.
]]
---@field [1] core.Texture
--[[
Texture of the back side.
]]
---@field [2] core.Texture

--[[
Textures of an `upright_sprite` visual. Uses 2 textures: `{front, back}`.
]]
---@alias core.ObjectProperties.upright_sprite.textures
--- | core.ObjectProperties.upright_sprite.textures.strict
--- | string[]

-- ------------------- ObjectProperties.upright_sprite.set ------------------ --

--[[
Object properties to set for the `upright_sprite` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.upright_sprite.set
--- | core.ObjectProperties.upright_sprite.get
--- | _.ObjectProperties.upright_sprite.set

---@class _.ObjectProperties.upright_sprite.set : _.ObjectProperties.upright_sprite.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `upright_sprite`
visual.
]]
---@class core.ObjectProperties.upright_sprite.get : _.ObjectProperties.upright_sprite.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.upright_sprite.set.__partial : _.ObjectProperties.spritesheet.set.__partial, _.ObjectProperties.shaded.set.__partial
--[[
A vertical flat texture.
]]
---@field visual "upright_sprite"
--[[
Textures of the sprite. Uses 2 textures: `{front, back}`.
]]
---@field textures core.ObjectProperties.upright_sprite.textures?

---@class _.ObjectProperties.upright_sprite.get.__partial : _.ObjectProperties.spritesheet.get.__partial, _.ObjectProperties.shaded.get.__partial
--[[
A vertical flat texture.
]]
---@field visual "upright_sprite"
--[[
Textures of the sprite. Uses 2 textures: `{front, back}`.
]]
---@field textures core.ObjectProperties.upright_sprite.textures