---@meta _

-- luanti/doc/lua_api.md: Definition tables > Item definition

-- ------------------------ ItemDef.touch_interaction ----------------------- --

--[[
Meaning of short and long taps:
* `"long_dig_short_place"`: long tap = dig, short tap = place
* `"short_dig_long_place"`: short tap = dig, long tap = place
* `"user"`:
  * `pointed_object`: same as `"short_dig_long_place"` if the client setting
    `touch_punch_gesture` is `"short_tap"` (default) and the item can punch
    (has no `on_use` callback). Same as `"long_dig_short_place"` otherwise.
  * `pointed_node` and `pointed_nothing`: same as `"long_dig_short_place"`.
  * The behavior of `"user"` may change in the future.
]]
---@alias core.ItemDef.touch_interaction.mode
---| "long_dig_short_place"
---| "short_dig_long_place"
---| "user"

--[[
Per-target interaction modes. The field used is selected according to the
current `pointed_thing`.
]]
---@class core.ItemDef.touch_interaction.pointed_thing
--[[
Mode used when pointing at nothing.
]]
---@field pointed_nothing core.ItemDef.touch_interaction.mode?
--[[
Mode used when pointing at a node.
]]
---@field pointed_node core.ItemDef.touch_interaction.mode?
--[[
Mode used when pointing at an object.
]]
---@field pointed_object core.ItemDef.touch_interaction.mode?

---@alias core.ItemDef.touch_interaction
---| core.ItemDef.touch_interaction.mode
---| core.ItemDef.touch_interaction.pointed_thing

-- ----------------------------- ItemDef fields ----------------------------- --

---@class core.ItemDef
---@field touch_interaction? core.ItemDef.touch_interaction Only affects touchscreen clients.<br>
--- Defines the meaning of short and long taps with the item in hand.<br>
--- If specified as a table, the field to be used is selected according to
--- the current `pointed_thing`.<br>
--- There are three possible TouchInteractionMode values:
--- - "long_dig_short_place" (long tap = dig, short tap = place)
--- - "short_dig_long_place" (short tap = dig, long tap = place)
--- - "user":
---   * For `pointed_object`: Equivalent to "short_dig_long_place" if the
---     client-side setting "touch_punch_gesture" is "short_tap" (the
---     default value) and the item is able to punch (i.e. has no on_use
---     callback defined).
---     Equivalent to "long_dig_short_place" otherwise.
---   * For `pointed_node` and `pointed_nothing`:
---     Equivalent to "long_dig_short_place".
---   * The behavior of "user" may change in the future.<br>
--- The default value is "user".