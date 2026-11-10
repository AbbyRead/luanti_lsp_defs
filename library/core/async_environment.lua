---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Async environment

--[[
The engine allows you to submit jobs to be ran in an isolated environment
concurrently with normal server operation.
A job consists of a function to be ran in the async environment, any amount of
arguments (will be serialized) and a callback that will be called with the return
value of the job function once it is finished.

The async environment does *not* have access to the map, entities, players or any
globals defined in the 'usual' environment. Consequently, functions like
`core.get_node()` or `core.get_player_by_name()` simply do not exist in it.

Arguments and return values passed through this can contain certain userdata
objects that will be seamlessly copied (not shared) to the async environment.
This allows you easy interoperability for delegating work to jobs.

* `core.handle_async(func, callback, ...)`:
    * Queue the function `func` to be ran in an async environment.
      Note that there are multiple persistent workers and any of them may
      end up running a given job. The engine will scale the amount of
      worker threads automatically.
    * When `func` returns the callback is called (in the normal environment)
      with all of the return values as arguments.
    * Optional: Variable amount of arguments that are passed to `func`
    * Returns an `AsyncJob` async job.
]]
---@param f function
---@param callback function
---@param ... any
---@return core.AsyncJob
function core.handle_async(f, callback, ...) end

--[[
* `core.register_async_dofile(path)`:
    * Register a path to a Lua file to be imported when an async environment
      is initialized. You can use this to preload code which you can then call
      later using `core.handle_async()`.
]]
---@param path core.Path
function core.register_async_dofile(path) end

--[[
APIs available in an async environment:

Classes:

* `AreaStore`, `ItemStack`, `ValueNoise`, `ValueNoiseMap`, `PseudoRandom`,
  `PcgRandom`, `SecureRandom`, `VoxelArea`, `Settings`
* `VoxelManip`: only if transferred into environment; can't read/write to map

Class instances that can be transferred between environments:

* `ItemStack`, `ValueNoise`, `ValueNoiseMap`, `VoxelManip`

Functions:

* Standalone helpers such as logging, filesystem, encoding,
  hashing or compression APIs
* `core.register_portable_metatable`
* IPC

Variables:

* `core.settings`
* `core.registered_items`, `registered_nodes`, `registered_tools`,
  `registered_craftitems` and `registered_aliases`
    * with all functions and userdata values replaced by `true`, calling any
      callbacks here is obviously not possible
]]
---@class corelib.async
local async = {
    settings = core.settings,

-- TODO async registered_* has functions and userdata set to true instead
    registered_items = core.registered_items,
    registered_nodes = core.registered_nodes,
    registered_tools = core.registered_tools,
    registered_craftitems = core.registered_craftitems,
    registered_aliases = core.registered_aliases,
-- TODO ... and more. it would have been nice if they just list everything that's available
}