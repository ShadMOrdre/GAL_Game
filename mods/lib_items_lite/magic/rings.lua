--
-- Rings
--

minetest.register_tool("magic:ring_diamond_gold", {
	description = "Ring of Flying",
	inventory_image = "rings_diamond_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("gold", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_topaz_gold", {
	description = "Ring of Healing",
	inventory_image = "rings_topaz_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("indigo", user, pointed_thing) then
			itemstack:add_wear(65535/36)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_ruby_gold", {
	description = "Ring of Protection",
	inventory_image = "rings_ruby_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("red", user, pointed_thing) then
			itemstack:add_wear(65535/12)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_saphire_gold", {
	description = "Ring of Water Breathing",
	inventory_image = "rings_saphire_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("cyan", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_emerald_gold", {
	description = "Ring of Transmutation",
	inventory_image = "rings_emerald_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("green", user, pointed_thing) then
			itemstack:add_wear(65535/18)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_amethyst_gold", {
	description = "Ring of Time",
	inventory_image = "rings_amethyst_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("magenta", user, pointed_thing) then
			itemstack:add_wear(65535/2436)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_diamond_silver", {
	description = "Ring of Flying",
	inventory_image = "rings_diamond_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("gold", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_topaz_silver", {
	description = "Ring of Healing",
	inventory_image = "rings_topaz_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("indigo", user, pointed_thing) then
			itemstack:add_wear(65535/36)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_ruby_silver", {
	description = "Ring of Protection",
	inventory_image = "rings_ruby_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("red", user, pointed_thing) then
			itemstack:add_wear(65535/12)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_saphire_silver", {
	description = "Ring of Water Breathing",
	inventory_image = "rings_saphire_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("cyan", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_emerald_silver", {
	description = "Ring of Transmutation",
	inventory_image = "rings_emerald_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("green", user, pointed_thing) then
			itemstack:add_wear(65535/18)
		end
	return itemstack
	end,
})

minetest.register_tool("magic:ring_amethyst_silver", {
	description = "Ring of Time",
	inventory_image = "rings_amethyst_silver.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("magenta", user, pointed_thing) then
			itemstack:add_wear(65535/2436)
		end
	return itemstack
	end,
})
