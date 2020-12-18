
local S = mobs.intllib



mobs:register_mob("prehistoric_life:nautilus", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 6,
	armor = 100,
	fly = true,
	fly_in = "default:water_source",
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	visual = "mesh",
	mesh = "prehistoric_life_nautilus.b3d",
	textures = {
		{"prehistoric_life_nautilus.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "prehistoric_life_bubbles",
	},
	walk_velocity = 1,
	run_velocity = 1,
	runaway = true,
	drops = {
		{name = "prehistoric_life:nautilus_raw", chance = 1, min = 2, max = 2},
		{name = "prehistoric_life:nautilus_shell", chance = 3, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 7,
	light_damage = 0,
	fall_damage = 0,
	fear_height = 0,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 1,
		walk_end = 60,
		run_start = 1,
		run_end = 60,
	},
	on_rightclick = function(self, clicker)

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end
	end,
})

local spawn_on = "default:water_source"

mobs:spawn({
	name = "prehistoric_life:nautilus",
	nodes = {spawn_on},
	min_light = nil,
	chance = 15000,
	min_height = 0,
	day_toggle = nil,
})

mobs:register_egg("prehistoric_life:nautilus", S("Nautilus"), "prehistoric_life_overlay_nautilus.png", 1)

-- tooth
minetest.register_craftitem("prehistoric_life:nautilus_shell", {
	description = ("Nautilus Shell"),
	inventory_image = "prehistoric_life_nautilus_shell.png",
})

-- raw meat
minetest.register_craftitem("prehistoric_life:raw_nautilus", {
	description = ("Raw Nautilus"),
	inventory_image = "prehistoric_life_raw_nautilus.png",
	on_use = minetest.item_eat(-3),
})

-- cooked meat
minetest.register_craftitem("prehistoric_life:cooked_nautilus", {
	description = ("Calamari"),
	inventory_image = "prehistoric_life_calamari.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "prehistoric_life:raw_nautilus",
	recipe = "prehistoric_life:cooked_nautilus",
	cooktime = 5,
})
