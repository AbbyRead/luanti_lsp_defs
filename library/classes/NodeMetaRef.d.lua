---@meta _

-- luanti/doc/lua_api.md: Class reference > `NodeMetaRef`

-- NOTE: changes are linked to MetaDataRef, ItemStackMetaRef, NodeMetaRef,
-- PlayerMetaRef and StorageRef

--[[
`NodeMetaRef`
-------------

Node metadata: reference extra data and functionality stored in a node.
Can be obtained via `core.get_meta(pos)`.

All methods in `MetaDataRef` are available (see there for the semantics of
`from_table`/`to_table` and the `${k}` deprecation note).
]]
---@class core.NodeMetaRef : core.MetaDataRef
local NodeMetaRef = {}

--[[
* `contains(key)`: Returns `true` if `key` present, otherwise `false`.
    * Returns `nil` when the MetaData is inexistent.
]]
---@nodiscard
---@param key core.MetadataTable.fields.node.keys
---@return boolean?
function NodeMetaRef:contains(key) end

--[[
* `get(key)`: Returns the value stored at `key` as a string if present.
    * Returns `nil` otherwise.
]]
---@nodiscard
---@param key core.MetadataTable.fields.node.keys
---@return string? value
function NodeMetaRef:get(key) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@param key core.MetadataTable.fields.node.keys
---@param value string
function NodeMetaRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.node.keys.integer
---@param value int
function NodeMetaRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.node.keys.number
---@param value number
function NodeMetaRef:set_string(key, value) end

--[[
* `get_string(key)`: Returns a string value at `key` or `""` if not present
]]
---@nodiscard
---@param key core.MetadataTable.fields.node.keys
---@return string value
function NodeMetaRef:get_string(key) end

--[[
* `set_int(key, value)`
    * Set an integer number `value` to `key`
    * Range: [s32]
    * Some systems internally have a larger value range but you should not
      rely on this behavior to ensure portability of your code
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.node.keys.integer
---@param value int
function NodeMetaRef:set_int(key, value) end

--[[
* `get_int(key)`:
    * Returns the value stored at `key` as an integer
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.node.keys.integer
---@return int value
function NodeMetaRef:get_int(key) end

--[[
* `set_float(key, value)`
    * Store a number (a 64-bit floating-point number) exactly.
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.node.keys.number
---@param value number
function NodeMetaRef:set_float(key, value) end

--[[
* `get_float(key)`:
    * Returns a 64-bit floating-point number stored at `key`.
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.node.keys.number
---@return number value
function NodeMetaRef:get_float(key) end

--[[
* `get_keys()`: returns a list of all keys in the metadata.
]]
---@nodiscard
---@return core.MetadataTable.fields.node.keys[] keys
function NodeMetaRef:get_keys() end

--[[
* `from_table(data)`
    * Imports metadata from a metadata table
    * If `data` is a metadata table (see `MetaDataRef` docs), the metadata it
      represents will replace all metadata of this MetaDataRef object
    * Any non-table value for `data` will clear all metadata
    * Item table values the `inventory` field may also be itemstrings
    * Returns `true` on success
]]
---@param data core.MetadataTable.node.set?
---@return boolean?
function NodeMetaRef:from_table(data) end

--[[
* `to_table()`:
    * Returns a metadata table (see `MetaDataRef` docs) or `nil` on failure.
]]
---@nodiscard
---@return core.MetadataTable.node.get
function NodeMetaRef:to_table() end


--[[
* `get_inventory()`: returns `InvRef`
]]
---@nodiscard
---@return core.InvRef
function NodeMetaRef:get_inventory() end

--[[
* `mark_as_private(name or {name1, name2, ...})`: Mark specific vars as private
  This will prevent them from being sent to the client. Note that the "private"
  status will only be remembered if an associated key-value pair exists,
  meaning it's best to call this when initializing all other meta (e.g.
  `on_construct`).
]]
---@param fields OneOrMany<core.MetadataTable.fields.node.keys>
function NodeMetaRef:mark_as_private(fields) end