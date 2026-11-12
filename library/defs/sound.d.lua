---@meta _

-- luanti/doc/lua_api.md: Sounds

--[[
Table form of a `SimpleSoundSpec`: specifies a sound name, gain (=volume),
pitch and fade. `gain`, `pitch` and `fade` are optional and default to `1.0`,
`1.0` and `0.0`. Only Ogg Vorbis files are supported; positional sounds need
single-channel (mono) files.
]]
---@class core.SimpleSoundSpec.tablefmt
--[[
Sound-group name. If `""`, no sound is played. A sound group is the set of
all sound files named `<sound-group name>[.<single digit>].ogg`; one of them
is chosen at random when played. Sound files can only be referred to by their
sound-group name.
]]
---@field name string
--[[
Volume (`1.0` = 100%), must be non-negative. OpenAL clamps sound gain to a
maximum of `1.0`; setting a higher gain for a positional sound increases the
radius inside which maximal gain is reached. Gain of positional sounds doesn't
increase inside a 1 node radius. The gain given here describes the gain at a
distance of 3 nodes.
]]
---@field gain number?
--[[
Applies a pitch-shift to the sound. Each factor of `2.0` results in a
pitch-shift of +12 semitones. Must be positive.
]]
---@field pitch number?
--[[
If > `0.0`, the sound is faded in, with this value in gain per second, until `gain` is reached.
]]
---@field fade number?

--[[
String form of a `SimpleSoundSpec`: just the sound name, or the empty string
for no sound.
]]
---@alias core.SimpleSoundSpec.stringfmt string

--[[
Specifies a sound name, gain (=volume), pitch and fade. Either a string (the
sound name, `""` for no sound) or a table. An empty table `{}` also plays no
sound.
]]
---@alias core.SimpleSoundSpec
--- | core.SimpleSoundSpec.tablefmt
--- | core.SimpleSoundSpec.stringfmt

--[[
Sound parameter table: specifies how a sound is played. Only one of `pos` /
`object` and only one of `to_player` / `exclude_player` can be used.
]]
---@class core.SoundParameter
--[[
Scales the gain specified in the `SimpleSoundSpec`.
]]
---@field gain number?
--[[
Overwrites the pitch specified in the `SimpleSoundSpec`.
]]
---@field pitch number?
--[[
Overwrites the fade specified in the `SimpleSoundSpec`.
]]
---@field fade number?
--[[
Start with a time-offset into the sound, as if the sound was already playing
for this many seconds. Negative values are relative to the sound's length, so
the sound reaches its end in `-start_time` seconds. Unspecified what happens
if `loop` is false and `start_time` is smaller than minus the sound's length.
Available since feature `sound_params_start_time`.
]]
---@field start_time number?
--[[
If true, the sound is played in a loop.
]]
---@field loop boolean?
--[[
Play the sound at a position. Can't be used together with `object`.
]]
---@field pos vector?
--[[
Attach the sound to an object. Can't be used together with `pos`.
]]
---@field object core.ObjectRef?
--[[
Only play for this player. Can't be used together with `exclude_player`.
]]
---@field to_player string?
--[[
Don't play the sound for this player. Can't be used together with `to_player`.
]]
---@field exclude_player string?
--[[
Only play for players that are at most this far away when the sound starts
playing. Needs `pos` or `object` to be set. Default: `32`.
]]
---@field max_hear_distance number?