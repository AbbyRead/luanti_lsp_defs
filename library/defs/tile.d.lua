---@meta _

-- luanti/doc/lua_api.md: Definition tables > Tile definition
-- luanti/doc/lua_api.md: Definition tables > Tile animation definition

-- -------------------- TileAnimationDef.vertical_frames -------------------- --

--[[
Tile animation `vertical_frames`: the texture is a vertical strip of frames.
]]
---@class core.TileAnimationDef.vertical_frames
--[[
Animation type.
]]
---@field type "vertical_frames"
--[[
Width of a frame in pixels. Integer in range [1, 65535].
]]
---@field aspect_w int? Frame width in pixels, range 1-65535 (docs example: 16; omitted by existing mods)
--[[
Height of a frame in pixels. Integer in range [1, 65535].
]]
---@field aspect_h int? Frame height in pixels, range 1-65535 (docs example: 16; omitted by existing mods)
--[[
Full loop length (in seconds).
]]
---@field length number

-- ------------------------ TileAnimationDef.sheet_2d ----------------------- --

--[[
Tile animation `sheet_2d`: the texture is a sheet of frames in a grid.
]]
---@class core.TileAnimationDef.sheet_2d
--[[
Animation type.
]]
---@field type "sheet_2d"
--[[
Width in number of frames (integer).
]]
---@field frames_w int
--[[
Height in number of frames (integer).
]]
---@field frames_h int
--[[
Length of a single frame (in seconds).
]]
---@field frame_length number

-- ---------------------------- TileAnimationDef ---------------------------- --

--[[
Tile animation definition: `vertical_frames` or `sheet_2d`. Also used for item
images (an item image definition is basically a tile definition for items).
]]
---@alias core.TileAnimationDef
--- | core.TileAnimationDef.vertical_frames
--- | core.TileAnimationDef.sheet_2d

-- ----------------------------- TileDef.__base ----------------------------- --

---@class _.TileDef.__base
--[[
Texture name, e.g. `"image.png"`.
]]
---@field name core.Texture
--[[
Deprecated, yet still supported field name for `name`.
]]
---@deprecated
---@field image string?

-- ---------------------------- TileDef.animation --------------------------- --

--[[
Tile with an animation: `{name="image.png", animation={Tile Animation
definition}}`.
]]
---@class core.TileDef.animation : _.TileDef.__base
--[[
The animation of the tile.
]]
---@field animation core.TileAnimationDef


-- ----------------------------- TileDef.regular ---------------------------- --

--[[
Align style of a tile: determines whether the texture will be rotated with the
node (`"node"`) or kept aligned with its surroundings (`"world"`). `"user"`
means the client setting will be used, similar to `glasslike_framed_optional`.
Supported by solid nodes and nodeboxes only.
]]
---@alias core.TileDef.align_style
--- | "node"
--- | "world"
--- | "user"

--[[
Tile with rendering options:
`{name="image.png", backface_culling=bool, align_style=..., scale=int}`.
]]
---@class core.TileDef.regular : _.TileDef.__base
--[[
Backface culling; enabled by default for most nodes.
]]
---@field backface_culling boolean?
--[[
See `core.TileDef.align_style`.
]]
---@field align_style core.TileDef.align_style?
--[[
Used to make the texture span several (exactly `scale`) nodes, instead of
just one, in each direction. Works for world-aligned textures only. As the
effect is applied on a per-mapblock basis, `16` should be equally divisible by
`scale` or you may get wrong results.
]]
---@field scale int?

-- ------------------------------ TileDef.color ----------------------------- --

--[[
Tile with a color: `{name="image.png", color=ColorSpec}`. The texture's color
is multiplied with this color.
]]
---@class core.TileDef.color : _.TileDef.__base
--[[
The tile's color overrides the owning node's color in all cases.
]]
---@field color core.ColorSpec

-- --------------------------------- TileDef -------------------------------- --

--[[
Tile definition: a texture name, or a table (with animation, rendering
options or color).
]]
---@alias core.TileDef
--- | core.Texture
--- | core.TileDef.animation
--- | core.TileDef.regular
--- | core.TileDef.color