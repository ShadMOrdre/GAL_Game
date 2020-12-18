
local S = mobs_races.intllib

--ShadMOrdre's Mob Spawn function
--function mobs:register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)
local function register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)

	mobs:spawn_specific(name, nodes, neighbors, min_light, max_light, spawn_interval, chance, active_object_count, min_height, max_height, day_toggle)
end

--SPAWNS
	register_spawn2("mobs_races:balrog", {"air"}, {"gal:liquid_lava_source", "gal:stone_obsidian"}, 14, 10, 64000, 2, 10, -200, -31000)

	register_spawn2("mobs_races:banshee", {"air"}, {"bones:bones"}, 4, 1, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:ent", {"air"}, {"gal:dirt_with_litter_coniferous"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:golem", {"air"}, {"gal:stone"}, 14, 10, 64000, 2, 10, 31000, -31000, false)
	register_spawn2("mobs_races:gnorm", {"air"}, {"gal:dirt_with_grass"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:mummy", {"air"}, {"gal:sand_desert"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:ninja", {"air"}, {"gal:dirt_with_grass"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:orc2", {"air"}, {"gal:dirt_with_snow",}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:orc", {"air"}, {"gal:dirt_with_grass_dry",}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:ogre", {"air"}, {"gal:sand_desert"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:skeleton", {"air"}, {"gal:stone"}, 7, 1, 64000, 2, 10, -200, -31000)

	register_spawn2("mobs_races:skeleton_soldier", {"air"}, {"gal:dirt_with_grass", "gal:dirt_with_grass_dry","gal:stone","gal:dirt"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:skeleton_archer", {"air"}, {"gal:dirt_with_grass", "gal:dirt_with_grass_dry","gal:stone","gal:dirt"}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:snow_walker", {"air"}, {"gal:dirt_with_snow", "gal:ice", "gal:snow",}, 14, 10, 64000, 2, 10, 31000, -31000)
	--register_spawn2("mobs_races:snowbarian1", {"air"}, {"gal:dirt_with_snow", "gal:ice", "gal:snow",}, 14, 10, 64000, 2, 10, 31000, -31000)
	--register_spawn2("mobs_races:snowbarian2", {"air"}, {"gal:dirt_with_snow", "gal:ice", "gal:snow",}, 14, 10, 64000, 2, 10, 31000, -31000)
	--register_spawn2("mobs_races:snowbarian_archer", {"air"}, {"gal:dirt_with_snow", "gal:ice", "gal:snow",}, 14, 10, 64000, 2, 10, 31000, -31000)

	register_spawn2("mobs_races:zombie", {"air"}, {"gal:dirt_with_grass", "gal:dirt_with_grass_dry", "gal:sand_desert"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:zombie_soldier", {"air"}, {"gal:dirt_with_grass", "gal:dirt_with_grass_dry", "gal:sand_desert"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:zombie_brute", {"air"}, {"gal:dirt_with_grass"}, 14, 10, 64000, 2, 10, 31000, -31000)

	--register_spawn2("mobs_races:witch", {"air"}, {"gal:dirt_with_grass"}, 7, 1, 64000, 2, 10, -200, -31000)
	register_spawn2("mobs_races:oerkki", {"air"}, {"gal:dirt_with_grass"}, 7, 1, 64000, 2, 10, -200, -31000)



	register_spawn2("mobs_races:goblin_cobble", {"air"}, {"group:stone"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_digger", {"air"}, {"group:stone"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_coal", {"air"}, {"gal:stone_with_coal"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_iron", {"air"}, {"gal:stone_with_iron"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_gold", {"air"}, {"gal:stone_with_gold"}, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_diamond", {"air"}, {"gal:stone_with_diamond" }, 14, 10, 64000, 2, 10, 31000, -31000)
	register_spawn2("mobs_races:goblin_king", {"air"}, {"gal:stone_cobble_mossy",}, 14, 10, 64000, 2, 10, 31000, -31000)



--EGGS
	mobs:register_egg("mobs_races:balrog", "Balrog", "default_lava.png", 1)

	mobs:register_egg("mobs_races:banshee", "Banshee", "default_stone.png", 1)

	mobs:register_egg("mobs_races:barbarian1", "NPC - Barbarian 01", "mobs_spawner.png", 1)
	mobs:register_egg("mobs_races:barbarian2", "NPC - Barbarian 02", "mobs_spawner.png", 1)
	mobs:register_egg("mobs_races:barbarian_archer", "NPC - Barbarian Archer", "mobs_spawner.png", 1)

	mobs:register_egg("mobs_races:ent", "Ent", "default_tree.png", 1)

	mobs:register_egg("mobs_races:gnorm", "Gnorm", "default_dirt.png", 1)

	mobs:register_egg("mobs_races:golem", "Stone Golem", "default_stone.png", 1)
	mobs:register_egg("mobs_races:golem_friendly", "Stone Golem (friendly)", "default_stone.png", 1)

	mobs:register_egg("mobs_races:mummy", "Mummy", "default_paper.png", 1)

	mobs:register_egg("mobs_races:ninja", "Ninja", "default_leaves.png", 1)

	mobs:register_egg("mobs_races:ogre", "Ogre", "default_desert_sand.png", 1)
	mobs:register_egg("mobs_races:orc2", "Morgul Orc", "default_desert_sand.png", 1) -- new and improved, hey
	mobs:register_egg("mobs_races:orc", "Orc", "default_desert_sand.png", 1)

	mobs:register_egg("mobs_races:skeleton", "Skeleton Boss", "default_dirt.png", 1)

	mobs:register_egg("mobs_races:skeleton_soldier", "Skeleton Soldier", "skeleton_inv.png", 0)
	mobs:register_egg("mobs_races:skeleton_archer", "Skeleton Archer", "skeleton_inv.png", 0)

	mobs:register_egg("mobs_races:snow_walker", "Snow Walker", "lib_materials_mineral_diamond_block.png", 1)

	--mobs:register_egg("mobs_races:snowbarian1", "NPC - Snowbarian 01", "mobs_spawner.png", 1)
	--mobs:register_egg("mobs_races:snowbarian2", "NPC - Snowbarian 02", "mobs_spawner.png", 1)
	--mobs:register_egg("mobs_races:snowbarian_archer", "NPC - Snowbarian Archer", "mobs_spawner.png", 1)

	mobs:register_egg("mobs_races:zombie", "Zombie", "zombie_head.png", 0)
	mobs:register_egg("mobs_races:zombie_soldier", "Zombie Soldier", "wool_dark_green.png", 1)
	mobs:register_egg("mobs_races:zombie_brute", "Zombie Brute (boss)", "default_dirt.png", 1)

	--mobs:register_egg("mobs_races:witch", "Witch", "wool_violet.png", 1)
	mobs:register_egg("mobs_races:oerkki", "Oerkki", "wool_violet.png", 1)


--Dragon Normal
	--mobs:spawn_specific("mobs_races:dragon", {"air"}, {"gal:stone"}, 10, 20, 300, 15000, 2, -100, 11000)
	--mobs:register_egg("mobs_races:dragon", "Dragon", "default_apple.png", 1)
	 --mobs:register_spawn("mobs_races:dragon", {"air"}, {"gal:tree_pine_leaves"}, 14, 10, 64000, 2, 31000)
--
--Wild Dragons
	 register_spawn2("mobs_races:dragon2", {"air"}, {"gal:tree_pine_leaves"}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:dragon3", {"air"}, {"gal:tree_acacia_leaves",}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:dragon4", {"air"}, {"gal:tree_jungle_leaves"}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:waterdragon", {"air"}, {"gal:liquid_water_source"}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:wyvern",	{"air"}, {"gal:tree_default_leaves"}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:dragon_great", {"air"}, {"gal:liquid_lava_source"}, 14, 10, 64000, 2, 10, 31000, -31000)
	 register_spawn2("mobs_races:dragon_king", {"air"}, {"gal:liquid_lava_source"}, 14, 10, 64000, 2, 10, 31000, -31000)

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
--




