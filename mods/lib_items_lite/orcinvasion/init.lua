--vehicle api
dofile(minetest.get_modpath("orcinvasion").."/api.lua")

--mapgen
--[[
minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:desert_sand", "default:snowblock", "default:dirt_with_snow", "default:dirt_with_dry_grass"},
		sidelen = 116,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_min = 5,
		y_max = 31000,
		schematic = minetest.get_modpath("orcinvasion").."/schematics/castle.mts",
		flags = "place_center_x",
		rotation = "random",
	})
--]]
--siege engines


minetest.register_entity("orcinvasion:catapult", {
	visual = "mesh",
	mesh = "catapult.b3d",
	textures = {"catapult2.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	damage = 2,
	physical = true,
	collisionbox = {-2, -0.4, -2, 2, 2, 2},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		object_attach(self, clicker, {x=0, y=6, z=6}, false, {x=0, y=0, z=5})
		end
	end,
	on_step = function(self, dtime)
	if self.driver then
		object_drive(self, dtime, 1, 0.5, true, "orcinvasion:rock", 10, nil, nil, false)
		return false
		end
		return true
	end,
})
--
register_vehicle_spawner("orcinvasion:catapult", "catapult", "orcinvasion_ctplt.png", false)
--
--nodes and items

minetest.register_node("orcinvasion:brick", {
	description = "Orc Brick",
	tiles = {
		"orcinvasion_brick.png",
	},
	groups = {cracky=3}
})

minetest.register_craftitem("orcinvasion:meat", {
	description = "orc meat",
	wield_image = "orcinvasion_orcflesh.png",
	inventory_image = "orcinvasion_orcflesh.png",
	on_use = minetest.item_eat(-1)
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "orcinvasion:meat",
	cooktime = 5,
})
--[[
minetest.register_node("orcinvasion:spawner", {
	description = "Orc Spawner",
	tiles = {
		"orcinvasion_spawner.png",
	},
	groups = {cracky=3}
})

minetest.register_node("orcinvasion:spawner2", {
	description = "Orc(archer) Spawner",
	tiles = {
		"orcinvasion_spawner2.png",
	},
	groups = {cracky=3}
})
--]]
minetest.register_node("orcinvasion:flag", {
	description = "Orc flag",
	drawtype = "torchlike",
	tiles = {"orcinvasion_flag.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "orcinvasion_flag.png",
	visual_scale = 5.5,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {oddly_breakable_by_hand=1, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	walkable = false,
})

minetest.register_node("orcinvasion:spears", {
	description = "Orc spears",
	drawtype = "plantlike",
	tiles = {"orcinvasion_spears.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "orcinvasion_spears.png",
	visual_scale = 2,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {oddly_breakable_by_hand=1, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	walkable = false,
})


minetest.register_node("orcinvasion:torch", {
	description = "Orc Torch",
	drawtype = "torchlike",
	inventory_image = "orcinvasion_torch_inv.png",
	wield_image = "orcinvasion_torch_inv.png",
	tiles = {{
		name = "orcinvasion_torch.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	}},
	selection_box = {
		type = "wallmounted",
	},
	light_source = 20,
	sunlight_propogates = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {cracky=1, oddly_breakeable_by_hand=1}
})

--abms
--[[
minetest.register_abm({
	nodenames = {"orcinvasion:spawner"},
	interval = 10,
	chance = 10,
	action = function(pos)
		minetest.env:add_entity({x=pos.x, y=pos.y+2, z=pos.z}, "orcinvasion:orc_soldier")
	end
})

minetest.register_abm({
	nodenames = {"orcinvasion:spawner2"},
	interval = 10,
	chance = 10,
	action = function(pos)
		minetest.env:add_entity({x=pos.x, y=pos.y+2, z=pos.z}, "orcinvasion:orc_archer")
	end
})


--mobs



mobs:register_mob("orcinvasion:orc_soldier", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 72,
	hp_max = 82,
	armor = 100,
	collisionbox = {-0.4, 0, -0.4, 0.4, 2, 0.4},
	visual = "mesh",
	mesh = "orc_soldier.b3d",
	textures = {
		{"orc_soldier.png"},
		{"orc_soldier2.png"},
		{"orc_soldier3.png"},
	},
	drops = {{name = "orcinvasion:meat", chance = 10, min = 1, max = 3},},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 30,
		walk_start = 52,
		walk_end = 72,
		stand_start = 1,
		stand_end = 10,
		run_start = 52,
		run_end = 71,
		punch_start = 20,
		punch_end = 50,

	},
})


mobs:register_spawn("orcinvasion:orc_soldier", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 350, 2, 31000)

mobs:register_egg("orcinvasion:orc_soldier", "Orc (soldier)", "default_desert_sand.png", 1)

mobs:register_mob("orcinvasion:orc_archer", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "shoot",
	shoot_interval = 2,
	shoot_offset = 0.5,
	arrow = "orcinvasion:arrow",
	hp_min = 42,
	hp_max = 52,
	armor = 100,
	collisionbox = {-0.4, 0, -0.4, 0.4, 2.5, 0.4},
	visual = "mesh",
	mesh = "orc_archer.b3d",
	textures = {
		{"orcinvasion_archer.png"},
	},
	drops = {{name = "orcinvasion:meat", chance = 10, min = 1, max = 3},},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 30,
		walk_start = 55,
		walk_end = 75,
		stand_start = 1,
		stand_end = 10,
		run_start = 55,
		run_end = 75,
		shoot_start = 20,
		shoot_end = 35,

	},
})


mobs:register_spawn("orcinvasion:orc_archer", {"default:wood","default:dirt_with_grass", "default:desert_sand"}, 20, 10, 650, 2, 31000)

mobs:register_egg("orcinvasion:orc_archer", "Orc (archer)", "default_desert_sand.png", 1)

mobs:register_mob("orcinvasion:ogre", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 72,
	hp_max = 82,
	armor = 90,
	collisionbox = {-0.6, 0, -0.6, 0.6, 3.2, 0.6},
	visual = "mesh",
	mesh = "ogre.b3d",
	textures = {
		{"orcinvasion_ogre.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 30,
		walk_start = 40,
		walk_end = 60,
		stand_start = 1,
		stand_end = 20,
		run_start = 40,
		run_end = 60,
		punch_start = 20,
		punch_end = 35,

	},
})


mobs:register_spawn("orcinvasion:ogre", {"default:dirt_with_dry_grass","default:dirt_with_grass", "default:desert_sand"}, 20, 10, 1050, 2, 31000)

mobs:register_egg("orcinvasion:ogre", "Ogre", "default_dry_grass.png", 1)
--]]
--arrows
mobs:register_arrow("orcinvasion:arrow", {
   visual = "sprite",
   visual_size = {x=0.3, y=0.3},
   textures = {"orcinvasion_arrow.png"},
   velocity = 12,
   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,
   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

minetest.register_entity("orcinvasion:rock", {
	visual = "mesh",
	mesh = "rock.b3d",
	textures = {"orcinvasion_rock.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)
		minetest.after(30, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "orcinvasion:rock" and n ~= "orcinvasion:catapult" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=15},
						}, nil)
						self.object:remove()
					end
				end
			end
			
					for dx=-1,1 do
						for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "orcinvasion:rock" and n ~= "orcinvasion:catapult" and n ~= "air" then
									local pos = self.object:getpos()
									tnt.boom(pos, {damage_radius=5,radius=2,ignore_protection=false})
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



