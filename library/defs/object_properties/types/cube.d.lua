---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

-- ------------------ ObjectProperties.cube.textures.strict ----------------- --

--[[
Textures of a `cube` visual, one per face. Same layout as a node.
]]
---@class core.ObjectProperties.cube.textures.strict
--[[
Texture of the +Y face.
]]
---@field [1] core.Texture
--[[
Texture of the -Y face.
]]
---@field [2] core.Texture
--[[
Texture of the +X face.
]]
---@field [3] core.Texture
--[[
Texture of the -X face.
]]
---@field [4] core.Texture
--[[
Texture of the +Z face.
]]
---@field [5] core.Texture
--[[
Texture of the -Z face.
]]
---@field [6] core.Texture

--[[
Textures of a `cube` visual. All 6 must be defined, just like a node.
]]
---@alias core.ObjectProperties.cube.textures
--- | core.ObjectProperties.cube.textures.strict
--- | string[]

-- -------------------------- ObjectProperties.cube ------------------------- --

--[[
Object properties to set for the `cube` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.cube.set
--- | core.ObjectProperties.cube.get
--- | _.ObjectProperties.cube.set

---@class _.ObjectProperties.cube.set : _.ObjectProperties.cube.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `cube`
visual.
]]
---@class core.ObjectProperties.cube.get : _.ObjectProperties.cube.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.cube.set.__partial : _.ObjectProperties.backface_culling.set.__partial, _.ObjectProperties.shaded.set.__partial
--[[
A node-sized cube.
]]
---@field visual "cube"
--[[
Textures of the cube. Uses 6 textures just like a node, but all 6 must be
defined.
]]
---@field textures core.ObjectProperties.cube.textures?

---@class _.ObjectProperties.cube.get.__partial : _.ObjectProperties.backface_culling.get.__partial, _.ObjectProperties.shaded.get.__partial
--[[
A node-sized cube.
]]
---@field visual "cube"
--[[
Textures of the cube. Uses 6 textures just like a node, but all 6 must be
defined.
]]
---@field textures core.ObjectProperties.cube.textures