

local function random_appearence()

	local appearence = {}
	local chosen_skin = nil
	local chosen_armour = nil
	local chosen_weapon = nil

	local skins = {
		"mobs_others_snow_walker.png",
		"mobs_others_snow_walker_1.png",
		"mobs_others_snow_walker_2.png"
	}

	local weapons = {
		"mobs_others_crystal_sword.png",
		"mobs_others_crystal_axe.png"
	}

	local ARMOUR = "mobs_others_helmet_crystal.png" ..
		"^" .. "mobs_others_chestplate_crystal.png" ..
		"^" .. "mobs_others_leggings_crystal.png" ..
		"^" .. "mobs_others_boots_crystal.png" ..
		"^" .. "mobs_others_shield_crystal.png"

	local ARMOUR_HELMET = "mobs_others_helmet_crystal.png"

	local ARMOUR_SHIELD = "mobs_others_shield_crystal.png"

	local ARMOUR_HELMET_SHIELD = "mobs_others_helmet_crystal.png" ..
		"^" .. "mobs_others_shield_crystal.png"

	local armours = {
		ARMOUR,
		ARMOUR_HELMET,
		ARMOUR_SHIELD,
		ARMOUR_HELMET_SHIELD
	}

	chosen_skin = skins[math.random(1, 3)]
	chosen_armour = armours[math.random(1, 4)]
	chosen_weapon = weapons[math.random(1, 2)]
	
	--table.insert(appearence, 1, chosen_skin)
	--table.insert(appearence, 2, chosen_armour)
	--table.insert(appearence, 3, chosen_weapon)
	--table.insert(appearence, 4, "mobs_others_transparent.png")
	--appearence = {
	--	{chosen_skin},
	--	{chosen_armour},
	--	{chosen_weapon},
	--	{"mobs_others_transparent.png"}
	--}

	local appearence_string = {chosen_skin, chosen_armour, chosen_weapon}

	--return appearence
	return appearence_string
end

mobs:register_mob("mobs_races:snowbarian1", {
	type = "monster",
	passive = false,
	docile_by_day = false,
	attacks_monsters = true,
	group_attack = true,
	attack_animals = true,
	hp_min = 20,
	hp_max = 65,
	exp_min = 10,
	exp_max = 65,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	--textures = {
	--	"barbarian.png",	
	--	"3d_armor_trans.png",
	--	"default_tool_steelsword.png",
	--},
	textures = random_appearence(),
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 4,
	drops = { },
	armor = 150,
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
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
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell2",
		death = "mobs_barbarian_death",
		attack = "default_sword_steel2",
	},
	step=0.5,
	blood_amount = 35,
	blood_offset = 0.25,
	activity_level=2,


	on_spawn = function(self, pos)
		--self.light_damage = dps(self)
		--self.textures = random_appearence()
		self.object:set_properties({textures = random_appearence()})
		return true
	end,

})

mobs:register_mob("mobs_races:snowbarian2", {
	type = "monster",
	passive = false,
	docile_by_day = false,
	attacks_monsters = true,
	group_attack = true,
	attack_animals = true,
	hp_min = 20,
	hp_max = 65,
	exp_min = 10,
	exp_max = 65,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	--textures = {
	--	"barbarian.png",	
	--	"3d_armor_trans.png",
	--	"castle_battleaxe.png",
	--},
	textures = random_appearence(),
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 4,
	drops = { },
	armor = 150,
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
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
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_death",
		attack = "default_sword_steel",
	},
	step=0.5,
	blood_amount = 35,
	blood_offset = 0.25,
	activity_level=2,
})

mobs:register_mob("mobs_races:snowbarian_archer", {
	type = "monster",
	passive = false,
	docile_by_day = false,
	attacks_monsters = true,
	group_attack = true,
	attack_animals = true,
	hp_min = 10,
	hp_max = 45,
	exp_min = 10,
	exp_max = 65,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	--textures = {
	--	"barbarian.png",	
	--	"3d_armor_trans.png",
	--	"bows_bow_steel.png",
	--},
	textures = random_appearence(),
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 25,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 4,
	drops = { },
	armor = 150,
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "shoot",
	arrow_offset = 1.2,
	arrow = "bows:arrow_steel",
	shoot_interval = 2.2,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		death = "mobs_barbarian_death",
	},
	step=0.5,
	blood_amount = 35,
	blood_offset = 0.25,
	activity_level=2,
})



