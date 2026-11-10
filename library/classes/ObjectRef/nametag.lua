---@meta _

-- luanti/doc/lua_api.md: Class reference > `ObjectRef`

-- ---------------------------- NametagAttributes --------------------------- --

--[[
Nametag attributes as returned by `get_nametag_attributes()`.
A nametag is a HUD text rendered above the object.
]]
---@class core.NametagAttributes.get
--[[
Text of the nametag.
]]
---@field text string
--[[
Text color.
]]
---@field color core.ColorSpec.tablefmt
--[[
Background color of the nametag.
]]
---@field bgcolor core.ColorSpec.tablefmt

--[[
Attributes accepted by `set_nametag_attributes()`. Omitted fields keep their
current value.
]]
---@alias core.NametagAttributes.set
--- | core.NametagAttributes.get
--- | _.NametagAttributes.set

---@class _.NametagAttributes.set
--[[
Text of the nametag.
]]
---@field text string? Unset fields keep their current value
--[[
Text color.
]]
---@field color core.ColorSpec?
--[[
Background color of the nametag. `false` will cause the background to be set
automatically based on user settings. Default: `false`.
]]
---@field bgcolor core.ColorSpec|false?


-- ---------------------------- ObjectRef methods --------------------------- --

---@class _.ObjectRef.__base
local ObjectRefBase

--[[
* `get_nametag_attributes()`
    * returns a table with the attributes of the nametag of an object
    * a nametag is a HUD text rendered above the object
    * ```lua
      {
          text = "",
          color = {a=0..255, r=0..255, g=0..255, b=0..255},
          bgcolor = {a=0..255, r=0..255, g=0..255, b=0..255},
      }
      ```
]]
---@nodiscard
---@return  core.NametagAttributes.get attributes
function ObjectRefBase:get_nametag_attributes() end

--[[
* `set_nametag_attributes(attributes)`
    * sets the attributes of the nametag of an object
    * `attributes`:
      ```lua
      {
          text = "My Nametag",
          color = ColorSpec,
          -- ^ Text color
          bgcolor = ColorSpec or false,
          -- ^ Sets background color of nametag
          -- `false` will cause the background to be set automatically based on user settings
          -- Default: false
      }
      ```
]]
---@param attributes core.NametagAttributes.set
function ObjectRefBase:set_nametag_attributes(attributes) end