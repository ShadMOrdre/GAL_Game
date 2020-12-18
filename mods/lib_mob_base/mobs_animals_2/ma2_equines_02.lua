
-- saddles
minetest.register_craftitem("mobs_animals_2:saddle", {
	description = "Saddle",
	inventory_image = "ma2_saddle.png",
})

minetest.register_craft({
	output = "mobs_animals_2:saddle",
	recipe = {
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', 'default:steel_ingot', 'mobs:leather'},
		{'mobs:leather', 'default:steel_ingot', 'mobs:leather'},
	}
})

--random items
minetest.register_craftitem("mobs_animals_2:saddle2", {
	description = "Horse Saddle",
	inventory_image = "open_ai_saddle.png",
})



mobs:register_mob("mobs_animals_2:equine", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"equine.png"},
	},
	visual = "mesh",
	mesh = "equine.b3d",
	visual_size = {x=2,y=2},
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
		speed_normal = 5,
		stand_start = 1,		stand_end = 80,
		walk_start = 101,		walk_end = 120,
	},
	follow = "gal:item_wheat",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs_animals_2:saddle2" then
			clicker:get_inventory():remove_item("main", "mobs_animals_2:saddle2")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_animals_2:equine")			
		end
	end,
})
mobs:register_mob("mobs_animals_2:equine2", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"ma2_equine2.png"},
	},
	visual = "mesh",
	mesh = "ma2_equine2.b3d",
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
		speed_normal = 5,
		stand_start = 1,		stand_end = 80,
		walk_start = 101,		walk_end = 120,
	},
	follow = "gal:item_wheat",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs_animals_2:saddle2" then
			clicker:get_inventory():remove_item("main", "mobs_animals_2:saddle2")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_animals_2:equine2")			
		end
	end,
})
mobs:register_mob("mobs_animals_2:horse_tamed", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"mobs_horsepeg.png"},
	},
	visual = "mesh",
	mesh = "mobs_horse.x",
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

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs_animals_2:saddle" then
			clicker:get_inventory():remove_item("main", "mobs_animals_2:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_animals_2:horse_tamed")			
		end
	end,
})
