---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Setting-related

--[[ core.settings split off into library/classes/Settings/LuantiSettings.lua ]]--

--[[
* `core.setting_get_pos(name)`: Loads a setting from the main settings and
  parses it as a position (in the format `(1,2,3)`). Returns a position or nil.
  **Deprecated: use `core.settings:get_pos()` instead**
]]
---@nodiscard
---@deprecated
---@param name core.LuantiSettings.keys.vector
---@return vec?
function core.setting_get_pos(name) end