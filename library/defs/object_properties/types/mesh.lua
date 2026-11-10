---@meta _

-- luanti/doc/lua_api.md: Definition tables > Object properties

--[[
Object properties to set for the `mesh` visual
(all fields optional; defaults are injected).
]]
---@alias core.ObjectProperties.mesh.set
--- | core.ObjectProperties.mesh.get
--- | _.ObjectProperties.mesh.set

---@class _.ObjectProperties.mesh.set : _.ObjectProperties.mesh.set.__partial, _.ObjectProperties.__base.set

--[[
Object properties as returned by the engine for the `mesh`
visual.
]]
---@class core.ObjectProperties.mesh.get : _.ObjectProperties.mesh.get.__partial, _.ObjectProperties.__base.get

---@class _.ObjectProperties.mesh.set.__partial : _.ObjectProperties.backface_culling.set.__partial, _.ObjectProperties.shaded.set.__partial
--[[
Uses the defined mesh model (see `mesh`).
]]
---@field visual "mesh"
--[[
File name of mesh when using "mesh" visual.
For legacy reasons, this uses a 10x scale for meshes: 10 units = 1 node.
]]
---@field mesh core.Path?
--[[
One texture is required for each mesh buffer/material, in order.
]]
---@field textures core.Texture[]?

---@class _.ObjectProperties.mesh.get.__partial : _.ObjectProperties.backface_culling.get.__partial, _.ObjectProperties.shaded.get.__partial
--[[
Uses the defined mesh model (see `mesh`).
]]
---@field visual "mesh"
--[[
File name of mesh when using "mesh" visual.
For legacy reasons, this uses a 10x scale for meshes: 10 units = 1 node.
]]
---@field mesh core.Path
--[[
One texture is required for each mesh buffer/material, in order.
]]
---@field textures core.Texture[]