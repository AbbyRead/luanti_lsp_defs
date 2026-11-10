---@meta _

-- luanti/doc/lua_api.md: Definition tables > Item definition

-- ------------------------------ ItemDef.sound ----------------------------- --

--[[
Item sounds to be played at various events.
All fields in this table are optional.
]]
---@class core.ItemDef.sound
--[[
Played when a tool breaks due to wear. Ignored for non-tools.
]]
---@field breaks core.SimpleSoundSpec?
--[[
Played when the item is eaten with `core.do_item_eat`.
]]
---@field eat core.SimpleSoundSpec?
--[[
Played when the item is used with the 'punch/dig' key pointing at a node or
entity.
]]
---@field punch_use core.SimpleSoundSpec?
--[[
Played when the item is used with the 'punch/dig' key pointing at nothing
(air).
]]
---@field punch_use_air core.SimpleSoundSpec?

-- ----------------------------- ItemDef fields ----------------------------- --

---@class core.ItemDef
--[[
Definition of item sounds to be played at various events.
All fields in the table are optional.
]]
---@field sound? core.ItemDef.sound