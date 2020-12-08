mobs:register_mob("mobs_races:ent", {
	type = "npc",
	race = "ents",
	hp_min = 50,
	hp_max = 70,
	collisionbox = {-0.5, 0, -0.5, 0.5, 5, 0.5},
	textures = {
		{"mobs_races_ent3.png"},
	},
	visual_size = {x=3.5,y=3.5},
	visual = "mesh",
	mesh = "mobs_ent.x",
	view_range = 20,
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	armor = 100,
	damage = 5,
	drops = {
		{name = "default:sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_beech_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_birch_01_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_cedar_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_conifers_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_eucalyptus_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_jungle_01_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_maple_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_oak_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_pine_01_sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lib_ecology:tree_spruce_sapling",
		chance = 250,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 60,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 17,
		stand_end = 17,
		walk_start = 10,
		walk_end = 80,
		run_start = 10,
		run_end = 80,
		punch_start = 1,
		punch_end = 1,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_yeti_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,

})