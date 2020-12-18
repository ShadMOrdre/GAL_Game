--###################
--################### HORSE
--###################

mobs:register_mob("mobs_animals_2:horse_mustang", {
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
	mesh = "horse.b3d",
    textures = {{"horse.png"},{"horse1.png"},{"horse2.png"},{"horse3.png"},{"horse4.png"},{"horse5.png"},{"horse6.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})


