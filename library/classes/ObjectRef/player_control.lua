---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- ------------------------------ PlayerControl ----------------------------- --

--[[
Player input, as returned by `PlayerRef:get_player_control`.
Boolean fields represent the pressed keys. The table is empty (`{}`) if the
object is not a player.
]]
---@class core.PlayerControl
--[[
Forward key pressed.
]]
---@field  up boolean
--[[
Backward key pressed.
]]
---@field  down boolean
--[[
Left key pressed.
]]
---@field  left boolean
--[[
Right key pressed.
]]
---@field  right boolean
--[[
Jump key pressed.
]]
---@field  jump boolean
--[[
Aux1 key pressed.
]]
---@field  aux1 boolean
--[[
Sneak key pressed.
]]
---@field  sneak boolean
--[[
Dig key pressed.
]]
---@field  dig boolean
--[[
Place key pressed.
]]
---@field  place boolean
--[[
Equal to `dig`; exists only for backwards compatibility.
]]
---@field  LMB boolean
--[[
Equal to `place`; exists only for backwards compatibility.
]]
---@field  RMB boolean
--[[
Zoom key pressed.
]]
---@field  zoom boolean
--[[
Movement along the X axis (sideways), in the range [-1.0, +1.0].
Takes both keyboard and joystick input into account. Prefer this over
`left`/`right` to support different input methods correctly.
]]
---@field  movement_x number
--[[
Movement along the Y axis (forward/backward), in the range [-1.0, +1.0].
Takes both keyboard and joystick input into account. Prefer this over
`up`/`down` to support different input methods correctly.
]]
---@field  movement_y number

-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `get_player_control()`: returns table with player input
    * The table contains the following boolean fields representing the pressed
      keys: `up`, `down`, `left`, `right`, `jump`, `aux1`, `sneak`, `dig`,
      `place`, `LMB`, `RMB` and `zoom`.
    * The fields `LMB` and `RMB` are equal to `dig` and `place` respectively,
      and exist only to preserve backwards compatibility.
    * The table also contains the fields `movement_x` and `movement_y`.
        * They represent the movement of the player. Values are numbers in the
          range [-1.0,+1.0].
        * They take both keyboard and joystick input into account.
        * You should prefer them over `up`, `down`, `left` and `right` to
          support different input methods correctly.
    * Returns an empty table `{}` if the object is not a player.
]]
---@nodiscard
---@return core.PlayerControl
function PlayerRef:get_player_control() end

--[[
* `get_player_control_bits()`: returns integer with bit packed player pressed
  keys.
    * Bits:
        * 0 - up
        * 1 - down
        * 2 - left
        * 3 - right
        * 4 - jump
        * 5 - aux1
        * 6 - sneak
        * 7 - dig
        * 8 - place
        * 9 - zoom
    * Returns `0` (no bits set) if the object is not a player.
]]
---@nodiscard
---@return int
function PlayerRef:get_player_control_bits() end