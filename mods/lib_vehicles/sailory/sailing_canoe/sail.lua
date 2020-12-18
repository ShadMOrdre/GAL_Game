local sail_attach = {x = -10, y = 5, z = 10}

local function put_sail(self)
	local pos = self.object:get_pos()
	self.sail = minetest.add_entity(pos, "sailing_canoe:sail")
	if self.sail
	then
		self.sail:set_attach(
			self.object,
			"",
			sail_attach,
			{x = 0, y = self.sail_yaw, z = 0})
	end
end


local function toggle_sail(self)
	if self.sail_cooldown > 0
	then
		return
	end
	self.sail_cooldown = 0.25
	if self.sail
	then
		self.sail:remove()
		self.sail = nil
	else
		put_sail(self)
	end
end

local function turn_sail(self, left, right)
	if left == right or not self.sail
	then
		return
	end
	
	local turn_speed = 2
	if left
	then
		turn_speed = -turn_speed
	end
	local new_yaw = self.sail_yaw + turn_speed
	
	if new_yaw > 90 or new_yaw < -90
	then
		return
	end
	
	self.sail_yaw = new_yaw
	self.sail:set_attach(
		self.object,
		"",
		sail_attach,
		{x = 0, y = self.sail_yaw, z = 0})
end

return toggle_sail, turn_sail
