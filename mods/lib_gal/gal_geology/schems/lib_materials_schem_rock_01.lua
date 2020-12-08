	
	local __ = {name = "air",param2 = 0,prob = 0}
	local S0 = {name = "gal:stone", param2 = 0, prob = 254}
	local S1 = {name = "gal:stone", param2 = 0, prob = 192}
	local S2 = {name = "gal:stone", param2 = 0, prob = 128}
	local S3 = {name = "gal:stone", param2 = 0, prob = 96}
	local D0 = {name = "gal:dirt", param2 = 0, prob = 254}

return {
		size = {x = 3,y = 3,z = 3},
		data = {
			S0, S0, S0,
			S0, S0, __,
			__, __, __,

			S0, S0, S0,
			S0, S0, S0,
			S0, S0, __,

			S0, S0, S0,
			S0, S0, S0,
			__, S0, S0
		},
		yslice_prob = {
			{prob = 254, ypos = 0},
			{prob = 254, ypos = 1},
			{prob = 254, ypos = 2}
		}
	}
