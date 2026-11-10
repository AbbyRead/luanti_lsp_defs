---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Item handling

--[[
Result of a recipe lookup where no recipe was found (`core.get_craft_recipe`):
`{ items = nil, width = 0 }`
]]
---@class core.CraftRecipe.unknown
--[[
Recipe method.
]]
---@field method "unknown"
--[[
Always `0` when no recipe was found.
]]
---@field width 0
--[[
`nil` when no recipe was found.
]]
---@field items nil

--[[
Input table for `core.get_craft_result` with method `"normal"`.
]]
---@alias core.CraftRecipe.normal.set
--- | core.CraftRecipe.normal.get
--- | _.CraftRecipe.normal.set

---@class _.CraftRecipe.normal.set
--[[
Craft method.
]]
---@field method "normal"
--[[
Width of the craft grid, for example `3`. If omitted, the grid width is derived by the engine.
]]
---@field width int?
--[[
Items in the craft grid, for example `{stack1, stack2, ..., stack9}`.
]]
---@field items SparseList<core.Item>

--[[
Normal (crafting grid) recipe as returned by the engine.
]]
---@class core.CraftRecipe.normal.get
--[[
Craft method.
]]
---@field method "normal"
--[[
Width of the craft grid or recipe, in range [0, N] (2 or 3 is used often).
`0` means shapeless recipe.
]]
---@field width int
--[[
Recipe item names or grid stacks. Empty ingredients (itemstring `""`) are
represented as `nil`, hence a sparse list.
]]
---@field items SparseList<core.Item>

--[[
Cooking recipe: a single input item, a single output item stack and a cooking
time. The engine implements nothing specific to cooking; it is retrieved through
`core.get_craft_result` for a consistent interface across games/mods.
]]
---@class core.CraftRecipe.cooking
--[[
Craft method.
]]
---@field method "cooking"
--[[
The single input item.
]]
---@field items SparseList<core.Item>

--[[
Fuel recipe: one input item and a burn time. Fuels have no output item.
]]
---@class core.CraftRecipe.fuel
--[[
Craft method.
]]
---@field method "fuel"
--[[
The single fuel item.
]]
---@field items SparseList<core.Item>

--[[
Any recipe form accepted as input by `core.get_craft_result`.
]]
---@alias core.CraftRecipe.set
--- | core.CraftRecipe.get
--- | core.CraftRecipe.normal.set
--- | core.CraftRecipe.cooking
--- | core.CraftRecipe.fuel

--[[
Any recipe form returned by `core.get_craft_recipe` for a found recipe, or by
`core.get_craft_result` as `decremented_input`.
]]
---@alias core.CraftRecipe.get
--- | core.CraftRecipe.normal.get
--- | core.CraftRecipe.cooking
--- | core.CraftRecipe.fuel

-- ----------------------- CraftingRecipe.with_output ----------------------- --

---@class _.CraftRecipe.with_output
--[[
String with item name and quantity, e.g. `"default:gold_ingot 9"`.
]]
---@field output core.Item.stringfmt

--[[
Recipe with no result (`core.get_all_craft_recipes` entries).
]]
---@class core.CraftRecipe.with_output.unknown : core.CraftRecipe.unknown, _.CraftRecipe.with_output

--[[
Normal recipe with its output.
]]
---@class core.CraftRecipe.with_output.normal : core.CraftRecipe.normal.get, _.CraftRecipe.with_output

--[[
Cooking recipe with its output.
]]
---@class core.CraftRecipe.with_output.cooking : core.CraftRecipe.cooking, _.CraftRecipe.with_output

--[[
Fuel recipe with its output (empty item name).
]]
---@class core.CraftRecipe.with_output.fuel : core.CraftRecipe.fuel, _.CraftRecipe.with_output

--[[
Any recipe entry returned by `core.get_all_craft_recipes`.
]]
---@alias core.CraftRecipe.with_output
--- | core.CraftRecipe.with_output.unknown
--- | core.CraftRecipe.with_output.normal
--- | core.CraftRecipe.with_output.cooking
--- | core.CraftRecipe.with_output.fuel

-- ------------------------------- CraftOutput ------------------------------ --

--[[
`output` of `core.get_craft_result` for `method = "normal"`.
]]
---@class core.CraftOutput.normal
--[[
`ItemStack`; if unsuccessful: empty `ItemStack`.
]]
---@field item core.ItemStack
--[[
List of replacement `ItemStack`s that couldn't be placed in
`decremented_input.items`. Replacements can be placed in `decremented_input`
if the stack of the replaced item has a count of 1.
]]
---@field replacements SparseList<core.ItemStack>

