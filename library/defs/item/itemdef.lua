---@meta _

-- luanti/doc/lua_api.md: Items
-- luanti/doc/lua_api.md: Definition tables > Item definition

--[[
Names of the item definition fields that can be changed with
`core.override_item`.
]]
---@alias core.ItemDef.keys
---| "description"
---| "short_description"
---| "groups"
---| "inventory_image"
---| "inventory_overlay"
---| "wield_image"
---| "wield_overlay"
---| "wield_scale"
---| "palette"
---| "color"
---| "stack_max"
---| "range"
---| "liquids_pointable"
---| "pointabilities"
---| "light_source"
---| "tool_capabilities"
---| "wear_color"
---| "node_placement_prediction"
---| "node_dig_prediction"
---| "touch_interaction"
---| "sound"
---| "on_place"
---| "on_secondary_use"
---| "on_drop"
---| "on_pickup"
---| "on_use"
---| "after_use"

-- --------------------------------- ToolDef -------------------------------- --
--[[
Tool definition: an item definition with `tool_capabilities`. The only
technically unique thing about tools is their wear; beyond that, no
gameplay-relevant assumptions can be made about tools or non-tools.
]]
---@class core.ToolDef : core.ItemDef
--[[
Tool capabilities of the tool. Also used as the fallback for the wielded
item's interaction (see Tool Capabilities).
]]
---@field tool_capabilities core.ToolCapabilities

-- -------------------------------- callbacks ------------------------------- --

--[[
When the 'place' key was pressed with the item in hand
and a node was pointed at.
Shall place item and return the leftover itemstack
or nil to not modify the inventory.
The placer may be any ObjectRef or nil.
default: core.item_place
]]
---@alias core.ItemDef.on_place fun(itemstack:core.ItemStack, placer:core.ObjectRef?, pointed_thing:core.PointedThing): core.ItemStack?

--[[
Same as on_place but called when not pointing at a node.
Function must return either nil if inventory shall not be modified,
or an itemstack to replace the original itemstack.
The user may be any ObjectRef or nil.
default: nil
]]
---@alias core.ItemDef.on_secondary_use fun(itemstack:core.ItemStack, user:core.ObjectRef?, pointed_thing:core.PointedThing): core.ItemStack?

--[[
Shall drop item and return the leftover itemstack.
The dropper may be any ObjectRef or nil.
default: core.item_drop
]]
---@alias core.ItemDef.on_drop fun(itemstack:core.ItemStack, dropper:core.ObjectRef?, pos:vec): core.ItemStack?

--[[
Called when a dropped item is punched by a player.
Shall pick-up the item and return the leftover itemstack or nil to not
modify the dropped item.
Parameters:
- `itemstack`: The `ItemStack` to be picked up.
- `picker`: Any `ObjectRef` or `nil`.
- `pointed_thing` (optional): The dropped item (a `"__builtin:item"`
  luaentity) as `type="object"` `pointed_thing`.
- `time_from_last_punch, ...` (optional): Other parameters from
  `luaentity:on_punch`.
default: `core.item_pickup`
]]
---@alias core.ItemDef.on_pickup fun(itemstack: core.ItemStack, picker:core.ObjectRef?, pointed_thing:core.PointedThing?, time_from_last_punch:number?, tool_capabilities:core.ToolCapabilities?, dir:vec?, damage:int?): core.ItemStack?

--[[
default: nil
When user pressed the 'punch/mine' key with the item in hand.
Function must return either nil if inventory shall not be modified,
or an itemstack to replace the original itemstack.
e.g. itemstack:take_item(); return itemstack
Otherwise, the function is free to do what it wants.
The user may be any ObjectRef or nil.
The default functions handle regular use cases.
]]
---@alias core.ItemDef.on_use fun(itemstack:core.ItemStack, user:core.ObjectRef?, pointed_thing:core.PointedThing): core.ItemStack?

--[[
default: nil
If defined, should return an itemstack and will be called instead of
wearing out the item (if tool). If returns nil, does nothing.
If after_use doesn't exist, it is the same as:
  function(itemstack, user, node, digparams)
    itemstack:add_wear(digparams.wear)
    return itemstack
  end
The user may be any ObjectRef or nil.
]]
---@alias core.ItemDef.after_use fun(itemstack:core.ItemStack, user:core.ObjectRef?, node:core.Node.get, digparams:core.DigParams): core.ItemStack?

---@alias core.ItemImageDefinition string|table -- Placeholder or texture/image definition type

---@alias core.TouchInteractionMode
---| '"long_dig_short_place"' # Long tap = dig, short tap = place
---| '"short_dig_long_place"' # Short tap = dig, long tap = place
---| '"user"' # Engine-dependent default behavior

---@class core.SimpleSoundSpec
---@field name? string
---@field gain? number
---@field pitch? number
---@field max_hear_distance? number

---@class core.ToolCapabilities
---@field full_punch_interval number
---@field max_drop_level integer
---@field groupcaps table<string, { times: number[], uses: integer, maxlevel: integer }>
---@field damage_groups table<string, integer>
---@field punch_attack_uses? integer

---@class core.WearColor
---@field blend? "constant"|"linear"
---@field color_stops table<number, string>

---@class core.ItemSoundSpec
---@field breaks? core.SimpleSoundSpec
---@field eat? core.SimpleSoundSpec
---@field punch_use? core.SimpleSoundSpec
---@field punch_use_air? core.SimpleSoundSpec

-- -------------------------------------------------------------------------- --

---@class core.ItemDef
---@field description? string
---@field short_description? string
---@field groups? core.Groups.item
---@field inventory_image? core.ItemImageDefinition
---@field inventory_overlay? core.ItemImageDefinition
---@field wield_image? core.ItemImageDefinition
---@field wield_overlay? core.ItemImageDefinition
---@field wield_scale? vector
---@field palette? core.Texture
---@field color? core.ColorSpec
---@field stack_max? integer
---@field range? number
---@field liquids_pointable? boolean
---@field light_source? core.Light.source
---@field tool_capabilities? core.ToolCapabilities
---@field wear_color? core.WearColor
---@field node_placement_prediction? core.Node.name
---@field node_dig_prediction? core.Node.name
---@field on_place? core.ItemDef.on_place
---@field on_secondary_use? core.ItemDef.on_secondary_use
---@field on_drop? core.ItemDef.on_drop
---@field on_pickup? core.ItemDef.on_pickup
---@field on_use? core.ItemDef.on_use
---@field after_use? core.ItemDef.after_use
---@field [string] any