minetest.register_tool("magic:axe_diamond", {
	description = "Lightning Axe",
	inventory_image = "tool_axe_diamond.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.80, [2]=1.40, [3]=0.80}, uses=25, maxlevel=3},
			fleshy={times={[2]=1.00, [3]=0.50}, uses=100, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_tool("magic:axe_ruby", {
	description = "Flaming Axe",
	inventory_image = "tool_axe_ruby.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.00, [2]=0.50, [3]=0.25}, uses=100, maxlevel=3},
			fleshy={times={[2]=0.50, [3]=0.25}, uses=100, maxlevel=2}
		},
		damage_groups = {fleshy=7},
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_tool("magic:pick_diamond", {
	description = "Elven Pickaxe",
	inventory_image = "tool_pick_diamond.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.00, [2]=1.50, [3]=0.75}, uses=25, maxlevel=3}
		},
		damage_groups = {fleshy=5},
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_tool("magic:pick_ruby", {
	description = "Pickaxe of Fire",
	inventory_image = "tool_pick_ruby.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=2.00, [2]=0.50, [3]=0.25}, uses=100, maxlevel=3}
		},
		damage_groups = {fleshy=6},
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_tool("magic:sword_diamond", {
	description = "Lightning Sword",
	inventory_image = "tool_sword_diamond.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_tool("magic:sword_ruby", {
	description = "Flaming Sword",
	inventory_image = "tool_sword_ruby.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.70, [2]=0.70, [3]=0.23}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	groups = {not_in_creative_inventory = 1},
})

--
-- Staves
--

minetest.register_tool("magic:staff_diamond", {
	description = "Diamond Wand",
	inventory_image = "tool_staff_diamond.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("gold", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:staff_topaz", {
	description = "Topaz Wand",
	inventory_image = "tool_staff_topaz.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("indigo", user, pointed_thing) then
			itemstack:add_wear(65535/36)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:staff_ruby", {
	description = "Ruby Wand",
	inventory_image = "tool_staff_ruby.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("red", user, pointed_thing) then
			itemstack:add_wear(65535/12)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:staff_turquoise", {
	description = "Saphire Wand",
	inventory_image = "tool_staff_turquoise.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("cyan", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:staff_emerald", {
	description = "Emerald Wand",
	inventory_image = "tool_staff_emerald.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("green", user, pointed_thing) then
			itemstack:add_wear(65535/18)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:staff_amethyst", {
	description = "Amethyst Wand",
	inventory_image = "tool_staff_amethyst.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("magenta", user, pointed_thing) then
			itemstack:add_wear(65535/2436)
		end
	return itemstack
	end,
})

