---@meta _

-- luanti/doc/lua_api.md: 'core' namespace reference > Server

-- --------------------------- DynamicMediaOptions -------------------------- --

--[[
Options for `core.dynamic_add_media`.

Exactly one of `filepath` or `filedata` must be given.
Variants: `core.DynamicMediaOptions.filepath`, `core.DynamicMediaOptions.filedata`.
]]
---@class _.DynamicMediaOptions.__base
--[[
Name of the player the media should be sent to instead of all players.
Cannot be used when calling at startup time.
]]
---@field to_player string?
--[[
If true, the server creates a copy of the file and forgets about it once
delivered. Default: `false`.
Cannot be used when calling at startup time.
]]
---@field ephemeral boolean?
--[[
Hint whether the client should save the media in its cache.
Default: `not ephemeral`. Added in 5.14.0.
]]
---@field client_cache boolean?

--[[
Options when sending a file from the filesystem.
]]
---@class core.DynamicMediaOptions.filepath : _.DynamicMediaOptions.__base
--[[
Name the media file will be usable as. Optional when `filepath` is present
(`filename` and `filedata` support requires feature `dynamic_add_media_filepath`, 5.9.0).
]]
---@field filename string?
--[[
Path to the file on the filesystem.
]]
---@field filepath core.Path

--[[
Options when sending a file from data in memory.
]]
---@class core.DynamicMediaOptions.filedata : _.DynamicMediaOptions.__base
--[[
Name the media file will be usable as.
]]
---@field filename string
--[[
The data of the file to be sent.
]]
---@field filedata string

--[[
Options table for `core.dynamic_add_media`. Provide either `filepath` or
`filedata`, not both.
(table options require feature `dynamic_add_media_table`, 5.5.0)
]]
---@alias core.DynamicMediaOptions
--- | core.DynamicMediaOptions.filepath
--- | core.DynamicMediaOptions.filedata

-- ---------------------------- core.* functions ---------------------------- --

--[[
Called for every player as soon as the media is available on that client.
`name` is the player name.
]]
---@alias core.fn.dynamic_add_media fun(name:string):boolean

--[[
Pushes the specified media file to client(s). The file must be a supported
image, sound or model format. Dynamically added media is not persisted
between server restarts.

Returns false on error, true if the request was accepted. `callback` is called
for every player as soon as the media is available on the client.

Notes:

* If `ephemeral` is false and `to_player` is unset, the file is added to the
  media sent to clients on startup, so it appears even on old clients
  (<5.3.0) if they rejoin.
* If `ephemeral` is false, the file must not be modified, deleted, moved or
  renamed after calling this function.
* Adding media files with the same name twice is not possible. Exception:
  `to_player` can send the same, already existent file to multiple chosen
  players (`ephemeral` false only).
* Can also be called at startup time. In that case `callback` MUST be `nil`
  and `ephemeral` / `to_player` cannot be used (feature
  `dynamic_add_media_startup`, 5.9.0).
* Clients attempt to fetch files added this way via remote media, which can
  make transfer of bigger files painless (if set up).
]]
---@param options core.DynamicMediaOptions
---@param callback core.fn.dynamic_add_media
function core.dynamic_add_media(options, callback) end