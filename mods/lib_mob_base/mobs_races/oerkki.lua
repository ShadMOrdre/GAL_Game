
local S = mobs.intllib


-- Oerkki by PilzAdam

mobs:register_arrow("mobs_races:lightning", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"mobs_trans.png"},
   velocity = 4,
   tail = 0, -- enable tail

   hit_player = function(self, player)
	  player:punch(self.object, 1.0, {
	 full_punch_interval = 1.0,
	 damage_groups = {fleshy = 3},
	  }, nil)
   end,
   
   hit_mob = function(self, player)
	  player:punch(self.object, 1.0, {
	 full_punch_interval = 1.0,
	 damage_groups = {fleshy = 3},
	  }, nil)
   end,

   hit_node = function(self, pos, node)
	  self.object:remove()
   end,
   
   on_step = function(self)
		local velo = self.object:getvelocity()
		local pos = self.object:getpos()
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expiration_time = 0.1,
			size = 5,
			collision_detection = true,
			collision_removal = true,
			vertical = true,
			texture = "mobs_lightning.png",
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=1.0},
			glow = 12,
		})
   end,
})


mobs:register_mob("mobs_races:oerkki", {
	type = "monster",
	passive = false,
	shoot_offset = 0.7,
	shoot_interval = 1,
	arrow = "mobs_races:lightning",
	attack_type = "shoot",
	pathfinding = true,
	reach = 2,
	damage = 4,
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.9, 0.4},
	visual = "mesh",
	mesh = "mobs_oerkki.b3d",
	textures = {
		{"mobs_oerkki.png"},
		{"mobs_oerkki2.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_oerkki",
	},
	walk_velocity = 1,
	run_velocity = 3,
	view_range = 10,
	jump = true,
	drops = {
		{name = "gal:stone_obsidian", chance = 3, min = 0, max = 2},
		{name = "gal:metal_gold_lump", chance = 2, min = 0, max = 2},
	},
	water_damage = 2,
	lava_damage = 4,
	light_damage = 1,
	fear_height = 4,
	animation = {
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 36,
		run_start = 37,
		run_end = 49,
		punch_start = 37,
		punch_end = 49,
		speed_normal = 15,
		speed_run = 15,
	},
	replace_rate = 5,
	replace_what = {"torch:torch"},
	replace_with = "air",
	replace_offset = -1,
	immune_to = {
		{"lib_handtools:tool_sword_bronze", 0}, -- no damage
		{"gal:metal_gold_lump", -10}, -- heals by 10 points
	},
})


if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "mobs_races:oerkki",
	nodes = {"default:stone"},
	max_light = 7,
	chance = 7000,
	max_height = -10,
})
end


mobs:register_egg("mobs_races:oerkki", S("Oerkki"), "default_obsidian.png", 1)


--mobs:alias_mob("mobs:oerkki", "mobs_monster:oerkki") -- compatiblity
