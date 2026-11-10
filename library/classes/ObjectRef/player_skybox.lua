---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------- PlayerSkyParameters.regular.color ------------------- --

--[[
Sky colors for the `"regular"` sky type, accepted by `PlayerRef:set_sky`.
All fields are optional (alpha is ignored). Also accepts the table returned by
`PlayerRef:get_sky_color`.
]]
---@alias core.PlayerSkyParameters.regular.color.set
--- | core.PlayerSkyParameters.regular.color.get
--- | _.PlayerSkyParameters.regular.color.set

---@class _.PlayerSkyParameters.regular.color.set
--[[
ColorSpec for the top half of the sky during the day. Default `#61b5f5`.
]]
---@field day_sky core.ColorSpec?
--[[
ColorSpec for the bottom half of the sky during the day. Default `#90d3f6`.
]]
---@field day_horizon core.ColorSpec?
--[[
ColorSpec for the top half of the sky during dawn/sunset.
The resulting sky color will be a darkened version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
Default `#b4bafa`.
]]
---@field dawn_sky core.ColorSpec?
--[[
ColorSpec for the bottom half of the sky during dawn/sunset.
The resulting sky color will be a darkened version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
Default `#bac1f0`.
]]
---@field dawn_horizon core.ColorSpec?
--[[
ColorSpec for the top half of the sky during the night.
The resulting sky color will be a dark version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
Default `#006bff`.
]]
---@field night_sky core.ColorSpec?
--[[
ColorSpec for the bottom half of the sky during the night.
The resulting sky color will be a dark version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
Default `#4090ff`.
]]
---@field night_horizon core.ColorSpec?
--[[
ColorSpec for when you are either indoors or underground. Default `#646464`.
]]
---@field indoors core.ColorSpec?
--[[
ColorSpec that changes the fog tinting for the sun at sunrise and sunset. Default `#f47d1d`.
]]
---@field fog_sun_tint core.ColorSpec?
--[[
ColorSpec that changes the fog tinting for the moon at sunrise and sunset. Default `#7f99cc`.
]]
---@field fog_moon_tint core.ColorSpec?
--[[
Which mode the directional fog abides by: `"custom"` uses `fog_sun_tint` and
`fog_moon_tint`, while `"default"` uses the classic Luanti sun and moon
tinting (tonemaps are used).
Default `default`.
]]
---@field fog_tint_type "custom"|"default"?

--[[
Current sky colors for the `"regular"` sky type, as returned by
`PlayerRef:get_sky_color`.
]]
---@class core.PlayerSkyParameters.regular.color.get
--[[
ColorSpec for the top half of the sky during the day.
]]
---@field day_sky core.ColorSpec
--[[
ColorSpec for the bottom half of the sky during the day.
]]
---@field day_horizon core.ColorSpec
--[[
ColorSpec for the top half of the sky during dawn/sunset.
The resulting sky color will be a darkened version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
]]
---@field dawn_sky core.ColorSpec
--[[
ColorSpec for the bottom half of the sky during dawn/sunset.
The resulting sky color will be a darkened version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
]]
---@field dawn_horizon core.ColorSpec
--[[
ColorSpec for the top half of the sky during the night.
The resulting sky color will be a dark version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
]]
---@field night_sky core.ColorSpec
--[[
ColorSpec for the bottom half of the sky during the night.
The resulting sky color will be a dark version of the ColorSpec.
Warning: the darkening of the ColorSpec is subject to change.
]]
---@field night_horizon core.ColorSpec
--[[
ColorSpec for when you are either indoors or underground.
]]
---@field indoors core.ColorSpec
--[[
ColorSpec that changes the fog tinting for the sun at sunrise and sunset.
]]
---@field fog_sun_tint core.ColorSpec
--[[
ColorSpec that changes the fog tinting for the moon at sunrise and sunset.
]]
---@field fog_moon_tint core.ColorSpec
--[[
Which mode the directional fog abides by: `"custom"` uses `fog_sun_tint` and
`fog_moon_tint`, while `"default"` uses the classic Luanti sun and moon
tinting (tonemaps are used).
]]
---@field fog_tint_type "custom"|"default"


