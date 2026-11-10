---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Utilities

-- -------------------------------- GameInfo -------------------------------- --

--[[
Information about the current game. Other meta information (e.g. version or
release number) can be read manually from `game.conf` in the game's root
directory.
]]
---@class core.GameInfo
--[[
Game id.
]]
---@field id string
--[[
Game title.
]]
---@field title string
--[[
Game author.
]]
---@field author string
--[[
Root directory of the game.
]]
---@field path core.Path

-- ---------------------------- core.* functions ---------------------------- --

--[[
Returns a table containing information about the current game.
Unofficial: Path is the root directory of the game, useful if you are looking for it
]]
---@nodiscard
---@return core.GameInfo
function core.get_game_info() end