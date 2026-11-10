---@meta _

-- luanti/doc/lua_api.md: Definition tables > Node definition

-- ------------------------------ NodeDef.tiles ----------------------------- --

--[[
Textures of a node, one per face in the order +Y, -Y, +X, -X, +Z, -Z.
The list can be shortened to the needed length.
]]
---@class core.NodeDef.tiles.strict
--[[
Tile of the +Y face.
]]
---@field [1] core.TileDef?
--[[
Tile of the -Y face.
]]
---@field [2] core.TileDef?
--[[
Tile of the +X face.
]]
---@field [3] core.TileDef?
--[[
Tile of the -X face.
]]
---@field [4] core.TileDef?
--[[
Tile of the +Z face.
]]
---@field [5] core.TileDef?
--[[
Tile of the -Z face.
]]
---@field [6] core.TileDef?

--[[
Textures of a node (+Y, -Y, +X, -X, +Z, -Z).
The list can be shortened to the needed length.
]]
---@alias core.NodeDef.tiles
--- | core.NodeDef.tiles.strict
--- | core.TileDef[]

-- -------------------------- NodeDef.special_tiles ------------------------- --

--[[
Special textures of a node; used rarely. See `core.NodeDef.special_tiles`.
]]
---@class core.NodeDef.special_tiles.strict
--[[
First special tile.
]]
---@field [1] core.TileDef?
--[[
Second special tile.
]]
---@field [2] core.TileDef?

--[[
Special textures of a node; used rarely (e.g. the liquid texture of
`glasslikeliquidlevel` nodes).
The list can be shortened to the needed length.
]]
---@alias core.NodeDef.special_tiles
--- | core.NodeDef.special_tiles.strict
--- | core.TileDef[]

-- ----------------------------- NodeDef fields ----------------------------- --

---@class core.NodeDef
--[[
tiles = {tile definition 1, def2, def3, def4, def5, def6},
Textures of node; +Y, -Y, +X, -X, +Z, -Z
List can be shortened to needed length.
]]
---@field tiles core.NodeDef.tiles?
--[[
overlay_tiles = {tile definition 1, def2, def3, def4, def5, def6},
Same as `tiles`, but these textures are drawn on top of the base
tiles. You can use this to colorize only specific parts of your
texture. If the texture name is an empty string, that overlay is not
drawn. Since such tiles are drawn twice, it is not recommended to use
overlays on very common nodes.
]]
---@field overlay_tiles core.NodeDef.tiles?
--[[
special_tiles = {tile definition 1, Tile definition 2},
Special textures of node; used rarely.
List can be shortened to needed length.
]]
---@field special_tiles core.NodeDef.special_tiles?