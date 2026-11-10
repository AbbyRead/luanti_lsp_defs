---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference
-- luanti/doc/lua_api.md: 'core' namespace reference > Global objects

--[[
The `core` namespace, containing the engine's Lua API. Aliased by the
deprecated global `minetest`.
]]
---@class corelib
core = {}

--[[
* `core.env`: `EnvRef` of the server environment and world.
    * Any function in the `core` namespace can be called using the syntax
      `core.env:somefunction(somearguments)`
      instead of `core.somefunction(somearguments)`
    * Deprecated, but support is not to be dropped soon
]]
---@deprecated
---@type corelib
core.env = core

--[[
* `minetest`: alias for the `core` namespace
    * Deprecated, but support is not to be dropped soon
]]
---@deprecated
---@class minetest: corelib
minetest = core