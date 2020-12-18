--
-- Rings
--

minetest.register_tool("rings:diamond_gold", {
	description = "Diamond Ring",
	inventory_image = "rings_diamond_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("gold", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:topaz_gold", {
	description = "Topaz Ring",
	inventory_image = "rings_topaz_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("indigo", user, pointed_thing) then
			itemstack:add_wear(65535/36)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:ruby_gold", {
	description = "Ruby Ring",
	inventory_image = "rings_ruby_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("red", user, pointed_thing) then
			itemstack:add_wear(65535/12)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:saphire_gold", {
	description = "Saphire Ring",
	inventory_image = "rings_saphire_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("cyan", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:emerald_gold", {
	description = "Emerald Ring",
	inventory_image = "rings_emerald_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("green", user, pointed_thing) then
			itemstack:add_wear(65535/18)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:amethyst_gold", {
	description = "Amethyst Ring",
	inventory_image = "rings_amethyst_gold.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("magenta", user, pointed_thing) then
			itemstack:add_wear(65535/2436)
		end
	return itemstack
	end,
})

minetest.register_craft({
	output = 'rings:diamond_gold',
	recipe = {
		{'mineral:diamond_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:topaz_gold',
	recipe = {
		{'mineral:topaz_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:ruby_gold',
	recipe = {
		{'mineral:ruby_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:saphire_gold',
	recipe = {
		{'mineral:saphire_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:emerald_gold',
	recipe = {
		{'mineral:emerald_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:amethyst_gold',
	recipe = {
		{'mineral:amethyst_gem'},
		{'mineral:gold_ingot'},
	}
})

minetest.register_tool("rings:diamond_silver", {
	description = "Diamond Ring",
	inventory_image = "rings_diamond_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("gold", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:topaz_silver", {
	description = "Topaz Ring",
	inventory_image = "rings_topaz_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("indigo", user, pointed_thing) then
			itemstack:add_wear(65535/36)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:ruby_silver", {
	description = "Ruby Ring",
	inventory_image = "rings_ruby_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("red", user, pointed_thing) then
			itemstack:add_wear(65535/12)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:saphire_silver", {
	description = "Saphire Ring",
	inventory_image = "rings_saphire_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("cyan", user, pointed_thing) then
			itemstack:add_wear(65535/24)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:emerald_silver", {
	description = "Emerald Ring",
	inventory_image = "rings_emerald_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("green", user, pointed_thing) then
			itemstack:add_wear(65535/18)
		end
	return itemstack
	end,
})

minetest.register_tool("rings:amethyst_silver", {
	description = "Amethyst Ring",
	inventory_image = "rings_amethyst_silver.png",
	on_use = function(itemstack, user, pointed_thing)
		if magic:shoot_ray("magenta", user, pointed_thing) then
			itemstack:add_wear(65535/2436)
		end
	return itemstack
	end,
})

minetest.register_craft({
	output = 'rings:diamond_silver',
	recipe = {
		{'mineral:diamond_gem'},
		{'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:topaz_silver',
	recipe = {
		{'mineral:topaz_gem'},
		{'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:ruby_silver',
	recipe = {
		{'mineral:ruby_gem'},
		{'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:saphire_silver',
	recipe = {
		{'mineral:saphire_gem'},
		{'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:emerald_silver',
	recipe = {
		{'mineral:emerald_gem'},
		{'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'rings:amethyst_silver',
	recipe = {
		{'mineral:amethyst_gem'},
		{'mineral:silver_ingot'},
	}
})
