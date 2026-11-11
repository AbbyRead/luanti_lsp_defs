---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Item handling

--[[
Returns a texture string for making an image of a cube (useful as an item image).
img1 is used for img2 and img3 if either is unspecified.
]]
---@nodiscard
---@param img1 core.Texture
---@param img2 core.Texture?
---@param img3 core.Texture?
---@return core.Texture
function core.inventorycube(img1, img2, img3) end

--[[
* `core.get_pointed_thing_position(pointed_thing, above)`
    * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
      does not refer to a node or entity.
    * If the optional `above` parameter is true and the `pointed_thing` refers
      to a node, then it will return the `above` position of the `pointed_thing`.
]]
---@nodiscard
---@param pointed_thing core.PointedThing.nothing
---@param above boolean?
---@return nil
function core.get_pointed_thing_position(pointed_thing, above) end

--[[
* `core.get_pointed_thing_position(pointed_thing, above)`
    * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
      does not refer to a node or entity.
    * If the optional `above` parameter is true and the `pointed_thing` refers
      to a node, then it will return the `above` position of the `pointed_thing`.
]]
---@nodiscard
---@param pointed_thing core.PointedThing.node
---@param above boolean?
---@return ivec
function core.get_pointed_thing_position(pointed_thing, above) end

--[[
* `core.get_pointed_thing_position(pointed_thing, above)`
    * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
      does not refer to a node or entity.
    * If the optional `above` parameter is true and the `pointed_thing` refers
      to a node, then it will return the `above` position of the `pointed_thing`.
]]
---@nodiscard
---@param pointed_thing core.PointedThing.object
---@param above boolean?
---@return vec
function core.get_pointed_thing_position(pointed_thing, above) end

--[[
Converts a vector to a facedir value, used in `param2` for `paramtype2 = "facedir"`.

* `is6d`: if truthy, the y component is taken into account.
]]
---@nodiscard
---@param dir vector
---@param is6d boolean?
---@return core.Param2.facedir
function core.dir_to_facedir(dir, is6d) end

--[[
Converts a facedir back into a vector aimed directly out the "back" of a node.
]]
---@nodiscard
---@param facedir core.Param2.facedir
---@return ivec
function core.facedir_to_dir(facedir) end

--[[
Converts a vector to a 4dir value, used in `param2` for `paramtype2 = "4dir"`.
]]
---@nodiscard
---@param dir vector
---@return core.Param2.4dir
function core.dir_to_fourdir(dir) end

--[[
Converts a 4dir back into a vector aimed directly out the "back" of a node.
]]
---@nodiscard
---@param fourdir core.Param2.4dir
---@return ivec
function core.fourdir_to_dir(fourdir) end

--[[
Converts a vector to a wallmounted value, used for `paramtype2 = "wallmounted"`.
]]
---@nodiscard
---@param dir vector
---@return core.Param2.wallmounted
function core.dir_to_wallmounted(dir) end

--[[
Converts a wallmounted value back into a vector aimed directly out the "back" of a node.
]]
---@nodiscard
---@param wallmounted core.Param2.wallmounted
---@return ivec
function core.wallmounted_to_dir(wallmounted) end

--[[
Converts a vector into a yaw (angle, radians).
]]
---@nodiscard
---@param dir vector
---@return number
function core.dir_to_yaw(dir) end

--[[
Converts a yaw (angle) to a vector.
]]
---@nodiscard
---@param yaw number
---@return vec
function core.yaw_to_dir(yaw) end

--[[
Removes everything but the color information from the given `param2` value.
Returns `nil` if the given `paramtype2` does not contain color information.
]]
---@nodiscard
---@param param2 core.Param2
---@param paramtype2 core.NodeDef.paramtype2.color
---@return core.Param2
function core.strip_param2_color(param2, paramtype2) end

--[[
Removes everything but the color information from the given `param2` value.
Returns `nil` if the given `paramtype2` does not contain color information.
]]
---@nodiscard
---@param param2 core.Param2
---@param paramtype2 string
---@return nil
function core.strip_param2_color(param2, paramtype2) end

--[[
Returns the list of itemstrings dropped by `node` when dug with the item `toolname`
(not limited to tools). The default implementation does not use `tool`, `digger` and
`pos`, but `core.node_dig` provides them (since 5.12.0) for games/mods implementing
custom drops.

* `node`: node as table or node name
* `toolname`: name of the item used to dig (can be `nil`)
* `tool`: `ItemStack` used to dig (can be `nil`)
* `digger`: the ObjectRef that digs the node (can be `nil`)
* `pos`: position of the dug node (can be `nil`)
]]
---@nodiscard
---@param node core.Node.name|core.Node.set
---@param toolname core.Tool.name?
---@param tool core.ItemStack?
---@param digger core.ObjectRef?
---@param pos ivector?
---@return core.Item.stringfmt[]
function core.get_node_drops(node, toolname, tool, digger, pos) end

--[[ core.get_craft_result() .. core.get_all_craft_recipes() split off into ./craft_result.lua ]]--

--[[
* `core.handle_node_drops(pos, drops, digger)`
    * `drops`: list of itemstrings
    * Handles drops from nodes after digging: Default action is to put them
      into digger's inventory.
    * Can be overridden to get different functionality (e.g. dropping items on
      ground)
]]
---@param pos ivector
---@param drops core.Item.stringfmt[]
---@param digger core.ObjectRef
function core.handle_node_drops(pos, drops, digger) end

--[[
* `core.itemstring_with_palette(item, palette_index)`: returns an item
  string.
    * Creates an item string which contains palette index information
      for hardware colorization. You can use the returned string
      as an output in a craft recipe.
    * `item`: the item stack which becomes colored. Can be in string,
      table and native form.
    * `palette_index`: this index is added to the item stack
]]
---@nodiscard
---@param item core.Item
---@param palette_index int
---@return core.Item.stringfmt
function core.itemstring_with_palette(item, palette_index) end

--[[
* `core.itemstring_with_color(item, colorstring)`: returns an item string
    * Creates an item string which contains static color information
      for hardware colorization. Use this method if you wish to colorize
      an item that does not own a palette. You can use the returned string
      as an output in a craft recipe.
    * `item`: the item stack which becomes colored. Can be in string,
      table and native form.
    * `colorstring`: the new color of the item stack
]]
---@param item core.Item
---@param colorstring core.ColorString
---@return core.Item.stringfmt
function core.itemstring_with_color(item, colorstring) end