
local S = mobs.intllib



mobs:register_mob("prehistoric_life:velociraptor_tamed", {
	type = "tamed_dinosaur",
        attacks_monsters = true,
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 4,
	hp_min = 21,
	hp_max = 32,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "prehistoric_life_velociraptor.b3d",
	textures = {
		{"prehistoric_life_velociraptor.png"},
	},
	child_texture = {
		{"prehistoric_life_velociraptor_child.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dirtmonster",
	},
	view_range = 26,
	walk_velocity = 3,
	run_velocity = 5,
	runaway = false,
	drops = {
		{name = "prehistoric_life:velociraptor_raw", chance = 1, min = 2, max = 2},
		{name = "prehistoric_life:velociraptor_tooth", chance = 3, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 6,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		stand_start = 30,
		stand_end = 70,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
	},

	do_custom = function(self, dtime)

		self.egg_timer = (self.egg_timer or 0) + dtime
		if self.egg_timer < 10 then
			return
		end
		self.egg_timer = 0

		if self.child
		or math.random(1, 200) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, "prehistoric_life:velociraptor_egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("prehistoric_life:velociraptor_tamed", S("Tamed Velociraptor"), "prehistoric_life_overlay_velociraptor.png", 1)
