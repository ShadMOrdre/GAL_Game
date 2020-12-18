perlin_wind = {}
local storage = minetest.get_mod_storage()

local UPDATE_INTERVAL = 4

local noiseparams =
{
	offset = storage:get_int("offset"),
	scale = 1000,
	spread = {x = 10000, y = 10000, z = 10000},
	octaves = 1,
	persist = 0.63,
}
local strength = storage:get_int("strength")

local perlin

local tau = 2 * math.pi

function perlin_wind.get(pos)
	local yaw = perlin:get_2d(pos) % tau
	
	
	
	local dir = vector.new(math.sin(yaw), 0, math.cos(yaw))
	
	return vector.multiply(dir, strength)
end

function perlin_wind.set_seed(seed)
	noiseparams.seed = seed
	perlin = PerlinNoise(noiseparams)
	storage:set_int("seed", seed)
end




do
	local seed = storage:get_int("seed")
	if seed == 0
	then
		seed = os.clock()
		perlin_wind.set_seed(seed)
	end
	
	if strength == 0
	then
		strength = math.random(10)
		storage:set_int("strength", strength)
	end
end


local timer = math.huge
minetest.register_globalstep(function(dtime)
		if timer > UPDATE_INTERVAL
		then
			local offset = noiseparams.offset + (math.random() - 0.5) / 32
			
			if math.abs(offset) < 10
			then
				noiseparams.offset = offset
				storage:set_int("offset", offset)
			end
			
			local newstrength = math.abs(strength + (math.random() - 0.5) / 32)
			
			if newstrength > 2 and newstrength < 10
			then
				strength = newstrength
				storage:set_int("strength", strength)
			end 
			
			
			perlin = PerlinNoise(noiseparams)
			timer = 0
		else
			timer = timer + dtime
		end
	end)
