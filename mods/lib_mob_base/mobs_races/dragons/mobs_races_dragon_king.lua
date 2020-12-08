local gdragon_base = {
	type = "monster",
	passive = false,
	attacks_monsters = false,
	damage = 5,
	reach = 4,
	attack_type = "dogshoot",
	shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	arrow = "dmobs:lightning",
	shoot_offset = 1,
	hp_min = 140,
	hp_max = 180,
	armor = 220,
	collisionbox = {-0.6, -1.4, -0.6, 0.6, 0.6, 0.6},
	visual = "mesh",
	mesh = "enderdragon.b3d",
	textures = {
	  {"enderdragon.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	runaway = false,
	jump_chance = 30,
	walk_chance = 80,
	fall_speed = 0,
	pathfinding = true,
	fall_damage = 0,
	sounds = {
		shoot_attack = "mobs_fireball",
	  random = "roar",
	},
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	drops = {
		{name = "mobs_races:dragon_egg_king", chance = 1, min = 1, max = 1},
	},
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 20,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 1,
		walk_end = 22,
		stand_start = 1,
		stand_end = 22,
		run_start = 1,
		run_end = 22,
		punch_start = 22,
		punch_end = 47,
	},
	knock_back = 2,
}

mobs:register_mob("mobs_races:dragon_king", mobs_races.deepclone(gdragon_base) )

gdragon_base.type = "npc"
gdragon_base.attacks_monsters = true

gdragon_base.on_rightclick = mobs_races.dragon.ride
	
gdragon_base.do_custom = mobs_races.dragon.do_custom

mobs:register_mob("mobs_races:dragon_king_tame", mobs_races.deepclone(gdragon_base) )


--###################
--################### ENDERDRAGON
--###################

mobs:register_mob("mobs_races:end_dragon", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "enderdragon.b3d",
	textures = {
		{"enderdragon.png"},
	},
	visual_size = {x=1, y=1},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_races:end_dragon", "Enderdragon", "enderdragon_inv.png", 0)


