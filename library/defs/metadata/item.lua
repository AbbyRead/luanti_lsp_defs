---@meta _

-- luanti/doc/lua_api.md: Metadata
-- luanti/doc/lua_api.md: Class reference > `MetaDataRef`

-- ------------------- MetadataTable.*.item special fields ------------------ --
--[[
Keys of the item metadata key-value store that are handled specially.
Item metadata cannot store the character `"\1"`.
]]
---@alias core.MetadataTable.fields.item.keys.special
--- | "description"
--- | "short_description"
--- | "inventory_image"
--- | "inventory_overlay"
--- | "wield_image"
--- | "wield_overlay"
--- | "wield_scale"
--- | "color"
--- | "palette_index"
--- | "count_meta"
--- | "count_alignment"
--- | "range"

--[[
Any item metadata key: a special key or an arbitrary string.
]]
---@alias core.MetadataTable.fields.item.keys
--- | core.MetadataTable.fields.item.keys.special
--- | string

--[[
Special item metadata keys that hold integers (`set_int`/`get_int`).
]]
---@alias core.MetadataTable.fields.item.keys.integer.special
--- | "palette_index"
--- | "count_alignment"

--[[
Item metadata keys usable with integer accessors.
]]
---@alias core.MetadataTable.fields.item.keys.integer
--- | core.MetadataTable.fields.item.keys.integer.special
--- | string

--[[
Special item metadata keys that hold floats (`set_float`/`get_float`).
]]
---@alias core.MetadataTable.fields.item.keys.number.special
--- | "range"

--[[
Item metadata keys usable with float accessors.
]]
---@alias core.MetadataTable.fields.item.keys.number
--- | core.MetadataTable.fields.item.keys.number.special
--- | string

-- --------------------------- MetadataTable.item --------------------------- --

--[[
Key-value store of item metadata. All values are stored as strings.
The fields below are handled specially.
]]
---@class core.MetadataTable.fields.item : {[string]:string?}
--[[
Set the item stack's description.
See also: `get_description` in `ItemStack`.
]]
---@field description string?
--[[
Set the item stack's short description.
See also: `get_short_description` in `ItemStack`.
]]
---@field short_description string?
--[[
Override `inventory_image.name`.
]]
---@field inventory_image core.Texture?
--[[
Override `inventory_overlay.name`.
]]
---@field inventory_overlay core.Texture?
--[[
Override `wield_image.name`.
]]
---@field wield_image core.Texture?
--[[
Override `wield_scale`. Use `vector.to_string`.
]]
---@field wield_scale core.MetadataTable.vector?
--[[
A `ColorString` that sets the stack's color.
]]
---@field color core.ColorString?
--[[
If the item has a palette, used to get the current color from the palette.
]]
---@field palette_index int?
--[[
Replace the displayed count with any string.
]]
---@field count_meta string?
--[[
Alignment of the displayed count value. The lowest 2 bits specify the
x-direction alignment, the 3rd and 4th bits the y-direction alignment:
`0` = default, `1` = left / up, `2` = middle, `3` = right / down.
The default currently is the same as right/down.
Example: `6` = 2 + 1*4 = middle,up
]]
---@field count_alignment int?
--[[
Override the pointing range.
Example: `meta:set_float("range", 4.2)`
]]
---@field range number?

--[[
Metadata table of an item stack (see `MetaDataRef:to_table`/`from_table`).
Item stacks have no inventory.
]]
---@class core.MetadataTable.item
--[[
Key-value storage of metadata fields. All values are strings; numbers must be
converted to strings first.
]]
---@field fields core.MetadataTable.fields.item?