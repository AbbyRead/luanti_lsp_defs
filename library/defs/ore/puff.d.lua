---@meta _

-- luanti/doc/lua_api.md: Flag Specifier Format
-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

-- ---------------------------- OreDef.puff.flags --------------------------- --

--[[
Table form of the `puff` ore flags. A flag prefixed with `no` explicitly
clears it (see "Flag Specifier Format").
]]
---@class core.OreDef.puff.flags.tablefmt
--[[
If set, puff ore generation will not taper down large differences in
displacement when approaching the edge of a puff.
]]
---@field puff_cliffs boolean?
--[[
Clears `puff_cliffs`.
]]
---@field nopuff_cliffs boolean?
--[[
If set, a negative displacement from `np_puff_top` or `np_puff_bottom`
generates the absolute difference in noise displacement values instead of
leaving the sub-column ungenerated.
]]
---@field puff_additive_composition boolean?
--[[
Clears `puff_additive_composition`.
]]
---@field nopuff_additive_composition boolean?
--[[
String form of the `puff` ore flags: comma-delimited flag names, e.g.
`"puff_cliffs,nopuff_additive_composition"`.
]]
---@alias core.OreDef.puff.flags.stringfmt string

--[[
Attributes for puff ore generation, as a table or comma-delimited string
(see "Flag Specifier Format"). Both flags have no effect on other ore types.
]]
---@alias core.OreDef.puff.flags
--- | core.OreDef.puff.flags.tablefmt
--- | core.OreDef.puff.flags.stringfmt

-- ------------------------------- OreDef.puff ------------------------------ --

--[[
Ore definition of type `"puff"`: creates a sheet of ore in a cloud-like puff
shape.
As with `sheet`, the size and shape of puffs are described by `noise_params`
and `noise_threshold`, and puffs are placed at random vertical positions
within the currently generated chunk.
]]
---@class core.OreDef.puff : _.OreDef.__base
--[[
Always `"puff"`.
]]
---@field  ore_type "puff"
--[[
Ore attributes: `puff_cliffs`, `puff_additive_composition`.
]]
---@field flags core.OreDef.puff.flags?
--[[
Ore has a 1 out of clust_scarcity chance of spawning in a node.
If the desired average distance between ores is 'd', set this to
d * d * d.
]]
---@field clust_scarcity int?
--[[
Number of ores in a cluster
]]
---@field clust_num_ores int?
--[[
Size of the bounding box of the cluster.
In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27
nodes are coal ore.
]]
---@field clust_size int?
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
Noise is evaluated in 2D: the Z component of `spread` is ignored, but should
still be defined.
]]
---@field noise_params core.NoiseParams.3d
--[[
Noise parameters for the vertical top displacement of each puff.
]]
---@field np_puff_top core.NoiseParams.3d?
--[[
Noise parameters for the vertical bottom displacement of each puff.
]]
---@field np_puff_bottom core.NoiseParams.3d?