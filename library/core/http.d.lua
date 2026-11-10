---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > HTTP Requests

-- ------------------------------ HTTPApiTable ------------------------------ --

--[[
Callback of `HTTPApiTable.fetch`, called upon completion with the result.
]]
---@alias core.HTTPApiTable.fetch.fn fun(res:core.HTTPRequestResultDef)

--[[
* `HTTPApiTable.fetch(HTTPRequest req, callback)`
    * Performs given request asynchronously and calls callback upon completion
    * callback: `function(HTTPRequestResult res)`
    * Use this HTTP function if you are unsure, the others are for advanced use
]]
---@alias core.HTTPApiTable.fetch fun(req:core.HTTPRequestDef, callback:core.HTTPApiTable.fetch.fn)

--[[
Handle returned by `HTTPApiTable.fetch_async`, for `HTTPApiTable.fetch_async_get`.
]]
---@alias core.HTTPFetchAsyncID int

--[[
* `HTTPApiTable.fetch_async(HTTPRequest req)`: returns handle
    * Performs given request asynchronously and returns handle for
      `HTTPApiTable.fetch_async_get`
]]
---@alias core.HTTPApiTable.fetch_async fun(req:core.HTTPRequestDef):core.HTTPFetchAsyncID

--[[
* `HTTPApiTable.fetch_async_get(handle)`: returns HTTPRequestResult
    * Return response data for given asynchronous HTTP request
]]
---@alias core.HTTPApiTable.fetch_async_get fun(handle:core.HTTPFetchAsyncID):core.HTTPRequestResultDef

--[[
Table returned by `core.request_http_api()`, containing the http functions
`fetch`, `fetch_async` and `fetch_async_get`.

**DO NOT ALLOW ANY OTHER MODS TO ACCESS THIS TABLE, STORE IT IN A LOCAL VARIABLE!**
]]
---@class core.HTTPApiTable
--[[
Performs given request asynchronously and calls callback upon completion.
Use this HTTP function if you are unsure, the others are for advanced use.
]]
---@field fetch core.HTTPApiTable.fetch
--[[
Performs given request asynchronously and returns a handle for `fetch_async_get`.
]]
---@field fetch_async core.HTTPApiTable.fetch_async
--[[
Returns response data for given asynchronous HTTP request.
]]
---@field fetch_async_get core.HTTPApiTable.fetch_async_get

-- ---------------------------- core.* functions ---------------------------- --

--[[
* `core.request_http_api()`:
    * returns `HTTPApiTable` containing http functions if the calling mod has
      been granted access by being listed in the `secure.http_mods` or
      `secure.trusted_mods` setting, otherwise returns `nil`.
    * The returned table contains the functions `fetch`, `fetch_async` and
      `fetch_async_get` described below.
    * Only works at init time and must be called from the mod's main scope
      (not from a function).
    * Function only exists if Luanti server was built with cURL support.
    * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN
      A LOCAL VARIABLE!**
]]
---@nodiscard
---@return core.HTTPApiTable?
function core.request_http_api() end