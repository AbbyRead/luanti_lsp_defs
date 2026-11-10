---@meta _

-- luanti/doc/lua_api.md: Metadata
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- ------------------ MetadataTable.*.storage special fields ----------------- --

--[[
Special storage metadata keys. None are defined; all keys are plain strings.
]]
---@alias core.MetadataTable.fields.storage.keys.special
--- | string

--[[
Any storage metadata key.
]]
---@alias core.MetadataTable.fields.storage.keys
--- | core.MetadataTable.fields.storage.keys.special
--- | string

--[[
Special storage metadata keys that hold integers. None are defined.
]]
---@alias core.MetadataTable.fields.storage.keys.integer.special
--- | string

--[[
storage metadata keys usable with integer accessors (`set_int`/`get_int`).
]]
---@alias core.MetadataTable.fields.storage.keys.integer
--- | core.MetadataTable.fields.storage.keys.integer.special
--- | string

--[[
Special storage metadata keys that hold floats. None are defined.
]]
---@alias core.MetadataTable.fields.storage.keys.number.special
--- | string

--[[
storage metadata keys usable with float accessors (`set_float`/`get_float`).
]]
---@alias core.MetadataTable.fields.storage.keys.number
--- | core.MetadataTable.fields.storage.keys.number.special
--- | string

-- -------------------------- MetadataTable.storage -------------------------- --

--[[
Key-value store of storage metadata. All values are stored as strings.
Per mod and world metadata, saved automatically. Cannot store raw binary data (JSON backend).
]]
---@class core.MetadataTable.fields.storage : {[string]:string?}

--[[
Metadata table of a mod `StorageRef` (see `MetaDataRef:to_table`/`from_table`).
Has no inventory.
]]
---@class core.MetadataTable.storage
--[[
Key-value storage of metadata fields. Numbers must be converted to strings
first.
]]
---@field fields core.MetadataTable.fields.storage?