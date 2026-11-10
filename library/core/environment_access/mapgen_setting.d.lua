---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Environment access

-- ------------------------------ MapgenParams ------------------------------ --

--[[
Table used by the deprecated `core.get_mapgen_params` / `core.set_mapgen_params`.
Fields left unset in `set_mapgen_params` leave that parameter unchanged.
]]
---@class core.MapgenSettings.mapgen_param
--[[
Name of the mapgen (`mg_name` in `core.get_mapgen_setting`).
]]
---@field mgname core.LuantiSettings.enums.mg_name
--[[
Integer [-2^64, 2^64].

**WARNING**: `seed` is broken. If the returned `seed` is outside the range of
`[0, 2^53-1]`, it is probably incorrect. The actual seed internally stored by
Luanti is in the [u64] range. When setting, only values in the [ulua] range are
accepted, which is a part of the full [u64] range. Prefer
`core.get_mapgen_setting("seed")`.
]]
---@field seed int
--[[
Integer [1, 32767].
]]
---@field chunksize int
--[[
Integer [s16].
]]
---@field water_level int
--[[
Comma-delimited string of flags (`mg_flags` in `core.get_mapgen_setting`).
When setting, a `"no"` prefix on a flag clears it instead. Same format and
options as `mg_flags` in `minetest.conf`.
]]
---@field flags core.LuantiSettings.flags

--[[
Mapgen setting names whose value is an integer. Note: use `"seed"`, not
`"fixed_map_seed"`.
]]
---@alias core.MapgenSetting.keys.integer
--- | _.LuantiSettings.mapgen.keys.integer
--- | "seed"
--- | "chunksize"

--[[
Mapgen setting names whose value is a number.
]]
---@alias core.MapgenSetting.keys.number
--- | _.LuantiSettings.mapgen.keys.number

--[[
Mapgen setting names whose value is a 3D NoiseParams table.
]]
---@alias core.MapgenSetting.keys.noise_params.3d
--- | _.LuantiSettings.mapgen.keys.noise_params.3d

--[[
Mapgen setting names whose value is a 2D NoiseParams table.
]]
---@alias core.MapgenSetting.keys.noise_params.2d
--- | _.LuantiSettings.mapgen.keys.noise_params.2d

--[[
Any mapgen setting name.
]]
---@alias core.MapgenSetting.keys
--- | _.LuantiSettings.mapgen.keys

-- ---------------------------- core.* functions ---------------------------- --

--[[
* `core.get_mapgen_params()`
    * Deprecated: use `core.get_mapgen_setting(name)` instead.
    * Returns a table containing:
        * `mgname`
        * `seed`
        * `chunksize`
        * `water_level`
        * `flags`
]]
---@deprecated
---@nodiscard
---@return core.MapgenSettings.mapgen_param
function core.get_mapgen_params() end

--[[
* `core.set_mapgen_params(MapgenParams)`
    * Deprecated: use `core.set_mapgen_setting(name, value, override)`
      instead.
    * Set map generation parameters.
    * Function cannot be called after the registration period.
    * Takes a table as an argument with the fields:
        * `mgname`
        * `seed`
        * `chunksize`
        * `water_level`
        * `flags`
    * Leave field unset to leave that parameter unchanged.
    * `flags` contains a comma-delimited string of flags to set, or if the
      prefix `"no"` is attached, clears instead.
    * `flags` is in the same format and has the same options as `mg_flags` in
      `minetest.conf`.
]]
---@deprecated
---@param MapgenParams core.MapgenSettings.mapgen_param
function core.set_mapgen_params(MapgenParams) end

--[[
* `core.get_mapgen_setting(name)`
    * Gets the *active* mapgen setting (or nil if none exists) in string
      format with the following order of precedence:
        1) Settings loaded from map_meta.txt or overrides set during mod
           execution.
        2) Settings set by mods without a metafile override
        3) Settings explicitly set in the user config file, minetest.conf
        4) Settings set as the user config default
    * Note: to get the seed, use `"seed"`, not `"fixed_map_seed"`.
    * Note: The seed is returned as a string, converted from the [u64] integer
      that Luanti internally uses. Do *not* convert this string to a
      number, you'd risk losing precision because [u64] reaches beyond the
      safe integer range
]]
---@nodiscard
---@param name core.MapgenSetting.keys.integer
---@return string
function core.get_mapgen_setting(name) end

