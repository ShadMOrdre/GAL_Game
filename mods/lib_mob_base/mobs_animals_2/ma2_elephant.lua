mobs:register_mob("mobs_animals_2:elephant_01", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.9, -2.0, -0.9, 0.9, 0.9, 0.9},
	visual = "mesh",
	mesh = "ma2_elephant_01.b3d",
	textures = {
		{"ma2_elephant_01.png"},
	},
	visual_size = {x=3.5, y=3.5},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -20, -- extra heavy!
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"gal:grass_3", "gal:grass_4", "gal:grass_5", "gal:grass_bamboo"},
	replace_with = "air",
	follow = {"gal:item_wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 3,
		walk_end = 19,
		stand_start = 20,
		stand_end = 30,
		run_start = 3,
		run_end = 19,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})




mobs:register_mob("mobs_animals_2:elephant_02", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	reach = 3,
	damage = 5,
	hp_min = 50,
	hp_max = 150,
	armor = 100,
	visual = "mesh",
	mesh = "ma2_elephant_02.b3d",
	textures = {
		{"ma2_elephant_02.png"},
	},
	visual_size = {x=1.0, y=1.0},
	collisionbox = {-1.1, 0, -1.1, 1.1, 2.1, 1.1},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = 0,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -9, 
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"gal:grass_3", "gal:grass_4", "gal:grass_5", "gal:grass_bamboo"},
	replace_with = "air",
	follow = {"gal:tree_default_leaves"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 3, max = 4},
	},
	animation = {
		speed_normal = 14,
		speed_run = 16,
		walk_start = 25,
		walk_end = 45,
		stand_start = 1,
		stand_end = 20,
		run_start = 25,
		run_end = 45,
		punch_start = 25,
		punch_end = 45,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})




