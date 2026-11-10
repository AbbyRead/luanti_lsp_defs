---@meta _

-- luanti/doc/lua_api.md: Metadata
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- ------------------- MetadataTable.*.node special fields ------------------ --

--[[
Keys of the node metadata key-value store that are handled specially.
]]
---@alias core.MetadataTable.fields.node.keys.special
--- | "formspec"
--- | "infotext"

--[[
Any node metadata key: a special key or an arbitrary string.
]]
---@alias core.MetadataTable.fields.node.keys
--- | core.MetadataTable.fields.node.keys.special
--- | string

--[[
Special node metadata keys that hold integers. None are defined.
]]
---@alias core.MetadataTable.fields.node.keys.integer.special
--- | string

--[[
Node metadata keys usable with integer accessors.
]]
---@alias core.MetadataTable.fields.node.keys.integer
--- | core.MetadataTable.fields.node.keys.integer.special
--- | string

--[[
Special node metadata keys that hold floats. None are defined.
]]
---@alias core.MetadataTable.fields.node.keys.number.special
--- | string

--[[
Node metadata keys usable with float accessors.
]]
---@alias core.MetadataTable.fields.node.keys.number
--- | core.MetadataTable.fields.node.keys.number.special
--- | string

-- --------------------------- MetadataTable.node --------------------------- --

--[[
Key-value store of node metadata. All values are stored as strings.
The fields below are handled specially.
]]
---@class core.MetadataTable.fields.node : {[string]:string?}
--[[
Defines an inventory menu that is opened with the 'place/use' key.
Only works if no `on_rightclick` was defined for the node.
]]
---@field formspec core.Formspec?
--[[
Text shown on the screen when the node is pointed at.
Line-breaks are applied automatically. Very long text is truncated.
]]
---@field infotext string?

--[[
Node metadata table accepted by `NodeMetaRef:from_table`.
]]
---@alias core.MetadataTable.node.set
--- | core.MetadataTable.node.get
--- | _.MetadataTable.node.set

---@class _.MetadataTable.node.set
--[[
Key-value storage of metadata fields. Numbers must be converted to strings.
]]
---@field fields core.MetadataTable.fields.node?
--[[
Node inventory in table form: keys are list names, values are item tables
(slot IDs starting at 1 mapped to ItemStacks or itemstrings).
]]
---@field inventory core.InventoryTable?

--[[
Node metadata table returned by `NodeMetaRef:to_table`.
]]
---@class core.MetadataTable.node.get
--[[
Key-value storage of metadata fields. All values are strings.
]]
---@field fields core.MetadataTable.fields.node?
--[[
Node inventory in table form: keys are list names, values are item tables
(slot IDs starting at 1 mapped to ItemStacks).
]]
---@field inventory core.InventoryTable.ItemStack?