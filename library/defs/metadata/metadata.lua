---@meta _

-- luanti/doc/lua_api.md: Metadata
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

--[[
Vector stored in metadata as a string, as produced by `vector.to_string`.
]]
---@alias core.MetadataTable.vector string

--[[
Any metadata key, across all metadata kinds (item, node, player, storage).
]]
---@alias core.MetadataTable.fields.keys
--- | core.MetadataTable.fields.item.keys
--- | core.MetadataTable.fields.node.keys
--- | core.MetadataTable.fields.player.keys
--- | core.MetadataTable.fields.storage.keys

--[[
Any metadata key usable with integer accessors (`set_int`/`get_int`),
across all metadata kinds.
Integers are limited to the s32 range for portability.
]]
---@alias core.MetadataTable.fields.keys.integer
--- | core.MetadataTable.fields.item.keys.integer
--- | core.MetadataTable.fields.node.keys.integer
--- | core.MetadataTable.fields.player.keys.integer
--- | core.MetadataTable.fields.storage.keys.integer

--[[
Any metadata key usable with float accessors (`set_float`/`get_float`),
across all metadata kinds. Stored as 64-bit floating-point numbers.
]]
---@alias core.MetadataTable.fields.keys.number
--- | core.MetadataTable.fields.item.keys.number
--- | core.MetadataTable.fields.node.keys.number
--- | core.MetadataTable.fields.player.keys.number
--- | core.MetadataTable.fields.storage.keys.number

--[[
Metadata table accepted by `MetaDataRef:from_table`.
Importing replaces all metadata of the target. Any non-table value clears all
metadata. Item table values of the `inventory` field may also be itemstrings.
]]
---@alias core.MetadataTable.set
--- | core.MetadataTable.get
--- | core.MetadataTable.node.set
--- | core.MetadataTable.item

--[[
Metadata table returned by `MetaDataRef:to_table`.
Has the keys `fields` (key-value storage; all values are strings) and, for
`NodeMetaRef` only, `inventory`.
]]
---@alias core.MetadataTable.get
--- | core.MetadataTable.node.get
--- | core.MetadataTable.item