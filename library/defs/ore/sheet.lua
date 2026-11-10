---@meta _

-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

--[[
Ore definition of type `"sheet"`: creates a sheet of ore in a blob shape
according to the 2D value noise described by `noise_params` and
`noise_threshold`.
The sheet consists of vertical columns of uniform randomly distributed height,
varying between the inclusive range `column_height_min` and
`column_height_max`.
`clust_scarcity` and `clust_num_ores` are ignored for this ore type.
]]
---@class core.OreDef.sheet : _.OreDef.__base
--[[
Always `"sheet"`.
]]
---@field  ore_type "sheet"
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
Minimum column height (inclusive). Default is `1`.
]]
---@field column_height_min int?
--[[
Maximum column height (inclusive). Defaults to `clust_size` for reverse
compatibility; new code should prefer `column_height_max`.
]]
---@field column_height_max int?
--[[
Position of the column at which ore emanates from, in range [0, 1].
1 = columns grow upward, 0 = downward, 0.5 = equally from each direction.
Default is `0.5`.
]]
---@field column_midpoint_factor number?