-- crafts

minetest.register_node("prehistoric_life:volcanic_sand", {
	description = ("Volcanic Sand"),
	tiles = {"prehistoric_life_volcanic_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("prehistoric_life:dirt_with_pete_moss", {
	description = "Dirt with Pete Moss",
	tiles = {"prehistoric_life_pete_moss.png", "prehistoric_life_pete_moss_side.png"},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("prehistoric_life:river_rock", {
	description = "River Rock",
	tiles = {"prehistoric_life_river_rock.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})
