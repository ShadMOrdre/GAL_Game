local random = math.random
local split = string.split
local conact = table.concat
local abs = math.abs
local sin = math.sin
local cos = math.cos
local pi = math.pi
local length = vector.length

local flag_attach = {x = -10, y = 33, z = 10}

local function set_cloth_color(obj, color)
	local properties = obj:get_properties()
	--remove underscores from colorstring
	color = table.concat(string.split(color, "_"))
	properties.textures[1] = "sailing_canoe_cloth.png^[multiply:" .. color
	
	obj:set_properties(properties)
end

local function set_colors(self)
	local flag = self.flag
	if flag
	then
		local color = self.flag_color
		set_cloth_color(flag, color)
	end
	
	local sail = self.sail
	if sail
	then
		local color = self.sail_color
		set_cloth_color(sail, color)
	end
end

local function dye(self, clicker)
	local itemstack = clicker:get_wielded_item()
	local name = itemstack:get_name()
	local name = string.split(name, ":")
	if not dye or name[1] ~= "dye"
	then
		return
	end
	if self.sail
	then
		self.sail_color = name[2]
	else
		self.flag_color = name[2]
	end
	set_colors(self)
	local name = clicker:get_player_name()
	
	if not (creative and creative.is_enabled_for
		and creative.is_enabled_for(name))
	then
		itemstack:take_item()
		clicker:set_wielded_item(itemstack)
	end
	return true
end

local function spawn_particles(self)
	if abs(self.speed) / random() < 9
	then
		return
	end
	
	local pos = self.object:get_pos()
	
	local yaw = -(self.object:get_yaw() + pi / 2)
	local left = {x = sin(yaw), y = 0, z = cos(yaw)}
	
	local back_left = vector.add(pos, left)
	local back_right = vector.add(pos, vector.multiply(left, -1.1))
	
	
	
	minetest.add_particle(
		{
			pos = back_left,
			texture = "bubble.png",
			size = random(5),
			expirationtime = random() * 3,
		})
	minetest.add_particle(
		{
			pos = back_right,
			texture = "bubble.png",
			size = random(5),
			expirationtime = random() * 3,
		})
end


local function angle(v1, v2)
	local doot = v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
	local lengths = length(v1) * length(v2)
	
	return math.acos(doot / lengths)
end

--displays wind direction by rotating the flag
local function show_wind(self)
	
	local yaw = self.object:get_yaw() + pi / 2
	local pos = self.object:get_pos()
	local wind = perlin_wind.get(pos)
	
	--blow flag
	local foreward = {x = cos(yaw), y = 0, z = sin(yaw)}
	local flag_yaw = angle(wind, {x = 0, y = 0, z = 1}) + yaw
	flag_yaw = (flag_yaw / pi * 180 + 180) % 360
	
	self.flag:set_attach(self.object,
		"",
		flag_attach,
		{x = 0, y = flag_yaw, z = 0})
end


return set_colors, dye, spawn_particles, show_wind