-- ------------------------- PlayerSkyParameters.fog ------------------------ --

--[[
Fog parameters accepted by `PlayerRef:set_sky`. All fields are optional.
Also accepts the table returned by `PlayerRef:get_sky`.
]]
---@alias core.PlayerSkyParameters.fog.set
--- | core.PlayerSkyParameters.fog.get
--- | _.PlayerSkyParameters.fog.set

---@class _.PlayerSkyParameters.fog.set
--[[
Upper bound for the client's viewing_range. Any value >= 0 sets the desired
upper bound, disables range_all and prevents disabling fog (F3 key by
default). Any value < 0 resets the behavior to being client-controlled. Default `-1`.
]]
---@field fog_distance int?
--[[
Overrides the client's fog_start: the fraction of the visible distance at
which fog starts to be rendered. Any value in [0.0, 0.99] sets fog_start as a
fraction of the viewing_range. Any value < 0 resets the behavior to being
client-controlled. Default `-1`.
]]
---@field fog_start number?
--[[
Overrides the color of the fog. Unlike `base_color` this applies regardless
of the skybox type.
Default `"#00000000"`, which means no override.
]]
---@field fog_color core.ColorSpec?

--[[
Current fog parameters, as returned by `PlayerRef:get_sky`.
]]
---@class core.PlayerSkyParameters.fog.get
--[[
Upper bound for the client's viewing_range. Any value >= 0 sets the desired
upper bound, disables range_all and prevents disabling fog (F3 key by
default). Any value < 0 resets the behavior to being client-controlled.
]]
---@field fog_distance int
--[[
Overrides the client's fog_start: the fraction of the visible distance at
which fog starts to be rendered. Any value in [0.0, 0.99] sets fog_start as a
fraction of the viewing_range. Any value < 0 resets the behavior to being
client-controlled.
]]
---@field fog_start number
--[[
Overrides the color of the fog. Unlike `base_color` this applies regardless
of the skybox type.
]]
---@field fog_color core.ColorSpec



-- ----------------------- PlayerSkyParameters.__base ----------------------- --

--[[
Fields shared by all sky types, accepted by `PlayerRef:set_sky`.
All fields are optional.
]]
---@class _.PlayerSkyParameters.__base.set
--[[
ColorSpec whose meaning depends on `type`. Default `#ffffff`.
]]
---@field base_color core.ColorSpec?
--[[
Rotation angle of the sun/moon orbit in degrees, valid range [-60.0, 60.0].
By default the orbit is controlled by a client-side setting and this field is
not set. After a value is assigned, it can only be changed to another float
value.
Default: not set.
]]
---@field body_orbit_tilt number?
--[[
Up to six textures in the following order: Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
The top and bottom textures are oriented in-line with the east (X+) face (the
top edge of the bottom texture and the bottom edge of the top texture touch the
east face). Some top and bottom textures expect to be aligned with the north
face and need to be rotated by -90 and 90 degrees, respectively, to fit the
eastward orientation.
]]
---@field textures {}?
--[[
Whether clouds appear. Default `true`.
]]
---@field clouds boolean?
--[[
Whether to dim skybox brightness if the sky is assumed not to be visible
(e.g. in caves), based on a hardcoded and sometimes buggy heuristic.
Requires a Luanti 5.16.0+ client and server. Default `true`.
]]
---@field auto_dim_skybox boolean?
--[[
Fog parameters.
]]
---@field fog core.PlayerSkyParameters.fog.set?

