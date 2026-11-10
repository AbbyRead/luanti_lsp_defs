---@meta _

-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

--[[
`"stratum"` ore: a single undulating ore stratum that is continuous across
mapchunk borders and horizontally spans the world.

The 2D value noise `noise_params` defines the Y coordinate of the stratum
midpoint; the 2D value noise `np_stratum_thickness` defines its vertical
thickness in nodes. Because the stratum is continuous across mapchunk
borders, its vertical thickness is unlimited.

If `noise_params` is omitted, the ore occurs from `y_min` to `y_max` in a
simple horizontal stratum. Use `stratum_thickness` instead of
`np_stratum_thickness` for a constant thickness. Omitting one or both noise
parameters makes generation less intensive, which is useful when adding
multiple strata.

`y_min` and `y_max` limit generation and should be as close together as
possible (for performance) without clipping the stratum's Y variation.

Each node in the stratum has a 1-in-`clust_scarcity` chance of being ore, so
a solid-ore stratum needs a `clust_scarcity` of 1.
]]
---@class core.OreDef.stratum : _.OreDef.__base
--[[
Ore type. Must be `"stratum"` for this definition.
]]
---@field  ore_type "stratum"
--[[
If noise is above this threshold, ore is placed. Not needed for a
uniform distribution.
]]
---@field noise_threshold number?
--[[
NoiseParams structure describing one of the noises used for
ore distribution.
Needed by "sheet", "puff", "blob" and "vein" ores.
Omit from "scatter" ore for a uniform ore distribution.
Omit from "stratum" ore for a simple horizontal strata from y_min to
y_max.

For `"stratum"` this is 2D noise defining the Y coordinate of the stratum
midpoint.
]]
---@field noise_params core.NoiseParams.2d?
--[[
2D noise defining the stratum's vertical thickness in nodes.
]]
---@field np_stratum_thickness core.NoiseParams.2d?
--[[
Constant stratum thickness, only used if no thickness noise is defined.
Integer [u16]
]]
---@field stratum_thickness int?