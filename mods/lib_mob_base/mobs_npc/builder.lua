
-- Example entity that builds

mobs:register_mob("mobs_npc:builder_npc", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = false,
	attack_npcs = false,
	owner_loyal = true,
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	drawtype = "front",
	textures = {"steampunkengineer.png",	
		"3d_armor_trans.png",
		"worktable_saw.png",
	},
	child_texture = {
		{"mobs_npc_baby.png"}, -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "gal:tree_default_wood", chance = 1, min = 1, max = 3},
		{name = "gal:fruit_apple", chance = 2, min = 1, max = 2},
		{name = "lib_handtoole:tool_axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 20,
	owner = "",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	on_rightclick = function(self, clicker)
		if self.order == "build" then
			return
		end

		local pos = self.object:get_pos()
		nbq.build_schematic(self, nbq.modpath .. "/schematics/mgs_turret_new_01_6w_6l_9h_0_90.meta.conf", 
			vector.add(pos, {x = 1, y = 0, z = 1}), "0", 0)
	end,
	do_custom = nbq.build_process,
})

mobs:register_egg("mobs_npc:builder_npc", "Builder NPC", "default_brick.png", 1)
