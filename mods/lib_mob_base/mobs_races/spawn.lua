
local S = mobs_races.intllib

--ShadMOrdre's Mob Spawn function
--function mobs:register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)
local function register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)

	mobs:spawn_specific(name, nodes, neighbors, min_light, max_light, spawn_interval, chance, active_object_count, min_height, max_height, day_toggle)
end


	mobs:register_spawn("mobs_races:balrog", {"group:cracky"}, 14, 0, 500000, 1, -30912, -1800)

	mobs:register_spawn("mobs_races:banshee", {"bones:bones", "mobs_humans:human_bones"}, {"air"}, 4, 0, 60, 7, 1, -30912, 31000, false)

	mobs:register_spawn("mobs_races:ent", {"gal:dirt_with_coniferous_litter"}, 20, -1, 6000, 3, 31000)

	mobs:register_spawn("mobs_races:golem", {"gal:stone"}, 7, 0, 16000, 2, 31000)
	mobs:register_spawn("mobs_races:gnorm", {"gal:dirt_with_grass","default:wood"}, 20, 10, 32000, 2, 31000)

	mobs:register_spawn("mobs_races:orc2", {"gal:snow",}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("mobs_races:orc", {"gal:dirt_with_dry_grass",}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("mobs_races:ogre", {"gal:sand_desert"}, 20, 10, 15000, 2, 31000)
	mobs:register_spawn("mobs_races:skeleton", {"gal:stone"}, 7, 0, 16000, 2, 31000)

	mobs:register_egg("mobs_races:balrog", "Balrog", "default_lava.png", 1)

	mobs:register_egg("mobs_races:banshee", "Banshee", "default_stone.png", 1)

	mobs:register_egg("mobs_races:barbarian1", "NPC - Barbarian 01", "mobs_spawner.png", 1)
	mobs:register_egg("mobs_races:barbarian2", "NPC - Barbarian 02", "mobs_spawner.png", 1)
	mobs:register_egg("mobs_races:barbarian_archer", "NPC - Barbarian Archer", "mobs_spawner.png", 1)

	mobs:register_egg("mobs_races:ent", "Ent", "default_tree.png", 1)

	mobs:register_egg("mobs_races:gnorm", "Gnorm", "default_dirt.png", 1)

	mobs:register_egg("mobs_races:golem", "Stone Golem", "default_stone.png", 1)
	mobs:register_egg("mobs_races:golem_friendly", "Stone Golem (friendly)", "default_stone.png", 1)

	mobs:register_egg("mobs_races:ogre", "Ogre", "default_desert_sand.png", 1)

	mobs:register_egg("mobs_races:orc2", "Morgul Orc", "default_desert_sand.png", 1) -- new and improved, hey
	mobs:register_egg("mobs_races:orc", "Orc", "default_desert_sand.png", 1)

	mobs:register_egg("mobs_races:skeleton", "Skeleton", "default_dirt.png", 1)



--Dragon Normal
	--mobs:spawn_specific("mobs_races:dragon", {"air"}, {"default:stone"}, 20, 10, 300, 15000, 2, -100, 11000)
	--mobs:register_egg("mobs_races:dragon", "Dragon", "default_apple.png", 1)

--Wild Dragons
	 mobs:register_spawn("mobs_races:dragon2", {"gal:tree_pine_needles"}, 20, 10, 64000, 2, 31000)
	 mobs:register_spawn("mobs_races:dragon3", {"gal:tree_acacia_leaves","default:dirt_with_dry_grass"}, 20, 10, 64000, 2, 31000)
	 mobs:register_spawn("mobs_races:dragon4", {"gal:tree_jungle_01_leaves"}, 20, 10, 64000, 2, 31000)
	 mobs:register_spawn("mobs_races:waterdragon", {"gal:liquid_water_source"}, 20, 10, 32000, 1, 31000, false)
	 mobs:register_spawn("mobs_races:wyvern",	{"gal:tree_default_leaves"}, 20, 10, 32000, 1, 31000, false)
	 mobs:register_spawn("mobs_races:dragon_great", {"gal:liquid_lava_source"}, 20, 0, 64000, -21000, 1000, false)
	 mobs:register_spawn("mobs_races:dragon_king", {"gal:liquid_lava_source"}, 20, 0, 64000, -21000, 1000, false)

	--mobs:spawn_specific("mobs_races:dragon", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:dragon2", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:dragon3", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:dragon4", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:waterdragon", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:wyvern", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:dragon_great", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)
	--mobs:spawn_specific("mobs_races:dragon_king", {"air"}, {"default:stone"}, 20, 10, 300, 64000, 2, -100, 11000)


	mobs:register_egg("mobs_races:dragon", "Wild Fire Dragon", "default_apple.png", 1)
	mobs:register_egg("mobs_races:dragon2", "Wild Lightning Dragon", "default_mese_crystal.png", 1)
	mobs:register_egg("mobs_races:dragon3", "Wild Poison Dragon", "dmobs_poison.png", 1)
	mobs:register_egg("mobs_races:dragon4", "Wild Ice Dragon", "default_ice.png", 1)

--Tamed Dragons
	mobs:register_egg("mobs_races:dragon_red", "Tame Fire Dragon", "default_apple.png", 1)
	mobs:register_egg("mobs_races:dragon_black", "Tame Lightning Dragon", "default_mese_crystal.png", 1)
	mobs:register_egg("mobs_races:dragon_green", "Tame Poison Dragon", "dmobs_poison.png", 1)
	mobs:register_egg("mobs_races:dragon_blue", "Tame Ice Dragon", "default_ice.png", 1)

--Great Dragons
	mobs:register_egg("mobs_races:dragon_great", "Boss Dragon", "dmobs_egg1.png", 1)
	mobs:register_egg("mobs_races:dragon_great_tame", "Great Dragon", "default_lava_source_animated.png", 1)
	mobs:register_egg("mobs_races:dragon_king", "Dragon King", "dmobs_egg1.png", 1)
	mobs:register_egg("mobs_races:dragon_king_tame", "Dragon King (Allied)", "default_lava_source_animated.png", 1)

--Water Dragons
	mobs:register_egg("mobs_races:waterdragon", "Boss Waterdragon", "dmobs_egg4.png", 1)

--Wyverns
	mobs:register_egg("mobs_races:wyvern", "Boss Wyvern", "dmobs_egg3.png", 1)
