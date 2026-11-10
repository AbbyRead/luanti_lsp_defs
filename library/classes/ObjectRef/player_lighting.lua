---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------------- PlayerLightDef.shadow ------------------------- --

--[[
Ambient shadow parameters accepted by `PlayerRef:set_lighting`.
Controls ambient shadows. No effect on clients who have the "Dynamic Shadows"
effect disabled.
]]
---@alias core.PlayerLightDef.shadow.set
--- | core.PlayerLightDef.shadow.get
--- | _.PlayerLightDef.shadow.set

---@class _.PlayerLightDef.shadow.set
--[[
Intensity of the shadows from 0 (no shadows, default) to 1 (blackness).
]]
---@field intensity number?
--[[
Tints the shadows with the provided color, with integer color values in
range [0, 255]. Default `{r=0, g=0, b=0}`.
]]
---@field tint core.ColorSpec?
--[[
Direction vector that can override the direction of the light, disregarding
the sun/moon position. Useful for custom skyboxes. The default is a zero
vector and disables the override.
Note: the vector points "outwards" so that `(0, 1, 0)` is equivalent to the
sun at midday shining straight down.
]]
---@field direction vector?

--[[
Current ambient shadow parameters, as returned by `PlayerRef:get_lighting`.
]]
---@class core.PlayerLightDef.shadow.get
--[[
Intensity of the shadows from 0 (no shadows, default) to 1 (blackness).
]]
---@field intensity number
--[[
Tints the shadows with the provided color, with integer color values in
range [0, 255]. Default `{r=0, g=0, b=0}`.
]]
---@field tint core.ColorSpec
--[[
Direction vector that can override the direction of the light, disregarding
the sun/moon position. Useful for custom skyboxes. The default is a zero
vector and disables the override.
Note: the vector points "outwards" so that `(0, 1, 0)` is equivalent to the
sun at midday shining straight down.
]]
---@field direction vector

-- ------------------------- PlayerLightDef.exposure ------------------------ --

--[[
Automatic exposure parameters accepted by `PlayerRef:set_lighting`.
Controls automatic exposure. The basic exposure factor equation is
`e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`.
No effect on clients who have the "Automatic Exposure" effect disabled.
]]
---@alias core.PlayerLightDef.exposure.set
--- | core.PlayerLightDef.exposure.get
--- | _.PlayerLightDef.exposure.set

---@class _.PlayerLightDef.exposure.set
--[[
Lower luminance boundary used in the exposure calculation. Default `-3.0`.
]]
---@field luminance_min number?
--[[
Upper luminance boundary used in the exposure calculation. Default `-3.0`.
]]
---@field luminance_max number?
--[[
Corrects observed exposure by the given EV value. Default `0.0`.
]]
---@field exposure_correction number?
--[[
Speed of adapting to bright light. Default `1000.0`.
]]
---@field speed_dark_bright number?
--[[
Speed of adapting to a dark scene. Default `1000.0`.
]]
---@field speed_bright_dark number?
--[[
Power factor for center-weighted luminance measurement. Default `1.0`.
]]
---@field center_weight_power number?

--[[
Current automatic exposure parameters, as returned by `PlayerRef:get_lighting`.
]]
---@class core.PlayerLightDef.exposure.get
--[[
Lower luminance boundary used in the exposure calculation. Default `-3.0`.
]]
---@field luminance_min number
--[[
Upper luminance boundary used in the exposure calculation. Default `-3.0`.
]]
---@field luminance_max number
--[[
Corrects observed exposure by the given EV value. Default `0.0`.
]]
---@field exposure_correction number
--[[
Speed of adapting to bright light. Default `1000.0`.
]]
---@field speed_dark_bright number
--[[
Speed of adapting to a dark scene. Default `1000.0`.
]]
---@field speed_bright_dark number
--[[
Power factor for center-weighted luminance measurement. Default `1.0`.
]]
---@field center_weight_power number

-- -------------------------- PlayerLightDef.bloom -------------------------- --

--[[
Bloom parameters accepted by `PlayerRef:set_lighting`.
Controls bloom. No effect on clients with protocol version < 46 or clients
who have the "Bloom" effect disabled.
]]
---@alias core.PlayerLightDef.bloom.set
--- | core.PlayerLightDef.bloom.get
--- | _.PlayerLightDef.bloom.set

---@class _.PlayerLightDef.bloom.set
--[[
How much bloom is applied to the rendered image. Recommended range 0.0 to
1.0, default `0.05` (to be changed to `0` in the future; set it explicitly to
keep the current default). If set to 0, bloom is disabled.
]]
---@field intensity number?
--[[
Magnitude of bloom overexposure. Recommended range 0.1 to 10.0, default `1.0`.
]]
---@field strength_factor number?
--[[
How far the bloom effect spreads from the bright objects. Recommended range
0.1 to 8.0, default `1.0`. Behavior outside the recommended range is
unspecified.
]]
---@field radius number?

