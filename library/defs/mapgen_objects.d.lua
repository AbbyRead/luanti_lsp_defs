---@meta _

-- luanti/doc/lua_api.md: Mapgen objects

-- ----------------------------- GenNotify.flags ---------------------------- --

--[[
Table form of the gennotify flags passed to `core.set_gen_notify`: flag names
mapped to booleans. A field prefixed with `"no"` mapped to any boolean unsets
the flag.
]]
---@class core.GenNotify.flags.tablefmt : {[string]:boolean?}
--[[
Request `dungeon` notifications: bottom center position of dungeon rooms.
]]
---@field dungeon boolean?
--[[
Explicitly clears `dungeon`.
]]
---@field nodungeon boolean?
--[[
Request `temple` notifications: as `dungeon` but for desert temples (mgv6 only).
]]
---@field temple boolean?
--[[
Explicitly clears `temple`.
]]
---@field notemple boolean?
--[[
Request `cave_begin` notifications.
]]
---@field cave_begin boolean?
--[[
Explicitly clears `cave_begin`.
]]
---@field nocave_begin boolean?
--[[
Request `cave_end` notifications.
]]
---@field cave_end boolean?
--[[
Explicitly clears `cave_end`.
]]
---@field nocave_end boolean?
--[[
Request `large_cave_begin` notifications.
]]
---@field large_cave_begin boolean?
--[[
Explicitly clears `large_cave_begin`.
]]
---@field nolarge_cave_begin boolean?
--[[
Request `large_cave_end` notifications.
]]
---@field large_cave_end boolean?
--[[
Explicitly clears `large_cave_end`.
]]
---@field nolarge_cave_end boolean?
--[[
Request `custom` notifications: data originating from the Mapgen environment (Lua API).
]]
---@field custom boolean?
--[[
Explicitly clears `custom`.
]]
---@field nocustom boolean?
--[[
Request notifications for decorations (the decoration IDs to notify about are passed as `deco_ids` to `core.set_gen_notify`).
]]
---@field decoration boolean?
--[[
Explicitly clears `decoration`.
]]
---@field nodecoration boolean?

--[[
String form of the gennotify flags: a comma-delimited set of flag names
(whitespace and unrecognized flags are ignored), e.g.
`"dungeon, decoration"`. A flag prefixed with `"no"` explicitly clears it.
]]
---@alias core.GenNotify.flags.stringfmt string

--[[
Gennotify flags in table or string form, as accepted by `core.set_gen_notify`.
]]
---@alias core.GenNotify.flags
--- | core.GenNotify.flags.tablefmt
--- | core.GenNotify.flags.stringfmt

-- -------------------------------- GenNotify ------------------------------- --

--[[
Key of a decoration notification: `"decoration#id"`, where `id` is the
numeric unique decoration ID as returned by `core.get_decoration_id()`,
e.g. `"decoration#123"`.
]]
---@alias core.GenNotify.key.decoration string

--[[
Returns a table. You need to announce your interest in a specific
field by calling `core.set_gen_notify()` *before* map generation happens.

* key = string: generation notification type
* value = list of positions (usually)
   * Exceptions are denoted in the listing below.

Available generation notification types:

* `dungeon`: bottom center position of dungeon rooms
* `temple`: as above but for desert temples (mgv6 only)
* `cave_begin`
* `cave_end`
* `large_cave_begin`
* `large_cave_end`
* `custom`: data originating from [Mapgen environment](#mapgen-environment) (Lua API)
   * This is a table.
   * key = user-defined ID (string)
   * value = arbitrary Lua value
* `decoration#id`: decorations
  * (see below)

Decorations have a key in the format of `"decoration#id"`, where `id` is the
numeric unique decoration ID as returned by `core.get_decoration_id()`.
For example, `decoration#123`.

The returned positions are the ground surface 'place_on' nodes,
not the decorations themselves. A 'simple' type decoration is often 1
node above the returned position and possibly displaced by 'place_offset_y'.
]]
---@class core.GenNotify
--[[
Positions of dungeon rooms (bottom center) when `dungeon` notifications
were requested.
]]
---@field dungeon ivec[]?
--[[
Desert temple positions (mgv6 only).
]]
---@field temple ivec[]?
--[[
Positions of cave beginnings.
]]
---@field cave_begin ivec[]?
--[[
Positions of cave ends.
]]
---@field cave_end ivec[]?
--[[
Positions of large cave beginnings.
]]
---@field large_cave_begin ivec[]?
--[[
Positions of large cave ends.
]]
---@field large_cave_end ivec[]?
--[[
Data originating from the Mapgen environment (Lua API). Key = user-defined
ID (string), value = arbitrary Lua value.
]]
---@field custom table<string, any>
--[[
Positions of the ground surface 'place_on' nodes for the decoration with the
given ID (not the decorations themselves).
]]
---@field [core.GenNotify.key.decoration] ivec[]?