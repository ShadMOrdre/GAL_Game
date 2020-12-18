-- Minetest mod: creepers
-- (c) Kai Gerd Müller
-- See README.txt for licensing and other information.
--[[
local standardguardslist = {
	["default:mese"]="mese",
	["default:steelblock"]="steel",
	["default:copperblock"]="copper",
	["default:goldblock"]="gold",
	["default:bronzeblock"]="bronze",
	["default:diamondblock"]="diamond",
	["default:obsidian"]="obsidian"
}
--]]
local standardguardslist = {
	["gal:mineral_mese_block"]="mese",
	["gal:metal_steel_block"]="steel",
	["gal:metal_copper_block"]="copper",
	["gal:metal_gold_block"]="gold",
	["gal:metal_bronze_block"]="bronze",
	["gal:mineral_diamond_block"]="diamond",
	["gal:stone_obsidian"]="obsidian"
}

local function jump_needet(size,pos)
pos.y = (pos.y-size)+0.5
local r = false
for x = -1,1 do
for z = -1,1 do
if minetest.registered_nodes[minetest.get_node({x = pos.x+x,y=pos.y,z=pos.z+z}).name].walkable then
r = true
end
end
end
return r
end
local function animate(self, t)
	if t == 1 and self.canimation ~= 1 then
		self.object:set_animation({
			x = 0,
			y = 80},
			30, 0)
		self.canimation = 1
	elseif t == 2 and self.canimation ~= 2 then
		self.object:set_animation({x = 200,y = 220},30, 0)
		self.canimation = 2
	--walkmine
	elseif t == 3 and self.canimation ~= 3 then
		self.object:set_animation({x = 168,y = 188},30, 0)
		self.canimation = 3
	--walk
	end
end
local function get_nearest_enemy(self,pos,radius)
	local min_dist = radius+1
	local target = false
	for _,entity in ipairs(minetest.get_objects_inside_radius(pos,25)) do
		if entity ~= self.owner then
			luaent = entity:get_luaentity()
			if entity:is_player() or(luaent and not (luaent.guard and luaent.owner_name == self.owner_name)) then
			local p = entity:getpos()
			local dist = vector.distance(pos,p)
			if minetest.line_of_sight(pos,p, 2) == true and dist < min_dist then
				min_dist = dist
				min_player = player
					target = entity
			end
			end
		end
	end
return target
end
local function get_nearest_player(self,pos,radius)
	local min_dist = radius+1
	local target = false
	for _,entity in ipairs(minetest.get_objects_inside_radius(pos,25)) do
		if entity:is_player() then
			local p = entity:getpos()
			local dist = vector.distance(pos,p)
			if dist < min_dist then
				min_dist = dist
				min_player = player
					target = entity
			end
		end
	end
if target then
return target:get_player_name()
else
return target
end
end
local function register_guard(def)
	local defbox = def.size/2
	minetest.register_entity("guards:" .. def.name,{
		initial_properties = {
			name = def.name,
			hp_min = def.max_hp,
			hp_max = def.max_hp,
			visual_size = {x = def.size, y = def.size, z = def.size},
			visual = "mesh",
			mesh = "character.b3d",
			textures = {def.name .. ".png"},
			collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
			physical = true
		},
		-- ON ACTIVATE --
		on_punch = function(self)
			if self.object:get_hp() > 0 then return end
			self.object:remove()
		end,
		on_activate = function(self)
			self.timer = 0
			self.jump = 0
			self.guard = true
			self.object:setacceleration({x=0,y=-50,z=0})
		self.object:set_animation({
			x = 0,
			y = 80},
			30, 0)
			self.canimation = 1
		end,
		-- ON PUNCH --
		-- ON STEP --
		on_step = function(self, dtime)
			local pos = self.object:getpos()
			if self.owner_name then
			self.owner = minetest.get_player_by_name(self.owner_name)
			self.animation_set = true
			self.gravity = {x=0,y=-50,z=0}
			self.targetvektor = nil
			if self.timer < 1 then
			self.timer = self.timer+dtime
			end
			local punching = false
			local target = get_nearest_enemy(self,pos,def.size*3)
			if target and self.timer >= 1 then
				target:punch(self.object, 1.0,  {full_punch_interval=1.0,damage_groups = {fleshy=def.damage}})
				self.timer = 0
			end
			local target = get_nearest_enemy(self,pos,25)
			if target then
			target = target:getpos()
			self.targetvektor = vector.multiply(vector.normalize({x=target.x-pos.x,y=0,z=target.z-pos.z}),def.speed)
			end
			if not self.targetvektor and self.owner and self.owner:get_hp() and self.owner:get_hp()>0 then
					local pre_targetvektor = vector.subtract(self.owner:getpos(),pos)
					local pre_length = vector.length(pre_targetvektor)
					if pre_length > 4 then
						self.nextanimation = 3
						self.animation_set = false
					self.targetvektor = vector.multiply(vector.divide(pre_targetvektor,pre_length),def.speed)
					end
			end
			local velocity = self.object:getvelocity()
			self.jump = (self.jump +1)%10
			if self.targetvektor then
			if self.animation_set then
				self.nextanimation = 2
			end
			--if  minetest.get_node(pos).name == "default:water_source" then
			if  minetest.get_node(pos).name == "gal:liquid_water_source" then
				self.gravity = {x=0,y=0,z=0}
			end
			--if  minetest.get_node(vector.add(pos,{x=0,y=1,z=0})).name == "default:water_source" then
			if  minetest.get_node(vector.add(pos,{x=0,y=1,z=0})).name == "gal:liquid_water_source" then
				self.targetvektor.y = 1
			end
			if self.jump == 0 and --[[vector.distance(vector.new(),velocity)<def.speed/10 and velocity.y == 0 and minetest.registered_nodes[minetest.get_node(vector.add(pos,{x=0,y=-(def.size+0.5),z=0})).name].walkable]]jump_needet(def.size,pos) then
				self.targetvektor.y = 40			
			end
			self.object:setacceleration(self.gravity)
			self.object:setvelocity(self.targetvektor)
			self.object:setyaw(math.atan2(self.targetvektor.z,self.targetvektor.x)-math.pi/2)
			else
				self.object:setvelocity({x=0,y=0,z=0})		
				self.nextanimation = 1
			end
			animate(self,self.nextanimation)
			else
			local next_owner = get_nearest_player(self,pos,100)
			if next_owner then
				self.owner_name = next_owner
			end
			end
			if self.object:get_hp() > 0 then return end
			self.object:remove()
		end
	})
