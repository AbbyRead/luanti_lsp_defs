---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Storage API
-- luanti/doc/lua_api.md: Class reference > `StorageRef`

-- NOTE: changes are linked to MetaDataRef, ItemStackMetaRef, NodeMetaRef,
-- PlayerMetaRef and StorageRef

-- ------------------------------- constructor ------------------------------ --

--[[
* `core.get_mod_storage()`:
    * returns reference to mod private `StorageRef`
    * must be called during mod load time
]]
---@nodiscard
---@return core.StorageRef
function core.get_mod_storage() end

-- ------------------------------- StorageRef ------------------------------- --

--[[
`StorageRef`
------------

Mod metadata: per mod and world metadata, saved automatically.
Can be obtained via `core.get_mod_storage()` during load time.

WARNING: This storage backend is incapable of saving raw binary data due
to restrictions of JSON.

### Methods

* All methods in MetaDataRef

]]
---@class core.StorageRef : core.MetaDataRef
local StorageRef = {}

--[[
* `contains(key)`: Returns `true` if `key` present, otherwise `false`.
    * Returns `nil` when the MetaData is inexistent.
]]
---@nodiscard
---@param key core.MetadataTable.fields.storage.keys
---@return boolean?
function StorageRef:contains(key) end

--[[
* `get(key)`: Returns the value stored at `key` as a string if present.
    * Returns `nil` otherwise.
]]
---@nodiscard
---@param key core.MetadataTable.fields.storage.keys
---@return string? value
function StorageRef:get(key) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@param key core.MetadataTable.fields.storage.keys
---@param value string
function StorageRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.storage.keys.integer
---@param value int
function StorageRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.storage.keys.number
---@param value number
function StorageRef:set_string(key, value) end

--[[
* `get_string(key)`: Returns a string value at `key` or `""` if not present
]]
---@nodiscard
---@param key core.MetadataTable.fields.storage.keys
---@return string value
function StorageRef:get_string(key) end

--[[
* `set_int(key, value)`
    * Set an integer number `value` to `key`
    * Range: [s32]
    * Some systems internally have a larger value range but you should not
      rely on this behavior to ensure portability of your code
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.storage.keys.integer
---@param value int
function StorageRef:set_int(key, value) end

--[[
* `get_int(key)`:
    * Returns the value stored at `key` as an integer
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.storage.keys.integer
---@return int value
function StorageRef:get_int(key) end

--[[
* `set_float(key, value)`
    * Store a number (a 64-bit floating-point number) exactly.
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.storage.keys.number
---@param value number
function StorageRef:set_float(key, value) end

--[[
* `get_float(key)`:
    * Returns a 64-bit floating-point number stored at `key`.
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.storage.keys.number
---@return number value
function StorageRef:get_float(key) end

--[[
* `get_keys()`: returns a list of all keys in the metadata.
]]
---@return core.MetadataTable.fields.storage.keys[] keys
function StorageRef:get_keys() end

--[[
* `from_table(data)`
    * Imports metadata from a metadata table
    * If `data` is a metadata table (see `MetaDataRef` docs), the metadata it
      represents will replace all metadata of this MetaDataRef object
    * Any non-table value for `data` will clear all metadata
    * Item table values the `inventory` field may also be itemstrings
    * Returns `true` on success
]]
---@param data core.MetadataTable.storage?
---@return boolean?
function StorageRef:from_table(data) end

--[[
* `to_table()`:
    * Returns a metadata table (see `MetaDataRef` docs) or `nil` on failure.
]]
---@nodiscard
---@return core.MetadataTable.storage
function StorageRef:to_table() end