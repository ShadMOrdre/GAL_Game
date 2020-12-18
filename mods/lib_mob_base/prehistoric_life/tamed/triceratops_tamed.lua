
local S = mobs.intllib



mobs:register_mob("prehistoric_life:triceratops_tamed", {
	type = "tamed_dinosaur",
	passive = true,
	hp_min = 97,
	hp_max = 116,
	armor = 100,
	collisionbox = {-1, -1, -1, 1.8, 1.7, 1},
	visual = "mesh",
	mesh = "prehistoric_life_triceratops.b3d",
	textures = {
		{"prehistoric_life_triceratops.png"},
	},
	child_texture = {
		{"prehistoric_life_triceratops_child.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dirtmonster",
	},
	view_range = 26,
	walk_velocity = 1,
	run_velocity = 3,
	runaway = false,
	drops = {
		{name = "prehistoric_life:triceratops_raw", chance = 1, min = 2, max = 2},
		{name = "prehistoric_life:triceratops_tooth", chance = 3, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 6,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		stand_start = 50,
		stand_end = 100,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
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

		minetest.add_item(pos, "prehistoric_life:triceratops_egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("prehistoric_life:triceratops_tamed", S("Tamed Triceratops"), "prehistoric_life_overlay_triceratops.png", 1)
