





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


mobs:register_mob("mobs_races:witch", {
	type = "monster",
	passive = false,
	shoot_offset = 0.7,
	shoot_interval = 1,
	arrow = "mobs_races:lightning",
	attack_type = "shoot",
	hp_min = 30,
	hp_max = 40,
	armor = 100,
	collisionbox = {-0.35,0,-0.35, 0.35,1.8,0.35},
	visual = "mesh",
	mesh = "witch.b3d",
	textures = {
		{"mobs_witch.png"},
	},
	makes_footstep_sound = true,
	walk_velocity = 1.3,
	run_velocity = 1.5,
	jump = 1,
	water_damage = 5,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	view_range = 15,
	drops = {
		{name = "gal:stone_obsidian", chance = 2, min = 1, max = 2},
	},
	animation = {
		speed_normal = 16,
		speed_run = 20,
		stand_start = 1,
		stand_end = 30,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
		shoot_start = 30,
		shoot_end = 50,
	},
})


--mobs:register_egg("mobs_races:witch", "Witch", "wool_violet.png", 1)
--mobs:register_spawn("mobs_races:witch", {"mapgen:dirt_with_swamp_grass",}, 5, 0, 7000, 20, 11000)



















