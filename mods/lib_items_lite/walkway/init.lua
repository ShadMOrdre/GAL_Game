walkway = {}


-- taken from moreblocks
local box_slope_half = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5,   -0.5,  0.5, -0.375, 0.5},
		{-0.5, -0.375, -0.25, 0.5, -0.25,  0.5},
		{-0.5, -0.25,  0,    0.5, -0.125, 0.5},
		{-0.5, -0.125, 0.25, 0.5,  0,     0.5},
	}
}

local box_slope_half_raised = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5,   -0.5,  0.5, 0.125, 0.5},
		{-0.5, 0.125, -0.25, 0.5, 0.25,  0.5},
		{-0.5, 0.25,  0,    0.5, 0.375, 0.5},
		{-0.5, 0.375, 0.25, 0.5,  0.5,     0.5},
	}
}
local function same_sign(x, y)
   return (x > 0 and y > 0) or (x < 0 and y < 0)
end
local function diff_sign(x, y)
   return (x > 0 and y < 0) or (x < 0 and y > 0)
end
local function abs(x)
   if x > 0 then
      return x
   else
      return -x
   end
end
local speed = 0.4
local function generate_velocity_vector(dir, vx, vz, node)
   local vy=0
   local p = 1
--   local dir = vector.new(minetest.facedir_to_dir(node.param2))
   if node.name=="walkway:slope_1" or node.name=="walkway:slope_2"  then
      p = 1
      vx=0
      vz=0
      if same_sign(dir.x/speed+vx,dir.x) or same_sign(dir.z/speed+vz,dir.z) then
--	 minetest.chat_send_all("CASE 1")
	 vy = 1
      elseif diff_sign(dir.x/speed+vx,dir.x) or diff_sign(dir.z/speed+vz,dir.z) then
	 vy = -1
      end
   elseif node.name=="walkway:slope_1_down" or node.name=="walkway:slope_2_down" then
      vx=0 -- dirty fix, could not get this to work properly.
      vz=0
      p = -1
      if same_sign(dir.x/speed+vx,dir.x) or same_sign(dir.z/speed+vz,dir.z) then
	 vy = -1
      elseif diff_sign(dir.x/speed+vx,dir.x) or diff_sign(dir.z/speed+vz,dir.z) then
	 vy = 1
      end

   end
--   minetest.chat_send_all(dir.x..";"..p*(dir.x / speed+vx)..",".. vy*(abs((dir.x +dir.z)/speed+vx+vz))/2 ..","..p*(dir.z / speed+vz)..";"..dir.z)
   return {x = p*(dir.x / speed+vx), y = vy*(abs((dir.x +dir.z)/speed))/2, z = p*(dir.z / speed+vz)}
end


