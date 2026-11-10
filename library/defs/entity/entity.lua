---@meta _

-- luanti/doc/lua_api.md: Registered entities
-- luanti/doc/lua_api.md: Definition tables > Entity definition

--[[
Registered entity name, e.g. `"mod:thing"`.
]]
---@alias core.Entity.name string

--[[
Registered entity name, or an armor group.
]]
---@alias core.Entity.namelike
--- | core.Groups.armor
--- | core.Entity.name

-- -------------------------------- EntityDef ------------------------------- --

--[[
Called when the object is instantiated.
`staticdata` is the string returned by `get_staticdata` when the entity was
last saved. `dtime_s` is the time passed since the object was unloaded, which
can be used for updating the entity state.
]]
---@alias core.EntityDef.on_activate fun(self:core.Entity, staticdata:string, dtime_s:number)

--[[
Called when the object is about to get removed or unloaded.
`removal` indicates whether the object is about to get removed. Calling
`object:remove()` on an active object will call this with `removal=true`.
The mapblock the entity resides in being unloaded will call this with
`removal=false`.
Note that this won't be called if the object hasn't been activated in the
first place. In particular, `core.clear_objects({mode = "full"})` won't call
this, whereas `core.clear_objects({mode = "quick"})` might call this.
]]
---@alias core.EntityDef.on_deactivate fun(self:core.Entity, removal:boolean)

--[[
Called on every server tick, after movement and collision processing.
`dtime` is the elapsed time since last call. `moveresult` is a table with
collision info (only available if `physical=true`).
]]
---@alias core.EntityDef.on_step fun(self:core.Entity, dtime:number, moveresult:core.Entity.moveresult?)

--[[
Called when somebody punches the object.
You probably want to handle most punches using the automatic armor group
system.

* `puncher`: can be `nil`.
* `time_from_last_punch`: meant for disallowing spamming of clicks (can be
  `nil`).
* `tool_capabilities`: capability table of used item.
* `dir`: unit vector of direction of punch. Always defined. Points from the
  puncher to the punched.
* `damage`: damage that will be done to entity (integer).

Can return `true` to prevent the default damage mechanism.
]]
---@alias core.EntityDef.on_punch fun(self:core.Entity, puncher:core.EntityRef?, time_from_last_punch:number?, tool_capabilities:core.ToolCapabilities?, dir:vector, damage:int):boolean?

--[[
Called when the object dies. `killer` can be `nil`.
]]
---@alias core.EntityDef.on_death fun(self:core.Entity, killer:core.EntityRef?)

--[[
Called when `clicker` pressed the 'place/use' key while pointing to the
object (not necessarily an actual rightclick). `clicker` may or may not be a
player.
]]
---@alias core.EntityDef.on_rightclick fun(self:core.Entity, clicker:core.EntityRef)

--[[
Called after another object is attached to this object.
]]
---@alias core.EntityDef.on_attach_child fun(self:core.Entity, child:core.EntityRef)

--[[
Called after another object has detached from this object.
]]
---@alias core.EntityDef.on_detach_child fun(self:core.Entity, child:core.EntityRef)

--[[
Called after detaching from another object (`parent` is where it got
detached from). Also called before removal from the world.
]]
---@alias core.EntityDef.on_detach fun(self:core.Entity, parent:core.EntityRef)

--[[
Should return a string that will be passed to `on_activate` when the object
is instantiated the next time.
]]
---@alias core.EntityDef.get_staticdata fun(self:core.Entity):string

--[[
Entity definition

Used by `core.register_entity`. The definition table becomes a metatable of a
newly created per-entity luaentity table, meaning its fields (e.g.
`initial_properties`) will be shared between all instances of an entity.
Arbitrary member variables can be defined using a `_` prefix. See "Registered
entities" for explanations of the callbacks.
]]
---@class core.EntityDef
--[[
A table of object properties, see the `Object properties` section.
The properties in this table are applied to the object once when it is
spawned.
]]
---@field initial_properties core.ObjectProperties.set? Engine defaults apply when omitted
--[[
See `core.EntityDef.on_activate`.
]]
---@field on_activate core.EntityDef.on_activate?
--[[
See `core.EntityDef.on_deactivate`.
]]
---@field on_deactivate core.EntityDef.on_deactivate?
--[[
See `core.EntityDef.on_step`.
]]
---@field on_step core.EntityDef.on_step?
--[[
See `core.EntityDef.on_punch`.
]]
---@field on_punch core.EntityDef.on_punch?
--[[
See `core.EntityDef.on_death`.
]]
---@field on_death core.EntityDef.on_death?
--[[
See `core.EntityDef.on_rightclick`.
]]
---@field on_rightclick core.EntityDef.on_rightclick?
--[[
See `core.EntityDef.on_attach_child`.
]]
---@field on_attach_child core.EntityDef.on_attach_child?
--[[
See `core.EntityDef.on_detach_child`.
]]
---@field on_detach_child core.EntityDef.on_detach_child?
--[[
See `core.EntityDef.on_detach`.
]]
---@field on_detach core.EntityDef.on_detach?
--[[
See `core.EntityDef.get_staticdata`.
]]
---@field get_staticdata core.EntityDef.get_staticdata?

-- --------------------------------- Entity --------------------------------- --

--[[
Functions receive a "luaentity" table as `self`:

* It has the member `name`, which is the registered name `("mod:thing")`
* It has the member `object`, which is an `core.EntityRef` pointing to the object
* The original prototype is visible directly via a metatable
]]
---@class core.Entity : core.EntityDef
--[[
Shared with the entity definition (via metatable), see `core.EntityDef`.
]]
---@field initial_properties core.ObjectProperties.set? Engine defaults apply when omitted
--[[
The registered name, e.g. `"mod:thing"`.
]]
---@field  name core.Entity.name
--[[
The object this luaentity belongs to.
]]
---@field  object core.EntityRef