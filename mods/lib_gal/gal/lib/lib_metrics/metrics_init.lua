

--##
--##	CONSTANTS, LOCALIZED FUNCTIONS
--##

	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor
	
	

--##
--##    LINE FUNCTIONS:  Lerp, Steps, Bias, Gain
--##

	function gal.lib.metrics.lerp(noise_a, noise_b, n_mod)
		return noise_a * (1 - n_mod) + noise_b * n_mod
	end

	function gal.lib.metrics.steps(noise, h)
		local w = math.abs(noise)				--n_base
		local k = math.floor(h / w)
		local f = (h - k * w) / w
		local s = math.min(2 * f, 1.0)
		return (k + s) * w
	end

	function gal.lib.metrics.bias(noise, bias)
		return (noise / ((((1.0 / bias) - 2.0) * (1.0 - noise)) + 1.0))
	end

	function gal.lib.metrics.gain(noise, gain)
		if noise < 0.5 then
			return bias(noise * 2.0, gain) / 2.0
		else
			return bias(noise * 2.0 - 1.0, 1.0 - gain) / 2.0 + 0.5
		end
	end



--##
--##	MIDPOINT, TRIANGULATION FUNCTIONS
--##

	function gal.lib.metrics.get_midpoint(a,b)						--get_midpoint(a,b)
		return ((a.x+b.x) * 0.5), ((a.z+b.z) * 0.5)					--returns the midpoint between two points
	end
	
	function gal.lib.metrics.get_triangulation_2d(a,b,c)					--get_2d_triangulation(a,b,c)
		return ((a.x+b.x+c.x)/3), ((a.z+b.z+c.z)/3)				--returns the triangulated point between three points (average pos)
	end
	
	function gal.lib.metrics.get_triangulation_3d(a,b,c)					--get_3d_triangulation(a,b,c)
		return ((a.x+b.x+c.x)/3), ((a.y+b.y+c.y)/3), ((a.z+b.z+c.z)/3)		--returns the 3D triangulated point between three points (average pos)
	end


