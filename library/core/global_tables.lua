---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Global tables
--[=[
NOTE: manually searched from output log of below in a minimal game:
core.log(dump2(core, 'core'))
]=]

--[[
Callbacks registered with `core.register_on_mods_loaded`.
]]
---@type core.fn.on_mods_loaded[]
core.registered_on_mods_loaded = {}

--[[
Callbacks registered with `core.register_on_shutdown`.
]]
---@type core.fn.on_shutdown[]
core.registered_on_shutdown = {}

--[[
Callbacks registered with `core.register_on_generated`.
]]
---@type core.fn.on_generated[]
core.registered_on_generateds = {}

--[[
Callbacks registered with `core.register_on_newplayer`.
]]
---@type core.fn.on_newplayer[]
core.registered_on_newplayers = {}

--[[
Callbacks registered with `core.register_on_dieplayer`.
]]
---@type core.fn.on_dieplayer[]
core.registered_on_dieplayers = {}

--[[
Callbacks registered with `core.register_on_respawnplayer`.
]]
---@type core.fn.on_respawnplayer[]
core.registered_on_respawnplayers = {}

--[[
Callbacks registered with `core.register_on_prejoinplayer`.
]]
---@type core.fn.on_prejoinplayer[]
core.registered_on_prejoinplayers = {}

--[[
Callbacks registered with `core.register_on_joinplayer`.
]]
---@type core.fn.on_joinplayer[]
core.registered_on_joinplayers = {}

--[[
Callbacks registered with `core.register_on_leaveplayer`.
]]
---@type core.fn.on_leaveplayer[]
core.registered_on_leaveplayers = {}

--[[
Callbacks registered with `core.register_on_player_receive_fields`.
]]
---@type core.fn.on_player_receive_fields[]
core.registered_on_player_receive_fields = {}

--[[
Callbacks registered with `core.register_on_cheat`.
]]
---@type core.fn.on_cheat[]
core.registered_on_cheats = {}

--[[
Callbacks registered with `core.register_on_protection_violation`.
]]
---@type core.fn.on_protection_violation[]
core.registered_on_protection_violation = {}

--[[
Callbacks registered with `core.register_on_punchplayer`.
]]
---@type core.fn.on_punchplayer[]
core.registered_on_punchplayers = {}

--[[
Callbacks registered with `core.register_on_priv_grant`.
]]
---@type core.fn.on_priv_grant[]
core.registered_on_priv_grant = {}

--[[
Callbacks registered with `core.register_on_priv_revoke`.
]]
---@type core.fn.on_priv_revoke[]
core.registered_on_priv_revoke = {}

--[[
Callbacks registered with `core.register_on_authplayer`.
]]
---@type core.fn.on_authplayer[]
core.registered_on_authplayers = {}

--[[
Callbacks registered with `core.register_can_bypass_userlimit`.
]]
---@type core.fn.can_bypass_userlimit[]
core.registered_can_bypass_userlimit = {}

--[[
Callbacks registered with `core.register_on_modchannel_message`.
]]
---@type core.fn.on_modchannel_message[]
core.registered_on_modchannel_message = {}

--[[
Callbacks registered with `core.register_on_player_inventory_action`.
]]
---@type core.fn.on_player_inventory_action[]
core.registered_on_player_inventory_actions = {}

--[[
Callbacks registered with `core.register_allow_player_inventory_action`.
]]
---@type core.fn.allow_player_inventory_action[]
core.registered_allow_player_inventory_actions = {}

--[[
Callbacks registered with `core.register_on_rightclickplayer`.
]]
---@type core.fn.on_rightclickplayer[]
core.registered_on_rightclickplayers = {}

--[[
Callbacks registered with `core.register_on_liquid_transformed`.
]]
---@type core.fn.on_liquid_transform[]
core.registered_on_liquid_transformed = {}

--[[
Callbacks registered with `core.register_on_mapblocks_changed`.
]]
---@type core.fn.on_mapblocks_changed[]
core.registered_on_mapblocks_changed = {}

--[[
Map of registered privilege definitions, indexed by name.
Registered privileges can be modified directly in this table.
]]
---@type table<core.PrivilegeSet.keys, core.PrivilegeDef>
core.registered_privileges = {}

--[[
Map of registered chat command definitions, indexed by name.
]]
---@type table<core.ChatCommandDef.keys, core.ChatCommandDef>
core.registered_chatcommands = {}

--[[
Map of registered node definitions, indexed by name.
]]
---@type table<core.Node.name, core.NodeDef>
core.registered_nodes = {}

--[[
Callbacks registered with `core.register_on_craft`.
]]
---@type core.fn.on_craft[]
core.registered_on_crafts = {}

