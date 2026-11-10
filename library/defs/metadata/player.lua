---@meta _

-- luanti/doc/lua_api.md: Metadata
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- ------------------ MetadataTable.*.player special fields ----------------- --

--[[
Special player metadata keys. None are defined; all keys are plain strings.
]]
---@alias core.MetadataTable.fields.player.keys.special
--- | string

--[[
Any player metadata key.
]]
---@alias core.MetadataTable.fields.player.keys
--- | core.MetadataTable.fields.player.keys.special
--- | string

--[[
Special player metadata keys that hold integers. None are defined.
]]
---@alias core.MetadataTable.fields.player.keys.integer.special
--- | string

--[[
player metadata keys usable with integer accessors (`set_int`/`get_int`).
]]
---@alias core.MetadataTable.fields.player.keys.integer
--- | core.MetadataTable.fields.player.keys.integer.special
--- | string

--[[
Special player metadata keys that hold floats. None are defined.
]]
---@alias core.MetadataTable.fields.player.keys.number.special
--- | string

--[[
player metadata keys usable with float accessors (`set_float`/`get_float`).
]]
---@alias core.MetadataTable.fields.player.keys.number
--- | core.MetadataTable.fields.player.keys.number.special
--- | string

-- -------------------------- MetadataTable.player -------------------------- --

--[[
Key-value store of player metadata. All values are stored as strings.
Uses the same storage as the deprecated player attribute API.
]]
---@class core.MetadataTable.fields.player : {[string]:string?}

--[[
Metadata table of a `PlayerMetaRef` (see `MetaDataRef:to_table`/`from_table`).
Has no inventory.
]]
---@class core.MetadataTable.player
--[[
Key-value storage of metadata fields. Numbers must be converted to strings
first.
]]
---@field fields core.MetadataTable.fields.player?