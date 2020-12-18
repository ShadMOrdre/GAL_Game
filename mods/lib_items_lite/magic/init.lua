magic = {
	stations = {
		topaz = {
			"mineral:tin_block",
			"moretrees:fir_planks",
			"moretrees:fir_trunk",
			"flowers:potted_geranium",
			"flowers:geranium",
			"plant:blackberry",
		},
		amethyst = {
			"mineral:silver_block",
			"moretrees:willow_planks",
			"moretrees:willow_trunk",
			"flowers:potted_viola",
			"flowers:viola",
			"plant:heath_saxifrage_purple",
		},
		saphire = {
			"mineral:mithril_block",
			"moretrees:birch_planks",
			"moretrees:birch_trunk",
			"flowers:potted_cactus",
		},
		emerald = {
			"mineral:copper_block",
			"moretrees:pine_planks",
			"moretrees:pine_trunk",
			"flowers:potted_bonsai",
		},
		diamond = {
			"mineral:steel_block",
			"moretrees:apple_tree_planks",
			"moretrees:apple_tree_trunk",
			"flowers:potted_dandelion_white",
			"flowers:dandelion_white",
			"plant:gorse",
		},
		ruby = {
			"mineral:gold_block",
			"moretrees:oak_planks",
			"moretrees:oak_trunk",
			"flowers:potted_rose",
			"flowers:rose",
			"plant:hawthorn",
		},
		obsidian = {
			"mineral:obsidian",
			"mineral:bronze_block",
			"moretrees:spruce_planks",
			"moretrees:spruce_trunk",
			"dryplants:reedmace_height_3_spikes",
			"mobs:beehive",
		},
	},
}

minetest.register_privilege("magic", { 
	description = "Can use powerful magic.", 
	give_to_singleplayer = false 
})

dofile(minetest.get_modpath("magic").."/functions.lua")
dofile(minetest.get_modpath("magic").."/effects.lua")

function magic:shoot_ray(colour, player)
	local ray = "magic:ray_"..colour
	local playerpos = player:getpos()
	local obj = minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, ray)
	local dir = player:get_look_dir()
	obj:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
	obj:setacceleration({x=dir.x*-3, y=-10, z=dir.z*-3})
	obj:setyaw(player:get_look_yaw()+math.pi)
	--minetest.sound_play("throwing_sound", {pos=playerpos, gain = 0.5})
	if obj:get_luaentity().player == "" then
		obj:get_luaentity().player = player
	end
	obj:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
	return true
end

minetest.register_entity("magic:ray_cyan", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_cyan.png"},
	velocity = 5,
	-- freezing ray, water.
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(8)
		if type == "animal" then
			damage = damage * -1
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
		for dx=-1,1 do
			for dy=0,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.get_node(p).name
					if minetest.is_protected(p, "") then
						return false
					end
					if n == "air" then	
						minetest.set_node(p, {name="gal:ice"})
					end
				end
			end
		end
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_cyan" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_gold", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_gold.png"},
	velocity = 5,
	-- flight
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
		playereffects.apply_effect_type("fly", 123, player)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		obj:setpos({x = pos.x, y = pos.y + 23, z = pos.z})
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_gold" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_green", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_green.png"},
	velocity = 5,
	-- transmute, spawn creatures, control weather.
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(7)
		if type == "animal" then
			damage = damage * -1
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_green" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_indigo", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_indigo.png"},
	velocity = 5,
	-- basic healing
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
		playereffects.apply_effect_type("heal", 1, player)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(4)
		if type == "animal" then
			damage = damage * -1
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_indigo" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_magenta", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_magenta.png"},
	velocity = 5,
	-- fast / slow
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
		playereffects.apply_effect_type("high_speed", 123, player)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(5)
		if type == "animal" then
			damage = damage * -1
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_magenta" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_red", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_red.png"},
	velocity = 5,
	-- fireball / dispel all / grow
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
		local effects = playereffects.get_player_effects(name)
		for e=1, #effects do
			playereffects.cancel_effect(effects[e].effect_id)
		end
		minetest.chat_send_player(name, "All magical effects dispelled.")
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(9)
		if type == "animal" then
			damage = damage * -1
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
		for dx=-1,1 do
			for dy=0,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.get_node(p).name
					if minetest.is_protected(p, "") then
						return false
					end
					if n ~= "default:obsidian" and n ~= "default:obsidianbrick" then	
						if minetest.registered_nodes[n].groups.flammable then
							minetest.set_node(p, {name="fire:basic_flame"})
						end
					end
				end
			end
		end
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_red" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

minetest.register_entity("magic:ray_yellow", {
	physical = false,
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"magic_ray_yellow.png"},
	velocity = 5,
	hit_player = function(self, pos, player)
		local name = player:get_player_name()
		-- minetest.chat_send_all("Hit player -> "..name)
	end,
	hit_target = function(self, pos, obj)
		local name = obj:get_luaentity().name
		local type = obj:get_luaentity().type or "creature"
		-- minetest.chat_send_all("Hit "..type.." -> "..name)
		local damage = math.random(6) * -1
		if type == "animal" then
			damage = math.random(6)
		end
		obj:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups= {fleshy = damage},
		}, nil)
	end,
	hit_node = function(self, pos, node)
		-- minetest.chat_send_all("Hit "..node)
	end,
	collisionbox = {0,0,0,0,0,0}, -- remove box around arrows

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local node = minetest.get_node(self.object:getpos()).name
		if minetest.registered_nodes[node].walkable then
			self.hit_node(self, pos, node)
			self.object:remove()
			return
		end
		for _,obj in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				self.hit_player(self, pos, obj)
				self.object:remove()
				return
			else
				local target = obj:get_luaentity()
				if target ~= nil then
					if target.name ~= "magic:ray_yellow" and 
							target.name ~= "__builtin:item" then
						self.hit_target(self, pos, obj)
						self.object:remove()
						return
					end
				end
			end
		end
	end
})

dofile(minetest.get_modpath("magic").."/staffs.lua")
dofile(minetest.get_modpath("magic").."/rings.lua")
dofile(minetest.get_modpath("magic").."/potions.lua")
--dofile(minetest.get_modpath("magic").."/questitems.lua")

dofile(minetest.get_modpath("magic").."/chatcommands.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]:[Loaded]")

