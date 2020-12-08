lib_tools.config = lib_tools.config or Settings(minetest.get_worldpath().."/lib_tools.conf")

local conf_table = lib_tools.config:to_table()

local defaults = {
	enable_mining_drill = "false",
	enable_mining_laser = "false",
	enable_flashlight = "true",
	enable_wind_mill = "false",
	enable_frames = "false",
	enable_corium_griefing = "false",
	enable_radiation_protection = "true",
	enable_entity_radiation_damage = "true",
	enable_longterm_radiation_damage = "true",
	enable_nuclear_reactor_digiline_selfdestruct = "false",
	enable_granite_generation = "true",
	enable_marble_generation = "true",
	enable_rubber_tree_generation = "true",
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		lib_tools.config:set(k, v)
	end
end

lib_tools.power_tools = {}

function lib_tools.register_power_tool(craftitem, max_charge)
	lib_tools.power_tools[craftitem] = max_charge
end

--- Fully charge RE chargeable item.
-- Must be defined early to reference in item definitions.
function lib_tools.refill_RE_charge(stack)
	local max_charge = lib_tools.power_tools[stack:get_name()]
	if not max_charge then return stack end
	lib_tools.set_RE_wear(stack, max_charge, max_charge)
	local meta = minetest.deserialize(stack:get_metadata()) or {}
	meta.charge = max_charge
	stack:set_metadata(minetest.serialize(meta))
	return stack
end

