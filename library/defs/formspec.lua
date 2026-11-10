---@meta _

-- luanti/doc/lua_api.md: Formspec

--[[
A formspec string defining a menu (inventories, buttons, checkboxes, text
fields, etc.). It is a sequence of elements of the form `name[arg;arg;...]`,
optionally separated by spaces and newlines.

* Many elements have a unique `name`, used to identify user input on the
  server. Do not use `quit`, and do not start a name with `key_`.
* Names and values cannot contain binary data such as ASCII control characters
  (except engine escape sequences in values).
* Positions and sizes are in inventory slots, unless real coordinates are
  enabled with `real_coordinates[true]` (recommended for new forms).
* Elements are drawn in definition order (formspec version 3+); all
  background elements are drawn first.
* Inventories at a `player:<name>` location are only sent to that player.
* Escape player-supplied text with `core.formspec_escape`; color text with
  `core.colorize`.
* Elements added with `ObjectRef:set_formspec_prepend()` are applied to every
  formspec of that player; use `no_prepend[]` to opt out.

Example (chest):
```lua
"size[8,9]" ..
"list[context;main;0,0;8,4;]" ..
"list[current_player;main;0,5;8,4;]"
```
]]
---@alias core.Formspec string