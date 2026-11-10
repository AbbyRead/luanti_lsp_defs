---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global callback registration functions

--[[
Fields received from a formspec: each formspec element's value (as string), indexed by
the element's `name`. The value depends on the element type:

* `animated_image`: index of the current frame
* `button` and variants: user-facing button text if pressed, otherwise `nil`
* `field`, `textarea` and variants: text in the field
* `dropdown`: index or value, depending on the `index event` argument
* `tabheader`: tab index starting with `"1"` (only if tab changed)
* `checkbox`: `"true"` if checked, `"false"` if unchecked
* `textlist`: see `core.explode_textlist_event`
* `table`: see `core.explode_table_event`
* `scrollbar`: see `core.explode_scrollbar_event`
* `key_enter_field`: name of the focused text field when Enter was pressed
]]
---@class core.FormspecFields : {[string]:string}
--[[
Sent as `"true"` when the user actively closed the form by mouse click, keypress or
through a `button_exit[]` element.
]]
---@field quit "true"?
--[[
Sent as `"true"` when the user tries to close the formspec but it used
`allow_close[false]`.
]]
---@field try_quit "true"?
--[[
Sent as `"true"` when the user pressed Enter while the focus was nowhere (closing the
formspec) or on a button. If the focus was on a text field, `key_enter_field` also
holds that field's name. See also `field_close_on_enter`.
]]
---@field key_enter "true"?

--[[
Callback for `core.register_on_player_receive_fields`. Return true to stop calling
remaining functions.

`formname` is the name passed to `core.show_formspec`; the empty string refers to the
player inventory (the formspec set by `set_inventory_formspec`).
]]
---@alias core.fn.on_player_receive_fields fun(player:core.PlayerRef, formname:string, fields:core.FormspecFields):boolean?

--[[
Called when the server received input from `player`, on any of these events:

* a button was pressed
* Enter was pressed while the focus was on a text field
* a checkbox was toggled
* something was selected in a dropdown list
* a different tab was selected
* selection was changed in a textlist or table
* an entry was double-clicked in a textlist or table
* a scrollbar was moved
* the form was actively closed by the player

See `core.FormspecFields` for the fields. Newest functions are called first. If a
function returns `true`, remaining functions are not called.
]]
---@param f core.fn.on_player_receive_fields
function core.register_on_player_receive_fields(f) end