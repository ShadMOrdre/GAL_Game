

local S = gal.intllib

--[[   DEFAULT Spawning parameters
	-- ANTS
	mobs:spawn_specific("mobs_nssm:ant_soldier", {"mobs_nssm:ant_dirt"}, {"air"}, 0, 14, 7, 1000, 3, 4, 200)
	mobs:spawn_specific("mobs_nssm:ant_worker", {"mobs_nssm:ant_dirt"}, {"air"}, 0, 14, 5, 1000, 6, 4, 200)

	-- SPIDERS
	mobs:spawn_specific("mobs_nssm:tarantula", {"mobs_nssm:web", }, {"air"}, 0, 14, 6, 1000, 1, 20, 30)
	mobs:spawn_specific("mobs_nssm:uloboros", {"mobs_nssm:web", }, {"air"}, 0, 14, 8, 1000, 1, 25, 35)

	-- SEA
	mobs:spawn_specific("mobs_nssm:crocodile", {"gal:liquid_water_muddy_source",}, {"air"}, 0, 14, 100, 2000, 1, -2, 12)
	mobs:spawn_specific("mobs_nssm:octopus", {"gal:liquid_water_source"}, {"gal:liquid_water_source"}, 0, 14, 100, 2000, 1, -192, 0)
	mobs:register_spawn("mobs_nssm:crocodile", {"gal:sand","gal:liquid_water_source"}, 0, 20, 32000, 2, 31000, true)
	mobs:register_spawn("mobs_nssm:octopus", {"gal:liquid_water_source"}, 0, 20, 32000, 2, 31000, true)

	-- DESERT
	mobs:spawn_specific("mobs_nssm:sandworm", {"gal:sand_desert", "gal:stone_desert"}, {"air"}, 0, 14, 100, 2000, 1, 15, 55)

	-- MOUNTAINS
	mobs:spawn_specific("mobs_nssm:werewolf", {"gal:dirt_with_fungi_covered_grass"}, {"air"}, 0, 10, 100, 1000, 1, 20, 30)

	-- ICE
	mobs:spawn_specific("mobs_nssm:white_werewolf", {"gal:dirt_with_snow","gal:ice"}, {"air"}, 0, 10, 100, 1000, 1, 80, 110)

	-- SKY
	--mobs:spawn_specific("mobs_nssm:moonheron", {"air"}, {"air"}, 0, 8, 100, 160000, 2, 10, 40)
--]]

--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle)
--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle)



--ShadMOrdre's Mob Spawn function
local function register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)

	mobs:spawn_specific(name, nodes, neighbors, min_light, max_light, spawn_interval, chance, active_object_count, min_height, max_height, day_toggle)
end



-- Spawning parameters

-- ANTS
	register_spawn2("mobs_nssm:ant_soldier", {"air"}, {"mobs_nssm:ant_dirt"}, 14, 10, 128000, 2, 10, 31000, -31000)
	register_spawn2("mobs_nssm:ant_worker", {"air"}, {"mobs_nssm:ant_dirt"}, 14, 10, 128000, 2, 10, 31000, -31000)

-- SPIDERS
	register_spawn2("mobs_nssm:spider", {"air"}, {"gal:dirt_with_grass_hot_humid", "gal:tree_jungle_trunk", "gal:dirt_with_litter_rainforest", "gal:snow", "gal:dirt_with_grass_crystal", "gal:dirt_with_grass_cold"}, 14, 10, 128000, 2, 10, 31000, -31000)
	register_spawn2("mobs_nssm:tarantula", {"air"}, {"gal:dirt_with_grass_hot_humid", "gal:tree_jungle_trunk", "mobs_nssm:web" }, 14, 10, 128000, 2, 10, 31000, -31000)
	register_spawn2("mobs_nssm:uloboros", {"air"}, {"gal:dirt_with_litter_rainforest", "gal:tree_jungle_trunk", "mobs_nssm:web" }, 14, 10, 128000, 2, 10, 31000, -31000)

-- SEA
	register_spawn2("mobs_nssm:crocodile", {"air"}, {"gal:sand","gal:liquid_water_source", "gal:liquid_water_muddy_source",}, 14, 10, 128000, 2, 10, 31000, -31000)
	register_spawn2("mobs_nssm:octopus", {"air"}, {"gal:liquid_water_source"}, 14, 10, 128000, 2, 10, 31000, -31000)

-- DESERT
	register_spawn2("mobs_nssm:sandworm", {"air"}, {"gal:sand_desert", "gal:stone_desert"}, 14, 10, 128000, 2, 10, 31000, -31000)

-- MOUNTAINS
	register_spawn2("mobs_nssm:werewolf", {"air"}, {"gal:dirt_with_grass"}, 14, 10, 128000, 2, 10, 31000, -31000)

-- ICE
	register_spawn2("mobs_nssm:white_werewolf", {"air"}, {"gal:dirt_with_snow","gal:snow"}, 14, 10, 128000, 2, 10, 31000, -31000)

-- SKY
	--mobs:spawn_specific("mobs_nssm:moonheron", {"air"}, {"air"}, 0, 8, 120, 160000, 1, 10, 40)


	mobs:register_egg("mobs_nssm:ant_soldier", "Ant Soldier", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:ant_worker", "Ant Worker", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:spider", S("Spider"), "mobs_cobweb.png", 1)
	mobs:register_egg("mobs_nssm:tarantula", "Tarantula", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:tarantula_tamed", "Tarantula - Tamed", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:uloboros", "Uloboros", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:crocodile", "Crocodile", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:octopus", "Octopus", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:sandworm", "Sandworm", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:werewolf", "Werewolf", "default_tree.png", 1)
	mobs:register_egg("mobs_nssm:white_werewolf", "White Werewolf", "default_tree.png", 1)





