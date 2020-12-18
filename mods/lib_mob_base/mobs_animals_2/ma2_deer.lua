
mobs:register_mob("mobs_animals_2:deer", {
	type = "animal",
	hp_min = 4,
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"mobs_deer.png"},
	},
	visual = "mesh",
	mesh = "mobs_deer2.x",
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 25,		stand_end = 75,
		walk_start = 75,		walk_end = 100,
	},
	follow = "gal:item_wheat",
	view_range = 5,
})