minetest.register_entity("walkway:moving_dummy",{
			 initial_properties = {
			    hp_max = 1,
			    physical = false,
			    collisionbox = {0.005, -0.005, 0.005, -0.005, 0.005, -0.025},
			    visual = "cube",
			    visual_size = {x = 1, y = 1},
			    textures = {"blank.png","blank.png", "blank.png","blank.png","blank.png","blank.png"},
			    spritediv = {x = 1, y = 1},
			    initial_sprite_basepos = {x = 0, y = 0},
			    is_visible = true;
			 },
			 player = nil,
			 on_step = function (self, dtime)
			    local name = ""
			    if self.player and self.player:is_player() then
			       name = self.player:get_player_name()
			    elseif not self.player then
			       self.object:remove()
			       return
			    end
			    local pos = self.object:getpos()
			    local napos = minetest.get_node(pos) 
			    local dir = vector.new(minetest.facedir_to_dir(napos.param2)) -- a copy of the facedir so we don't overwrite the facedir table
			    local vx=0
			    local vz=0
			    if name ~="" then
			       -- based on code from the tower crane mod --
			       local ctrl = self.player:get_player_control()
			       local yaw = self.player:get_look_horizontal()			  
			       local pos = self.player:getpos()
			       local walk_speed = minetest.settings:get("movement_speed_walk") or 4
			       local speed_forward = 0
			       local speed_right= 0
			       self.object:setyaw(yaw)
			       if (ctrl.up or ctrl.down or ctrl.left or ctrl.right) then
				  gal.player.api.set_animation(self.player, "walk" , 30)
			       else
				  gal.player.api.set_animation(self.player, "stand" , 30)
			       end

			       if ctrl.up then             -- forward
				  speed_forward = walk_speed
			       elseif ctrl.down then       -- backward
				  speed_forward = -walk_speed
			       end

			       if ctrl.right then          -- right
				  speed_right = walk_speed
			       elseif ctrl.left then       -- left
				  speed_right = -walk_speed
			       end

			       if ctrl.jump then
				  -- detach on jump
				  local veldir = self.object:getvelocity();
				  self.player:set_detach()
				  self.player:setpos({x = pos.x + veldir.x / 3, y = pos.y+1, z = pos.z + veldir.z / 3})
				  self.object:remove()
				  gal.player.api.player_attached[name] = false
				  return
			       end

			       -- calculate the direction vector
			       vx = math.cos(yaw+math.pi/2) * speed_forward + math.cos(yaw) * speed_right
			       vz = math.sin(yaw+math.pi/2) * speed_forward + math.sin(yaw) * speed_right
			       if dir.x == 0 then
				  vx = 0
			       elseif dir.z == 0 then
				  vz = 0
			       end
			    elseif not self.player:is_player() then
			       self.object:setyaw(self.player:getyaw())
			    end

			    
			    -- if napos.name == "walkway:belt_straight" then
			    --    self.object:setvelocity({x = dir.x / speed, y = 0, z = dir.z / speed})
			    if napos.name == "air" then
			       napos = minetest.get_node({x = pos.x, y = pos.y -1, z = pos.z})
			       dir = vector.new(minetest.facedir_to_dir(napos.param2))
			    elseif not string.sub(napos.name,1,string.len("walkway:")) == "walkway:" then
			       napos = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})
			       dir = vector.new(minetest.facedir_to_dir(napos.param2))
			    end
--			    minetest.chat_send_all(napos.name)
			    
			    if string.sub(napos.name,1,string.len("walkway:")) == "walkway:" then
			       if dir.x == 0 then
				  dir.x = (math.floor(pos.x + 0.5) - pos.x) * 2
			       elseif dir.z == 0 then
				  dir.z = (math.floor(pos.z + 0.5) - pos.z) * 2
			       end
			       self.object:setvelocity(generate_velocity_vector(dir, vx, vz, napos))
			    else
			       if self.player then
				  local veldir = self.object:getvelocity();
				  self.player:set_detach()
				  self.player:setpos({x = pos.x + veldir.x / 3, y = pos.y, z = pos.z + veldir.z / 3})
				  self.object:remove()
			       else
				  self.object:remove()
			       end
			       if name ~="" then
				  gal.player.api.player_attached[name] = false
			       end
			    end
			 end
})
nodedef = {
   groups = {cracky=1},
   paramtype = "light",
   paramtype2 = "facedir",
   is_ground_content = true,
   legacy_facedir_simple = true,

}

