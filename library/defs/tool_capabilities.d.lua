---@meta _

-- luanti/doc/lua_api.md: Tool Capabilities

-- ---------------------- ToolCapabilities.*.groupcaps ---------------------- --

--[[
Capabilities for one node group of an item (applies to all items, not just
tools).
]]
---@class core.ToolCapabilities.item.groupcap
--[[
Digging times for different ratings of the group, for nodes of the maximum
level. For example `times={[2]=2.00, [3]=0.70}` can dig nodes with a rating
of `2` or `3` for this group, and not rating `1` (unless a matching group
enables digging otherwise). If the resulting digging time is 0, a delay of
0.15 seconds is added between digging nodes (not applied for times between 0
and 0.15, so 0.01 is actually faster than 0).
]]
---@field times number[]?
--[[
Maximum level of a node of this group that the item can dig. An integer,
usually `0`, `1`, `2` or `3`.
]]
---@field maxlevel int?

--[[
Group capabilities by node group name, for non-tool items.
]]
---@alias core.ToolCapabilities.item.groupcaps table<core.Groups.node, core.ToolCapabilities.item.groupcap>

--[[
Capabilities for one node group of a tool. Like the item groupcap, with
`uses`.
]]
---@class core.ToolCapabilities.tool.groupcap : core.ToolCapabilities.item.groupcap
--[[
An integer [u16] that determines how many uses the tool has when used to dig
a node of this group of the maximum level. The maximum is 65535; 0 means
infinite uses. For lower leveled nodes, the use count is multiplied by
`3^leveldiff` (the difference of the tool's `maxlevel` and the node's `level`
group); the node cannot be dug if `leveldiff` is less than zero. Has no
effect for non-tools.
]]
---@field uses int?

--[[
Group capabilities by node group name, for tools.
]]
---@alias core.ToolCapabilities.tool.groupcaps table<core.Groups.node, core.ToolCapabilities.tool.groupcap>

-- --------------------- ToolCapabilities.damage_groups --------------------- --

--[[
Damage for groups of entities, by armor group name. See "Entity damage
mechanism".
]]
---@alias core.ToolCapabilities.damage_groups table<core.Groups.armor, int>

-- -------------------------- ToolCapabilities.item ------------------------- --

--[[
Tool capabilities of an item: which nodes it can dig and how fast, and which
objects it can hurt by punching and by how much. Available for all items, but
only tools can receive wear. Missing or incomplete tool capabilities default
to the player's hand.
]]
---@class core.ToolCapabilities.item
--[[
When used as a weapon, the item does full damage if this time (in seconds)
is spent between punches. If e.g. half the time is spent, it does half
damage.
]]
---@field full_punch_interval number?
--[[
Suggests the maximum level of node, when dug with the item, that will drop
its useful item. Integer. Not used in the engine; the game/mod code is
responsible for implementing it.
]]
---@field max_drop_level int?
--[[
Capabilities per node group, for digging.
]]
---@field groupcaps core.ToolCapabilities.item.groupcaps?
--[[
Damage groups, for punching objects.
]]
---@field damage_groups core.ToolCapabilities.damage_groups?

-- -------------------------- ToolCapabilities.tool ------------------------- --

--[[
Tool capabilities of a tool: an item with wear. Additionally supports
`uses` in groupcaps and `punch_attack_uses`.
]]
---@class core.ToolCapabilities.tool : core.ToolCapabilities.item
--[[
Capabilities per node group, for digging (with `uses`).
]]
---@field groupcaps core.ToolCapabilities.tool.groupcaps?
--[[
Amount of uses this tool has for attacking players and entities
by punching them (0 = infinite uses).
For compatibility, this is automatically set from the first
suitable groupcap using the formula "uses * 3^(maxlevel - 1)".
It is recommend to set this explicitly instead of relying on the
fallback behavior.
]]
---@field punch_attack_uses int?

-- ---------------------------- ToolCapabilities ---------------------------- --

--[[
Tool capabilities of an item or tool.
]]
---@alias core.ToolCapabilities
--- | core.ToolCapabilities.item
--- | core.ToolCapabilities.tool