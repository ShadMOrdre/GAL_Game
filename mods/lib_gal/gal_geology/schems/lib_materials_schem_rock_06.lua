
	local __ = {name = "air",param2 = 0,prob = 0}
	local S0 = {name = "gal:stone", param2 = 0, prob = 254}
	local S1 = {name = "gal:stone", param2 = 0, prob = 192}
	local S2 = {name = "gal:stone", param2 = 0, prob = 128}
	local S3 = {name = "gal:stone", param2 = 0, prob = 96}
	local D0 = {name = "gal:dirt", param2 = 0, prob = 254}

return {
		size = {x = 4,y = 6,z = 3},
		data = {
			D0, D0, D0, D0,
			S0, S0, __, __,
			__, S0, __, __,
			__, __, __, __,
			__, __, __, __,
			__, __, __, __,

			D0, D0, D0, D0,
			S0, S0, S0, S0,
			S0, S0, S0, __,
			S0, S0, __, __,
			__, S0, __, __,
			__, S0, __, __,

			D0, D0, D0, D0,
			__, S0, __, __,
			__, S0, __, __,
			__, __, __, __,
			__, __, __, __,
			__, __, __, __
		},
		yslice_prob = {
			{prob = 254, ypos = 0},
			{prob = 254, ypos = 1},
			{prob = 254, ypos = 2},
			{prob = 254, ypos = 3},
			{prob = 254, ypos = 4},
			{prob = 254, ypos = 5}
		}
	}
