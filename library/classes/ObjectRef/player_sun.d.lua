---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- --------------------------- PlayerSunParameters -------------------------- --

--[[
Sun parameters accepted by `PlayerRef:set_sun`. All fields are optional.
Also accepts the table returned by `PlayerRef:get_sun`.
Note: for legacy reasons, the sun is bigger than the moon by a factor of about
`1.57` for equal `scale` values.
]]
---@alias core.PlayerSunParameters.set
--- | core.PlayerSunParameters.get
--- | _.PlayerSunParameters.set

---@class _.PlayerSunParameters.set
--[[
Whether the sun is visible. Default `true`.
]]
---@field visible boolean?
--[[
A regular texture for the sun. Setting to `""` re-enables the mesh sun.
Default `"sun.png"`, if it exists.
The texture appears non-rotated at sunrise and rotated 180 degrees (upside
down) at sunset.
]]
---@field texture core.Texture?
--[[
A 512x1 texture containing the tonemap for the sun.
Default `"sun_tonemap.png"`.
]]
---@field tonemap core.Texture?
--[[
A regular texture for the sunrise texture. Default `"sunrisebg.png"`.
]]
---@field sunrise core.Texture?
--[[
Whether the sunrise texture is visible. Default `true`.
]]
---@field sunrise_visible boolean?
--[[
Overall size of the sun. Default `1`.
]]
---@field scale number?

--[[
Current sun parameters, as returned by `PlayerRef:get_sun`.
Same fields as the table accepted by `set_sun`.
]]
---@class core.PlayerSunParameters.get
--[[
Whether the sun is visible.
]]
---@field visible boolean
--[[
Sun texture. `""` means the mesh sun is used.
]]
---@field texture core.Texture
--[[
A 512x1 texture containing the tonemap for the sun.
]]
---@field tonemap core.Texture
--[[
Sunrise texture.
]]
---@field sunrise core.Texture
--[[
Whether the sunrise texture is visible.
]]
---@field sunrise_visible boolean
--[[
Overall size of the sun.
]]
---@field scale number

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `set_sun(sun_parameters)`:
    * Passing no arguments resets the sun to its default values.
    * `sun_parameters` is a table with the following optional fields:
      see `core.PlayerSunParameters.set`.
]]
---@param sun_parameters core.PlayerSunParameters.set?
function PlayerRef:set_sun(sun_parameters) end

--[[
* `get_sun()`: returns a table with the current sun parameters as in
    `set_sun`.
]]
---@nodiscard
---@return core.PlayerSunParameters.get sun_parameters
function PlayerRef:get_sun() end