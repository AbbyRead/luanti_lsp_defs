---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Mod channels

--[[
* `core.mod_channel_join(channel_name)`
    * Server joins channel `channel_name`, and creates it if necessary. You
      should listen for incoming messages with
      `core.register_on_modchannel_message`.
    * This returns a [ModChannel](#modchannel) object.
]]
---@nodiscard
---@param channel_name string
---@return core.ModChannel
function core.mod_channel_join(channel_name) end