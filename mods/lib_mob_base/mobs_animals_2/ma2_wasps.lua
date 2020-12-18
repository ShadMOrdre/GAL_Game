
--wasps nest

minetest.register_node("mobs_animals_2:hive_wasp", {
	description = "Wasp Nest",
	tiles = {"ma2_hive_wasp.png"},
	groups = {crumbly=1, oddly_breakable_by_hand=1, falling_node=1, flammable=1},
	on_destruct = function(pos, oldnode)
		minetest.env:add_entity(pos, "mobs_animals_2:wasp")
		minetest.env:add_entity(pos, "mobs_animals_2:wasp")
		minetest.env:add_entity(pos, "mobs_animals_2:wasp")
		minetest.env:add_entity(pos, "mobs_animals_2:wasp")
	end,
})

mobs:register_mob("mobs_animals_2:bee", {
	type = "monster",
	reach = 1,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 2,
	hp_max = 3,
	armor = 100,
	collisionbox = {-0.1, -0, -0.1, 0.1, 0.5, 0.1},
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	visual = "mesh",
	mesh = "ma2_bee.b3d",
	textures = {
		{"ma2_bee.png"},
	},
	sounds = {
		random = "wasp",
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=0.6, y=0.6},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		walk_start = 6,
		walk_end = 16,
		stand_start = 6,
		stand_end = 16,
		run_start = 6,
		run_end = 16,
		punch_start = 6,
		punch_end = 16,
	},
})




--Wasps!
mobs:register_mob("mobs_animals_2:wasp", {
	type = "monster",
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 2,
	hp_max = 5,
	armor = 100,
	collisionbox = {-0.1, -0, -0.1, 0.1, 0.5, 0.1},
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	visual = "mesh",
	mesh = "ma2_wasp.b3d",
	textures = {
		{"ma2_wasp.png"},
	},
	sounds = {
		random = "wasp",
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=0.6, y=0.6},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 15,
		speed_run = 30,
		walk_start = 1,
		walk_end = 5,
		stand_start = 1,
		stand_end = 5,
		run_start = 1,
		run_end = 5,
		punch_start = 6,
		punch_end = 15,
	},
})


--mobs:register_egg("mobs_animals_2:wasp", "Wasp", "dmobs_wasp_bg.png", 1)

mobs:register_mob("mobs_animals_2:wasp_leader", {
	type = "monster",
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	shoot_interval = 1,
	arrow = "mobs_animals_2:sting",
	shoot_offset = 0,
	hp_min = 82,
	hp_max = 122,
	armor = 130,
	collisionbox = {-0.4, -0, -0.4, 0.3, 2, 0.3},
	pathfinding = true,
	fly = true,
	fall_speed = 0,
	stepheight = 1.5,
	visual = "mesh",
	mesh = "ma2_wasp.b3d",
	textures = {
		{"ma2_wasp.png"},
	},
	sounds = {
		random = "wasp",
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3.5, y=3.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "default:gold_lump", chance = 1, min = 3, max = 5},
	},
	do_custom = function(self)
	if math.random(1, 500) >= 500 then
		local pos = self.object:getpos()
		minetest.env:add_entity(pos, "mobs_animals_2:wasp")
		end
	end,
	replace_rate = 700,
	replace_what = {"air"},
	replace_with = "mobs_animals_2:hive_wasp",
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 6,
		speed_run = 15,
		walk_start = 1,
		walk_end = 5,
		stand_start = 1,
		stand_end = 5,
		run_start = 1,
		run_end = 5,
		shoot_start = 6,
		shoot_end = 15,
	},
})


--mobs:register_egg("mobs_animals_2:wasp_leader", "King of Sting", "dmobs_wasp_bg.png", 1)
