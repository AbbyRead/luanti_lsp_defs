---@meta _

-- luanti/doc/lua_api.md: Definition tables > `HTTPRequest` definition

--[[
HTTP method for a request. Defaults to `"GET"`.
]]
---@alias core.HTTPRequestDef.method
--- | "GET"
--- | "HEAD"
--- | "POST"
--- | "PUT"
--- | "PATCH"
--- | "DELETE"

--[[
`HTTPRequest` definition

Used by `HTTPApiTable.fetch` and `HTTPApiTable.fetch_async`.
]]
---@class core.HTTPRequestDef
--[[
URL to request, e.g. `"https://example.org"`.
]]
---@field  url string?
--[[
Timeout for request to be completed in seconds. Default depends on engine settings.
]]
---@field  timeout number?
--[[
The http method to use. Defaults to "GET".
]]
---@field  method core.HTTPRequestDef.method?
--[[
Data for the POST, PUT, PATCH or DELETE request.
Accepts both a string and a table. If a table is specified, encodes
table as x-www-form-urlencoded key-value pairs.
]]
---@field  data string|table<string,string>?
--[[
Optional, if specified replaces the default Luanti user agent with
given string.
]]
---@field  user_agent string?
--[[
Optional, if specified adds additional headers to the HTTP request.
You must make sure that the header strings follow HTTP specification
("Key: Value").
]]
---@field  extra_headers string[]?
--[[
Optional, if true performs a multipart HTTP request.
Default is false.
Not allowed for GET or HEAD method and `data` must be a table.
]]
---@field  multipart boolean?
--[[
Optional, if true then error messages are suppressed on failure.
Default is false.
]]
---@field  quiet boolean?
--[[
Deprecated, use `data` instead. Forces `method = "POST"`.
]]
---@deprecated
---@field  post_data string|table<string,string>?