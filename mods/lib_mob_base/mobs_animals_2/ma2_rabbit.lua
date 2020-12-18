--###################
--################### RABBIT
--###################

mobs:register_mob("mobs_animals_2:rabbit", {
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
	mesh = "ma2_rabbit.b3d",
    textures = {{"ma2_rabbit.png"},{"ma2_rabbit1.png"},{"ma2_rabbit2.png"},{"ma2_rabbit3.png"},{"ma2_rabbit4.png"},{"ma2_rabbit5.png"},{"ma2_rabbit6.png"},{"ma2_rabbit7.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})


