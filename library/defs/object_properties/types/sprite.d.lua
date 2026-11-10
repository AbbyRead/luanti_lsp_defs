---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

-- ----------------- ObjectProperties.sprite.textures.strict ---------------- --

--[[
Textures of a `sprite` visual: a single texture.
]]
---@class core.ObjectProperties.sprite.textures.strict
--[[
The sprite texture (may be a spritesheet, see `spritediv`).
]]
---@field [1] core.Texture

--[[
Textures of a `sprite` visual. Uses 1 texture.
]]
---@alias core.ObjectProperties.sprite.textures
--- | core.ObjectProperties.sprite.textures.strict
--- | string[]

-- ------------------------- ObjectProperties.sprite ------------------------ --
--[[
Object properties to set for the `sprite` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.sprite.set
--- | core.ObjectProperties.sprite.get
--- | _.ObjectProperties.sprite.set

---@class _.ObjectProperties.sprite.set : _.ObjectProperties.sprite.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `sprite`
visual.
]]
---@class core.ObjectProperties.sprite.get : _.ObjectProperties.sprite.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.sprite.set.__partial : _.ObjectProperties.spritesheet.set.__partial, _.ObjectProperties.spritesheet.set.__partial
--[[
A flat texture that always faces the player.
]]
---@field visual "sprite"?
--[[
Textures of the sprite. Uses 1 texture.
]]
---@field textures core.ObjectProperties.sprite.textures?

---@class _.ObjectProperties.sprite.get.__partial : _.ObjectProperties.spritesheet.get.__partial, _.ObjectProperties.spritesheet.get.__partial
--[[
A flat texture that always faces the player.
]]
---@field visual "sprite"
--[[
Textures of the sprite. Uses 1 texture.
]]
---@field textures core.ObjectProperties.sprite.textures