end
function register_golem(def)
	register_guard({
		damage = def.damage or 16,
		name = def.name .. "_guard",
		max_hp = def.guard_hp_max,
		size = def.guard_size,
		speed = def.guard_speed
	})
minetest.register_craftitem("guards:" .. def.name, {
	description = def.desc,
	wield_scale = {x=2,y=2,z=2},
	inventory_image = def.name .. ".png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = minetest.get_pointed_thing_position(pointed_thing,true)
		if pos then
		local guard = minetest.add_entity(vector.add(pos,{x=0,y=def.guard_size,z=0}),"guards:" .. def.name .. "_guard")
		guard:get_luaentity().owner_name = user:get_player_name()
		itemstack:take_item()
		end
		return itemstack
	end
})end
minetest.register_craft({
	output = "guards:finalisation_stab",
	recipe = {{"","default:mese",""},
		  {"","default:obsidian",""},
		  {"","default:obsidian",""}}
})
minetest.register_tool("guards:finalisation_stab", {
	description = "Finalisation Stab",
	inventory_image = "finalisator.png",
	wield_scale = {x=2,y=2,z=1},
	on_use = function(itemstack, user, pointed_thing)
		local pos = minetest.get_pointed_thing_position(pointed_thing,false)
		if pos then
		local spawn = false
		local n = minetest.get_node(pos).name
		local guard = standardguardslist[n]
		if guard then
		local lowerp = vector.subtract(pos,{x=0,y=1,z=0})
		local upperp = vector.add(pos,{x=0,y=1,z=0})
		if minetest.get_node(lowerp).name == n then
		minetest.remove_node(pos)
		minetest.remove_node(lowerp)
		pos = vector.subtract(pos,{x=0,y=0.5,z=0})
		spawn = true
		elseif minetest.get_node(upperp).name == n then
		minetest.remove_node(pos)
		minetest.remove_node(upperp)
		pos = vector.add(pos,{x=0,y=0.5,z=0})
		spawn = true
		end
		if spawn then
		itemstack:add_wear(65535/100)
		guard = minetest.add_entity(pos,"guards:" .. guard)
		guard:get_luaentity().owner_name = user:get_player_name()
		end
		end
		end
		return itemstack
	end
})

register_guard({
	damage = 9,
	name = "steel",
	max_hp = 30,
	size = 1,
	speed = 3
})
register_guard({
	damage = 10,
	name = "copper",
	max_hp = 40,
	size = 1,
	speed = 3
})
register_guard({
	damage = 11,
	name = "bronze",
	max_hp = 50,
	size = 1,
	speed = 3
})
register_guard({
	damage = 12,
	name = "obsidian",
	max_hp = 60,
	size = 1,
	speed = 3
})
register_guard({
	damage = 13,
	name = "gold",
	max_hp = 80,
	size = 1,
	speed = 3
})

register_guard({
	damage = 14,
	name = "mese",
	max_hp = 85,
	size = 1,
	speed = 3
})
register_guard({
	damage = 15,
	name = "diamond",
	max_hp = 90,
	size = 1,
	speed = 3
})



