---@meta _

-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

--[[
Ore definition of type `"blob"`: creates a deformed sphere of ore according
to 3D value noise described by `noise_params`.
The maximum size of the blob is `clust_size`, and `clust_scarcity` has the same
meaning as with the `scatter` type.
]]
---@class core.OreDef.blob : _.OreDef.__base
--[[
Always `"blob"`.
]]
---@field  ore_type "blob"
--[[
Ore has a 1 out of clust_scarcity chance of spawning in a node.
If the desired average distance between ores is 'd', set this to
d * d * d.
]]
---@field clust_scarcity int?
--[[
Number of ores in a clust
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
]]
---@field noise_params core.NoiseParams.3d