--[[
* `core.get_mapgen_setting(name)`
    * Gets the *active* mapgen setting (or nil if none exists) in string
      format with the following order of precedence:
        1) Settings loaded from map_meta.txt or overrides set during mod
           execution.
        2) Settings set by mods without a metafile override
        3) Settings explicitly set in the user config file, minetest.conf
        4) Settings set as the user config default
    * Note: to get the seed, use `"seed"`, not `"fixed_map_seed"`.
    * Note: The seed is returned as a string, converted from the [u64] integer
      that Luanti internally uses. Do *not* convert this string to a
      number, you'd risk losing precision because [u64] reaches beyond the
      safe integer range
]]
---@nodiscard
---@param name core.MapgenSetting.keys.number
---@return string|number
function core.get_mapgen_setting(name) end

--[[
* `core.get_mapgen_setting(name)`
    * Gets the *active* mapgen setting (or nil if none exists) in string
      format with the following order of precedence:
        1) Settings loaded from map_meta.txt or overrides set during mod
           execution.
        2) Settings set by mods without a metafile override
        3) Settings explicitly set in the user config file, minetest.conf
        4) Settings set as the user config default
    * Note: to get the seed, use `"seed"`, not `"fixed_map_seed"`.
    * Note: The seed is returned as a string, converted from the [u64] integer
      that Luanti internally uses. Do *not* convert this string to a
      number, you'd risk losing precision because [u64] reaches beyond the
      safe integer range
]]
---@nodiscard
---@param name core.MapgenSetting.keys
---@return string
function core.get_mapgen_setting(name) end

--[[
* `core.get_mapgen_setting_noiseparams(name)`
    * Same as above, but returns the value as a NoiseParams table if the
      setting `name` exists and is a valid NoiseParams.
]]
---@nodiscard
---@param name core.MapgenSetting.keys.noise_params.3d
---@return core.NoiseParams.3d?
function core.get_mapgen_setting_noiseparams(name) end

--[[
* `core.get_mapgen_setting_noiseparams(name)`
    * Same as above, but returns the value as a NoiseParams table if the
      setting `name` exists and is a valid NoiseParams.
]]
---@nodiscard
---@param name core.MapgenSetting.keys.noise_params.2d
---@return core.NoiseParams.2d?
function core.get_mapgen_setting_noiseparams(name) end

--[[
* `core.set_mapgen_setting(name, value, [override_meta])`
    * Sets a mapgen param to `value`, and will take effect if the corresponding
      mapgen setting is not already present in map_meta.txt.
    * `override_meta` is an optional boolean (default: `false`). If this is set
      to true, the setting will become the active setting regardless of the map
      metafile contents.
    * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`;
      the seed value *must* be provided as a string that *represents*
      an integer in the [u64] range
]]
---@deprecated
---@param name core.MapgenSetting.keys.integer
---@param value int
---@param override_meta boolean?
function core.set_mapgen_setting(name, value, override_meta) end

--[[
* `core.set_mapgen_setting(name, value, [override_meta])`
    * Sets a mapgen param to `value`, and will take effect if the corresponding
      mapgen setting is not already present in map_meta.txt.
    * `override_meta` is an optional boolean (default: `false`). If this is set
      to true, the setting will become the active setting regardless of the map
      metafile contents.
    * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`;
      the seed value *must* be provided as a string that *represents*
      an integer in the [u64] range
]]
---@deprecated
---@param name core.MapgenSetting.keys.number
---@param value number
---@param override_meta boolean?
function core.set_mapgen_setting(name, value, override_meta) end

--[[
* `core.set_mapgen_setting(name, value, [override_meta])`
    * Sets a mapgen param to `value`, and will take effect if the corresponding
      mapgen setting is not already present in map_meta.txt.
    * `override_meta` is an optional boolean (default: `false`). If this is set
      to true, the setting will become the active setting regardless of the map
      metafile contents.
    * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`;
      the seed value *must* be provided as a string that *represents*
      an integer in the [u64] range
]]
---@param name core.MapgenSetting.keys
---@param value string
---@param override_meta boolean?
function core.set_mapgen_setting(name, value, override_meta) end

--[[
* `core.set_mapgen_setting_noiseparams(name, value, [override_meta])`
    * Same as above, except value is a NoiseParams table.
]]
---@param name core.MapgenSetting.keys.noise_params.3d
---@param value core.NoiseParams.3d
---@param override_meta boolean?
function core.set_mapgen_setting_noiseparams(name, value, override_meta) end

--[[
* `core.set_mapgen_setting_noiseparams(name, value, [override_meta])`
    * Same as above, except value is a NoiseParams table.
]]
---@param name core.MapgenSetting.keys.noise_params.2d
---@param value core.NoiseParams.2d
---@param override_meta boolean?
function core.set_mapgen_setting_noiseparams(name, value, override_meta) end