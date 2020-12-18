mobs:register_mob("mobs_animals_2:quagga", {
	type = "animal",
	passive = false,
	hp_min = 50,
	hp_max = 60,
	armor = 120,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "horse.b3d",
	textures = {
		{"ma2_quagga.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3.2,
	jump = 1,
	stepheight = 1.2,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1, 
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"gal:grass_3", "gal:grass_4", "gal:grass_5",},
	replace_with = "air",
	follow = {"gal:item_wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 3, max = 4},
	},
	animation = {
		speed_normal = 16,
		speed_run = 22,
		walk_start = 25,
		walk_end = 45,
		stand_start = 80,
		stand_end = 120,
		run_start = 50,
		run_end = 70,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end
		
		if self.driver and clicker == self.driver then
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver and clicker:get_wielded_item():get_name() == "mobs:saddle" then
		object_attach(self, clicker, {x=0, y=25, z=0}, true, {x=2, y=6, z=0})
		end
	
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
	do_custom = function(self, dtime)
	if self.driver then
		self.state = "stand"
		object_drive(self, dtime, {
			speed = 6.3, 
			decell = 0.65,
			moving_anim = {x=50, y=70},
			stand_anim = {x=1, y=1},
			ignore_water = true
		})
		return false
		end
	return true
	end,
})


mobs:register_mob("mobs_animals_2:zebra", {
	type = "animal",
	passive = false,
	hp_min = 50,
	hp_max = 60,
	armor = 120,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "horse.b3d",
	textures = {
		{"ma2_zebra.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3.2,
	jump = 1,
	stepheight = 1.2,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1, 
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"gal:grass_3", "gal:grass_4", "gal:grass_5",},
	replace_with = "air",
	follow = {"gal:item_wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 3, max = 4},
	},
	animation = {
		speed_normal = 16,
		speed_run = 22,
		walk_start = 25,
		walk_end = 45,
		stand_start = 80,
		stand_end = 120,
		run_start = 50,
		run_end = 70,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end
		
		if self.driver and clicker == self.driver then
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver and clicker:get_wielded_item():get_name() == "mobs:saddle" then
		object_attach(self, clicker, {x=0, y=25, z=0}, true, {x=2, y=6, z=0})
		end
	
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
	do_custom = function(self, dtime)
	if self.driver then
		self.state = "stand"
		object_drive(self, dtime, {
			speed = 6.3, 
			decell = 0.65,
			moving_anim = {x=50, y=70},
			stand_anim = {x=1, y=1},
			ignore_water = true
		})
		return false
		end
	return true
	end,
})


mobs:register_mob("mobs_animals_2:donkey", {
	type = "animal",
	passive = false,
	hp_min = 50,
	hp_max = 60,
	armor = 120,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "horse.b3d",
	textures = {
		{"ma2_donkey.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3.2,
	jump = 1,
	stepheight = 1.2,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1, 
	fear_height = 2,
	replace_rate = 10,
	replace_what = {"gal:grass_3", "gal:grass_4", "gal:grass_5",},
	replace_with = "air",
	follow = {"gal:item_wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 2, min = 3, max = 4},
	},
	animation = {
		speed_normal = 16,
		speed_run = 22,
		walk_start = 25,
		walk_end = 45,
		stand_start = 80,
		stand_end = 120,
		run_start = 50,
		run_end = 70,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end
		
		if self.driver and clicker == self.driver then
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver and clicker:get_wielded_item():get_name() == "mobs:saddle" then
		object_attach(self, clicker, {x=0, y=25, z=0}, true, {x=2, y=6, z=0})
		end
	
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
	do_custom = function(self, dtime)
	if self.driver then
		self.state = "stand"
		object_drive(self, dtime, {
			speed = 6.3, 
			decell = 0.65,
			moving_anim = {x=50, y=70},
			stand_anim = {x=1, y=1},
			ignore_water = true
		})
		return false
		end
	return true
	end,
})