--[[
Current bloom parameters, as returned by `PlayerRef:get_lighting`.
]]
---@class core.PlayerLightDef.bloom.get
--[[
How much bloom is applied to the rendered image. Recommended range 0.0 to
1.0, default `0.05` (to be changed to `0` in the future; set it explicitly to
keep the current default). If set to 0, bloom is disabled.
]]
---@field intensity number
--[[
Magnitude of bloom overexposure. Recommended range 0.1 to 10.0, default `1.0`.
]]
---@field strength_factor number
--[[
How far the bloom effect spreads from the bright objects. Recommended range
0.1 to 8.0, default `1.0`. Behavior outside the recommended range is
unspecified.
]]
---@field radius number

-- --------------------- PlayerLightDef.volumetric_light -------------------- --

--[[
Volumetric light parameters accepted by `PlayerRef:set_lighting`.
Controls volumetric light (a.k.a. "godrays"). No effect on clients who have the
"Volumetric Lighting" or "Bloom" effects disabled.
]]
---@alias core.PlayerLightDef.volumetric_light.set
--- | core.PlayerLightDef.volumetric_light.get
--- | _.PlayerLightDef.volumetric_light.set

---@class _.PlayerLightDef.volumetric_light.set
--[[
Strength of the volumetric light effect from 0 (off, default) to 1 (strongest).
`0.2` is a reasonable standard value. Currently bloom `intensity` and
`strength_factor` affect it and vice versa; do not rely on this.
]]
---@field strength number?

--[[
Current volumetric light parameters, as returned by `PlayerRef:get_lighting`.
]]
---@class core.PlayerLightDef.volumetric_light.get
--[[
Strength of the volumetric light effect from 0 (off, default) to 1 (strongest).
`0.2` is a reasonable standard value. Currently bloom `intensity` and
`strength_factor` affect it and vice versa; do not rely on this.
]]
---@field strength number


-- ----------------------------- PlayerLightDef ----------------------------- --

--[[
Lighting parameters accepted by `PlayerRef:set_lighting`. All fields are
optional. Also accepts the table returned by `PlayerRef:get_lighting`.
]]
---@alias core.PlayerLightDef.set
--- | core.PlayerLightDef.get
--- | _.PlayerLightDef.set

---@class _.PlayerLightDef.set
--[[
Saturation (vividness). Default `1.0`. Applied as `result = b*(1-s) + c*s`
with `c` the original color, `b` its greyscale version with the same luma and
`s` this value; luma is always preserved.
Values > 1 oversaturate, < 1 down to 0 desaturate (0 is entirely greyscale),
and < 0 cause an inversion-like effect that keeps luma.
No effect on clients with shaders or post-processing disabled.
]]
---@field saturation number?
--[[
Controls ambient shadows. No effect on clients who have the "Dynamic Shadows"
effect disabled.
]]
---@field shadows core.PlayerLightDef.shadow.set?
--[[
Controls automatic exposure. The basic exposure factor equation is
`e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`.
No effect on clients who have the "Automatic Exposure" effect disabled.
]]
---@field exposure core.PlayerLightDef.exposure.set?
--[[
Controls bloom. No effect on clients with protocol version < 46 or clients
who have the "Bloom" effect disabled.
]]
---@field bloom core.PlayerLightDef.bloom.set?
--[[
Controls volumetric light (a.k.a. "godrays"). No effect on clients who have the
"Volumetric Lighting" or "Bloom" effects disabled.
]]
---@field volumetric_light core.PlayerLightDef.volumetric_light.set?

--[[
Current lighting parameters, as returned by `PlayerRef:get_lighting`.
Same fields as the table accepted by `set_lighting`.
]]
---@class core.PlayerLightDef.get
--[[
Saturation (vividness). Default `1.0`. Applied as `result = b*(1-s) + c*s`
with `c` the original color, `b` its greyscale version with the same luma and
`s` this value; luma is always preserved.
Values > 1 oversaturate, < 1 down to 0 desaturate (0 is entirely greyscale),
and < 0 cause an inversion-like effect that keeps luma.
No effect on clients with shaders or post-processing disabled.
]]
---@field saturation number
--[[
Controls ambient shadows. No effect on clients who have the "Dynamic Shadows"
effect disabled.
]]
---@field shadows core.PlayerLightDef.shadow.get
--[[
Controls automatic exposure. The basic exposure factor equation is
`e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`.
No effect on clients who have the "Automatic Exposure" effect disabled.
]]
---@field exposure core.PlayerLightDef.exposure.get
--[[
Controls bloom. No effect on clients with protocol version < 46 or clients
who have the "Bloom" effect disabled.
]]
---@field bloom core.PlayerLightDef.bloom.get
--[[
Controls volumetric light (a.k.a. "godrays"). No effect on clients who have the
"Volumetric Lighting" or "Bloom" effects disabled.
]]
---@field volumetric_light core.PlayerLightDef.volumetric_light.get

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `set_lighting(light_def)`: Sets lighting for the player
    * `light_def` must be a table to update the parameters or `nil` to reset all
      light parameters to defaults.
    * See `core.PlayerLightDef.set` for the table fields.
]]
---@param light_definition core.PlayerLightDef.set?
function PlayerRef:set_lighting(light_definition) end

--[[
* `get_lighting()`: returns the current state of lighting for the player.
    * Result is a table with the same fields as `light_definition` in `set_lighting`.
]]
---@nodiscard
---@return core.PlayerLightDef.get light_definition
function PlayerRef:get_lighting() end