minetest.register_node("walkway:belt", {
	description = "Moving Walkway",
	tiles = {{name="factory_belt_top_animation.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
	groups = {cracky=1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0,0.5},}
		},
})
minetest.register_node("walkway:slope_1",
		       {description = "Moving Walkway",
			tiles = {{name="factory_belt_top_animation.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
			   "factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
			groups = {cracky=1},
			
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			on_place = minetest.rotate_node,
			description = desc,
			is_ground_content = true,
			legacy_facedir_simple = true,
			mesh = "moreblocks_slope_half.obj",
			collision_box = box_slope_half,
			selection_box = box_slope_half,
})
minetest.register_node("walkway:slope_2",
		       {description = "Moving Walkway",
			tiles = {{name="factory_belt_top_animation.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
			   "factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
			groups = {cracky=1},
			
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			on_place = minetest.rotate_node,
			description = desc,
			is_ground_content = true,
			legacy_facedir_simple = true,
			mesh = "moreblocks_slope_half_raised.obj",
			collision_box = box_slope_half_raised,
			selection_box = box_slope_half_raised,
})
minetest.register_node("walkway:slope_1_down",
		       {description = "Moving Walkway",
			tiles = {{name="factory_belt_top_animation_down.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
			   "factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
			groups = {cracky=1},
			
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			on_place = minetest.rotate_node,
			description = desc,
			is_ground_content = true,
			legacy_facedir_simple = true,
			mesh = "moreblocks_slope_half.obj",
			collision_box = box_slope_half,
			selection_box = box_slope_half,
})
minetest.register_node("walkway:slope_2_down",
		       {description = "Moving Walkway",
			tiles = {{name="factory_belt_top_animation_down.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}, "factory_belt_bottom.png", "factory_belt_side.png",
			   "factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
			groups = {cracky=1},
			
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			on_place = minetest.rotate_node,
			description = desc,
			is_ground_content = true,
			legacy_facedir_simple = true,
			mesh = "moreblocks_slope_half_raised.obj",
			collision_box = box_slope_half_raised,
			selection_box = box_slope_half_raised,
})



-- minetest.register_node("walkway:belt_straight", {
-- 	description = "straight Conveyor Belt",
-- 	tiles = {{name="factory_belt_top_animation.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.4}}, "factory_belt_bottom.png", "factory_belt_side.png",
-- 		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
-- 	groups = {cracky=1},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	is_ground_content = true,
-- 	legacy_facedir_simple = true,
-- 	node_box = {
-- 			type = "fixed",
-- 			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
-- 		},
-- })

-- minetest.register_abm({
-- 	nodenames = {"walkway:belt", "walkway:belt_straight"},
-- 	neighbors = nil,
-- 	interval = 1,
-- 	chance = 1,
-- 	action = function(pos, node, active_object_count, active_object_count_wider)
-- 		local all_objects = minetest.get_objects_inside_radius(pos, 0.75)
-- 		local _,obj
-- 		for _,obj in ipairs(all_objects) do
-- 			if not obj:is_player() and obj:get_luaentity() and obj:get_luaentity().name == "__builtin:item" then
-- 				walkway.do_moving_item({x = pos.x, y = pos.y + 0.15, z = pos.z}, obj:get_luaentity().itemstring)
-- 				obj:get_luaentity().itemstring = ""
-- 				obj:remove()
-- 			end
-- 		end
-- 	end,
-- })

minetest.register_abm({
	nodenames = {"walkway:belt", "walkway:belt_straight", "walkway:slope_1", "walkway:slope_2", "walkway:slope_1_down", "walkway:slope_2_down"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local all_objects = minetest.get_objects_inside_radius(pos, 0.75)
		local _,obj
		for _,obj in ipairs(all_objects) do
		   if obj:is_player() and not obj:get_attach() then
--		      dum = walkway.do_moving_dummy():get_luaentity()
		      local dum = minetest.add_entity({x = pos.x, y = pos.y + 0.15, z = pos.z}, "walkway:moving_dummy"):get_luaentity()
		      dum.player = obj
		      obj:set_attach(dum.object, "", {x=0,y=9,z=0}, {x=0,y=0,z=0})
		      local name = obj:get_player_name()
		      gal.player.api.player_attached[name] = true
		   elseif obj:get_luaentity() and string.sub(obj:get_luaentity().name,1,string.len("mobs_animal"))  == "mobs_animal" then
		      local dir = vector.new(minetest.facedir_to_dir(node.param2))
		      obj:setvelocity(generate_velocity_vector(dir,0, 0, node))
--		      dum = walkway.do_moving_dummy({x = pos.x, y = pos.y + 0.15, z = pos.z}, obj):get_luaentity()
--		      dum.player = obj
--		      obj:set_attach(dum.object, "", {x=0,y=-1,z=0}, {x=0,y=0,z=0})
		   elseif obj:get_luaentity() and obj:get_luaentity().name == "__builtin:item" then
		      walkway.do_moving_item({x = pos.x, y = pos.y + 0.15, z = pos.z}, obj:get_luaentity().itemstring)
		      obj:get_luaentity().itemstring = ""
		      obj:remove()
		   end
		end
	end,
})

-- Based off of the pipeworks item code

function walkway.do_moving_item(pos, item)
	if item==":" then
		return
	end
	local stack = ItemStack(item)
	local obj = minetest.add_entity(pos, "walkway:moving_item")
	obj:get_luaentity():set_item(stack:to_string())
	return obj
end


minetest.register_entity("walkway:moving_item", {
	initial_properties = {
		hp_max = 1,
		physical = false,
		collisionbox = {0.125, 0.125, 0.125, 0.125, 0.125, 0.125},
		visual = "wielditem",
		visual_size = {x = 0.5, y = 0.5},
		textures = {""},
		spritediv = {x = 1, y = 1},
		initial_sprite_basepos = {x = 0, y = 0},
		is_visible = false,
	},

	physical_state = true,
	itemstring = '',
	set_item = function(self, itemstring)
		self.itemstring = itemstring
		local stack = ItemStack(itemstring)
		local count = stack:get_count()
		local max_count = stack:get_stack_max()
		if count > max_count then
			count = max_count
			self.itemstring = stack:get_name().." "..max_count
		end
		local s = 0.15 + 0.15 * (count / max_count)
		local c = 0.8 * s
		local itemtable = stack:to_table()
		local itemname = nil
		if itemtable then
			itemname = stack:to_table().name
		end
		local item_texture = nil
		local item_type = ""
		if core.registered_items[itemname] then
			item_texture = core.registered_items[itemname].inventory_image
			item_type = core.registered_items[itemname].type
		end
		prop = {
			is_visible = true,
			visual = "wielditem",
			textures = {itemname},
			visual_size = {x = s, y = s},
			collisionbox = {-c, -c, -c, c, c, c},
			automatic_rotate = math.pi * 0.2,
		}
		self.object:set_properties(prop)
	end,

	get_staticdata = function(self)
		return core.serialize({
			itemstring = self.itemstring
		})
	end,

	on_activate = function(self, staticdata, dtime_s)
		if string.sub(staticdata, 1, string.len("return")) == "return" then
			local data = core.deserialize(staticdata)
			if data and type(data) == "table" then
				self.itemstring = data.itemstring
			end
		else
			self.itemstring = staticdata
		end
		self.object:set_armor_groups({immortal = 1})
		self:set_item(self.itemstring)
	end,

	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local napos = minetest.get_node(pos) 
		local dir = vector.new(minetest.facedir_to_dir(napos.param2)) -- a copy of the facedir so we don't overwrite the facedir table
		if napos.name == "air" then
		   napos = minetest.get_node({x = pos.x, y = pos.y -1, z = pos.z})
		   dir = vector.new(minetest.facedir_to_dir(napos.param2))
		elseif not string.sub(napos.name,1,string.len("walkway:")) == "walkway:" then
		   napos = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})
		   dir = vector.new(minetest.facedir_to_dir(napos.param2))
		end

		if napos.name == "walkway:belt_straight" then
			self.object:setvelocity({x = dir.x / speed, y = 0, z = dir.z / speed})
		elseif string.sub(napos.name,1,string.len("walkway:")) == "walkway:" then
			if dir.x == 0 then
				dir.x = (math.floor(pos.x + 0.5) - pos.x) * 2
			elseif dir.z == 0 then
				dir.z = (math.floor(pos.z + 0.5) - pos.z) * 2
			end
			self.object:setvelocity(generate_velocity_vector(dir, 0, 0, napos))
		else
			local stack = ItemStack(self.itemstring)
			local veldir = self.object:getvelocity();
			minetest.item_drop(stack, walkway.no_player, {x = pos.x + veldir.x / 3, y = pos.y, z = pos.z + veldir.z / 3})
			self.object:remove()
		end
	end
})

minetest.register_craft({
	output = "walkway:belt 12",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:stone", "default:mese_crystal", "default:stone"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})
