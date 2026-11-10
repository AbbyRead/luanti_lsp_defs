---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------------- PlayerMoonParameters -------------------------- --

--[[
Moon parameters accepted by `PlayerRef:set_moon`. All fields are optional.
Also accepts the table returned by `PlayerRef:get_moon`.
Note: for legacy reasons, the sun is bigger than the moon by a factor of about
`1.57` for equal `scale` values.
]]
---@alias core.PlayerMoonParameters.set
--- | core.PlayerMoonParameters.get
--- | _.PlayerMoonParameters.set

---@class _.PlayerMoonParameters.set
--[[
Whether the moon is visible. Default `true`.
]]
---@field visible boolean?
--[[
A regular texture for the moon. Setting to `""` re-enables the mesh moon.
Default `"moon.png"`, if it exists.
The texture appears non-rotated at sunrise / moonset and rotated 180 degrees
(upside down) at sunset / moonrise. Relative to the sun, the moon texture is
hence rotated by 180 degrees; use the `^[transformR180` texture modifier to
achieve the same orientation.
]]
---@field texture core.Texture?
--[[
A 512x1 texture containing the tonemap for the moon.
Default `"moon_tonemap.png"`.
]]
---@field tonemap core.Texture?
--[[
Overall size of the moon. Default `1`.
]]
---@field scale number?

--[[
Current moon parameters, as returned by `PlayerRef:get_moon`.
Same fields as the table accepted by `set_moon`.
]]
---@class core.PlayerMoonParameters.get
--[[
Whether the moon is visible.
]]
---@field visible boolean
--[[
Moon texture. `""` means the mesh moon is used.
]]
---@field texture core.Texture
--[[
A 512x1 texture containing the tonemap for the moon.
]]
---@field tonemap core.Texture
--[[
Overall size of the moon.
]]
---@field scale number

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `set_moon(moon_parameters)`:
    * Passing no arguments resets the moon to its default values.
    * `moon_parameters` is a table with the following optional fields:
      see `core.PlayerMoonParameters.set`.
]]
---@param moon_parameters core.PlayerMoonParameters.set?
function PlayerRef:set_moon(moon_parameters) end

--[[
* `get_moon()`: returns a table with the current moon parameters as in
    `set_moon`.
]]
---@nodiscard
---@return core.PlayerMoonParameters.get moon_parameters
function PlayerRef:get_moon() end