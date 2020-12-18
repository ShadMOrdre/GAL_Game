

local S = gal.intllib

--ShadMOrdre's Mob Spawn function
--function mobs:register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)
local function register_spawn2(name, nodes, neighbors, max_light, min_light, spawn_interval, chance, active_object_count, max_height, min_height, day_toggle)

	mobs:spawn_specific(name, nodes, neighbors, min_light, max_light, spawn_interval, chance, active_object_count, min_height, max_height, day_toggle)
end


--[[
mobs:spawn({
	name = "draconis:fire_dragon",
	nodes = "default:stone",
        neighbours = "air",
	min_light = 14,
	interval = 100,
	chance = 8000, -- 15000
	min_height = 80,
	max_height = 200,
	day_toggle = true,
})
--]]



register_spawn2("draconis:fire_dragon", {"air"}, {"gal:liquid_lava_source",}, 14, 10, 64000, 2, 10, 31000, -31000, false)

mobs:register_egg("draconis:fire_dragon", S("Fire Dragon"), "fire_basic_flame.png", 1)
mobs:register_egg("draconis:hatched_fire_dragon", S("Tame Fire Dragon"), "fire_basic_flame.png", 1)



register_spawn2("draconis:fire_wyvern", {"air"}, {"gal:liquid_lava_source",}, 14, 10, 64000, 2, 10, 31000, -31000, false)

mobs:register_egg("draconis:fire_wyvern", S("Fire Wyvern"), "fire_basic_flame.png", 1)
mobs:register_egg("draconis:hatched_fire_wyvern", S("Tame Fire Wyvern"), "fire_basic_flame.png", 1)



register_spawn2("draconis:fire_wyvern", {"air"}, {"gal:ice",}, 14, 10, 64000, 2, 10, 31000, -31000, false)

mobs:register_egg("draconis:ice_wyvern", S("Ice Wyvern"), "draconis_frost_flame.png", 1)
mobs:register_egg("draconis:hatched_ice_wyvern", S("Tame Ice Wyvern"), "draconis_frost_flame.png", 1)



register_spawn2("draconis:jungle_wyvern", {"air"}, {"gal:tree_jungle_leaves",}, 14, 10, 64000, 2, 10, 31000, -31000, false)

mobs:register_egg("draconis:jungle_wyvern", S("Jungle Wyvern"), "default_jungleleaves.png", 1)

























