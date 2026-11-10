---@meta _

-- luanti/doc/lua_api.md: Nodes > Node paramtypes
-- luanti/doc/lua_api.md: Definition tables > Node definition

-- --------------------------- NodeDef.paramtype2 --------------------------- --

--[[
Function of `param1`.
* `"light"`: `param1` stores light. Required by a light source node to enable
  spreading its light, and by drawtypes that determine their brightness from
  the internal light value.
* `"none"`: `param1` is not used by the engine and can store an arbitrary
  value.
]]
---@alias core.NodeDef.paramtype
--- | "light"
--- | "none"

--[[
`paramtype2` values for which `param2` also selects a palette color.
]]
---@alias core.NodeDef.paramtype2.color
--- | "color"
--- | "colorfacedir"
--- | "color4dir"
--- | "colorwallmounted"
--- | "colordegrotate"

--[[
Function of `param2`. See "Node paramtypes" for the exact bit layout of each
value:
* `"flowingliquid"`: liquid level (bits 0-2) and downward flag (bit 3)
* `"wallmounted"`: direction the node is mounted to, [0, 7]
* `"facedir"`: 24 rotations, [0, 23]
* `"4dir"`: 4 horizontal rotations, [0, 3]
* `"leveled"`: height of a leveled nodebox or rooted plantlike
* `"degrotate"`: rotation in 1.5 degree steps, [0, 239]
* `"meshoptions"`: plantlike shape and modifiers (bitfield)
* `"color"`: palette index (256 pixel palette)
* `"colorfacedir"`, `"color4dir"`, `"colorwallmounted"`,
  `"colordegrotate"`: rotation combined with a palette color
* `"glasslikeliquidlevel"`: internal liquid level of framed glass
* `"none"`: not used by the engine
]]
---@alias core.NodeDef.paramtype2
--- | "flowingliquid"
--- | "wallmounted"
--- | "facedir"
--- | "4dir"
--- | "leveled"
--- | "degrotate"
--- | "meshoptions"
--- | "color"
--- | "colorfacedir"
--- | "color4dir"
--- | "colorwallmounted"
--- | "glasslikeliquidlevel"
--- | "colordegrotate"
--- | "none"

-- ----------------------------- NodeDef fields ----------------------------- --

---@class core.NodeDef
--[[
paramtype = "none",  -- See "Nodes"
* `paramtype = "light"`
    * The value stores light with and without sun in its lower and upper 4 bits
      respectively.
    * Required by a light source node to enable spreading its light.
    * Required by the following drawtypes as they determine their visual
      brightness from their internal light value:
        * torchlike
        * signlike
        * firelike
        * fencelike
        * raillike
        * nodebox
        * mesh
        * plantlike
        * plantlike_rooted
* `paramtype = "none"`
    * `param1` will not be used by the engine and can be used to store
      an arbitrary value
]]
---@field  paramtype core.NodeDef.paramtype?
--[[
Function of `param2`, see `core.NodeDef.paramtype2`.
`param2` is reserved for the engine when `paramtype2 ~= "none"`.
Palette variants require `palette` to be set.
]]
---@field paramtype2 core.NodeDef.paramtype2?