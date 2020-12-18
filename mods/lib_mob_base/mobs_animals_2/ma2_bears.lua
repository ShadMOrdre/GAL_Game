



mobs:register_mob("mobs_animals_2:bear_brown", {
	type = "animal",
	hp_min= 5,
	hp_max = 15,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	damage = 2,
	attack_type = "dogfight",
	passive = false,
	textures = {
		{"ma2_bear_brown.png"},
	},
	visual = "mesh",
	mesh = "ma2_bear_brown.x",
	makes_footstep_sound = true,
	view_range = 7,
	walk_velocity = 1,
	run_velocity = 2,
	damage = 10,
	armor = 200,
	attack_type = "dogfight",
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 5,
		max = 10,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,		speed_run = 15,
		stand_start = 0,		stand_end = 30,
		walk_start = 35,		walk_end = 65,
		run_start = 105,		run_end = 135,
		punch_start = 70,		punch_end = 100,
	},
})


mobs:register_mob("mobs_animals_2:bear_grizzly", {
	type = "animal",
	passive = false,
	reach = 2.2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	visual_size = {x=1, y=1},
	collisionbox = {-0.7, 0,-0.7, 0.7,1.8,0.7},
	visual = "mesh",
	mesh = "ma2_bear_grizzly.b3d",
	textures = {
		{"ma2_bear_grizzly.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = 1,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 1, max = 2},
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs_animals_2:fish_small_raw" then
			item:take_item()
			self.state = "stand"
			self.object:set_animation({x=55, y=75}, 18, 0)
		end
	end,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 11,
		walk_start = 15,
		walk_end = 30,
		run_start = 15,
		run_end = 30,
		punch_start = 35,
		punch_end = 50,
	},
})




mobs:register_mob("mobs_animals_2:bear_polar_01", {
	type = "animal",
	passive = false,
	reach = 2.2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	visual_size = {x=1, y=1},
	collisionbox = {-0.7, 0,-0.7, 0.7,1.8,0.7},
	visual = "mesh",
	mesh = "ma2_bear_grizzly.b3d",
	textures = {
		{"ma2_bear_polar_01.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = 1,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 1, max = 2},
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs_animals_2:fish_small_raw" then
			item:take_item()
			self.state = "stand"
			self.object:set_animation({x=55, y=75}, 18, 0)
		end
	end,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 11,
		walk_start = 15,
		walk_end = 30,
		run_start = 15,
		run_end = 30,
		punch_start = 35,
		punch_end = 50,
	},
})

--###################
--################### POLARBEAR
--###################

mobs:register_mob("mobs_animals_2:bear_polar_02", {
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
	mesh = "ma2_bear_polar.b3d",
	textures = {
		{"ma2_bear_polar_02.png"},
	},
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



