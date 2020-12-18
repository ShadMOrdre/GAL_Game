-- Draconis Nodes

-- Hatching Blocks

minetest.register_node("draconis:hot_obsidian", {
	description = "Super-Heated Obsidian",
	tiles = {"draconis_hot_obsidian.png"},
	damage_per_second = 2,
	--sounds = default.node_sound_stone_defaults(),
	sounds = mobs_animal.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2, igniter = 1},
})

minetest.register_node("draconis:cold_ice", {
	description = "Super-Cooled Ice",
	tiles = {"draconis_cold_ice.png"},
	is_ground_content = false,
	damage_per_second = 2,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 1},
	--sounds = default.node_sound_glass_defaults(),
	sounds = mobs_animal.node_sound_glass_defaults(),
})


