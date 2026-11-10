---@meta _

-- luanti/doc/lua_api.md: Fractal Value Noise
-- luanti/doc/lua_api.md: Flag Specifier Format

-- ---------------------------- NoiseParams.flags --------------------------- --

--[[
Table form of the noise flags (Flag Specifier Format): flag names mapped to
booleans. A field prefixed with `"no"` mapped to any boolean unsets the flag.
Leave `flags` unset for no special handling.
]]
---@class core.NoiseParams.flags.tablefmt
--[[
Keep auto-selection of eased/not-eased while specifying some other flags.
]]
---@field defaults boolean?
--[[
Explicitly clears `defaults`.
]]
---@field nodefaults boolean?
--[[
Maps noise gradient values onto a quintic S-curve before performing
interpolation, resulting in smooth, rolling noise. If no flags are specified
(or `defaults` is), 2D noise is eased and 3D noise is not eased. Easing a 3D
noise significantly increases the noise calculation load, so use with
restraint.
]]
---@field eased boolean?
--[[
Disables easing for sharp-looking noise with a slightly gridded
appearance.
]]
---@field noeased boolean?
--[[
The absolute value of each octave's noise variation is used when combining
the octaves:

`noise = offset + scale * (abs(octave1) + abs(octave2) * persistence + abs(octave3) * persistence ^ 2 + ...)`
]]
---@field absvalue boolean?
--[[
Explicitly clears `absvalue`.
]]
---@field noabsvalue boolean?

--[[
String form of the noise flags: a comma-delimited set of flag names, e.g.
`"defaults, absvalue"`. A flag prefixed with `"no"` explicitly clears it.
]]
---@alias core.NoiseParams.flags.stringfmt string

--[[
Noise flags in table or string form. Supported: `defaults`, `eased`, `absvalue`.
]]
---@alias core.NoiseParams.flags
--- | core.NoiseParams.flags.tablefmt
--- | core.NoiseParams.flags.stringfmt

-- --------------------------- NoiseParams.__base --------------------------- --

---@class _.NoiseParams.__base
--[[
After the multiplication by `scale` this is added to the result and is the final
step in creating the noise value.
Can be positive or negative.
]]
---@field offset number
--[[
Once all octaves have been combined, the result is multiplied by this.
Can be positive or negative.
]]
---@field scale number
--[[
This is a whole number that determines the entire pattern of the noise
variation. Altering it enables different noise patterns to be created.
With other parameters equal, different seeds produce different noise patterns
and identical seeds produce identical noise patterns.

For this parameter you can randomly choose any whole number. Usually it is
preferable for this to be different from other seeds, but sometimes it is useful
to be able to create identical noise patterns.

In some noise APIs the world seed is added to the seed specified in noise
parameters. This is done to make the resulting noise pattern vary in different
worlds, and be 'world-specific'.
]]
---@field seed int
--[[
The number of simple noise generators that are combined.
A whole number, 1 or more.
Each additional octave adds finer detail to the noise but also increases the
noise calculation load.
3 is a typical minimum for a high quality, complex and natural-looking noise
variation. 1 octave has a slight 'gridlike' appearance.

Choose the number of octaves according to the `spread` and `lacunarity`, and the
size of the finest detail you require. For example:
if `spread` is 512 nodes, `lacunarity` is 2.0 and finest detail required is 16
nodes, octaves will be 6 because the 'wavelengths' of the octaves will be
512, 256, 128, 64, 32, 16 nodes.
Warning: If the 'wavelength' of any octave falls below 1 an error will occur.
]]
---@field octaves int
--[[
Each additional octave has an amplitude that is the amplitude of the previous
octave multiplied by `persistence`, to reduce the amplitude of finer details,
as is often helpful and natural to do so.
Since this controls the balance of fine detail to large-scale detail
`persistence` can be thought of as the 'roughness' of the noise.

A positive or negative non-zero number, often between 0.3 and 1.0.
A common medium value is 0.5, such that each octave has half the amplitude of
the previous octave.
This may need to be tuned when altering `lacunarity`; when doing so consider
that a common medium value is 1 / lacunarity.

Instead of `persistence`, the key `persist` may be used to the same effect.
]]
---@field persistence number?
--[[
Alias of `persistence`.
]]
---@field persist number?
--[[
Each additional octave has a 'wavelength' that is the 'wavelength' of the
previous octave multiplied by 1 / lacunarity, to create finer detail.
'lacunarity' is often 2.0 so 'wavelength' often halves per octave.

A positive number no smaller than 1.0.
Values below 2.0 create higher quality noise at the expense of requiring more
octaves to cover a particular range of 'wavelengths'.
]]
---@field lacunarity number?
--[[
Leave this field unset for no special handling.
Currently supported are `defaults`, `eased` and `absvalue`:
]]
---@field flags core.NoiseParams.flags?

-- ------------------------------- NoiseParams ------------------------------ --

--[[
### Format example

For 2D or 3D value noise or value noise maps:

```lua
np_terrain = {
    offset = 0,
    scale = 1,
    spread = {x = 500, y = 500, z = 500},
    seed = 571347,
    octaves = 5,
    persistence = 0.63,
    lacunarity = 2.0,
    flags = "defaults, absvalue",
}
```

For 2D noise the Z component of `spread` is still defined but is ignored.
A single noise parameter table can be used for 2D or 3D noise.
]]
---@class core.NoiseParams.3d : _.NoiseParams.__base
--[[
For octave1, this is roughly the change of input value needed for a very large
variation in the noise value generated by octave1. It is almost like a
'wavelength' for the wavy noise variation.
Each additional octave has a 'wavelength' that is smaller than the previous
octave, to create finer detail. `spread` will therefore roughly be the typical
size of the largest structures in the final noise variation.

`spread` is a vector with values for x, y, z to allow the noise variation to be
stretched or compressed in the desired axes.
Values are positive numbers.
]]
---@field spread ivector

--[[
Noise parameters for 2D noise. The Z component of `spread` is still defined
but is ignored; a single noise parameter table can be used for 2D or 3D
noise.
]]
---@alias core.NoiseParams.2d core.NoiseParams.3d

--[[
Parameters of fractal value noise (2D or 3D): see `core.NoiseParams.3d` and
`core.NoiseParams.2d`.
]]
---@alias core.NoiseParams
--- | core.NoiseParams.2d
--- | core.NoiseParams.3d