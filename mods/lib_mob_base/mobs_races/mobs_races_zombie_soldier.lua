


-- raw zombie meat
minetest.register_craftitem("mobs_races:zombie_flesh", {
	description = "Zombie Flesh",
	inventory_image = "mobs_zombie_flesh.png",
	on_use = minetest.item_eat(-1),
})




mobs:register_mob("mobs_races:zombie_soldier", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 20,
	hp_max = 30,
	armor = 120,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_zombie_soldier.png"},
	},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = 1,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 15,
	drops = {
		{name = "mobs_races:zombie_flesh", chance = 2, min = 1, max = 2},
	},
	animation = {
		speed_normal = 27,
		speed_run = 27,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
})


--mobs:register_egg("mobs_races:zombie", "Zombie", "wool_dark_green.png", 1)
--mobs:register_spawn("mobs_races:zombie", {"default:dirt_with_grass", "default:desert_sand", "default:dirt_with_leafy_grass", "default:dirt_with_dry_grass"}, 5, 0, 7000, 20, 11000, true)