--##
--##	DIRECTION, SLOPE FUNCTIONS
--##

	function gal.lib.metrics.get_direction_to_pos(a,b)
		local t_compass
		local t_dir = {x = 0, z = 0}
	
		if a.z < b.z then
			t_dir.z = 1
			t_compass = "N"
		elseif a.z > b.z then
			t_dir.z = -1
			t_compass = "S"
		else
			t_dir.z = 0
			t_compass = ""
		end
		if a.x < b.x then
			t_dir.x = 1
			t_compass = t_compass .. "E"
		elseif a.x > b.x then
			t_dir.x = -1
			t_compass = t_compass .. "W"
		else
			t_dir.x = 0
			t_compass = t_compass .. ""
		end
		return t_dir, t_compass
	end
	
	function gal.lib.metrics.get_slope(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		return (rise/run), rise, run
	end
	
	function gal.lib.metrics.get_slope_inverse(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		return (run/rise), run, rise
	end
	
	function gal.lib.metrics.get_line_inverse(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		local inverse = (run - rise) / 2
		local c = {
			x = a.x + inverse,
			y = b.z + inverse
		}
		local d = {
			x = b.x - inverse,
			y = a.z - inverse
		}
		return c, d
	end




--##
--##	DISTANCE FUNCTIONS
--##

--## 3D Distance

	function gal.lib.metrics.get_distance_3d_chebyshev(a,b)						--get_distance(a,b)
	    return (max(abs(a.x-b.x), max(abs(a.y-b.y), abs(a.z-b.z))))					--returns the chebyshev distance between two points
	end

	function gal.lib.metrics.get_distance_3d_euclid(a,b)
		local dx = a.x - b.x
		local dy = a.y - b.y
		local dz = a.z - b.z
		return (dx*dx+dy*dy+dz*dz)^0.5
	end

	function gal.lib.metrics.get_distance_3d_manhattan(a,b)					--get_manhattan_distance(a,b)
	    return (abs(a.x-b.x) + abs(a.y-b.y) + abs(a.z-b.z))					--returns the manhattan distance between two points
	end


--## 2D Distance

	local function get_dist_a(a,b)						--get_distance(a,b)
		return (abs(a) + abs(b)) * 0.5
	end

	local function get_dist_c(a,b)						--get_distance(a,b)
		return max(abs(a), abs(b))
	end

	local function get_dist_e(a,b)						--get_distance(a,b)
		return ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
	end

	local function get_dist_l(a,b)						--get_distance(a,b)
		return min(abs(a), abs(b))
	end

	local function get_dist_m(a,b)						--get_distance(a,b)
		return abs(a) + abs(b)
	end

	local function get_dist_r(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return d_a + d_c + d_e + d_m
	end

	local function get_dist_x(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_c + d_e + d_m) * 0.25
	end

	local function get_dist_ac(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		return (d_a + d_c) * 0.5
	end

	local function get_dist_ae(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_a + d_e) * 0.5
	end

	local function get_dist_al(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_l = min(abs(a), abs(b))
		return (d_a + d_l) * 0.5
	end

	local function get_dist_am(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_m) * 0.5
	end

	local function get_dist_ce(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_c + d_e) * 0.5
	end

	local function get_dist_cl(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_l = min(abs(a), abs(b))
		return (d_c + d_e) * 0.5
	end

	local function get_dist_cm(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_m = abs(a) + abs(b)
		return (d_c + d_m) * 0.5
	end

	local function get_dist_em(a,b)						--get_distance(a,b)
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_e + d_m) * 0.5
	end

	local function get_dist_ace(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_a + d_c + d_e) * 0.35
	end

	local function get_dist_acm(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_m = abs(a) + abs(b)
		return (d_a + d_c + d_m) * 0.35
	end

	local function get_dist_aem(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_e + d_m) * 0.35
	end

	local function get_dist_cem(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_c + d_e + d_m) * 0.35
	end

	function gal.lib.metrics.set_dist_func(d_type)

		if d_type == "a" then
			gal.lib.metrics.get_dist = get_dist_a
		elseif d_type == "c" then
			gal.lib.metrics.get_dist = get_dist_c
		elseif d_type == "e" then
			gal.lib.metrics.get_dist = get_dist_e
		elseif d_type == "l" then
			gal.lib.metrics.get_dist = get_dist_l
		elseif d_type == "m" then
			gal.lib.metrics.get_dist = get_dist_m
		elseif d_type == "r" then
			gal.lib.metrics.get_dist = get_dist_r
		elseif d_type == "x" then
			gal.lib.metrics.get_dist = get_dist_x
		elseif d_type == "ac" then
			gal.lib.metrics.get_dist = get_dist_ac
		elseif d_type == "ae" then
			gal.lib.metrics.get_dist = get_dist_ae
		elseif d_type == "al" then
			gal.lib.metrics.get_dist = get_dist_al
		elseif d_type == "am" then
			gal.lib.metrics.get_dist = get_dist_am
		elseif d_type == "ce" then
			gal.lib.metrics.get_dist = get_dist_ce
		elseif d_type == "cl" then
			gal.lib.metrics.get_dist = get_dist_cl
		elseif d_type == "cm" then
			gal.lib.metrics.get_dist = get_dist_cm
		elseif d_type == "em" then
			gal.lib.metrics.get_dist = get_dist_em
		elseif d_type == "ace" then
			gal.lib.metrics.get_dist = get_dist_ace
		elseif d_type == "acm" then
			gal.lib.metrics.get_dist = get_dist_acm
		elseif d_type == "aem" then
			gal.lib.metrics.get_dist = get_dist_aem
		elseif d_type == "cem" then
			gal.lib.metrics.get_dist = get_dist_cem
		else
			gal.lib.metrics.get_dist = get_dist_e
		end
	end

	function gal.lib.metrics.get_distance(a,b,d_type)						--get_distance(a,b)
	
		local this_dist
		
		if d_type == "a" then
			this_dist = (abs(a) + abs(b)) * 0.5
		elseif d_type == "c" then
			this_dist = max(abs(a), abs(b))
		elseif d_type == "e" then
			this_dist = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		elseif d_type == "l" then
			this_dist = min(abs(a), abs(b))
		elseif d_type == "m" then
			this_dist = abs(a) + abs(b)
		elseif d_type == "x" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_c + d_e + d_m) * 0.25
		elseif d_type == "r" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = d_a + d_c + d_e + d_m
		elseif d_type == "ac" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			this_dist = (d_a + d_c) * 0.5
		elseif d_type == "ae" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_a + d_e) * 0.5
		elseif d_type == "al" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_l = min(abs(a), abs(b))
			this_dist = (d_a + d_l) * 0.5
		elseif d_type == "am" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_m) * 0.5
		elseif d_type == "ce" then
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_c + d_e) * 0.5
		elseif d_type == "cl" then
			local d_c = max(abs(a), abs(b))
			local d_l = min(abs(a), abs(b))
			this_dist = (d_c + d_e) * 0.5
		elseif d_type == "cm" then
			local d_c = max(abs(a), abs(b))
			local d_m = abs(a) + abs(b)
			this_dist = (d_c + d_m) * 0.5
			--this_dist = (d_c + d_m)
		elseif d_type == "em" then
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_e + d_m) * 0.5
		elseif d_type == "ace" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_a + d_c + d_e) * 0.35
		elseif d_type == "acm" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_c + d_m) * 0.35
		elseif d_type == "aem" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_e + d_m) * 0.35
		elseif d_type == "cem" then
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_c + d_e + d_m) * 0.35
		else
			this_dist = 0
		end
	
		return this_dist
	
	end










