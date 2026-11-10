---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Utilities

--[[
A network protocol version number, as used by `core.protocol_versions` and
`core.get_player_information(name).protocol_version`.
]]
---@alias core.Protocol
--- | 37
--- | 38
--- | 39
--- | 40
--- | 41
--- | 42
--- | 43
--- | 44
--- | 45
--- | 46
--- | 47
--- | 48
--- | 49
--- | 50

--[[
Table mapping Luanti versions to the corresponding protocol versions, for
modder convenience (available since 5.11).

Every major and minor version has an entry. Patch versions only have an entry
for the first release whose protocol version is not already present.

Example, check whether a client has at least the feature set of Luanti 5.8.0:

    core.get_player_information(name).protocol_version >= core.protocol_versions["5.8.0"]
]]
---@class core.ProtocolVersions
core.protocol_versions = {}

---@class core.ProtocolVersions : {[string]:core.Protocol}
--[[
Protocol version at the time of the 5.0.0 release.
]]
---@field ["5.0.0"] 37
--[[
Protocol version at the time of the 5.1.0 release.
]]
---@field ["5.1.0"] 38
--[[
Protocol version at the time of the 5.2.0 release.
]]
---@field ["5.2.0"] 39
--[[
Protocol version at the time of the 5.3.0 release.
]]
---@field ["5.3.0"] 39
--[[
Protocol version at the time of the 5.4.0 release.
]]
---@field ["5.4.0"] 39
--[[
Protocol version at the time of the 5.5.0 release.
]]
---@field ["5.5.0"] 40
--[[
Protocol version at the time of the 5.6.0 release.
]]
---@field ["5.6.0"] 41
--[[
Protocol version at the time of the 5.7.0 release.
]]
---@field ["5.7.0"] 42
--[[
Protocol version at the time of the 5.8.0 release.
]]
---@field ["5.8.0"] 43
--[[
Protocol version at the time of the 5.9.0 release.
]]
---@field ["5.9.0"] 44
--[[
Protocol version at the time of the 5.9.1 release.
]]
---@field ["5.9.1"] 45
--[[
Protocol version at the time of the 5.10.0 release.
]]
---@field ["5.10.0"] 46
--[[
Protocol version at the time of the 5.11.0 release.
]]
---@field ["5.11.0"] 47
--[[
Protocol version at the time of the 5.12.0 release.
]]
---@field ["5.12.0"] 48
--[[
Protocol version at the time of the 5.13.0 release.
]]
---@field ["5.13.0"] 49
--[[
Protocol version at the time of the 5.14.0 release.
]]
---@field ["5.14.0"] 50