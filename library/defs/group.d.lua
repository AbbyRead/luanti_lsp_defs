---@meta _

-- luanti/doc/lua_api.md: Groups

-- ------------------------------- Groups.item ------------------------------ --

--[[
Group table of an item. Groups define the properties of a thing in a way
that the engine and other mods can interact with it without knowing what it
is. Keys are group names, values are integer ratings in range [-32767, 32767].

Special groups marked with `(*)` in the docs have no engine functionality;
their implementation is left up to games.
]]
---@class core.Groups.item : {[string]:int}
--[[
`(*)` Special group for inventory mods to indicate that the item should be hidden in item lists.
]]
---@field not_in_creative_inventory int?

-- ------------------------------- Groups.node ------------------------------ --

--[[
Values for the `attached_node` group:

* `1`: if the node is wallmounted, it is attached in the wallmounted
  direction. Otherwise it is attached to the node below.
* `2`: if the node is facedir or 4dir, the facedir or 4dir direction is
  checked (attaching face is tile no. 5, the back face). No effect for other
  nodes.
* `3`: always attached to the node below.
* `4`: always attached to the node above.
]]
---@alias core.Groups.special.attached_node
--- | 0
--- | 1
--- | 2
--- | 3
--- | 4
--- | integer

--[[
Values for the `dig_immediate` group:

* `2`: the node always gets the digging time 0.5 seconds (rail, sign)
* `3`: the node always gets the digging time 0 seconds (torch)
]]
---@alias core.Groups.special.dig_immediate
--- | 0
--- | 1
--- | 2
--- | 3
--- | integer

--[[
Values for the `disable_jump` group: nonzero enables.
]]
---@alias core.Groups.special.disable_jump
--- | 0
--- | 1
--- | integer

--[[
Values for the `disable_descend` group: nonzero enables.
]]
---@alias core.Groups.special.disable_descend
--- | 0
--- | 1
--- | integer

--[[
Values for the `falling_node` group: nonzero enables.
]]
---@alias core.Groups.special.falling_node
--- | 0
--- | 1
--- | integer

--[[
Values for the `float` group: nonzero enables.
]]
---@alias core.Groups.special.float
--- | 0
--- | 1
--- | integer

--[[
Group table of a node. Inherits the item groups.
Fields marked with an asterisk in the docs have no engine functionality.
]]
---@class core.Groups.node : core.Groups.item
--[[
The node is 'attached' to a neighboring node. It checks whether the node it
is attached to is walkable. If it isn't, the node will drop as an item.
]]
---@field attached_node core.Groups.special.attached_node?
--[[
Value is bounce speed in percent. If positive, jump/sneak on floor impact
will increase/decrease bounce height. A negative value is the same
bounciness, but non-controllable.
]]
---@field bouncy int?
--[[
Makes nodes of raillike drawtype with the same group value connect to each other.
]]
---@field connect_to_raillike int?
--[[
Player can always pick up the node without reducing tool wear.
]]
---@field dig_immediate core.Groups.special.dig_immediate?
--[[
Player (and possibly other things) cannot jump from the node or if their
feet are in the node. Not supported for `new_move = false`.
]]
---@field disable_jump core.Groups.special.disable_jump?
--[[
Player (and possibly other things) cannot *actively* descend in the node
using Sneak or Aux1 key (for liquids and climbable nodes only). Not supported
for `new_move = false`.
]]
---@field disable_descend core.Groups.special.disable_descend?
--[[
Modifies the fall damage suffered when hitting the top of this node. There
is also an armor group with the same name. The final player damage is:

`damage = collision_speed * ((node_percent + 100) / 100) * ((player_percent + 100) / 100) - 14`

Negative damage values are discarded as no damage.
]]
---@field fall_damage_add_percent int?
--[[
If there is no walkable block under the node it will fall.
]]
---@field falling_node core.Groups.special.falling_node?
--[[
The node will not fall through liquids (`liquidtype ~= "none"`).
A liquid source with `groups = {falling_node = 1, float = 1}` will fall
through flowing liquids.
]]
---@field float core.Groups.special.float?
--[[
Can be used to give an additional sense of progression in the game.
A larger level will cause e.g. a weapon of a lower level to make much less
damage and get worn out much faster, or not be able to get drops from
destroyed nodes. `0` is something directly accessible at the start of
gameplay; there is no upper limit. See also `leveldiff` in Tool Capabilities.
]]
---@field level int?
--[[
Players and items will slide on the node. Slipperiness rises steadily with the value, starting at 1.
]]
---@field slippery int?

-- ------------------------------- Groups.tool ------------------------------ --

--[[
Values for the `disable_repair` group: nonzero enables.
]]
---@alias core.Groups.special.disable_repair
--- | 0
--- | 1
--- | integer

--[[
Group table of a tool. Inherits the item groups.
]]
---@class core.Groups.tool : core.Groups.item
--[[
If set to 1 for a tool, it cannot be repaired using the `"toolrepair"` crafting recipe.
]]
---@field disable_repair core.Groups.special.disable_repair?

-- ------------------------------ Groups.armor ------------------------------ --

--[[
Values for the `immortal` group: nonzero enables.
]]
---@alias core.Groups.special.immortal
--- | 0
--- | 1
--- | integer

--[[
Values for the `punch_operable` group: nonzero enables.
]]
---@alias core.Groups.special.punch_operable
--- | 0
--- | 1
--- | integer

--[[
`ObjectRef` armor groups. Keys are group names (usually damage groups such as
`fleshy`), values are integer ratings.
]]
---@class core.Groups.armor : {[string]:int}
--[[
Skips all damage and breath handling for an object. This group will also hide
the integrated HUD status bars for players. It is automatically set to all
players when damage is disabled on the server and cannot be reset (subject to
change).
]]
---@field immortal core.Groups.special.immortal?
--[[
Modifies the fall damage suffered by players when they hit the ground.
Analogous to the node group with the same name; see `core.Groups.node` for
the exact calculation.
]]
---@field fall_damage_add_percent int?
--[[
For entities: disables the regular damage mechanism for players punching it
by hand or a non-tool item, so that it can do something else than take
damage.
]]
---@field punch_operable core.Groups.special.punch_operable?