---@meta _

-- luanti/doc/lua_api.md: Definition table > Biome definition

--[[
Numeric biome ID. The maximum number of biomes is 65535, but using an
excessive amount slows down map generation, so the practical limit is much
lower.
]]
---@alias core.BiomeID int

--[[
Biome definition

Used by `core.register_biome`.
]]
---@class core.BiomeDef
--[[
Biome name
]]
---@field name string
--[[
Node dropped onto upper surface after all else is generated
]]
---@field node_dust core.Node.name?
--[[
Node forming surface layer of biome (see `depth_top`)
]]
---@field node_top core.Node.name?
--[[
Thickness of the surface layer of the biome.
Integer range of depth: [0, 32767]
]]
---@field depth_top int?
--[[
Node forming lower layer of biome (see `depth_filler`)
]]
---@field node_filler core.Node.name?
--[[
Thickness of the lower layer of the biome.
Integer range of depth: [0, 32767]
]]
---@field depth_filler int?
--[[
Node that replaces all stone nodes between roughly y_min and y_max.
]]
---@field node_stone core.Node.name?
--[[
Node forming a surface layer in seawater (see `depth_water_top`)
]]
---@field node_water_top core.Node.name?
--[[
Thickness of the surface layer in seawater.
Integer range of depth: [0, 32767]
]]
---@field depth_water_top int?
--[[
Node that replaces all seawater nodes not in the surface layer
]]
---@field node_water core.Node.name?
--[[
Node that replaces river water in mapgens that use default:river_water
]]
---@field node_river_water core.Node.name?
--[[
Node placed under river water (see `depth_riverbed`)
]]
---@field node_riverbed core.Node.name?
--[[
Thickness of the layer placed under river water.
Integer range of depth: [0, 32767]
]]
---@field depth_riverbed int?
--[[
Nodes placed inside 50% of the medium size caves.
Multiple nodes can be specified, each cave will use a randomly
chosen node from the list.
If this field is left out or 'nil', cave liquids fall back to
classic behavior of lava and water distributed using 3D noise.
For no cave liquid, specify "air".
]]
---@field node_cave_liquid core.Node.name|core.Node.name[]?
--[[
Node used for primary dungeon structure.
If absent, dungeon nodes fall back to the 'mapgen_cobble' mapgen
alias, if that is also absent, dungeon nodes fall back to the biome
'node_stone'.
If present, the following two nodes are also used.
]]
---@field node_dungeon core.Node.name?
--[[
Node used for randomly-distributed alternative structure nodes.
If alternative structure nodes are not wanted leave this absent.
]]
---@field node_dungeon_alt core.Node.name?
--[[
Node used for dungeon stairs.
If absent, stairs fall back to 'node_dungeon'.
]]
---@field node_dungeon_stair core.Node.name?
--[[
Upper limit for biome. Integer [s16].
Alternatively use `min_pos` / `max_pos`.
]]
---@field y_max int?
--[[
Lower limit for biome. Integer [s16].
Alternatively use `min_pos` / `max_pos`.
]]
---@field y_min int?
--[[
xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
Biome is limited to a cuboid defined by these integer positions.
Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
31000 in 'max_pos'.
]]
---@field max_pos ivector?
--[[
xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
Biome is limited to a cuboid defined by these integer positions.
Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
31000 in 'max_pos'.
]]
---@field min_pos ivector?
--[[
Vertical distance in nodes above 'y_max' over which the biome will
blend with the biome above.
Set to 0 for no vertical blend. Defaults to 0.
Integer [s16]
]]
---@field vertical_blend int?
--[[
Characteristic temperature and humidity for the biome.
These values create 'biome points' on a voronoi diagram with heat and
humidity as axes. The resulting voronoi cells determine the
distribution of the biomes.
Heat and humidity have average values of 50.0, vary mostly between
0.0 and 100.0 but can exceed these values.
]]
---@field heat_point number?
--[[
Characteristic temperature and humidity for the biome.
These values create 'biome points' on a voronoi diagram with heat and
humidity as axes. The resulting voronoi cells determine the
distribution of the biomes.
Heat and humidity have average values of 50.0, vary mostly between
0.0 and 100.0 but can exceed these values.
]]
---@field humidity_point number?
--[[
Relative weight of the biome in the Voronoi diagram.
A value of 0 (or less) is ignored and equivalent to 1.0.
]]
---@field weight number?