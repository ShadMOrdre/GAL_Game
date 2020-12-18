


-- raw zombie meat
minetest.register_craftitem("mobs_races:zombie_flesh", {
	description = "Zombie Flesh",
	inventory_image = "mobs_zombie_flesh.png",
	on_use = minetest.item_eat(-1),
})



mobs:register_arrow("mobs_races:stone", {
   visual = "cube",
   visual_size = {x = 1, y = 1},
   textures = {
   "default_stone.png",
   "default_stone.png",
   "default_stone.png",
   "default_stone.png",
   "default_stone.png",
   "default_stone.png",
   },
   velocity = 8,
   tail = 0, -- enable tail

   hit_player = function(self, player)
	  player:punch(self.object, 1.0, {
	 full_punch_interval = 1.0,
	 damage_groups = {fleshy = 5},
	  }, nil)
   end,
   
   hit_mob = function(self, player)
	  player:punch(self.object, 1.0, {
	 full_punch_interval = 1.0,
	 damage_groups = {fleshy = 5},
	  }, nil)
   end,

   hit_node = function(self, pos, node)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="gal:stone"})
		end
		self.object:remove()
   end,
   
   on_activate = function(self)
		self.object:set_properties({visual_size = {x=0, y=0},})
		local pos = self.object:getpos()
		local velo = self.object:get_velocity()
		self.object:set_pos({x=pos.x, y=pos.y+1.5, z=pos.z})
		minetest.after(0.5, function()
		self.object:set_properties({visual_size = {x=1, y=1},})
		--self.object:set_velocity({x=velo.x*8, y=0, z=velo.z*8})
		self.object:set_acceleration({x=velo.x*8, y=-9, z=velo.z*8})
		end)
   end
})

mobs:register_mob("mobs_races:zombie_brute", {
	type = "monster",
	passive = false,
	reach = 4,
	damage = 4,
	attack_type = "dogshoot",
   shoot_interval = 3,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =1,
   arrow = "mobs_races:stone",
   shoot_offset = 1,
	hp_min = 60,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.7,0,-0.7, 0.7,2,0.7},
	visual = "mesh",
	mesh = "zombie_brute.b3d",
	textures = {
		{"mobs_zombie_brute.png"},
	},
	blood_texture = "mobs_rotten_blood.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = 1,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	view_range = 15,
	drops = {
		{name = "mobs_races:zombie_flesh", chance = 2, min = 2, max = 5},
	},
	animation = {
		speed_normal = 27,
		speed_run = 35,
		stand_start = 1,
		stand_end = 20,
		walk_start = 45,
		walk_end = 65,
		run_start = 45,
		run_end = 65,
		punch_start = 20,
		punch_end = 40,
		shoot_start = 75,
		shoot_end = 95,
	},
})


--mobs:register_egg("mobs_races:zombie_brute", "Zombie Brute (boss)", "default_dirt.png", 1)
--mobs:register_spawn("mobs_races:zombie_brute", {"default:dirt_with_grass",}, 5, 0, 7000, 20, 11000)





















