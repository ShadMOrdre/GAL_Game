local pi = math.pi
local sin = math.sin
local cos = math.cos
local length = vector.length

local function is_water(pos)
  local nodename = minetest.get_node(pos).name
  return minetest.get_item_group(nodename, "water") ~= 0
end

local function float_or_fall(self)
	local pos = self.object:get_pos()
	pos.y = pos.y - 0.7
	local vel = self.object:getvelocity()
	
	--swim or fall
	if is_water(pos)
	then
		local uppos = {x = pos.x, y = pos.y + 1, z = pos.z + 1}
		if is_water(uppos)
		then
			--float up
			self.object:setacceleration({x = 0, y = 5, z = 0})
		else
			--float in place
			self.object:setacceleration({x = 0, y = 0, z = 0})
			vel.y = 0
			self.object:setvelocity(vel)
		end
	else
		--outside of water follow the laws of gravity
		self.object:setacceleration({x = 0, y = -9, z = 0})
		self.speed = self.speed * 0.5
	end
end


local function turn(self, left, right)
	local turn_speed = pi / 256
	local xaw = 0
	if not (left or right)
	then
		turn_speed = 0
	end
	if left and right
	then
		xaw = 0.2
		turn_speed = 0
	end
	
	if right
	then
		turn_speed = -turn_speed
	end
	
	local yaw = self.object:get_yaw() + turn_speed
	self.object:set_rotation({x = xaw, y = yaw, z = 0})
end






local function handle_wind(self)
	if not self.sail
	then
		return
	end
	
	local pos = self.object:get_pos()
	local wind = perlin_wind.get(pos)
	
	pos.y = pos.y + 2
	
	--do calculation relative to yaw and sail yaw
	
	local yaw = self.object:get_yaw()
	yaw = yaw + pi / 2
	
	
	
	
	--calculate speed depending on wind and sail position
	local sail_direction = yaw - self.sail_yaw / 180 * pi
	sail_direction = sail_direction % (pi * 2)
	
	
	
	local sail_vec = {x = -math.cos(sail_direction), y = 0, z = -sin(sail_direction)}
	
	local speed = (vector.angle(sail_vec, wind) - pi / 2) * 8
	
	--accelerate slowly
	speed = speed - self.speed
	self.speed = self.speed + speed * 0.01
end

local function move(self)
	--decay speed
	self.speed = self.speed * 0.995
	
	--set velocity depending on yaw and speed
	local yaw = self.object:get_yaw() + pi / 2
	local vel = vector.multiply({x = cos(yaw), y = 0, z = sin(yaw)}, self.speed)
	self.object:setvelocity(vel)
end

return float_or_fall, turn, handle_wind, move
