--###################
--################### PARROT
--###################

mobs:register_mob("mobs_animals_2:parrot", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "ma2_parrot.b3d",
	textures = {{"ma2_parrot_blue.png"},{"ma2_parrot_green.png"},{"ma2_parrot_grey.png"},{"ma2_parrot_red_blue.png"},{"ma2_parrot_yellow_blue.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 1.5,
	run_velocity = 1.5,
	jump = true,
	animation = {
		speed_normal = 80,		speed_run = 80,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})


