---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- ----------------------------- PlayerHudFlags ----------------------------- --

--[[
HUD flags accepted by `PlayerRef:hud_set_flags`. A flag equal to `nil` is not
modified. Also accepts the table returned by `PlayerRef:hud_get_flags`.
]]
---@alias core.PlayerHudFlags.set
--- | core.PlayerHudFlags.get
--- | _.PlayerHudFlags.set

---@class _.PlayerHudFlags.set
--[[
Show the hotbar.
]]
---@field hotbar boolean?
--[[
Show the health bar.
]]
---@field healthbar boolean?
--[[
Show the crosshair.
]]
---@field crosshair boolean?
--[[
Show the wielded item.
]]
---@field wielditem boolean?
--[[
Show the breath bar.
]]
---@field breathbar boolean?
--[[
Modifies the client's permission to view the minimap.
The client may locally elect to not view the minimap.
]]
---@field minimap boolean?
--[[
Only usable when `minimap` is true.
]]
---@field minimap_radar boolean?
--[[
Allow showing basic debug info that might give a gameplay advantage.
This includes map seed, player position, look direction, the pointed node and
block bounds. Does not affect players with the `debug` privilege.
]]
---@field basic_debug boolean?
--[[
Modifies the client's permission to view chat on the HUD.
The client may locally elect to not view chat. Does not affect the console.
]]
---@field chat boolean?

--[[
Current HUD flags, as returned by `PlayerRef:hud_get_flags`.
See `core.PlayerHudFlags.set` for the meaning of each flag.
]]
---@class core.PlayerHudFlags.get
--[[
Show the hotbar.
]]
---@field hotbar boolean
--[[
Show the health bar.
]]
---@field healthbar boolean
--[[
Show the crosshair.
]]
---@field crosshair boolean
--[[
Show the wielded item.
]]
---@field wielditem boolean
--[[
Show the breath bar.
]]
---@field breathbar boolean
--[[
Client's permission to view the minimap.
]]
---@field minimap boolean
--[[
Radar minimap mode; only usable when `minimap` is true.
]]
---@field minimap_radar boolean
--[[
Allow showing basic debug info (map seed, player position, look direction,
pointed node, block bounds). Does not affect players with the `debug` privilege.
]]
---@field basic_debug boolean
--[[
Client's permission to view chat on the HUD. Does not affect the console.
]]
---@field chat boolean


-- ---------------------------- PlayerRef methods --------------------------- --

---@class core.PlayerRef
local PlayerRef

--[[
* `hud_set_flags(flags)`: sets specified HUD flags of player.
    * `flags`: A table with the following fields set to boolean values
        * `hotbar`
        * `healthbar`
        * `crosshair`
        * `wielditem`
        * `breathbar`
        * `minimap`: Modifies the client's permission to view the minimap.
          The client may locally elect to not view the minimap.
        * `minimap_radar`: is only usable when `minimap` is true
        * `basic_debug`: Allow showing basic debug info that might give a gameplay advantage.
          This includes map seed, player position, look direction, the pointed node and block bounds.
          Does not affect players with the `debug` privilege.
        * `chat`: Modifies the client's permission to view chat on the HUD.
          The client may locally elect to not view chat. Does not affect the console.
    * If a flag equals `nil`, the flag is not modified
]]
---@param flags core.PlayerHudFlags.set
function PlayerRef:hud_set_flags(flags) end

--[[
* `hud_get_flags()`: returns a table of player HUD flags with boolean values.
    * See `hud_set_flags` for a list of flags that can be toggled.
]]
---@nodiscard
---@return core.PlayerHudFlags.get flags
function PlayerRef:hud_get_flags() end