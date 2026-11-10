---@meta _

-- luanti/doc/lua_api.md: Ores
-- luanti/doc/lua_api.md: Definition tables > Ore Definition

--[[
`"vein"` ore: veins of ore whose density varies by the intersection of two 3D
value noises with different seeds, both described by `noise_params`.

`clust_scarcity`, `clust_num_ores` and `clust_size` are ignored.

Difficult to control since it is sensitive to small changes. A decent
starting point: `noise_params = {offset = 0, scale = 3,
spread = {x=200, y=200, z=200}, seed = 5390, octaves = 4, persistence = 0.5,
lacunarity = 2.0, flags = "eased"}` with `noise_threshold = 1.6`.

**WARNING**: use very sparingly; ~200x more computationally expensive than
any other ore type.
]]
---@class core.OreDef.vein : _.OreDef.__base
--[[
Ore type. Must be `"vein"` for this definition.
]]
---@field  ore_type "vein"
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
---@field noise_params core.NoiseParams.3d?
--[[
Influence of random chance on ore placement inside the vein. Defaults to `1`.
Changing it may require adjusting `noise_threshold`.
]]
---@field random_factor number?