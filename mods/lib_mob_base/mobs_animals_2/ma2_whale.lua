mobs:register_mob("mobs_animals_2:whale_01", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 52,
	hp_max = 82,
	armor = 230,
	collisionbox = {-0.9, -1.2, -0.9, 0.9, 0.9, 0.9},
	visual = "mesh",
	mesh = "ma2_whale_01.b3d",
	textures = {
		{"ma2_whale_01.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,	
	stepheight = 1.5,
	fall_damage = 0,
	fall_speed = -6,
	fly = true,
	fly_in = "default:water_source",
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"fishing:fish_cooked"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	sounds = {
      random = "whale_1",
      death = "whale_1",
      distance = 128,
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 2,
		walk_end = 39,
		stand_start = 2,
		stand_end = 39,
		run_start = 2,
		run_end = 39,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})



mobs:register_mob("mobs_animals_2:whale_02", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 25,
	hp_max = 35,
	armor = 100,
	collisionbox = {-4, -2, -4, 4, 2, 4},
	visual = "mesh",
	mesh = "ma2_whale_02.b3d",
	textures = {
		{"ma2_whale_02.png"},
	},
	blood_texture = "mobs_blood.png",
	rotate = 180,
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = false,	
	stepheight = 0,
	fall_damage = 0,
	fall_speed = -6,
	fly = true,
	fly_in = "default:water_source",
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"fishing:fish_cooked"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	sounds = {
      random = "whale_1",
      death = "whale_1",
      distance = 128,
	},
	animation = {
		speed_normal = 0.1,
		speed_run = 0.5,
		walk_start = 2,
		walk_end = 28,
		stand_start = 30,
		stand_end = 50,
		run_start = 2,
		run_end = 28,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})






