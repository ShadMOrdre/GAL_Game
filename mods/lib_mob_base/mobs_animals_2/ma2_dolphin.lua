mobs:register_mob("mobs_animals_2:dolphin", {
	type = "monster",
	passive = false,
	reach = 1.5,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	collisionbox = {-0.7, -0.1, -0.7, 0.7, 1.3, 0.7},
	visual = "mesh",
	mesh = "ma2_dolphin.b3d",
	textures = {
		{"ma2_dolphin.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 3,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = 0,
	jump_height = 0,
	stepheight = 0,
	fly = true,
	fly_in = "gal:liquid_water_source",
	fall_damage = 0,
	fall_speed = 0,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 6,
		stand_end = 24,
		walk_start = 6,
		walk_end = 24,
		run_start = 31,
		run_end = 49,
	},
})
