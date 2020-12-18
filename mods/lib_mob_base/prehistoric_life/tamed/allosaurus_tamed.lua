
local S = mobs.intllib



mobs:register_mob("prehistoric_life:allosaurus_tamed", {
	type = "tamed_dinosaur",
        attacks_animals = true,
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 15,
	hp_min = 78,
	hp_max = 86,
	armor = 100,
	collisionbox = {-1.25, -1.50, -1.0, 1.0, 0.7, 1.0},
	visual = "mesh",
	mesh = "prehistoric_life_allosaurus.b3d",
	textures = {
		{"prehistoric_life_allosaurus.png"},
	},
	child_texture = {
		{"prehistoric_life_allosaurus_child.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dirtmonster",
	},
	view_range = 26,
	walk_velocity = 2,
	run_velocity = 5,
	runaway = false,
	drops = {
		{name = "prehistoric_life:allosaurus_raw", chance = 1, min = 2, max = 2},
		{name = "prehistoric_life:allosaurus_tooth", chance = 3, min = 1, max = 2},
	},
	water_damage = 2,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 7,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		stand_start = 40,
		stand_end = 80,
		walk_start = 1,
		walk_end = 30,
		run_start = 1,
		run_end = 30,
	},

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end
	end,

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

		minetest.add_item(pos, "prehistoric_life:allosaurus_egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("prehistoric_life:allosaurus_tamed", S("Tamed Allosaurus"), "prehistoric_life_overlay_allosaurus.png", 1)
