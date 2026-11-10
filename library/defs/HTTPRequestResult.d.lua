---@meta _

-- luanti/doc/lua_api.md: Definition tables > `HTTPRequestResult` definition

--[[
`HTTPRequestResult` definition

Passed to the `HTTPApiTable.fetch` callback. Returned by
`HTTPApiTable.fetch_async_get`.
]]
---@class core.HTTPRequestResultDef
--[[
If true, the request has finished (either succeeded, failed or timed
out)
]]
---@field  completed boolean?
--[[
If true, the request was successful
]]
---@field  succeeded boolean?
--[[
If true, the request timed out
]]
---@field  timeout boolean?
--[[
HTTP status code
]]
---@field  code int?
--[[
Response body
]]
---@field  data string?