--local rope = {}

-- Code by Mirko K. (modified by Temperest, Wulfsdad and kilbith) (License: GPL).
minetest.register_on_punchnode(function(pos, oldnode, digger)
	if oldnode.name == "lib_tools:rope" then
		lib_tools.rope_remove(pos, oldnode, digger, "lib_tools:rope")
	end
end)

function lib_tools.rope_place(itemstack, placer, pointed_thing)
	if pointed_thing.type == "node" then
		local under = pointed_thing.under
		local above = pointed_thing.above
		local pos = above
		local oldnode = minetest.get_node(pos)
		local stackname = itemstack:get_name()
		if minetest.is_protected(pos, placer:get_player_name()) then return end

		while oldnode.name == "air" and not itemstack:is_empty() do
			local newnode = {name = stackname, param1 = 0}
			minetest.set_node(pos, newnode)
			itemstack:take_item()
			pos.y = pos.y - 1
			oldnode = minetest.get_node(pos)
		end
	end
	return itemstack
end

function lib_tools.rope_remove(pos, oldnode, digger, rope_name)
	local num = 0
	local below = {x=pos.x, y=pos.y, z=pos.z}
	local digger_inv = digger:get_inventory()

	while minetest.get_node(below).name == rope_name do
		minetest.remove_node(below)
		below.y = below.y - 1
		num = num + 1
	end
	if num == 0 then return end
	digger_inv:add_item("main", rope_name.." "..num)
	return true
end

lib_tools.register("rope", {
	description = "Rope",
	drawtype = "nodebox",
	tiles = {"castle_ropes.png"},
	paramtype = "light",
	walkable = false,
	climbable = true,
	groups = {dig_immediate=3, choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=3},
	-- tiles = {"lib_tools_rope.png"},
	-- inventory_image = "lib_tools_rope_inv.png",
	-- wield_image = "lib_tools_rope_inv.png",
	-- selection_box = lib_tools.pixelbox(8, {{3, 0, 3, 2, 8, 2}}),
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
	on_place = lib_tools.rope_place
})



minetest.register_node("lib_tools:rope_1m",{
	description = "Rope (1 meter length)",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=1},
	paramtype = "light",
	climbable = true,
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
})

minetest.register_craft({
	output = "lib_tools:rope_1m",
	recipe = {
		{"farming:string"},
		{"farming:string"},
		{"farming:string"},
	}
})

minetest.register_node("lib_tools:box_rope", {
	description = "Rope from Ropebox",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {not_in_creative_inventory=1},
	climbable = true,
	walkable = false,
	diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "lib_tools:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_node("lib_tools:ropebox", {
	description = "Ropebox",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropebox_top.png",
		"castle_ropebox_top.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_2.png",
		"castle_ropebox_side_2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	connects_to = { "lib_tools:box_rope" },
	groups = {choppy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16},
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16},
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16},
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16}
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "lib_tools:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = p1.x - placer_pos.x,
				y = p1.y - placer_pos.y,
				z = p1.z - placer_pos.z
			}
			param2 = minetest.dir_to_facedir(dir)
		end

		if p0.y-1 == p1.y then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end

		return minetest.item_place(itemstack, placer, pointed_thing, param2)
	end,
})

minetest.register_abm({
	nodenames = {"lib_tools:ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="lib_tools:box_rope"})
	end
})

minetest.register_abm({
	nodenames = {"lib_tools:box_rope"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="lib_tools:box_rope"})
	end
})

minetest.register_craft({
	output = "lib_tools:ropebox",
	recipe = {
		{"default:wood"},
		{"lib_tools:rope_1m"},
	}
})

