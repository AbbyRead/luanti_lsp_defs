---@meta _

-- luanti/doc/lua_api.md: Schematics

-- ----------------------------- Schematic.flag ----------------------------- --

--[[
Table form of the schematic flags (Flag Specifier Format): flag names mapped
to booleans. A field prefixed with `"no"` mapped to any boolean unsets the
flag.
]]
---@class core.Schematic.flags.tablefmt
--[[
Placement of the decoration is centered along the X axis.
]]
---@field place_center_x boolean?
--[[
Explicitly clears `place_center_x`.
]]
---@field noplace_center_x boolean?
--[[
Placement of the decoration is centered along the Y axis.
]]
---@field place_center_y boolean?
--[[
Explicitly clears `place_center_y`.
]]
---@field noplace_center_y boolean?
--[[
Placement of the decoration is centered along the Z axis.
]]
---@field place_center_z boolean?
--[[
Explicitly clears `place_center_z`.
]]
---@field noplace_center_z boolean?

--[[
String form of the schematic flags: a comma-delimited set of flag names, e.g.
`"place_center_x, place_center_z"`. A flag prefixed with `"no"` explicitly
clears it.
]]
---@alias core.Schematic.flags.stringfmt string

--[[
Schematic flags in table or string form. Currently supported flags:
`place_center_x`, `place_center_y`, `place_center_z` and `force_placement`
(schematic nodes other than "ignore" replace existing nodes).
]]
---@alias core.Schematic.flags
--- | core.Schematic.flags.tablefmt
--- | core.Schematic.flags.stringfmt

-- ------------------------ SchematicDef.yslice_prob ------------------------ --

--[[
A `{ypos, prob}` slice table: sets the probability of a particular
horizontal slice of the schematic being placed.
]]
---@class core.SchematicDef.yslice_prob
--[[
Slice position; 0 is the lowest horizontal slice of a schematic.
]]
---@field  ypos int
--[[
Probability of the slice (integer in range [0, 255]). The default is 255.

* A probability value of `0` or `1` means that node will never appear
  (0% chance).
* A probability value of `254` or `255` means the node will always appear
  (100% chance).
* If the probability value `p` is greater than `1`, then there is a
  `(p / 256 * 100)` percent chance that node will appear when the schematic is
  placed on the map.
]]
---@field  prob int

-- ---------------------------- SchematicDef.node --------------------------- --

--[[
A single node of a schematic (a "MapNode table").
]]
---@class core.SchematicDef.Node
--[[
The name of the map node to place (required).
]]
---@field  name string
--[[
The raw param2 value of the node being placed onto the map
(integer in range [0, 255], default: 0).
]]
---@field param2 core.Param2?
--[[
Whether the node should forcibly overwrite any previous contents
(default: false).
]]
---@field force_place boolean?
--[[
The probability of this node being placed (integer in range [0, 255],
default: 255). See the probability values on `core.SchematicDef.yslice_prob`.
]]
---@field prob int?
--[[
Alias of `prob`.
]]
---@deprecated
---@field param1 int?

-- -------------------------------- Schematic ------------------------------- --

--[[
Numeric ID of a registered schematic, e.g. as returned by `core.register_schematic`.
]]
---@alias core.SchematicID int

--[[
A schematic specifier identifies a schematic by either a filename to a
Luanti Schematic file (`.mts`) or through raw data supplied through Lua,
in the form of a table.
]]
---@class core.SchematicDef
--[[
* The `size` field is a 3D vector containing the dimensions of the provided
  schematic. (required field)
]]
---@field  size ivector
--[[
* The `yslice_prob` field is a table of {ypos, prob} slice tables. A slice table
  sets the probability of a particular horizontal slice of the schematic being
  placed. (optional field)
  `ypos` = 0 for the lowest horizontal slice of a schematic.
  The default of `prob` is 255.
    * A probability value of `0` or `1` means that node will never appear
      (0% chance).
    * A probability value of `254` or `255` means the node will always appear
      (100% chance).
    * If the probability value `p` is greater than `1`, then there is a
      `(p / 256 * 100)` percent chance that node will appear when the schematic is
      placed on the map.
]]
---@field  yslice_prob core.SchematicDef.yslice_prob[]?
--[=[
* The `data` field is a flat table of Node tables making up the schematic,
  in the order of `[z [y [x]]]`. (required field)
  Each Node table contains:
    * `name`: the name of the map node to place (required)
    * `prob` (alias `param1`): the probability of this node being placed
      (default: 255)
    * `param2`: the raw param2 value of the node being placed onto the map
      (default: 0)
    * `force_place`: boolean representing if the node should forcibly overwrite
      any previous contents (default: false)
]=]
---@field  data core.SchematicDef.Node[]

--[[
Schematic specifier: a registered schematic ID, a path to a Luanti Schematic
file (`.mts`), or a table with raw data (see `core.SchematicDef`).
]]
---@alias core.Schematic
--- | core.SchematicID
--- | core.Path
--- | core.SchematicDef