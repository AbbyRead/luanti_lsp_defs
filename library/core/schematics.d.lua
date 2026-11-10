---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Schematics

--[[
Entry of the `probability_list` passed to `core.create_schematic`.
Several entries with the same `pos`: the last one is used. Entries with `pos`
outside the box formed by `p1` and `p2` are ignored.
]]
---@class core.Schematic.probability_list
--[[
Absolute coordinates of the node being modified.
]]
---@field pos ivector
--[[
* A probability value of `0` or `1` means that node will never appear
  (0% chance).
* A probability value of `254` or `255` means the node will always appear
  (100% chance).
* If the probability value `p` is greater than `1`, then there is a
  `(p / 256 * 100)` percent chance that node will appear when the schematic is
  placed on the map.
* Integer `0` to `255` encoding probability and per-node force-place.
  Probability has levels 0-127, then 128 may be added to encode force-place.
  For a probability stated as 0-255, divide by 2 and round down to get
  0-127, then add 128 to apply per-node force-place.
]]
---@field prob int

--[[
* `core.create_schematic(p1, p2, probability_list, filename, slice_prob_list)`
    * Create a schematic from the volume of map specified by the box formed by
      p1 and p2.
    * Apply the specified probability and per-node force-place to the specified
      nodes according to the `probability_list`.
        * Array of tables with fields `pos` and `prob`.
        * If `probability_list` equals `nil`, no probabilities are applied.
    * Apply the specified probability to the specified horizontal slices
      according to the `slice_prob_list`.
        * Array of tables with fields `ypos` and `prob`.
        * `ypos` is the y position of the slice, the lowest slice being
          `ypos = 0`.
        * Probability is specified in the same way as in `probability_list`.
        * If `slice_prob_list` equals `nil`, no slice probabilities are applied.
    * Saves schematic in the Luanti Schematic format to filename.
]]
---@param p1 ivector
---@param p2 ivector
---@param probability_list core.Schematic.probability_list[]?
---@param filename core.Path
---@param slice_prob_list core.SchematicDef.yslice_prob?
function core.create_schematic(p1, p2, probability_list, filename, slice_prob_list) end

--[[
Rotation of a placed schematic, as a string. If omitted, the schematic is not
rotated.
]]
---@alias core.Schematic.rotation
--- | "0"
--- | "90"
--- | "180"
--- | "270"
--- | "random"

--[[
`{["old_name"] = "convert_to", ...}`
]]
---@alias core.Schematic.replacements table<core.Node.name, core.Node.name>

--[[
* `core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)`
    * Place the schematic specified by schematic (see [Schematic specifier]) at
      `pos`.
    * `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
    * If the `rotation` parameter is omitted, the schematic is not rotated.
    * `replacements` = `{["old_name"] = "convert_to", ...}`
    * `force_placement` is a boolean indicating whether nodes other than `air`
      and `ignore` are replaced by the schematic.
    * Returns nil if the schematic could not be loaded.
    * **Warning**: Once you have loaded a schematic from a file, it will be
      cached. Future calls will always use the cached version and the
      replacement list defined for it, regardless of whether the file or the
      replacement list parameter have changed. The only way to load the file
      anew is to restart the server.
    * `flags` is a flag field with the available flags:
        * place_center_x
        * place_center_y
        * place_center_z
]]
---@param pos ivector
---@param schematic core.Schematic
---@param rotation core.Schematic.rotation?
---@param replacements core.Schematic.replacements?
---@param force_placement boolean?
---@param flags core.Schematic.flags?
---@return boolean?
function core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags) end

--[[
* `core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacement, force_placement, flags)`:
    * This function is analogous to core.place_schematic, but places a
      schematic onto the specified VoxelManip object `vmanip` instead of the
      map.
    * Returns false if any part of the schematic was cut-off due to the
      VoxelManip not containing the full area required, and true if the whole
      schematic was able to fit.
    * Returns nil if the schematic could not be loaded.
    * After execution, any external copies of the VoxelManip contents are
      invalidated.
    * `flags` is a flag field with the available flags:
        * place_center_x
        * place_center_y
        * place_center_z
]]
---@param vmanip core.VoxelManip
---@param pos ivector
---@param schematic core.Schematic
---@param rotation core.Schematic.rotation?
---@param replacements core.Schematic.replacements?
---@param force_placement boolean?
---@param flags core.Schematic.flags?
---@return boolean?
function core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacements, force_placement, flags) end

--[[
Options table for `core.serialize_schematic`.
]]
---@class core.SerializeSchematicOptions
--[[
If true and `format` is "lua", the generated Lua code has (X, Z) position
comments for every X row of the schematic data.
]]
---@field lua_use_comments boolean?
--[[
If a nonzero number and `format` is "lua", the generated Lua code uses that
many spaces as indentation instead of a tab character.
]]
---@field lua_num_indent_spaces int?

--[[
* `core.serialize_schematic(schematic, format, options)`
    * Return the serialized schematic specified by schematic
      (see [Schematic specifier])
    * in the `format` of either "mts" or "lua".
    * "mts" - a string containing the binary MTS data used in the MTS file
      format.
    * "lua" - a string containing Lua code representing the schematic in table
      format.
    * `options` is a table containing the following optional parameters:
        * If `lua_use_comments` is true and `format` is "lua", the Lua code
          generated will have (X, Z) position comments for every X row
          generated in the schematic data for easier reading.
        * If `lua_num_indent_spaces` is a nonzero number and `format` is "lua",
          the Lua code generated will use that number of spaces as indentation
          instead of a tab character.
]]
---@nodiscard
---@param schematic core.Schematic
---@param format "mts"|"lua"
---@param options core.SerializeSchematicOptions?
---@return string
function core.serialize_schematic(schematic, format, options) end

--[[
Options table for `core.read_schematic`.
]]
---@class core.ReadSchematicOptions
--[[
* `none`: no `write_yslice_prob` table is inserted.
* `low`: only probabilities that are not 254 or 255 are written in the
  `write_yslice_prob` table.
* `all`: write all probabilities to the `write_yslice_prob` table.
* The default is `all`; any invalid value is interpreted as `all`.
]]
---@field write_yslice_prob "none"|"low"|"all"?

--[[
* `core.read_schematic(schematic, options)`
    * Returns a Lua table representing the schematic (see: [Schematic specifier])
    * `schematic` is the schematic to read (see: [Schematic specifier])
    * `options` is a table containing the following optional parameters:
        * `write_yslice_prob`: string value:
            * `none`: no `write_yslice_prob` table is inserted,
            * `low`: only probabilities that are not 254 or 255 are written in
              the `write_yslice_prob` table,
            * `all`: write all probabilities to the `write_yslice_prob` table.
            * The default for this option is `all`.
            * Any invalid value will be interpreted as `all`.
]]
---@nodiscard
---@param schematic core.Schematic
---@param options core.ReadSchematicOptions?
---@return core.SchematicDef?
function core.read_schematic(schematic, options) end