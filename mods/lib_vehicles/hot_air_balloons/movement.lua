--localize global functions
local vector_new = vector.new
local math_hypot = math.hypot
local atan = math.atan
local cos = math.cos
local sin = math.sin
local pi = math.pi

local max_ballooning_vertical_speed = 1
local max_ballooning_horizontal_speed = 3

local function is_water_is_air(pos)
	local node_name = minetest.get_node(pos).name
	return minetest.get_item_group(node_name, "water"),
		node_name == "air"
end
local function get_vertical_acceleration(self)
	local heat = self.heat
	local vel_y = self.object:getvelocity().y
	local acc_candidate = heat / 1000 - 0.5
	
	--enforce max speed
	if vel_y > max_ballooning_vertical_speed
		and acc_candidate * vel_y > 0
	then
		return 0
	else
		return acc_candidate
	end
end

--if balloon is submerged
local function float_up(self, vel)
	self.submerged = true
	vel.y = 0.2 --TODO: balance this
	return vel
end

local function swim(self, vel)
	--allow controls, allow up
	local pos = self.object:get_pos()
	--keep y constant or rising
	local acc_y = get_vertical_acceleration(self)
	
	if self.submerged or acc_y < 0
	then
		self.submerged = false
		vel.y = 0
		return 0, vel
	else
		return acc_y, vel
	end
end

--rotates the balloon towards where the player is looking
local pi_192ths = math.pi / 192
local function rotate(self, player)
	local player_yaw = player:get_look_horizontal()
	local self_yaw = self.object:getyaw()
	if self_yaw - player_yaw > 0
	then
		self.object:setyaw(self_yaw - pi_192ths)
	else
		self.object:setyaw(self_yaw + pi_192ths)
	end
end

--takes wasd and turns it into a 2d vector
local pi_halves = math.pi / 2
function get_direction(right, left, up, down)
	local inline, cross = 0, 0
	local move = right or left or up or down
	if left then cross = 1 end
	if right then cross = cross - 1 end
	if up then inline = 1	end
	if down then inline = inline - 1 end
	local arg
	if inline < 0
	then
		return atan(cross / inline) + pi, move
	elseif inline > 0
	then
		return atan(cross / inline), move
	else
		return pi_halves * cross, move
	end
end


--[[
space to rotate where the player is looking
wasd to apply acceleration
shift to let air
]]
local function handle_control(self, vel)
	local player = minetest.get_player_by_name(self.pilot or "")
	if not player
	then
		self.pilot = nil
		return 0, 0
	end
	local control = player:get_player_control()
	if control.sneak --lowering heat quickly
	then
		local heat = self.heat - 30
		if heat < 0
		then
			self.heat = 0
		else
			self.heat = heat
		end
	end
	
	if control.jump --rotate towards player yaw
	then
		rotate(self, player)
	end
	
	--taking direction from get_direction
	--and turning it into radians.
	--if max speed is reached, only acceleration in the opposite direction is applied.
	local dir_radians, move = get_direction(control.right, control.left, control.up, control.down)
	if move and math_hypot(vel.x, vel.z)
	then
		dir_radians = dir_radians + player:get_look_horizontal()
		local x, z = -sin(dir_radians), cos(dir_radians)
		if math_hypot(vel.x, vel.z) > max_ballooning_horizontal_speed
		then
			if x * vel.x > 0
			then
				x = 0
			end
			if z * vel.z > 0
			then
				z = 0
			end
		end
		return x, z
	end
	return 0, 0
end

--handle movement in different cases
return function(self)
	local pos = self.object:get_pos()
	local on_water, in_air = is_water_is_air(pos)
	local acc = vector_new(0, 0, 0)
	local vel = self.object:getvelocity()
	local in_water
	local pos_above = vector_new(pos.x, pos.y + 1, pos.z)
	
	if is_water_is_air(pos_above) > 0 --if submerged
	then
		vel = float_up(self, vel)
		acc.x, acc.z = handle_control(self, vel)
		self.object:setvelocity(vel)
	elseif on_water > 0 --if on water
	then
		acc.y, vel = swim(self, vel)
		self.object:setvelocity(vel)
		acc.x, acc.z = handle_control(self, vel)
	elseif in_air
	then
		--allow controls and height change
		acc.y = get_vertical_acceleration(self)
		acc.x, acc.z = handle_control(self, vel)
	else --if on ground
		--only allow height change
		acc.y = get_vertical_acceleration(self)
	end
	self.object:setacceleration(acc)
end