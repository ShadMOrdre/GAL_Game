
local S = mobs.intllib



mobs:register_mob("prehistoric_life:tyrannosaurus_tamed", {
        type = "tamed_dinosaur",
	passive = false,
        attacks_monsters = true,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 32,
	hp_min = 166,
	hp_max = 175,
	armor = 100,
	collisionbox = {-1.75, -1.75, -1.75, 1.8, 1.75, 1.75},
	visual = "mesh",
	mesh = "prehistoric_life_tyrannosaurus.b3d",
	textures = {
		{"prehistoric_life_tyrannosaurus.png"},
	},
	child_texture = {
		{"prehistoric_life_tyrannosaurus_child.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dirtmonster",
	},
	view_range = 34,
	walk_velocity = 2,
	run_velocity = 3,
	runaway = false,
	drops = {
		{name = "prehistoric_life:tyrannosaurus_raw", chance = 1, min = 1, max = 3},
		{name = "prehistoric_life:tyrannosaurus_tooth", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	fall_damage = 4,
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

		minetest.add_item(pos, "prehistoric_life:tyrannosaurus_egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("prehistoric_life:tyrannosaurus_tamed", S("Tamed Tyrannosaurus"), "prehistoric_life_overlay_tyrannosaurus.png", 1)
