---@meta _

-- luanti/doc/lua_api.md: Class reference > `PlayerMetaRef`

-- NOTE: changes are linked to MetaDataRef, ItemStackMetaRef, NodeMetaRef,
-- PlayerMetaRef and StorageRef

--[[
`PlayerMetaRef`
---------------

Player metadata.
Uses the same method of storage as the deprecated player attribute API, so
data there will also be in player meta.
Can be obtained using `player:get_meta()`.

All methods in `MetaDataRef` are available (see there for the semantics of
`from_table`/`to_table` and the `${k}` deprecation note).
]]
---@class core.PlayerMetaRef: core.MetaDataRef
local PlayerMetaRef = {}

--[[
* `contains(key)`: Returns `true` if `key` present, otherwise `false`.
    * Returns `nil` when the MetaData is inexistent.
]]
---@nodiscard
---@param key core.MetadataTable.fields.player.keys
---@return boolean?
function PlayerMetaRef:contains(key) end

--[[
* `get(key)`: Returns the value stored at `key` as a string if present.
    * Returns `nil` otherwise.
]]
---@nodiscard
---@param key core.MetadataTable.fields.player.keys
---@return string? value
function PlayerMetaRef:get(key) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@param key core.MetadataTable.fields.player.keys
---@param value string
function PlayerMetaRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.player.keys.integer
---@param value int
function PlayerMetaRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.player.keys.number
---@param value number
function PlayerMetaRef:set_string(key, value) end

--[[
* `get_string(key)`: Returns a string value at `key` or `""` if not present
]]
---@nodiscard
---@param key core.MetadataTable.fields.player.keys
---@return string value
function PlayerMetaRef:get_string(key) end

--[[
* `set_int(key, value)`
    * Set an integer number `value` to `key`
    * Range: [s32]
    * Some systems internally have a larger value range but you should not
      rely on this behavior to ensure portability of your code
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.player.keys.integer
---@param value int
function PlayerMetaRef:set_int(key, value) end

--[[
* `get_int(key)`:
    * Returns the value stored at `key` as an integer
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.player.keys.integer
---@return int value
function PlayerMetaRef:get_int(key) end

--[[
* `set_float(key, value)`
    * Store a number (a 64-bit floating-point number) exactly.
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.player.keys.number
---@param value number
function PlayerMetaRef:set_float(key, value) end

--[[
* `get_float(key)`:
    * Returns a 64-bit floating-point number stored at `key`.
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.player.keys.number
---@return number value
function PlayerMetaRef:get_float(key) end

--[[
* `get_keys()`: returns a list of all keys in the metadata.
]]
---@nodiscard
---@return core.MetadataTable.fields.player.keys[] keys
function PlayerMetaRef:get_keys() end

--[[
* `from_table(data)`
    * Imports metadata from a metadata table
    * If `data` is a metadata table (see `MetaDataRef` docs), the metadata it
      represents will replace all metadata of this MetaDataRef object
    * Any non-table value for `data` will clear all metadata
    * Item table values the `inventory` field may also be itemstrings
    * Returns `true` on success
]]
---@param data core.MetadataTable.player?
---@return boolean?
function PlayerMetaRef:from_table(data) end

--[[
* `to_table()`:
    * Returns a metadata table (see `MetaDataRef` docs) or `nil` on failure.
]]
---@nodiscard
---@return core.MetadataTable.player
function PlayerMetaRef:to_table() end