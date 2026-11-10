---@meta _

-- luanti/doc/lua_api.md: Class reference > `PcgRandom`

-- ------------------------------- constructor ------------------------------ --

--[[
* `PcgRandom(seed, [seq])`: constructor
    * `seed`: integer seed in the [ulua] range
    * `seq`: optional integer sequence, each integer in the [ulua] range
]]
---@nodiscard
---@param seed int
---@param seq int[]?
---@return core.PcgRandom
function PcgRandom(seed, seq) end

-- -------------------------------- PcgRandom ------------------------------- --

--[[
`PcgRandom`
-----------

A 32-bit pseudorandom number generator.
Uses PCG32, an algorithm of the permuted congruential generator family,
offering very strong randomness.
]]
---@class core.PcgRandom
PcgRandom = {}

--[[
* `next()`: return next random integer number [s32]
]]
---@nodiscard
---@return int
function PcgRandom:next() end

--[[
* `next(min, max)`: return next integer random number [`min`...`max`]
]]
---@nodiscard
---@param min int
---@param max int
---@return int
function PcgRandom:next(min, max) end

--[[
* `rand_normal_dist(min, max, num_trials=6)`: return normally distributed
  random number [`min`...`max`].
    * This is only a rough approximation of a normal distribution with:
    * `mean = (max - min) / 2`, and
    * `variance = (((max - min + 1) ^ 2) - 1) / (12 * num_trials)`
    * Increasing `num_trials` improves accuracy of the approximation
]]
---@nodiscard
---@param min int
---@param max int
---@param num_trials int?
---@return int
function PcgRandom:rand_normal_dist(min, max, num_trials) end

--[[
* `get_state()`: return generator state encoded in string
]]
---@nodiscard
---@return string state
function PcgRandom:get_state() end

--[[
* `set_state(state_string)`: restore generator state from encoded string
]]
---@param state string
function PcgRandom:set_state(state) end