---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global callback registration functions

-- -------------------------- PlayerHPChangeReason -------------------------- --

--[[
Value of `reason.type`. Any type may carry additional fields from mods.

* `set_hp`: a mod or the engine called `set_hp` without giving a type; use this for
  custom damage types
* `fall`, `drown`, `respawn`: engine-defined causes
* `punch` and `node_damage` have their own classes
]]
---@alias core.PlayerHPChangeReason.regular.type
--- | "set_hp"
--- | "fall"
--- | "drown"
--- | "respawn"
--- | string

--[[
A PlayerHPChangeReason table. Any type may have additional fields from mods.
]]
---@class core.PlayerHPChangeReason.regular : {[string]:any}
--[[
Kind of HP change.
]]
---@field type core.PlayerHPChangeReason.regular.type
--[[
Whether the change came from a mod or the engine.
]]
---@field from  "mod"|"engine"

--[[
Reason for damage caused by a punch.
]]
---@class core.PlayerHPChangeReason.punch : core.PlayerHPChangeReason.regular
--[[
Kind of HP change.
]]
---@field type "punch"
--[[
The puncher, or nil if none.
]]
---@field object core.ObjectRef?

--[[
Reason for damage from `damage_per_second` of a neighboring node.
]]
---@class core.PlayerHPChangeReason.node_damage : core.PlayerHPChangeReason.regular
--[[
Kind of HP change.
]]
---@field type "node_damage"
--[[
Name of the node, or nil.
]]
---@field node core.Node.name?
--[[
Position of the node.
]]
---@field node_pos ivec?

--[[
Why a player's HP changed; see the variant classes.
]]
---@alias core.PlayerHPChangeReason
--- | core.PlayerHPChangeReason.regular
--- | core.PlayerHPChangeReason.punch
--- | core.PlayerHPChangeReason.node_damage

-- ---------------------------- core.* functions ---------------------------- --

--[[
Non-modifier callback; receives the final HP change calculated by the modifiers.
`hp_change` is negative for damage.
]]
---@alias core.fn.on_player_hpchange.logger fun(player:core.PlayerRef, hp_change:int, reason:core.PlayerHPChangeReason)

--[[
Called when the player gets damaged or healed.

* When `hp == 0`, damage doesn't trigger this callback.
* When `hp == hp_max`, healing does still trigger this callback.
* `hp_change`: the amount of change; negative when it is damage. The new HP value
  was historically clamped to [0, 65535] before calculating the change; this
  clamping was removed in 5.10.0.
* `reason`: a `core.PlayerHPChangeReason`. `reason.from` is `mod` or `engine`.
* `modifier`: when true, the function is a modifier and should return the actual
  `hp_change`. Modifiers only get a temporary `hp_change` that can be modified by
  later modifiers, and can return true as a second value to stop the execution of
  further functions. Non-modifiers receive the final HP change calculated by the
  modifiers.
]]
---@param f core.fn.on_player_hpchange.logger
function core.register_on_player_hpchange(f) end

--[[
Modifier callback; receives a temporary `hp_change` that later modifiers may alter.
Returns the actual `hp_change`, and optionally true as a second value to stop the
execution of further functions.
]]
---@alias core.fn.on_player_hpchange.modifier fun(player:core.PlayerRef, hp_change:int, reason:core.PlayerHPChangeReason):int, boolean?

--[[
Called when the player gets damaged or healed.

* When `hp == 0`, damage doesn't trigger this callback.
* When `hp == hp_max`, healing does still trigger this callback.
* `hp_change`: the amount of change; negative when it is damage. The new HP value
  was historically clamped to [0, 65535] before calculating the change; this
  clamping was removed in 5.10.0.
* `reason`: a `core.PlayerHPChangeReason`. `reason.from` is `mod` or `engine`.
* `modifier`: when true, the function is a modifier and should return the actual
  `hp_change`. Modifiers only get a temporary `hp_change` that can be modified by
  later modifiers, and can return true as a second value to stop the execution of
  further functions. Non-modifiers receive the final HP change calculated by the
  modifiers.
]]
---@param f core.fn.on_player_hpchange.modifier
---@param modifier true
function core.register_on_player_hpchange(f, modifier) end

--[[
Callback for `core.register_on_dieplayer`; `reason` is as in `register_on_player_hpchange`.
]]
---@alias core.fn.on_dieplayer fun(ObjectRef:core.PlayerRef, reason: core.PlayerHPChangeReason)

--[[
Called when a player dies. `reason` is a `core.PlayerHPChangeReason`, see
`core.register_on_player_hpchange`. For customizing the death screen, see
`core.show_death_screen`.
]]
---@param f core.fn.on_dieplayer
function core.register_on_dieplayer(f) end