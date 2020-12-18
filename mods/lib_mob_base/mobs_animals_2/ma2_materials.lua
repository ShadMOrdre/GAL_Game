

local S = mobs_animals_2.intllib





minetest.register_craftitem("mobs_animals_2:fish_small_raw", {
	description = "Fish - Small Raw",
	inventory_image = "ma2_fish_small_item.png",
	on_use = minetest.item_eat(1)
})

minetest.register_craftitem("mobs_animals_2:fish_small_cooked", {
	description = "Fish - Small Cooked",
	inventory_image = "ma2_fish_small_cooked.png",
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	type = "cooking",
	output = "mobs_animals_2:fish_small_raw",
	recipe = "mobs_animals_2:fish_small_cooked",
	cooktime = 3,
})








-- raw meat
minetest.override_item("mobs:meat_raw", {
	inventory_image = "mobs_meat_raw.png",
})

-- cooked meat
minetest.override_item("mobs:meat", {
	inventory_image = "mobs_meat.png",
})

-- leather
minetest.override_item("mobs:leather", {
	inventory_image = "mobs_leather.png",
})

-- bucket of milk
minetest.register_craftitem(":mobs:bucket_milk", {
	description = S("Bucket of Milk"),
	inventory_image = "mobs_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
	groups = {food_milk = 1, flammable = 3},
})

-- glass of milk
minetest.register_craftitem(":mobs:glass_milk", {
	description = S("Glass of Milk"),
	inventory_image = "mobs_glass_milk.png",
	on_use = minetest.item_eat(2, 'vessels:drinking_glass'),
	groups = {food_milk_glass = 1, flammable = 3, vessel = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "mobs:glass_milk 4",
	recipe = {
		'vessels:drinking_glass', 'vessels:drinking_glass',
		'vessels:drinking_glass', 'vessels:drinking_glass',
		'mobs:bucket_milk'
	},
	replacements = { {"mobs:bucket_milk", "bucket:bucket_empty"} }
})

minetest.register_craft({
	type = "shapeless",
	output = "mobs:bucket_milk",
	recipe = {
		'mobs:glass_milk', 'mobs:glass_milk',
		'mobs:glass_milk', 'mobs:glass_milk',
		'bucket:bucket_empty'
	},
	replacements = { {"mobs:glass_milk", "vessels:drinking_glass 4"} }
})


-- butter
minetest.register_craftitem(":mobs:butter", {
	description = S("Butter"),
	inventory_image = "mobs_butter.png",
	on_use = minetest.item_eat(1),
	groups = {food_butter = 1, flammable = 2},
})

if minetest.get_modpath("farming") and farming and farming.mod then
minetest.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_milk", "farming:salt"},
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})
else -- some saplings are high in sodium so makes a good replacement item
minetest.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_milk", "default:sapling"},
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})
end

-- cheese wedge
minetest.register_craftitem(":mobs:cheese", {
	description = S("Cheese"),
	inventory_image = "mobs_cheese.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:cheese",
	recipe = "mobs:bucket_milk",
	cooktime = 5,
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node(":mobs:cheeseblock", {
	description = S("Cheese Block"),
	tiles = {"mobs_cheeseblock.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	--sounds = default.node_sound_dirt_defaults()
	sounds = gal.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "mobs:cheeseblock",
	recipe = {
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
	}
})

minetest.register_craft({
	output = "mobs:cheese 9",
	recipe = {
		{'mobs:cheeseblock'},
	}
})

