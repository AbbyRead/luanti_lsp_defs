---@meta _

-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- NOTE: changes are linked to MetaDataRef, ItemStackMetaRef, NodeMetaRef,
-- PlayerMetaRef and StorageRef

--[[
`MetaDataRef`
-------------

Base class used by `StorageRef`, `NodeMetaRef`, `ItemStackMetaRef`, and
`PlayerMetaRef`.

Note: If a metadata value is in the format `${k}`, an attempt to get the value
will return the value associated with key `k`. There is a low recursion limit.
This behavior is **deprecated** and will be removed in a future version. Usage
of the `${k}` syntax in formspecs is not deprecated.

### Metadata tables

Metadata tables represent MetaDataRef in a Lua table form (see
`from_table`/`to_table`).

A metadata table is a table that has the following keys:

* `fields`: key-value storage of metadata fields
    * all values are stored as strings
    * numbers must be converted to strings first
* `inventory` (for NodeMetaRef only): A node inventory in table form
    * inventory table keys are inventory list names
    * inventory table values are item tables
    * item table keys are slot IDs (starting with 1)
    * item table values are ItemStacks

Example:

```lua
metadata_table = {
    -- metadata fields (key/value store)
    fields = {
        infotext = "Container",
        another_key = "Another Value",
    },

    -- inventory data (for nodes)
    inventory = {
        -- inventory list "main" with 4 slots
        main = {
            -- list of all item slots
            [1] = ItemStack("example:dirt"),
            [2] = ItemStack("example:stone 25"),
            [3] = ItemStack(""), -- empty slot
            [4] = ItemStack("example:pickaxe"),
        },
        -- inventory list "hidden" with 1 slot
        hidden = {
            [1] = ItemStack("example:diamond"),
        },
    },
}
```
]]
---@class core.MetaDataRef
local MetaDataRef = {}

--[[
* `contains(key)`: Returns `true` if `key` present, otherwise `false`.
    * Returns `nil` when the MetaData is inexistent.
]]
---@nodiscard
---@param key core.MetadataTable.fields.keys
---@return boolean?
function MetaDataRef:contains(key) end

--[[
* `get(key)`: Returns the value stored at `key` as a string if present.
    * Returns `nil` otherwise.
]]
---@nodiscard
---@param key core.MetadataTable.fields.keys
---@return string? value
function MetaDataRef:get(key) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@param key core.MetadataTable.fields.keys
---@param value string
function MetaDataRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.keys.integer
---@param value int
function MetaDataRef:set_string(key, value) end

--[[
* `set_string(key, value)`: Set the string `value` at `key`.
    * Value of `""` will delete the key.
]]
---@deprecated
---@param key core.MetadataTable.fields.keys.number
---@param value number
function MetaDataRef:set_string(key, value) end

--[[
* `get_string(key)`: Returns a string value at `key` or `""` if not present
]]
---@nodiscard
---@param key core.MetadataTable.fields.keys
---@return string value
function MetaDataRef:get_string(key) end

--[[
* `set_int(key, value)`
    * Set an integer number `value` to `key`
    * Range: [s32]
    * Some systems internally have a larger value range but you should not
      rely on this behavior to ensure portability of your code
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.keys.integer
---@param value int
function MetaDataRef:set_int(key, value) end

--[[
* `get_int(key)`:
    * Returns the value stored at `key` as an integer
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.keys.integer
---@return int value
function MetaDataRef:get_int(key) end

--[[
* `set_float(key, value)`
    * Store a number (a 64-bit floating-point number) exactly.
    * The value will be converted into a string when stored.
]]
---@param key core.MetadataTable.fields.keys.number
---@param value number
function MetaDataRef:set_float(key, value) end

--[[
* `get_float(key)`:
    * Returns a 64-bit floating-point number stored at `key`.
    * Returns `0` if key not present.
]]
---@nodiscard
---@param key core.MetadataTable.fields.keys.number
---@return number value
function MetaDataRef:get_float(key) end

--[[
* `get_keys()`: returns a list of all keys in the metadata.
]]
---@nodiscard
---@return core.MetadataTable.fields.keys[] keys
function MetaDataRef:get_keys() end

--[[
* `from_table(data)`
    * Imports metadata from a metadata table
    * If `data` is a metadata table (see `MetaDataRef` docs), the metadata it
      represents will replace all metadata of this MetaDataRef object
    * Any non-table value for `data` will clear all metadata
    * Item table values the `inventory` field may also be itemstrings
    * Returns `true` on success
]]
---@param data core.MetadataTable.set?
---@return boolean?
function MetaDataRef:from_table(data) end

--[[
* `to_table()`:
    * Returns a metadata table (see `MetaDataRef` docs) or `nil` on failure.
]]
---@nodiscard
---@return core.MetadataTable.get
function MetaDataRef:to_table() end

--[[
* `equals(other)`
    * returns `true` if this metadata has the same key-value pairs as `other`
]]
---@nodiscard
---@param other core.MetaDataRef
---@return boolean
function MetaDataRef:equals(other) end