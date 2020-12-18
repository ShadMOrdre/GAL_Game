vehicles = {}

dofile(minetest.get_modpath("vehicles").."/api.lua")


minetest.register_entity("vehicles:airballoon", {
	visual = "mesh",
	mesh = "airballoon.b3d",
	textures = {"vehicles_airballoon.png"},
	velocity = 15,
	acceleration = -5,
	hp_max = 200,
	animation_speed = 5,
	physical = true,
	collisionbox = {-0.7, -0.2, -0.9, 0.7, 0.6, 0.9},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		--vehicles.object_attach(self, clicker, {x=0, y=10, z=1}, true, {x=0, y=2, z=5})
		vehicles.object_attach(self, clicker, {x=0, y=4, z=1}, true, {x=0, y=-2, z=5})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 2, 
			decell = 0.95,
			moving_anim = {x=2, y=20},
			stand_anim = {x=1, y=1},
			fly = true,
			fly_mode = "hold",
			gravity = 0.2,
			animation_speed = 45,
		})
	end,
})

vehicles.register_spawner("vehicles:airballoon", "Airballoon", "vehicles_airballoon_inv.png")

minetest.register_entity("vehicles:boat", {
	visual = "mesh",
	mesh = "vehicles_boat.obj",
	textures = {"vehicles_boat.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.6, 0, -0.7, 0.6, 0.3, 0.7},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=5, z=4}, false, {x=0, y=12, z=4})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 4, 
			decell = 0.95,
			is_watercraft = true,
			gravity = 0,
			brakes = true,
			braking_effect = "vehicles_splash.png",
			handling = {initial=3.3, braking=3.5}
		})
	end,
})
vehicles.register_spawner("vehicles:boat", "Boat", "boat_item.png", true)



minetest.register_entity("vehicles:parachute", {
	visual = "mesh",
	mesh = "parachute.b3d",
	textures = {"vehicles_parachute.png"},
	velocity = 15,
	acceleration = -5,
	hp_max = 2,
	physical = true,
	collisionbox = {-0.5, -1, -0.5, 0.5, 1, 0.5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=0, z=-1.5}, false, {x=0, y=-4, z=0})
		end
	end,
	on_step = function(self, dtime)
	if self.driver then
		vehicles.object_glide(self, dtime, 8, 0.92, -0.2, "", "")
		return false
		end
		return true
	end,
})

minetest.register_tool("vehicles:backpack", {
	description = "Parachute",
	inventory_image = "vehicles_backpack.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+0+dir.z}, "vehicles:parachute")
			local entity = obj:get_luaentity()
			if obj.driver and placer == obj.driver then
			vehicles.object_detach(entity, placer, {x=1, y=0, z=1})
			elseif not obj.driver then
			vehicles.object_attach(entity, placer, {x=0, y=0, z=0}, true, {x=0, y=2, z=0})
			end
			item:take_item()
			return item
	end,
})


--wings
--currently doesn't work
minetest.register_entity("vehicles:wing_glider", {
	visual = "mesh",
	mesh = "wings.b3d",
	textures = {"vehicles_wings.png"},
	velocity = 15,
	acceleration = -5,
	hp_max = 2,
	armor = 0,
	physical = false,
	collisionbox = {-0.5, -0.1, -0.5, 0.5, 0.1, 0.5},
	on_step = function(self, dtime)
	if self.driver then
		local dir = self.driver:get_look_dir();
		local velo = self.object:getvelocity();
		local speed = math.sqrt(math.pow(velo.x, 2)+math.pow(velo.z, 2))
		local vec = {x=dir.x*16,y=dir.y*16+1,z=dir.z*16}
		local yaw = self.driver:get_look_yaw();
		self.object:setyaw(yaw+math.pi/2)
		self.object:setvelocity(vec)
		self.driver:set_animation({x=162, y=167}, 0, 0)
		if not self.anim then
		self.object:set_animation({x=25, y=45}, 10, 0)
		self.anim = true
		end
		return false
		else
		self.object:remove()
		end
		return true
	end,
	on_punch = function(self, puncher)
		if not self.driver then
		local name = self.object:get_luaentity().name
		local pos = self.object:getpos()
		minetest.env:add_item(pos, name.."_spawner")
		self.object:remove()
		end
		if self.object:get_hp() == 0 then
		if self.driver then
		vehicles.object_detach(self, self.driver, {x=1, y=0, z=1})
		end
		self.object:remove()
		end
	end,
})

