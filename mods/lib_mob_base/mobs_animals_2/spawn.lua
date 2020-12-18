
local S = mobs_animals_2.intllib


--function mobs:register_spawn(name, nodes, max_light, min_light, chance, active_object_count, max_height, day_toggle)


--ShadMOrdre's Mob Spawn function
local function register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)

	mobs:spawn_specific(name, nodes, neighbors, min_light, max_light, spawn_interval, chance, active_object_count, min_height, max_height, day_toggle)
end


--butterflies
	minetest.register_abm({
		nodenames = {"flowers:flower_rose", "flowers:flower_tulip", "flowers:flower_dandelion_yellow", "flowers:flower_viola", "flowers:flower_dandelion_white", "flowers:flower_geranium"},
		interval = 10.0,
		chance = 10,
		action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.env:add_entity({x=pos.x,y=pos.y+0.3,z=pos.z}, "mobs_animals_2:butterflies")
		end
	})


	register_spawn2("mobs_animals_2:ammonite_s", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_animals_2:ammonite_b", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:ammonite_s", "Small Ammonite", "default_sand.png", 1)
	mobs:register_egg("mobs_animals_2:ammonite_b", "Large Ammonite", "default_sand.png", 1)


	register_spawn2("mobs_animals_2:badger", {"air"}, {"gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:badger", "Badger", "default_obsidian.png", 1)
	register_spawn2("mobs_animals_2:badger2", {"air"}, {"gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:badger2", "Badger", "default_obsidian.png", 1)


	register_spawn2("mobs_animals_2:bat", {"air"}, {"gal:stone"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bat", "Bat", "animal_bat_inv.png", 0)


	register_spawn2("mobs_animals_2:bear_brown", {"air"}, {"gal:dirt_with_grass_temperate_humid", "gal:dirt_with_grass_temperate_semihumid", "gal:dirt_with_grass_temperate_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bear_brown", "Bear - Brown", "wool_brown.png", 1)

	register_spawn2("mobs_animals_2:bear_grizzly", {"air"}, {"gal:dirt_with_litter_coniferous",}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bear_grizzly", "Bear - Grizzly", "ma2_mammoth_wool.png", 1)

	register_spawn2("mobs_animals_2:bear_polar_01", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bear_polar_01", "Bear - Polar 01", "wool_white.png", 1)

	register_spawn2("mobs_animals_2:bear_polar_02", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bear_polar_02", "Bear - Polar 02", "ma2_bear_polar_02_inv.png", 0)


	register_spawn2("mobs_animals_2:bee", {"air"}, {"gal:dirt_with_grass"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bee", "Bee", "ma2_wasp_bg.png", 1)


	register_spawn2("mobs_animals_2:beetle", {"air"}, {"gal:stone_sandstone_white_gravel"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:beetle", "Giant Beetle", "default_desert_sand.png", 1)


	register_spawn2("mobs_animals_2:bird_small", {"air"}, {"gal:tree_default_leaves",}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bird_small", "Small Bird", "wool_cyan.png", 1)

	register_spawn2("mobs_animals_2:gull", {"air"}, {"gal:liquid_water_source", "gal:liquid_water_flowing"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:gull", "Gull", "default_cloud.png", 1)
	register_spawn2("mobs_animals_2:bird_lg", {"air"}, {"gal:tree_jungle_leaves", "gal:tree_pine_leaves", }, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bird_lg", "Large bird", "default_cloud.png", 1)
	register_spawn2("mobs_animals_2:bird_sm", {"air"}, {"gal:tree_beech_leaves", "gal:tree_oak_leaves"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:bird_sm", "Small bird", "default_cloud.png", 1)
	
	
	register_spawn2("mobs_animals_2:butterfly", {"air"}, {"group:flower"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:butterfly", "Butterfly", "default_cloud.png", 1)


	register_spawn2("mobs_animals_2:cat", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_temperate_semiarid"},14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:cat", "Cat", "ma2_cat_inv.png", 0)


	register_spawn2("mobs_animals_2:cavecrab", {"air"}, {"gal:stone", "gal:sand"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:cavecrab", "Cave Crab", "default_sand.png", 1)

	--mobs:register_spawn("mobs_animals_2:ma2_rooster", {"gal:dirt_with_grass", "ethereal:bamboo_dirt"}, 14, 10, 64000, 0, true)
	register_spawn2("mobs_animals_2:rooster", {"air"}, {"group:soil"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:rooster", "Rooster", "wool_brown.png", 1)
	--mobs:register_spawn("mobs_animals_2:ma2_chicken_01", {"gal:dirt_with_grass", "ethereal:bamboo_dirt"}, 14, 10, 64000, 0, true)
	mobs:register_egg("mobs_animals_2:chicken_01", "Chicken 01", "wool_brown.png", 1)
	register_spawn2("mobs_animals_2:chicken_01", {"air"}, {"group:soil"}, 14, 10, 64000, 2, 10, 31000, -31000, true)

	register_spawn2("mobs_animals_2:cow", {"air"}, {"group:soil"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:cow", S("Cow"), "mobs_cow_inv.png", 0)


	register_spawn2("mobs_animals_2:crabspider", {"air"}, {"gal:sand_desert", "gal:sand_silver"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:crabspider", "Crab Spider", "default_obsidian.png", 1)


	register_spawn2("mobs_animals_2:crocodile", {"gal:dirt_with_grass", "gal:dirt", "gal:sand"}, {"gal:liquid_water_flowing","gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:crocodile", "Crocodile", "default_grass.png", 1)
	
	register_spawn2("mobs_animals_2:crocodile_float", {"gal:liquid_water_flowing","gal:liquid_water_source"}, {"gal:dirt_with_grass","gal:sand","gal:dirt"}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:crocodile_float", "Crocodile (floater)", "default_grass.png", 1)
	
	register_spawn2("mobs_animals_2:crocodile_swim", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:crocodile_swim", "Crocodile (swimmer)", "default_grass.png", 1)


	register_spawn2("mobs_animals_2:deer", {"air"}, {"gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:deer", "Deer", "wool_violet.png", 1)


	register_spawn2("mobs_animals_2:dolphin", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:dolphin", "Dolphin", "wool_cyan.png", 1)


	register_spawn2("mobs_animals_2:donkey", {"air"}, {"gal:dirt_with_grass_temperate_temperate",}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:donkey", "Donkey", "default_obsidian.png", 1)


	register_spawn2("mobs_animals_2:elephant_01", {"air"}, {"gal:dirt_with_grass_warm_semihumid","gal:dirt_with_grass_warm_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:elephant_01", "Elephant 01", "ma2_elephant_01.png", 1)

	register_spawn2("mobs_animals_2:elephant_02", {"air"}, {"gal:dirt_with_grass_warm_temperate","gal:dirt_with_grass_warm_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:elephant_02", "Elephant 02", "ma2_elephant_01.png", 1)

	
	register_spawn2("mobs_animals_2:fish_river", {"gal:liquid_water_river_source",}, {"gal:liquid_water_river_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:fish_river", "Fish - River", "default_dirt.png", 1)

	register_spawn2("mobs_animals_2:fish_small", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:fish_small", "Fish - Small", "default_water.png", 1)
	
	register_spawn2("mobs_animals_2:pirana", {"gal:liquid_water_river_source",}, {"gal:liquid_water_river_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:pirana", "Piranha", "wool_dark_grey.png", 1)

	register_spawn2("mobs_animals_2:clownfish", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:clownfish", "Clownfish", "animal_clownfish_clownfish_item.png", 0)
	
	register_spawn2("mobs_animals_2:tropical", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:tropical", "Tropical fish", "animal_fish_blue_white_fish_blue_white_item.png", 0)


	register_spawn2("mobs_animals_2:fox", {"air"}, {"gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_warm_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:fox", "Fox", "wool_orange.png", 1)


	register_spawn2("mobs_animals_2:hedgehog", {"air"}, {"gal:dirt_with_grass_temperate_semihumid","gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:hedgehog", "Hedgehog", "wool_brown.png", 1)


--HORSES
	register_spawn2("mobs_animals_2:equine", {"air"}, {"gal:dirt_with_grass_temperate_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:equine", "Equine", "mobs_horse_inv.png", 0)
	
	register_spawn2("mobs_animals_2:equine2", {"air"}, {"gal:dirt_with_grass_temperate_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:equine2", "Equine", "mobs_horse_inv.png", 0)
	
	register_spawn2("mobs_animals_2:horse_tamed", {"air"}, {"gal:dirt_with_grass_temperate_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:horse_tamed", "Tamed White Horse", "mobs_horse_peg_inv.png", 0)

	register_spawn2("mobs_animals_2:horse_mustang", {"air"}, {"gal:dirt_with_grass_temperate_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:horse_mustang", "Horse - Mustang", "horse_inv.png", 0)

	register_spawn2("mobs_animals_2:horse_brown", {"air"}, {"gal:dirt_with_grass_temperate_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	register_spawn2("mobs_animals_2:horse_white", {"air"}, {"gal:dirt_with_grass_temperate_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	register_spawn2("mobs_animals_2:horse_arabian", {"air"}, {"gal:dirt_with_grass_temperate_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)


	register_spawn2("mobs_animals_2:goat", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_temperate_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:goat", "Goat", "default_grass.png", 1)


	register_spawn2("mobs_animals_2:jellyfish", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:jellyfish", "Jellyfish", "jellyfish_inv.png", 0)


	register_spawn2("mobs_animals_2:giraffe", {"air"}, {"gal:dirt_with_grass_warm_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:giraffe", "Giraffe", "wool_yellow.png", 1)


	register_spawn2("mobs_animals_2:llama", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_warm_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:llama", "llama", "ma2_llama_inv.png", 0)


	register_spawn2("mobs_animals_2:mammoth", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:mammoth", "Mammoth", "decoblocks_mammoth_wool.png", 1)


	--register_spawn2("mobs_animals_2:medved", {"air"}, {"gal:dirt_with_grass_temperate_humid", "gal:dirt_with_grass_temperate_semihumid", "gal:dirt_with_grass_temperate_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	--mobs:register_egg("mobs_animals_2:medved", "Bear", "wool_brown.png", 1)


	register_spawn2("mobs_animals_2:mule", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_temperate_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:mule", "Mule", "ma2_mule_inv.png", 0)

	register_spawn2("mobs_animals_2:ostrich", {"air"}, {"gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_temperate_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:ostrich", S("Ostrich"), "dl_ostrich_inv.png", 0)

	register_spawn2("mobs_animals_2:owl", {"air"}, {"gal:dirt_with_grass_temperate_humid", "gal:dirt_with_grass_temperate_semihumid", "gal:dirt_with_grass_temperate_temperate", "gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:owl", "Owl", "default_tree.png", 1)


	register_spawn2("mobs_animals_2:panda", {"air"}, {"gal:dirt_with_grass_hot_semihumid", "gal:dirt_with_grass_hot_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:panda", "Panda", "default_papyrus.png", 1)
	register_spawn2("mobs_animals_2:panda1", {"air"}, {"gal:dirt_with_grass_hot_semihumid", "gal:dirt_with_grass_hot_semihumid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:panda1", "Panda1", "default_papyrus.png", 1)


	register_spawn2("mobs_animals_2:parrot", {"air"}, {"gal:dirt_with_grass_hot_humid", "gal:dirt_with_grass_hot_semihumid", "gal:dirt_with_grass_hot_temperate", "gal:dirt_with_rainforest_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:parrot", "Parrot", "ma2_parrot_inv.png", 0)

	register_spawn2("mobs_animals_2:penguin", {"air"}, {"gal:dirt_with_snow", "gal:ice"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:penguin", "Penguin", "default_grass.png", 1)

	register_spawn2("mobs_animals_2:pig", {"air"}, {"gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_cool_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:pig", "Pig", "ma2_pig_inv.png", 0)
	--mobs:register_egg("mobs_animals_2:pig_flying", "flying Pig", "wool_pink.png", 1)
	--mobs:register_egg("mobs_animals_2:pig_evil", "Kamikaze Pig", "wool_pink.png", 1)


	register_spawn2("mobs_animals_2:polar_bear", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	--mobs:register_egg("mobs_animals_2:polar_bear", "Polar Bear", "decoblocks_mammoth_wool.png", 1)

	register_spawn2("mobs_animals_2:polar_bear2", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	--mobs:register_egg("mobs_animals_2:polar_bear2", "Polarbear", "polarbear_inv.png", 0)


	register_spawn2("mobs_animals_2:quagga", {"air"}, {"gal:dirt_with_grass_warm_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:quagga", "Quagga", "wool_orange.png", 1)


	register_spawn2("mobs_animals_2:rabbit", {"air"}, {"gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_warm_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:rabbit", "Rabbit", "ma2_rabbit_inv.png", 0)


	register_spawn2("mobs_animals_2:shark_lg", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:shark_lg", "Shark (large)", "mob_shark_shark_item.png", 0)
	register_spawn2("mobs_animals_2:shark_md", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:shark_md", "Shark (medium)", "mob_shark_shark_item.png", 0)
	register_spawn2("mobs_animals_2:shark_sm", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:shark_sm", "Shark (small)", "mob_shark_shark_item.png", 0)


	register_spawn2("mobs_animals_2:sheep_white", {"air"}, {"group:soil"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	--mobs:register_spawn("mobs_animals_2:sheep_white", {"gal:dirt_with_grass_temperate_semiarid", "gal:dirt_with_grass_cool_temperate"}, 20, 10, 64000, 2, 31000, true)


	register_spawn2("mobs_animals_2:smilodon", {"air"}, {"gal:dirt_with_snow"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:smilodon", S("Sabertooth Tiger"), "wool_yellow.png", 1)


	register_spawn2("mobs_animals_2:tortoise", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_warm_semiarid", "gal:dirt_with_grass_warm_semiarid"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:tortoise", "Tortoise", "default_grass.png", 1)


	register_spawn2("mobs_animals_2:trilobite", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:trilobite", "Trilobite", "default_water.png", 1)

	
	register_spawn2("mobs_animals_2:turtle", {"air"}, {"gal:dirt_with_grass","gal:sand","gal:sand_desert",}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:turtle", "Turtle", "default_grass.png", 1)
	register_spawn2("mobs_animals_2:seaturtle", {"gal:liquid_water_source",}, {"gal:liquid_water_source",}, 14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:seaturtle", "Sea Turtle", "default_water.png", 1)
	
	register_spawn2("mobs_animals_2:walrus", {"air"}, {"gal:dirt_with_snow", "gal:ice"}, 20, 0, 20000, 1, 31000)
	mobs:register_egg("mobs_animals_2:walrus", "Walrus", "default_grass.png", 1)
	

	register_spawn2("mobs_animals_2:wasp", {"air"}, {"gal:dirt_with_grass","gal:dirt_with_grass_temperate_temperate","gal:dirt_with_grass_warm_temperate",},14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_animals_2:wasp_leader", {"air"}, {"gal:dirt_with_grass",},14, 10, 64000, 2, 10, 31000, -31000)
	mobs:register_egg("mobs_animals_2:wasp", "Wasp", "ma2_wasp_bg.png", 1)
	mobs:register_egg("mobs_animals_2:wasp_leader", "King of Sting", "ma2_wasp_bg.png", 1)

	
	register_spawn2("mobs_animals_2:wolf", {"air"}, {"gal:dirt_with_coniferous_litter"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:wolf", "Wolf", "wool_green.png", 1)


	register_spawn2("mobs_animals_2:whale_01", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	--mobs:register_spawn("mobs_animals_2:whale", {"default:water_source"}, 5, 14, 1500, 20, 1000, true)
	mobs:register_egg("mobs_animals_2:whale_01", "Whale", "default_water_source.png", 1)
	register_spawn2("mobs_animals_2:whale_02", {"gal:liquid_water_source",}, {"gal:liquid_water_source",},14, 10, 64000, 2, 10, 31000, -31000)
	--mobs:register_spawn("mobs_animals_2:whale_02", {"default:water_source"}, 20, 10, 15000, 20, 1000)
	mobs:register_egg("mobs_animals_2:whale_02", "Whale", "default_water.png", 1)


	register_spawn2("mobs_animals_2:zebra", {"air"}, {"gal:dirt_with_grass_warm_temperate", "gal:dirt_with_grass_warm_temperate"}, 14, 10, 64000, 2, 10, 31000, -31000, true)
	mobs:register_egg("mobs_animals_2:zebra", "Zebra", "default_obsidian.png", 1)

