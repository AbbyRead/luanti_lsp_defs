---@meta _

-- luanti/doc/lua_api.md: Flag Specifier Format
-- luanti/doc/lua_api.md: Decoration types
-- luanti/doc/lua_api.md: Mapgen objects
-- luanti/doc/lua_api.md: Definition tables > Decoration definition

-- --------------------------- DecorationDef.flags -------------------------- --

---@class _.DecorationDef.flags.tablefmt.__base
--[[
Nodes other than "air" and "ignore" are replaced by the decoration.
]]
---@field force_placement boolean?
--[[
Explicitly clears `force_placement` (the value is ignored, only presence counts).
]]
---@field noforce_placement boolean?

---@class _.DecorationDef.flags.tablefmt.liquid_surface : _.DecorationDef.flags.tablefmt.__base
--[[
Find the highest liquid (not solid) surface under open air. Search stops and
fails on the first solid node. Cannot be used with `all_floors` or
`all_ceilings`.
]]
---@field liquid_surface boolean?
--[[
Explicitly clears `liquid_surface` (the value is ignored, only presence counts).
]]
---@field noliquid_surface boolean?

---@class _.DecorationDef.flags.tablefmt.all : _.DecorationDef.flags.tablefmt.__base
--[[
Place the decoration on all floor surfaces instead of only the highest
surface in a mapchunk, e.g. in caves and dungeons.
]]
---@field all_floors boolean?
--[[
Explicitly clears `all_floors` (the value is ignored, only presence counts).
]]
---@field noall_floors boolean?
--[[
Place the decoration on all ceiling surfaces. Ceiling decorations invert
the effect of `place_offset_y`. Y-slice probabilities do not work correctly
for ceiling schematic decorations. If both `all_floors` and `all_ceilings`
are set, floor and ceiling decorations are aligned vertically.
]]
---@field all_ceilings boolean?
--[[
Explicitly clears `all_ceilings` (the value is ignored, only presence counts).
]]
---@field noall_ceilings boolean?

--[[
Table form of the decoration flags: flag names mapped to booleans. If a
field with the flag name prefixed with `"no"` is present (mapped to any
boolean), the flag is unset. `liquid_surface` cannot be combined with
`all_floors` / `all_ceilings`, hence the two variants.
]]
---@alias core.DecorationDef.flags.tablefmt
--- | _.DecorationDef.flags.tablefmt.liquid_surface
--- | _.DecorationDef.flags.tablefmt.all

--[[
String form of the decoration flags: a comma-delimited set of flag names
(whitespace and unrecognized flags are ignored). A flag prefixed with `"no"`
explicitly clears it. Example: `"liquid_surface, force_placement"`.
]]
---@alias core.DecorationDef.flags.stringfmt string

--[[
Flags for all decoration types, in table or string form (see Flag Specifier
Format). Supported flags: `liquid_surface`, `force_placement`, `all_floors`,
`all_ceilings`.
]]
---@alias core.DecorationDef.flags
--- | core.DecorationDef.flags.tablefmt
--- | core.DecorationDef.flags.stringfmt

-- ------------------- core.DecorationDef.schematic.flags ------------------- --

--[[
Table form of schematic decoration flags (variant with `liquid_surface`).
Additionally accepts the schematic flags `place_center_x`, `place_center_y`
and `place_center_z`.
]]
---@class core.DecorationDef.schematic.flags.tablefmt.liquid_surface : _.DecorationDef.flags.tablefmt.liquid_surface, core.Schematic.flags.tablefmt

--[[
Table form of schematic decoration flags (variant with `all_floors` /
`all_ceilings`). Additionally accepts the schematic flags `place_center_x`,
`place_center_y` and `place_center_z`.
]]
---@class core.DecorationDef.schematic.flags.tablefmt.all : _.DecorationDef.flags.tablefmt.all, core.Schematic.flags.tablefmt

--[[
Table form of the flags of a schematic decoration: the decoration flags plus
the schematic flags `place_center_x/y/z`.
]]
---@alias core.DecorationDef.schematic.flags.tablefmt
--- | core.DecorationDef.schematic.flags.tablefmt.liquid_surface
--- | core.DecorationDef.schematic.flags.tablefmt.all

--[[
String form of the flags of a schematic decoration: a comma-delimited set of
decoration flags and schematic flags (`place_center_x`, `place_center_y`,
`place_center_z`, `force_placement`). Example: `"place_center_x, all_floors"`.
]]
---@alias core.DecorationDef.schematic.flags.stringfmt string

--[[
Flags for schematic decorations, in table or string form. See Schematic
attributes and Flag Specifier Format: by default no flag is set.
]]
---@alias core.DecorationDef.schematic.flags
--- | core.DecorationDef.schematic.flags.tablefmt
--- | core.DecorationDef.schematic.flags.stringfmt