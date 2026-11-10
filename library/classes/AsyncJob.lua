---@meta _

-- luanti/doc/lua_api.md: Class reference > `AsyncJob`

--[[
A reference to a job to be run in an async environment, as returned by
`core.handle_async`.
]]
---@class core.AsyncJob
local AsyncJob = {}

--[[
* `cancel()`: try to cancel the job
    * Returns whether the job was cancelled.
    * A job can only be cancelled if it has not started.
]]
---@nodiscard
---@return boolean
function AsyncJob:cancel() end