minetest.register_tool("vehicles:wings", {
	description = "Wings",
	inventory_image = "vehicles_backpack.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local wings_ready = true
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local objs = minetest.get_objects_inside_radius({x=playerpos.x,y=playerpos.y,z=playerpos.z}, 2)	
			for k, obj2 in pairs(objs) do
				if obj2:get_luaentity() ~= nil and obj2:get_luaentity().name == "vehicles:wing_glider" then
					local wing = obj2:get_luaentity()
					wing.driver = nil
					obj2:remove()
					vehicles.object_detach(obj2:get_luaentity(), placer, {x=1, y=0, z=1})
					placer:set_properties({
					visual_size = {x=1, y=1},
					})
					wings_ready = false
				end
			end
			
			if wings_ready then
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+0+dir.z}, "vehicles:wing_glider")
					local entity = obj:get_luaentity()
					placer:set_attach(entity.object, "", {x=0,y=-5,z=0}, {x=0,y=-3,z=0})
					entity.driver = placer
					local dir = placer:get_look_dir()
					placer:set_properties({
					visual_size = {x=1, y=-1},
					})
					item:add_wear(500)
					return item
			end
	end,
})




minetest.register_entity("vehicles:horse", {
	visual = "mesh",
	mesh = "horse.x",
	textures = {"vehicles_horse.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.3, 0.5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=8, z=0}, true, {x=0, y=4, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 13,
			decell = 0.5,
			moving_anim = {x=75, y=100},
			stand_anim = {x=25, y=25},
			jump_type = "jump",
			jump_anim = {x=25, y=50},
			extra_yaw = 1.57,
			handling = {initial=2, braking=3}
		})
	end,
})

vehicles.register_spawner("vehicles:horse", "Horse", "vehicles_horse_inv.png", true)

minetest.register_entity("vehicles:ship", {
	visual = "mesh",
	mesh = "ship.b3d",
	textures = {"vehicles_ship.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 0,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0.4, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=20, z=4}, true, {x=0, y=5, z=4})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 12, 
			decell = 0.85,
			is_watercraft = true,
			gravity = 0,
			boost = true,
			boost_duration = 10,
			boost_effect = "vehicles_splash.png",
			brakes = true,
			braking_effect = "vehicles_splash.png",
			handling = {initial=1, braking=1.8}
		})
	end,
})

vehicles.register_spawner("vehicles:ship", "Sail Boat", "vehicles_ship_inv.png", true)

minetest.register_craft( {
	output = "vehicles:ship_spawner 1",
	recipe = {
		{ "wool:white", "wool:white", "" },
		{ "default:acacia_wood", "hyrule_mapgen:crystal_1", "default:acacia_wood" },
		{ "default:acacia_wood", "default:acacia_wood", "default:acacia_wood" }
	}
})

minetest.register_entity("vehicles:spinner", {
	visual = "mesh",
	mesh = "spinner.b3d",
	textures = {"vehicles_spinner.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 0.3, 0.4},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=10, z=0}, true, {x=0, y=2, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 11, 
			decell = 0.6,
			moving_anim = {x=3, y=18},
			stand_anim = {x=1, y=1},
			jump_type = "jump",
			jump_anim = {x=3, y=18},
			brakes = false,
			braking_effect = "hyrule_mapgen_trans.png",
			handling = {initial=3, braking=3}
		})
	end,
})

--vehicles.register_spawner("vehicles:spinner", "Spinner", "vehicles_spinner_inv.png")