--[[
Fields shared by all sky types, as returned by `PlayerRef:get_sky`.
]]
---@class _.PlayerSkyParameters.__base.get
--[[
ColorSpec whose meaning depends on `type`.
]]
---@field base_color core.ColorSpec
--[[
Rotation angle of the sun/moon orbit in degrees, valid range [-60.0, 60.0].
By default the orbit is controlled by a client-side setting and this field is
not set. After a value is assigned, it can only be changed to another float
value.
]]
---@field body_orbit_tilt number
--[[
Up to six textures in the following order: Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
The top and bottom textures are oriented in-line with the east (X+) face (the
top edge of the bottom texture and the bottom edge of the top texture touch the
east face). Some top and bottom textures expect to be aligned with the north
face and need to be rotated by -90 and 90 degrees, respectively, to fit the
eastward orientation.
]]
---@field textures {}
--[[
Whether clouds appear.
]]
---@field clouds boolean
--[[
Whether to dim skybox brightness if the sky is assumed not to be visible
(e.g. in caves), based on a hardcoded and sometimes buggy heuristic.
Requires a Luanti 5.16.0+ client and server.
]]
---@field auto_dim_skybox boolean
--[[
Fog parameters.
]]
---@field fog core.PlayerSkyParameters.fog.get

-- ----------------------- PlayerSkyParameters.regular ---------------------- --

--[[
Parameters for the `"regular"` sky type: the default sky with day/dawn/night
colors, sun, moon and stars. Uses 0 textures; `base_color` is ignored.
]]
---@alias core.PlayerSkyParameters.regular.set
--- | core.PlayerSkyParameters.regular.get
--- | _.PlayerSkyParameters.regular.set

---@class _.PlayerSkyParameters.regular.set : _.PlayerSkyParameters.__base.set
--[[
Sky type. `"regular"` uses 0 textures and ignores `base_color`.
Default `"regular"`.
]]
---@field type "regular"?
--[[
Sky colors, used in `"regular"` type only (alpha is ignored).
]]
---@field sky_color core.PlayerSkyParameters.regular.color.set?

--[[
Current parameters of a `"regular"` sky.
]]
---@class core.PlayerSkyParameters.regular.get : _.PlayerSkyParameters.__base.get
--[[
Sky type; `"regular"` uses 0 textures and ignores `base_color`.
]]
---@field type "regular"
--[[
Sky colors, used in `"regular"` type only (alpha is ignored).
]]
---@field sky_color core.PlayerSkyParameters.regular.color.get

-- ----------------------- PlayerSkyParameters.skybox ----------------------- --

--[[
Exactly six skybox textures, in the order Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
]]
---@class core.PlayerSkyParameters.skybox.textures.strict
--[[
Y+ (top) texture.
]]
---@field [1] core.Texture
--[[
Y- (bottom) texture.
]]
---@field [2] core.Texture
--[[
X+ (east) texture.
]]
---@field [3] core.Texture
--[[
X- (west) texture.
]]
---@field [4] core.Texture
--[[
Z- (south) texture.
]]
---@field [5] core.Texture
--[[
Z+ (north) texture.
]]
---@field [6] core.Texture

--[[
Skybox textures: up to six, in the order Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
]]
---@alias core.PlayerSkyParameters.skybox.textures
--- | core.PlayerSkyParameters.skybox.textures.strict
--- | core.Texture[]

--[[
Parameters for the `"skybox"` sky type: custom skybox using 6 textures,
`base_color` is used as fog.
]]
---@alias core.PlayerSkyParameters.skybox.set
--- | core.PlayerSkyParameters.skybox.get
--- | _.PlayerSkyParameters.skybox.set

---@class _.PlayerSkyParameters.skybox.set : _.PlayerSkyParameters.__base.set
--[[
Sky type. `"skybox"` uses 6 textures and `base_color` is used as fog.
]]
---@field type "skybox"
--[[
Up to six textures in the following order: Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
The top and bottom textures are oriented in-line with the east (X+) face (the
top edge of the bottom texture and the bottom edge of the top texture touch the
east face). Some top and bottom textures expect to be aligned with the north
face and need to be rotated by -90 and 90 degrees, respectively, to fit the
eastward orientation.
]]
---@field textures core.PlayerSkyParameters.skybox.textures?

--[[
Current parameters of a `"skybox"` sky.
]]
---@class core.PlayerSkyParameters.skybox.get : _.PlayerSkyParameters.__base.get
--[[
Sky type. `"skybox"` uses 6 textures and `base_color` is used as fog.
]]
---@field type "skybox"
--[[
Up to six textures in the following order: Y+ (top), Y- (bottom), X+ (east),
X- (west), Z- (south), Z+ (north).
The top and bottom textures are oriented in-line with the east (X+) face (the
top edge of the bottom texture and the bottom edge of the top texture touch the
east face). Some top and bottom textures expect to be aligned with the north
face and need to be rotated by -90 and 90 degrees, respectively, to fit the
eastward orientation.
]]
---@field textures core.PlayerSkyParameters.skybox.textures

