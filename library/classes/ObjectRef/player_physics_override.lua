---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- -------------------------- PlayerPhysicsOverride ------------------------- --

--[[
Physics overrides accepted by `PlayerRef:set_physics_override`. All fields are
optional. Also accepts the table returned by `PlayerRef:get_physics_override`.

All numeric fields modify a corresponding `movement_*` setting. For simpler
code, games should first modify the `movement_*` settings (e.g. via the game's
`minetest.conf`) to set a global base value for all players and only use
`set_physics_override` for per-player changes.
Some fields don't exist in old API versions, see feature
`physics_overrides_v2`.
]]
---@alias core.PlayerPhysicsOverride.set
--- | core.PlayerPhysicsOverride.get
--- | _.PlayerPhysicsOverride.set

---@class _.PlayerPhysicsOverride.set
--[[
Multiplier to *all* movement speed (`speed_*`) and acceleration
(`acceleration_*`) values. Default `1`.
]]
---@field speed number?
--[[
Multiplier to default walk speed. Default `1`.
The actual walk speed is the product of `speed` and `speed_walk`.
]]
---@field speed_walk number?
--[[
Multiplier to default climb speed. Default `1`.
The actual climb speed is the product of `speed` and `speed_climb`.
]]
---@field speed_climb number?
--[[
Multiplier to default sneak speed. Default `1`.
The actual sneak speed is the product of `speed` and `speed_crouch`.
]]
---@field speed_crouch number?
--[[
Multiplier to default speed in Fast Mode. Default `1`.
The actual fast speed is the product of `speed` and `speed_fast`.
]]
---@field speed_fast number?
--[[
Multiplier to default jump value. Default `1`.
]]
---@field jump number?
--[[
Multiplier to default gravity value. Default `1`.
]]
---@field gravity number?
--[[
Multiplier to liquid movement resistance (for nodes with `liquid_move_physics`);
the higher this value, the lower the resistance to movement. At `math.huge`
the resistance is zero and you can move through any liquid like air.
Default `1`. Warning: values below 1 are currently unsupported.
]]
---@field liquid_fluidity number?
--[[
Multiplier to default maximum liquid resistance (for nodes with
`liquid_move_physics`); controls deceleration when entering a node at high
speed. At higher values you come to a halt more quickly. Default `1`.
]]
---@field liquid_fluidity_smooth number?
--[[
Multiplier to default liquid sinking speed (for nodes with
`liquid_move_physics`). Default `1`.
]]
---@field liquid_sink number?
--[[
Multiplier to horizontal and vertical acceleration on ground or when climbing.
Default `1`. The actual acceleration is the product of `speed` and
`acceleration_default`.
]]
---@field acceleration_default number?
--[[
Multiplier to acceleration when jumping or falling. Default `1`.
The actual acceleration is the product of `speed` and `acceleration_air`.
]]
---@field acceleration_air number?
--[[
Multiplier to acceleration in Fast Mode. Default `1`.
The actual acceleration is the product of `speed` and `acceleration_fast`.
]]
---@field acceleration_fast number?
--[[
Whether the player can sneak. Default `true`.
]]
---@field sneak boolean?
--[[
Whether the player can use the new move code replications of the old sneak
side-effects: sneak ladders and 2 node sneak jump. Default `false`.
]]
---@field sneak_glitch boolean?
--[[
Use new move/sneak code. When `false` the exact old code is used for the
specific old sneak behavior. Default `true`.
]]
---@field new_move boolean?

--[[
Current physics overrides, as returned by `PlayerRef:get_physics_override`.
Same fields as the table accepted by `set_physics_override`.
]]
---@class core.PlayerPhysicsOverride.get
--[[
Multiplier to *all* movement speed (`speed_*`) and acceleration
(`acceleration_*`) values.
]]
---@field speed number
--[[
Multiplier to default walk speed.
]]
---@field speed_walk number
--[[
Multiplier to default climb speed.
]]
---@field speed_climb number
--[[
Multiplier to default sneak speed.
]]
---@field speed_crouch number
--[[
Multiplier to default speed in Fast Mode.
]]
---@field speed_fast number
--[[
Multiplier to default jump value.
]]
---@field jump number
--[[
Multiplier to default gravity value.
]]
---@field gravity number
--[[
Multiplier to liquid movement resistance (for nodes with `liquid_move_physics`).
]]
---@field liquid_fluidity number
--[[
Multiplier to default maximum liquid resistance (for nodes with
`liquid_move_physics`).
]]
---@field liquid_fluidity_smooth number
--[[
Multiplier to default liquid sinking speed (for nodes with
`liquid_move_physics`).
]]
---@field liquid_sink number
--[[
Multiplier to horizontal and vertical acceleration on ground or when climbing.
]]
---@field acceleration_default number
--[[
Multiplier to acceleration when jumping or falling.
]]
---@field acceleration_air number
--[[
Multiplier to acceleration in Fast Mode.
]]
---@field acceleration_fast number
--[[
Whether the player can sneak.
]]
---@field sneak boolean
--[[
Whether the player can use sneak ladders and 2 node sneak jump.
]]
---@field sneak_glitch boolean
--[[
Whether the new move/sneak code is used.
]]
---@field new_move boolean


-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `set_physics_override(override_table)`
    * Overrides the physics attributes of the player.
    * `override_table` fields: see `core.PlayerPhysicsOverride.set`.
]]
---@param override_table core.PlayerPhysicsOverride.set
function PlayerRef:set_physics_override(override_table) end

--[[
* `get_physics_override()`: returns the table given to `set_physics_override`
]]
---@nodiscard
---@return core.PlayerPhysicsOverride.get override_table
function PlayerRef:get_physics_override() end