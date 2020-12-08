minetest.register_tool("medieval:sickle_wood", {
	description = "Wooden sickle",
	inventory_image = "medieval_medieval_sickle_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[2]=0.4, [3]=0.3}, uses=10, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("medieval:sickle_stone", {
	description = "Stone sickle",
	inventory_image = "medieval_medieval_sickle_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[2]=0.2, [3]=0.2}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("medieval:sickle_steel", {
	description = "Steel sickle",
	inventory_image = "medieval_medieval_sickle_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[2]=0.1, [3]=0.1}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("medieval:fish", {
	description = "<0{{{{{><(",
	inventory_image = "medieval_fish.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
			fleshy = {times={[2]=0.6, [3]=0.5}, uses=80, maxlevel=1}
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_craft({
	output = 'medieval:sickle_wood',
	recipe = {
		{'group:wood', '', 'group:wood'},
		{'', 'group:wood', 'default:stick'},
		{'', '', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'medieval:sickle_stone',
	recipe = {
		{'group:stone', '', 'group:stone'},
		{'', 'group:stone', 'default:stick'},
		{'', '', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'medieval:sickle_steel',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', 'default:stick'},
		{'', '', 'default:stick'},
	}
})
