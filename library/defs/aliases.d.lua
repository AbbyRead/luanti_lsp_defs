---@meta _

-- luanti/doc/lua_api.md: Aliases > Mapgen aliases

-- ------------------------------- MapgenAlias ------------------------------ --

--[[
Essential mapgen aliases for non-V6 mapgens. Set with `core.register_alias`.
`mapgen_river_water_source` is required for mapgens with sloping rivers, where
a river liquid node with a short `liquid_range` and `liquid_renewable = false`
is needed to avoid flooding.
]]
---@alias core.MapgenAlias.essential
--- | "mapgen_stone"
--- | "mapgen_water_source"
--- | "mapgen_river_water_source"

--[[
Optional mapgen aliases for non-V6 mapgens.

* `mapgen_lava_source`: fallback lava node used if cave liquids are not
  defined in biome definitions. Deprecated, define cave liquids in biome
  definitions instead.
* `mapgen_cobble`: fallback node used if dungeon nodes are not defined in
  biome definitions. Deprecated, define dungeon nodes in biome definitions
  instead.
]]
---@alias core.MapgenAlias.optional
--- | "mapgen_lava_source"
--- | "mapgen_cobble"

--[[
Essential mapgen aliases for Mapgen V6.
]]
---@alias core.MapgenAlias.v6.essential
--- | "mapgen_stone"
--- | "mapgen_water_source"
--- | "mapgen_lava_source"
--- | "mapgen_dirt"
--- | "mapgen_dirt_with_grass"
--- | "mapgen_sand"
--- | "mapgen_tree"
--- | "mapgen_leaves"
--- | "mapgen_apple"
--- | "mapgen_cobble"

--[[
Optional mapgen aliases for Mapgen V6. Fallbacks when missing:

* `mapgen_gravel`, `mapgen_desert_stone`: stone
* `mapgen_desert_sand`: sand
* `mapgen_dirt_with_snow`, `mapgen_snowblock`: dirt_with_grass
* `mapgen_snow`, `mapgen_junglegrass`: not placed
* `mapgen_ice`: water_source
* `mapgen_jungletree`, `mapgen_pine_tree`: tree
* `mapgen_jungleleaves`, `mapgen_pine_needles`: leaves
* `mapgen_stair_cobble`, `mapgen_mossycobble`: cobble
* `mapgen_stair_desert_stone`: desert_stone
]]
---@alias core.MapgenAlias.v6.optional
--- | "mapgen_gravel"
--- | "mapgen_desert_stone"
--- | "mapgen_desert_sand"
--- | "mapgen_dirt_with_snow"
--- | "mapgen_snowblock"
--- | "mapgen_snow"
--- | "mapgen_ice"
--- | "mapgen_jungletree"
--- | "mapgen_jungleleaves"
--- | "mapgen_junglegrass"
--- | "mapgen_pine_tree"
--- | "mapgen_pine_needles"
--- | "mapgen_stair_cobble"
--- | "mapgen_mossycobble"
--- | "mapgen_stair_desert_stone"

--[[
Mapgen aliases. In a game, a certain number of these must be set to tell core
mapgens which of the game's nodes to use, e.g.
`core.register_alias("mapgen_stone", "default:stone")`.

`mapgen_singlenode` (not listed here) sets the node used by Mapgen Singlenode;
by default the world is filled with air.
]]
---@alias core.MapgenAlias
--- | core.MapgenAlias.essential
--- | core.MapgenAlias.optional
--- | core.MapgenAlias.v6.essential
--- | core.MapgenAlias.v6.optional

--[[
Alias name for `core.register_alias` / `core.register_alias_force`: a mapgen
alias or any other string. An alias refers to the item called `original_name`;
`core.register_alias` does nothing if an item named `alias` already exists,
while `core.register_alias_force` unregisters it.
]]
---@alias core.Alias
--- | core.MapgenAlias
--- | string