-- ------------------------ PlayerSkyParameters.plain ----------------------- --

--[[
Parameters for the `"plain"` sky type: uses 0 textures, `base_color` is used
as both fog and sky.
]]
---@alias core.PlayerSkyParameters.plain.set
--- | core.PlayerSkyParameters.plain.get
--- | _.PlayerSkyParameters.plain.set

---@class _.PlayerSkyParameters.plain.set : _.PlayerSkyParameters.__base.set
--[[
Sky type. `"plain"` uses 0 textures and `base_color` is used as both fog
and sky.
]]
---@field type "plain"

--[[
Current parameters of a `"plain"` sky.
]]
---@class core.PlayerSkyParameters.plain.get : _.PlayerSkyParameters.__base.get
--[[
Sky type. `"plain"` uses 0 textures and `base_color` is used as both fog
and sky.
]]
---@field type "plain"


-- --------------------------- PlayerSkyParameters -------------------------- --

---@alias core.PlayerSkyParameters.set
--- | core.PlayerSkyParameters.regular.set
--- | core.PlayerSkyParameters.skybox.set
--- | core.PlayerSkyParameters.plain.set

---@alias core.PlayerSkyParameters.get
--- | core.PlayerSkyParameters.regular.get
--- | core.PlayerSkyParameters.skybox.get
--- | core.PlayerSkyParameters.plain.get

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `set_sky(sky_parameters)`
    * The presence of the function `set_sun`, `set_moon` or `set_stars` indicates
      whether `set_sky` accepts this format. Check the legacy format otherwise.
    * Passing no arguments resets the sky to its default values.
    * `sky_parameters` is a table with the following optional fields:
      see `core.PlayerSkyParameters.set`.
]]
---@param sky_parameters core.PlayerSkyParameters.set?
function PlayerRef:set_sky(sky_parameters) end

--[[
* `get_sky(as_table)`:
    * `as_table`: boolean that determines whether the deprecated version of this
    function is being used.
        * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
        * Deprecated: `false` or `nil` returns base_color, type, table of textures,
        clouds.
]]
---@nodiscard
---@param as_table true
---@return core.PlayerSkyParameters.get sky_parameters
function PlayerRef:get_sky(as_table) end

--[[
* `set_sky(base_color, type, {texture names}, clouds)`
    * Deprecated. Use `set_sky(sky_parameters)`
    * `base_color`: ColorSpec, defaults to white
    * `type`: Available types:
        * `"regular"`: Uses 0 textures, `bgcolor` ignored
        * `"skybox"`: Uses 6 textures, `bgcolor` used
        * `"plain"`: Uses 0 textures, `bgcolor` used
    * `clouds`: Boolean for whether clouds appear in front of `"skybox"` or
      `"plain"` custom skyboxes (default: `true`)
]]
---@deprecated
---@param base_color core.ColorSpec
---@param type "regular"|"skybox"|"plain"
---@param textures core.Texture[]
---@param clouds boolean?
function PlayerRef:set_sky(base_color, type, textures, clouds) end

--[[
* `get_sky(as_table)`:
    * `as_table`: boolean that determines whether the deprecated version of this
    function is being used.
        * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
        * Deprecated: `false` or `nil` returns base_color, type, table of textures,
        clouds.
]]
---@deprecated
---@nodiscard
---@return core.ColorSpec base_color
---@return "regular"|"skybox"|"plain" type
---@return core.Texture[] textures
---@return boolean? clouds
function PlayerRef:get_sky(as_table) end

--[[
* `get_sky_color()`:
    * Deprecated: Use `get_sky(as_table)` instead.
    * returns a table with the `sky_color` parameters as in `set_sky`.
]]
---@deprecated
---@nodiscard
---@return core.PlayerSkyParameters.regular.color.get sky_color
function PlayerRef:get_sky_color() end