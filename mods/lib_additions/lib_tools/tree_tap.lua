
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local mesecons_materials = minetest.get_modpath("mesecons_materials")

minetest.register_tool("lib_tools:treetap", {
	description = S("Tree Tap"),
	inventory_image = "technic_tree_tap.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local pos = pointed_thing.under
		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return
		end
		local node = minetest.get_node(pos)
		local node_name = node.name
		if node_name ~= "lib_ecology:tree_rubber_trunk" then
			return
		end
		node.name = "lib_ecology:tree_rubber_trunk_empty"
		minetest.swap_node(pos, node)
		minetest.handle_node_drops(pointed_thing.above, {"lib_tools:raw_latex"}, user)
		if not lib_tools.creative_mode then
			local item_wear = tonumber(itemstack:get_wear())
			item_wear = item_wear + 819
			if item_wear > 65535 then
				itemstack:clear()
				return itemstack
			end
			itemstack:set_wear(item_wear)
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = "lib_tools:treetap",
	recipe = {
		{"pipeworks:tube_1", "group:wood",    "default:stick"},
		{"",               "default:stick", "default:stick"}
	},
})

minetest.register_craftitem("lib_tools:raw_latex", {
	description = S("Raw Latex"),
	inventory_image = "technic_raw_latex.png",
})

if mesecons_materials then
	minetest.register_craft({
		type = "cooking",
		recipe = "lib_tools:raw_latex",
		output = "mesecons_materials:glue",
	})
end

minetest.register_craftitem("lib_tools:rubber", {
	description = S("Rubber Fiber"),
	inventory_image = "technic_rubber.png",
})

minetest.register_abm({
	label = "Tools: tree tap",
	nodenames = {"lib_ecology:tree_rubber_trunk_empty"},
	interval = 60,
	chance = 15,
	action = function(pos, node)
		if minetest.find_node_near(pos, (moretrees and moretrees.leafdecay_radius) or 5, {"lib_ecology:tree_rubber_leaves"}) then
			node.name = "lib_ecology:tree_rubber_trunk"
			minetest.swap_node(pos, node)
		end
	end
})

