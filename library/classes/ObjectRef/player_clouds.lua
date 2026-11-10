---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------------- PlayerCloudParameters ------------------------- --

--[[
Cloud parameters accepted by `PlayerRef:set_clouds`. All fields are optional;
omitted fields are left unchanged. Also accepts the table returned by
`PlayerRef:get_clouds`.
]]
---@alias core.PlayerCloudParameters.set
--- | core.PlayerCloudParameters.get
--- | _.PlayerCloudParameters.set

---@class _.PlayerCloudParameters.set
--[[
Cloud density, from `0` (no clouds) to `1` (full clouds). Default `0.4`.
]]
---@field density number?
--[[
Basic cloud color with alpha channel. Default `#fff0f0e5`.
]]
---@field color core.ColorSpec?
--[[
Cloud color lower bound, use for a "glow at night" effect.
Alpha is ignored. Default `#000000`.
]]
---@field ambient core.ColorSpec?
--[[
Cloud height, i.e. y of cloud base. Default per conf, usually `120`.
]]
---@field height int?
--[[
Cloud thickness in nodes. Default `16`.
If set to zero the clouds are rendered flat.
]]
---@field thickness int?
--[[
2D cloud speed + direction in nodes per second. Default `{x=0, z=-2}`.
]]
---@field speed {x:number, z:number}?
--[[
Shadow color, applied to the base of the cloud. Default `#cccccc`.
]]
---@field shadow core.ColorSpec?

--[[
Current cloud parameters, as returned by `PlayerRef:get_clouds`.
Same fields as the table accepted by `set_clouds`.
]]
---@class core.PlayerCloudParameters.get
--[[
Cloud density, from `0` (no clouds) to `1` (full clouds).
]]
---@field density number
--[[
Basic cloud color with alpha channel.
]]
---@field color core.ColorSpec
--[[
Cloud color lower bound ("glow at night" effect). Alpha is ignored.
]]
---@field ambient core.ColorSpec
--[[
Cloud height, i.e. y of cloud base.
]]
---@field height int
--[[
Cloud thickness in nodes. Zero means the clouds are rendered flat.
]]
---@field thickness int
--[[
2D cloud speed + direction in nodes per second.
]]
---@field speed {x:number, z:number}
--[[
Shadow color, applied to the base of the cloud.
]]
---@field shadow core.ColorSpec

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef


--[[
* `set_clouds(cloud_parameters)`: set cloud parameters
    * Passing no arguments resets clouds to their default values.
    * `cloud_parameters` is a table with the following optional fields:
        * `density`: from `0` (no clouds) to `1` (full clouds) (default `0.4`)
        * `color`: basic cloud color with alpha channel, ColorSpec
          (default `#fff0f0e5`).
        * `ambient`: cloud color lower bound, use for a "glow at night" effect.
          ColorSpec (alpha ignored, default `#000000`)
        * `height`: cloud height, i.e. y of cloud base (default per conf,
          usually `120`)
        * `thickness`: cloud thickness in nodes (default `16`).
          if set to zero the clouds are rendered flat.
        * `speed`: 2D cloud speed + direction in nodes per second
          (default `{x=0, z=-2}`).
        * `shadow`: shadow color, applied to the base of the cloud
          (default `#cccccc`).
]]
---@param cloud_parameters core.PlayerCloudParameters.set?
function PlayerRef:set_clouds(cloud_parameters) end

--[[
* `get_clouds()`: returns a table with the current cloud parameters as in
  `set_clouds`.
]]
---@nodiscard
---@return core.PlayerCloudParameters.get cloud_parameters
function PlayerRef:get_clouds() end