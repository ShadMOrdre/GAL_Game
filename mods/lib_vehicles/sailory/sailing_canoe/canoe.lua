local modpath = minetest.get_modpath("sailing_canoe")

local float_or_fall, turn, handle_wind, move =
	dofile(modpath .. "/movement.lua")
local toggle_sail, turn_sail =
	dofile(modpath .. "/sail.lua")
local set_colors, dye, spawn_particles, show_wind =
	dofile(modpath .. "/visuals.lua")


local canoe = {
	hp_max = 10,
	initial_properties =
	{
		physical = true,
		-- Warning: Do not change the position of the collisionbox top surface,
		-- lowering it causes the boat to fall through the world if underwater
		collisionbox = {-1.3, -0.35, -1.3, 1.3, 0.3, 1.3},
		visual = "mesh",
		mesh = "sailing_canoe_canoe.obj",
		textures = {"sailing_canoe_entity.png"},
	},
	
	driver = nil,
	v = 0,
	removed = false,
	sail = nil,
	sail_color = nil,
	sail_yaw = 0,
	sail_cooldown = 0,
	speed = 0,
	flag = nil,
	flag_color = nil,
}


local player_attach = {x = -10.5, y = 2, z = 0}


local function remove(self)
	--TODO: drop item
	if self.sail
	then
		self.sail:remove()
	end
	if self.flag
	then
		self.flag:remove()
	end
	self.object:remove()
end


local function handle_control(self)
	if not self.driver
	then
		return
	end
	local ctrl = self.driver:get_player_control()
	if ctrl.sneak
	then
		turn_sail(self, ctrl.left, ctrl.right)
	else
		turn(self, ctrl.left, ctrl.right)
	end
	
	if ctrl.jump
	then
		toggle_sail(self)
		set_colors(self)
	end
end


------------------------------------------------------------------------

function canoe.on_step(self, dtime)
	self.sail_cooldown = self.sail_cooldown - dtime
	
	handle_control(self)
	handle_wind(self)
	float_or_fall(self)
	move(self)
	spawn_particles(self)
	show_wind(self)
end

function canoe.on_detach_child(self, child)
	if child:is_player()
	then
		self.driver = nil
	end
end

function canoe.get_staticdata(self)
	local data = 
	{
		flag_color = self.flag_color,
		sail_color = self.sail_color,
		hp = self.object:get_hp(),
	}
	
	return minetest.serialize(data)
end

function canoe.on_activate(self, staticdata)	
	local data = minetest.deserialize(staticdata) or {}
	if not data.flag_color
	then
		data.flag_color = "red"
	end
	self.flag_color = data.flag_color
	if not data.sail_color
	then
		data.sail_color = "white"
	end
	self.sail_color = data.sail_color
	
	if data.hp
	then
		self.object:set_hp(data.hp)
	end
	

	local pos = self.object:get_pos()
	self.flag = minetest.add_entity(pos, "sailing_canoe:flag")
	if self.flag
	then
		self.flag:set_attach(
			self.object,
			"",
			nil,
			{x = 0, y = self.sail_yaw, z = 0})
	end
	set_colors(self)
end



function canoe.on_rightclick(self, clicker)
	if not clicker
	then
		return
	end
	
	
	if dye(self, clicker)
	then
		return
	end
	
	
	local name = clicker:get_player_name()
	if self.driver == clicker
	then
		--dismount
		clicker:set_detach()
		self.driver = nil
		if player_api
		then
			player_api.player_attached[name] = nil
		end
	elseif not self.driver
	then
		--mount
		self.driver = clicker
		clicker:set_attach(
			self.object,
			"",
			player_attach,
			{x = 0, y = 0, z = 0})
			
		if player_api
		then
			player_api.player_attached[name] = true
			minetest.after(0.1, player_api.set_animation, clicker, "sit", 30)
		end
	end
end

function canoe.on_punch(self, puncher, time_from_last_punch, tool_capabilities, dir, damage)
	local hp = self.object:get_hp() - damage
	if hp <= 0
	then
		if puncher
		then
			--put item into inventory or drop it
			local name = puncher:get_player_name()
			local inv = puncher:get_inventory()
			
			local stack = ItemStack("sailing_canoe:canoe")
			local meta = stack:get_meta()
			meta:set_string("flag_color", self.flag_color)
			meta:set_string("sail_color", self.sail_color)
			
			
			--check if player is in creative and already has
			--the same item
			--takes sail and flag colors into account
			if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(name)
				and inv:contains_item("main", stack, true))
			then
				stack = inv:add_item("main", stack)
				if not stack:is_empty()
				then
					minetest.add_item(self.object:get_pos(), stack)
				end
			end
		end
		remove(self)
	end
end





local sail =
{
	initial_properties =
		{
		physical = false,
		visual = "mesh",
		mesh = "sailing_canoe_sail.obj",
		static_save = false,
	}
}



local flag =
{
	initial_properties =
	{
		physical = false,
		visual = "mesh",
		mesh = "sailing_canoe_flag.obj",
		static_save = false,
		visual_size = {x = 0.1, y = 0.1, z = 0.1},
	}
}

local function attachment_on_step(self)
	if not self.object:get_attach()
	then
		self.object:remove()
	end
end
sail.on_step = attachment_on_step
flag.on_step = attachment_on_step


minetest.register_entity("sailing_canoe:canoe", canoe)
minetest.register_entity("sailing_canoe:sail", sail)
minetest.register_entity("sailing_canoe:flag", flag)




