
mobs:register_mob("mobs_animals_2:giraffe", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"ma2_giraffe.png"},
	},
	visual = "mesh",
	mesh = "ma2_giraffe.x",
	makes_footstep_sound = true,
	walk_velocity = 2,
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
		stand_start = 0,		stand_end = 30,
		walk_start = 70,		walk_end = 100,
	},
	follow = "gal:item_wheat",
	view_range = 5,
})


