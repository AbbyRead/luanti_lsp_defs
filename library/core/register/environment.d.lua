---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Registration functions > Environment

--[[
Registers a node. Note: pass a clean table that has not been used for another registration, as it will be modified.
]]
---@param name string
---@param node_def core.NodeDef
function core.register_node(name, node_def) end

--[[
Registers a craftitem. Note: pass a clean table that has not been used for another registration, as it will be modified.
]]
---@param name string
---@param itemdef core.ItemDef
function core.register_craftitem(name, itemdef) end

--[[
Registers a tool. Note: pass a clean table that has not been used for another registration, as it will be modified.
]]
---@param name string
---@param itemdef core.ItemDef
function core.register_tool(name, itemdef) end

--[[
Overrides fields of an item registered with register_node/tool/craftitem. The item
must already be defined.

* `redefinition`: table of fields `[name] = new_value`, overwriting fields of or
  adding fields to the existing definition
* `del_fields`: list of field names to set to `nil` (delete from the original
  definition)

Example: `core.override_item("default:mese", {light_source=core.LIGHT_MAX}, {"sounds"})`
overwrites `light_source` and removes the sounds from the mese block.
]]
---@param name string
---@param redefinition core.ItemDef|core.NodeDef?
---@param del_fields core.ItemDef.keys|core.NodeDef.keys?
function core.override_item(name, redefinition, del_fields) end

--[[
Unregisters the item from the engine, and deletes the entry with key `name` from
`core.registered_items` and from the associated item table according to its
nature (e.g. `core.registered_nodes`).
]]
---@param name string
function core.unregister_item(name) end

--[[
Registers an entity type. See `core.EntityDef`.
]]
---@param name string
---@param entity_def core.EntityDef
function core.register_entity(name, entity_def) end

--[[
Registers an Active Block Modifier. See `core.ABMDef`.
]]
---@param abmdef core.ABMDef
function core.register_abm(abmdef) end

--[[
Registers a Loading Block Modifier. See `core.LBMDef`.
]]
---@param lbmdef core.LBMDef
function core.register_lbm(lbmdef) end

--[[
Adds an alias `alias` for the item `original_name`, so `alias` can be used to refer to
it. Does nothing if an item named `alias` already exists.

Also use this to set the 'mapgen aliases' needed in a game for the core mapgens.
]]
---@param alias core.Alias
---@param original_name core.Item.name
function core.register_alias(alias, original_name) end

--[[
Like `core.register_alias`, but if an item named `alias` already exists, it is
unregistered (`core.register_alias` does nothing in that case).
]]
---@param alias core.Alias
---@param original_name core.Item.name
function core.register_alias_force(alias, original_name) end

--[[
Registers an ore. Returns an integer handle uniquely identifying the registered ore on
success. The order of ore registrations determines the order of ore generation.
]]
---@param def core.OreDef
---@return core.OreID?
function core.register_ore(def) end

--[[
Registers a biome. Returns an integer handle uniquely identifying the registered
biome on success. To get the biome ID, use `core.get_biome_id`.
]]
---@param biome_def core.BiomeDef
---@return core.BiomeID?
function core.register_biome(biome_def) end

--[[
Unregisters the biome from the engine, and deletes the entry with key
`name` from `core.registered_biomes`.

Warning: This alters the biome to biome ID correspondences, so any
  decorations or ores using the 'biomes' field must afterwards be cleared
  and re-registered.
]]
---@param name string
function core.unregister_biome(name) end

--[[
Registers a decoration. Returns an integer handle uniquely identifying the registered
decoration on success. To get the decoration ID, use `core.get_decoration_id`.
The order of decoration registrations determines the order of decoration generation.
]]
---@param decoration_def core.DecorationDef
---@return core.DecorationID?
function core.register_decoration(decoration_def) end

--[[
Registers a schematic. Returns an integer handle uniquely identifying the registered
schematic on success.

If the schematic is loaded from a file, the `name` field is set to the filename.
If called while loading a mod and `name` is a relative path, the current mod path is
prepended to the schematic filename.
]]
---@param schem_def core.SchematicDef
---@return core.SchematicID
function core.register_schematic(schem_def) end

--[[
Clears all biomes currently registered.

Warning: Clearing and re-registering biomes alters the biome to biome ID
      correspondences, so any decorations or ores using the 'biomes' field must
afterwards be cleared and re-registered.
]]
function core.clear_registered_biomes() end

--[[
Clears all decorations currently registered.
]]
function core.clear_registered_decorations() end

--[[
Clears all ores currently registered.
]]
function core.clear_registered_ores() end

--[[
Clears all schematics currently registered.
]]
function core.clear_registered_schematics() end