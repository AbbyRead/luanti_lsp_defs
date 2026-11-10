---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------------- PlayerStarParameters -------------------------- --

--[[
Star parameters accepted by `PlayerRef:set_stars`. All fields are optional.
Also accepts the table returned by `PlayerRef:get_stars`.
]]
---@alias core.PlayerStarParameters.set
--- | core.PlayerStarParameters.get
--- | _.PlayerStarParameters.set

---@class _.PlayerStarParameters.set
--[[
Whether the stars are visible. Default `true`.
]]
---@field visible boolean?
--[[
Maximum opacity of stars at day, from 0.0 to 1.0. No effect if `visible` is
false. Default `0.0`.
]]
---@field day_opacity number?
--[[
Number of stars in the skybox, in the range [0, 16384]. Only applies to
`"skybox"` and `"regular"` sky types. Default `1000`.
]]
---@field count int?
--[[
Color of the stars; the alpha channel sets the overall star brightness. Default `#ebebff69`.
]]
---@field star_color core.ColorSpec?
--[[
Overall size of the stars. Default `1`.
]]
---@field scale number?
--[[
Decides how to generate the sky stars (u32). If set to zero, the client picks
a random integer. Default `0`.
]]
---@field star_seed int?

--[[
Current star parameters, as returned by `PlayerRef:get_stars`.
Same fields as the table accepted by `set_stars`.
]]
---@class core.PlayerStarParameters.get
--[[
Whether the stars are visible.
]]
---@field visible boolean
--[[
Maximum opacity of stars at day, from 0.0 to 1.0. No effect if `visible` is
false.
]]
---@field day_opacity number
--[[
Number of stars in the skybox, in the range [0, 16384]. Only applies to
`"skybox"` and `"regular"` sky types.
]]
---@field count int
--[[
Color of the stars; the alpha channel sets the overall star brightness.
]]
---@field star_color core.ColorSpec
--[[
Overall size of the stars.
]]
---@field scale number
--[[
Decides how to generate the sky stars (u32). If set to zero, the client picks
a random integer.
]]
---@field star_seed int

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef


--[[
* `set_stars(star_parameters)`:
    * Passing no arguments resets stars to their default values.
    * `star_parameters` is a table with the following optional fields:
        * `visible`: Boolean for whether the stars are visible.
            (default: `true`)
        * `day_opacity`: Float for maximum opacity of stars at day.
            No effect if `visible` is false.
            (default: 0.0; maximum: 1.0; minimum: 0.0)
        * `count`: Amount of stars in the skybox. Only applies
            to `"skybox"` and `"regular"` sky types.
            (range: [0, 16384]) (default: `1000`)
        * `star_color`: ColorSpec, sets the colors of the stars,
            alpha channel is used to set overall star brightness.
            (default: `#ebebff69`)
        * `scale`: Float controlling the overall size of the stars (default: `1`)
        * `star_seed`: Integer [u32] which decides how to generate the sky stars.
           If set to zero, the client picks a random integer. (default: `0`)
]]
---@param star_parameters core.PlayerStarParameters.set?
function PlayerRef:set_stars(star_parameters) end

--[[
* `get_stars()`: returns a table with the current stars parameters as in
    `set_stars`.
]]
---@nodiscard
---@return core.PlayerStarParameters.get star_parameters
function PlayerRef:get_stars() end