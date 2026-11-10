---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Logging

--[[
Log level. Default for `core.log` is `"none"`.
]]
---@alias core.LoggingLevel
--- | "none"
--- | "error"
--- | "warning"
--- | "action"
--- | "info"
--- | "verbose"

--[[
Unofficial note: I made it deprecated because this should NOT be in any production code, and you should use something better tbh, like dbg.pp (from lars's dbg mod)
* Equivalent to `core.log(table.concat({...}, "\t"))`
]]
---@deprecated
---@param ... any
function core.debug(...) end

--[[
* `core.log([level,] text)`
    * `level` is one of `"none"`, `"error"`, `"warning"`, `"action"`,
      `"info"`, or `"verbose"`.
]]
---@param loglevel core.LoggingLevel
---@param text string
function core.log(loglevel, text) end

--[[
* `core.log([level,] text)`
    * Logs `text` with the default level `"none"`.
]]
---@param text string
function core.log(text) end