--[[
`output` of `core.get_craft_result` for `method = "cooking"`.
]]
---@class core.CraftOutput.cooking
--[[
`ItemStack`; if unsuccessful: empty `ItemStack`.
]]
---@field item core.ItemStack
--[[
List of replacement `ItemStack`s that couldn't be placed in
`decremented_input.items`.
]]
---@field replacements SparseList<core.ItemStack>
--[[
Cooking time (`cooktime`). If unsuccessful: `0`.
]]
---@field time number

--[[
`output` of `core.get_craft_result` for `method = "fuel"`. There is no output
item.
]]
---@class core.CraftOutput.fuel
--[[
List of replacement `ItemStack`s that couldn't be placed in
`decremented_input.items`.
]]
---@field replacements SparseList<core.ItemStack>
--[[
Burn time (`burntime`). If unsuccessful: `0`.
]]
---@field time number

--[[
`output` of `core.get_craft_result`, depending on `input.method`.
]]
---@alias core.CraftOutput
--- | core.CraftOutput.normal
--- | core.CraftOutput.cooking
--- | core.CraftOutput.fuel

-- ---------------------------- core.* functions ---------------------------- --

--[[
* `core.get_craft_result(input)`: returns `output, decremented_input`
    * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
    * `input.width` = for example `3`
    * `input.items` = for example
      `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
    * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
    * `output.time` = a number, if unsuccessful: `0`
    * `output.replacements` = List of replacement `ItemStack`s that couldn't be
      placed in `decremented_input.items`. Replacements can be placed in
      `decremented_input` if the stack of the replaced item has a count of 1.
    * `decremented_input` = like `input`
]]
---@nodiscard
---@param input core.CraftRecipe.normal.set
---@return core.CraftOutput.normal, core.CraftRecipe.normal.get
function core.get_craft_result(input) end

--[[
* `core.get_craft_result(input)`: returns `output, decremented_input`
    * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
    * `input.width` = for example `3`
    * `input.items` = for example
      `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
    * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
    * `output.time` = a number, if unsuccessful: `0`
    * `output.replacements` = List of replacement `ItemStack`s that couldn't be
      placed in `decremented_input.items`. Replacements can be placed in
      `decremented_input` if the stack of the replaced item has a count of 1.
    * `decremented_input` = like `input`
]]
---@nodiscard
---@param input core.CraftRecipe.cooking
---@return core.CraftOutput.cooking, core.CraftRecipe.cooking
function core.get_craft_result(input) end

--[[
* `core.get_craft_result(input)`: returns `output, decremented_input`
    * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
    * `input.width` = for example `3`
    * `input.items` = for example
      `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
    * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
    * `output.time` = a number, if unsuccessful: `0`
    * `output.replacements` = List of replacement `ItemStack`s that couldn't be
      placed in `decremented_input.items`. Replacements can be placed in
      `decremented_input` if the stack of the replaced item has a count of 1.
    * `decremented_input` = like `input`
]]
---@nodiscard
---@param input core.CraftRecipe.fuel
---@return core.CraftOutput.fuel, core.CraftRecipe.fuel
function core.get_craft_result(input) end

--[[
* `core.get_craft_recipe(output)`: returns a table
    * Returns the last registered recipe for the `output` item name
    * Return value:
        * No recipe found: `{ items = nil, width = 0 }`
        * Recipe found: see `core.get_all_craft_recipes` table values.
]]
---@nodiscard
---@param output core.Item.name
---@return core.CraftRecipe.get|core.CraftRecipe.unknown
function core.get_craft_recipe(output) end

--[[
* `core.get_all_craft_recipes(output)`: returns a table or `nil`
    * Returns an indexed table of all registered recipes which have the result `output`.
    * Returns `nil` if no recipe was found.
    * `output`: an item name, such as `"default:torch"`.
    * Returned table values:
        * `method`: 'normal' or 'cooking' or 'fuel'
        * `width`: in range [0, N] (2 or 3 is used often). 0 means shapeless recipe.
          Only valid for `method = "normal"`.
        * `items`: list of recipe item names.
          Empty ingredients (itemstring `""`) are represented as `nil`.
        * `output`: string with item name and quantity
        * `time` (for 'cooking' or 'fuel'): is `cooktime` or `burntime` (since 5.17.0)
        * `replacements`: see Crafting recipes (since 5.17.0)
    * Example result for `"default:gold_ingot"` with two recipes:
      ```lua
      {
          {
              method = "cooking", width = 3,
              output = "default:gold_ingot", items = {"default:gold_lump"},
          },
          {
              method = "normal", width = 1,
              output = "default:gold_ingot 9", items = {"default:goldblock"},
          }
      }
      ```
]]
---@nodiscard
---@param query_item core.Item.name
---@return core.CraftRecipe.with_output[]
function core.get_all_craft_recipes(query_item) end