--[[
Callbacks registered with `core.register_craft_predict`.
]]
---@type core.fn.craft_predict[]
core.registered_craft_predicts = {}

--[[
Callbacks registered with `core.register_on_item_pickup`.
]]
---@type core.fn.on_item_pickup[]
core.registered_on_item_pickups = {}

--[[
Callbacks registered with `core.register_on_item_eat`.
]]
---@type core.fn.on_item_eat[]
core.registered_on_item_eats = {}

--[[
Callbacks registered with `core.register_on_dignode`.
]]
---@type core.fn.on_dignode[]
core.registered_on_dignodes = {}

--[[
Callbacks registered with `core.register_on_placenode`.
]]
---@type core.fn.on_placenode[]
core.registered_on_placenodes = {}

--[[
Callbacks registered with `core.register_on_punchnode`.
]]
---@type core.fn.on_punchnode[]
core.registered_on_punchnodes = {}

--[[
Map of active object references, indexed by object GUID.
]]
---@type table<string, core.ObjectRef>
core.objects_by_guid = {}

--[[
**Obsolete:** Use `core.objects_by_guid` instead.
GUIDs are strictly more useful than active object IDs.

Map of active object references, indexed by active object id.
]]
---@deprecated
---@type SparseList<core.ObjectRef>
core.object_refs = {}

--[[
Map of Lua entities, indexed by active object id.
]]
---@type SparseList<core.Entity>
core.luaentities = {}

--[[
Map of registered aliases, indexed by name.
]]
---@type table<core.Alias, core.Item.name>
core.registered_aliases = {}

--[[
Map of registered tool definitions, indexed by name.
]]
---@type table<core.Tool.name, core.ToolDef>
core.registered_tools = {}

--[[
Map of registered craft item definitions, indexed by name.
]]
---@type table<core.Item.name, core.ItemDef>
core.registered_craftitems = {}

--[[
Map of registered items, indexed by name.
]]
---@type table<core.Item.name, core.ItemDef>
core.registered_items = {}

--[[
Map of registered entity prototypes, indexed by name.
Values in this table may be modified directly.
Note: changes to initial properties will only affect entities spawned
afterwards, as they are only read when spawning.
]]
---@type table<string, core.EntityDef>
core.registered_entities = {}

--[[
List of LBM definitions.
]]
---@type core.LBMDef[]
core.registered_lbms = {}

--[[
List of ABM definitions.
]]
---@type core.ABMDef[]
core.registered_abms = {}

--[[
Callbacks registered with `core.register_on_player_hpchange`, split into
`modifiers` and `loggers`.
]]
---@class core.reg.on_player_hpchanges
core.registered_on_player_hpchanges = {}

--[[
Callbacks registered with `core.register_on_player_hpchange(f, true)`.
]]
---@type core.fn.on_player_hpchange.modifier[]
core.registered_on_player_hpchanges.modifiers = {}

--[[
Callbacks registered with `core.register_on_player_hpchange(f)`.
]]
---@type core.fn.on_player_hpchange.logger[]
core.registered_on_player_hpchanges.loggers = {}

--[[
Map of registered biome definitions, indexed by the `name` field.
If `name` is nil, the key is the object handle returned by
`core.register_biome`.
]]
---@type table<string|core.BiomeID, core.BiomeDef>
core.registered_biomes = {}

--[[
Map of registered ore definitions, indexed by the `name` field.
If `name` is nil, the key is the object handle returned by
`core.register_ore`.
]]
---@type table<string|core.OreID, core.OreDef>
core.registered_ores = {}

--[[
Map of registered decoration definitions, indexed by the `name` field.
If `name` is nil, the key is the object handle returned by
`core.register_decoration`.
]]
---@type table<string|core.DecorationID, core.DecorationDef>
core.registered_decorations = {}

--[[
Callbacks registered with `core.register_on_chat_message`.
]]
---@type core.fn.on_chat_message[]
core.registered_on_chat_messages = {}

--[[
Callbacks registered with `core.register_on_chatcommand`.
]]
---@type core.fn.on_chatcommand[]
core.registered_on_chatcommands = {}

--[[
Callbacks registered with `core.register_globalstep`.
]]
---@type core.fn.globalstep[]
core.registered_globalsteps = {}

--[[
Callbacks for player events. Internal; no documented registration function.
]]
---@type core.fn.playerevent[]
core.registered_playerevents = {}

--[[
Map of detached inventory callbacks, indexed by inventory name (see
`core.create_detached_inventory`).
]]
---@type table<string, core.DetachedInventoryCallbacks>
core.detached_inventories = {}