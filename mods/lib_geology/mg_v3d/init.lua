

if gal.mapgen.name ~= "mg_v3d" then
	return
end

mg_v3d = {}
mg_v3d.name = "mg_v3d"
mg_v3d.ver_max = 0
mg_v3d.ver_min = 1
mg_v3d.ver_rev = 0
mg_v3d.ver_str = mg_v3d.ver_max .. "." .. mg_v3d.ver_min .. "." .. mg_v3d.ver_rev
mg_v3d.authorship = "ShadMOrdre.  Additional credits to Termos' Islands mod; Gael-de-Sailleys' Valleys; duane-r Valleys_c, burli mapgen, and paramats' mapgens"
mg_v3d.license = "LGLv2.1"
mg_v3d.copyright = "2020"
mg_v3d.path_mod = minetest.get_modpath(minetest.get_current_modname())
mg_v3d.path_world = minetest.get_worldpath()

mg_v3d.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] mg_v3d:  Loading..."))
minetest.log(S("[MOD] mg_v3d:  Version:") .. S(mg_v3d.ver_str))
minetest.log(S("[MOD] mg_v3d:  Legal Info: Copyright ") .. S(mg_v3d.copyright) .. " " .. S(mg_v3d.authorship) .. "")
minetest.log(S("[MOD] mg_v3d:  License: ") .. S(mg_v3d.license) .. "")


	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_v3d.fillermap = {}
	mg_v3d.rivermap = {}

	mg_v3d.water_level = 1
	mg_v3d.use_heat_scalar = false
	local elevation_chill = 0.5
	local function set_elevation_chill(ec)
		elevation_chill = ec
	end

	mg_v3d.mg_world_scale = 1
	local mg_world_scale = mg_v3d.mg_world_scale
	mg_v3d.mg_river_size = 5
	mg_v3d.density = 128

	mg_v3d.mg_base_height = 240

	local max_highland = gal.mapgen.maxheight_highland
	local max_mountain = gal.mapgen.maxheight_mountain


	local nobj_3dterrain = nil
	local nbuf_3dterrain = {}

	local nobj_2dterrain = nil
	local nbuf_2dterrain = {}

	local nobj_filler_depth = nil
	local nbuf_filler_depth = {}

	local nobj_val_river = nil
	local nbuf_val_river = {}

	local nobj_heatmap = nil
	local nbuf_heatmap = {}
	local nobj_heatblend = nil
	local nbuf_heatblend = {}
	local nobj_humiditymap = nil
	local nbuf_humiditymap = {}
	local nobj_humidityblend = nil
	local nbuf_humidityblend = {}

	mg_v3d.mg_noise_spread = 1024
	mg_v3d.mg_noise_scale = 50
	mg_v3d.mg_noise_seed = 5202
	mg_v3d.mg_noise_offset = -10
	mg_v3d.mg_noise_octaves = 6
	mg_v3d.mg_noise_persist = 0.4
	mg_v3d.mg_noise_lacunarity = 2


	local np_3dterrain = {
		offset = 0,
		scale = 1,
		spread = {x = (384 * mg_v3d.mg_world_scale), y = (192 * mg_v3d.mg_world_scale), z = (384 * mg_v3d.mg_world_scale)},
		seed = 5934,
		--octaves = 7,
		octaves = 5,
		--persist = 0.4,
		persist = 0.5,
		--lacunarity = 2.19,
		lacunarity = 2.11,
		--flags = ""
	}
	--NOT USED
	local np_2dterrain = {
		offset = -4,
		scale = 25,
		spread = {x = (600 * mg_v3d.mg_world_scale), y = (600 * mg_v3d.mg_world_scale), z = (600 * mg_v3d.mg_world_scale)},
		seed = 5934,
		--octaves = 8,
		octaves = 7,
		--persist = 0.3,
		persist = 0.4,
		--lacunarity = 2.19,
		lacunarity = 2.11,
		--flags = ""
	}

	local np_v3d_filler_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = 150, y = 150, z = 150},
		seed = 261,
		octaves = 3,
		persistence = 0.7,
	}
	local np_val_river = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1,
		spread = {x = 256, y = 256, z = 256},
		seed = -6050,
		octaves = 5,
		persist = 0.6,
	}

	local np_heat = {
		flags = "defaults",
		lacunarity = 2,
		offset = 50,
		scale = 50,
		spread = {x = (1000), y = (1000), z = (1000)},
		seed = 5349,
		octaves = 3,
		persist = 0.5,
	}
	local np_heat_blend = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.5,
		spread = {x = 8, y = 8, z = 8},
		seed = 13,
		octaves = 2,
		persist = 1,
	}
	local np_humid = {
		flags = "defaults",
		lacunarity = 2,
		offset = 50,
		scale = 50,
		spread = {x = (1000), y = (1000), z = (1000)},
		seed = 842,
		octaves = 3,
		persist = 0.5,
	}
	local np_humid_blend = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.5,
		spread = {x = 8, y = 8, z = 8},
		seed = 90003,
		octaves = 2,
		persist = 1,
	}



	local function get_heat_scalar(z)

		local t_z = abs(z)
		local t_heat = 0
		local t_heat_scale = 0.0071875 
		local t_heat_factor = 0

		local t_heat_mid = 31000 * 0.25
		local t_diff = abs(t_heat_mid - t_z)

		if t_z >= t_heat_mid then
			t_heat_factor = t_heat_scale * -1
		elseif t_z <= t_heat_mid then
			t_heat_factor = t_heat_scale
		end

		local t_map_scale = t_heat_factor
		return t_diff * t_map_scale

	end
--
	local function calc_biome_from_noise(heat, humid, pos)
		local biome_closest = nil
		local biome_closest_blend = nil
		local dist_min = 31000
		local dist_min_blend = 31000
	
		for i, biome in pairs(minetest.registered_biomes) do

			local min_pos = biome.min_pos or {x=-31000,y=-31000,z=-31000}
			local max_pos = biome.max_pos or {x=31000,y=31000,z=31000}
			local v_blend = biome.vertical_blend or gal.mapgen.biome_vertical_blend or 8
			local bio_heat = biome.b_heat or 50
			local bio_humid = biome.b_humid or 50
			local bio_name = biome.name

			if pos.y >= min_pos.y and pos.y <= max_pos.y+v_blend
					and pos.x >= min_pos.x and pos.x <= max_pos.x
					and pos.z >= min_pos.z and pos.z <= max_pos.z then

				local d_heat = heat - bio_heat
				local d_humid = humid - bio_humid
				local dist = d_heat*d_heat + d_humid*d_humid -- Pythagorean distance
	
				if pos.y <= max_pos.y then -- Within y limits of biome

					if dist < dist_min then
						dist_min = dist
						biome_closest = {}
						biome_closest.name = bio_name
						biome_closest.vertical_blend = v_blend
						biome_closest.max_pos = max_pos
					end

				elseif dist < dist_min_blend then -- Blend area above biome

					dist_min_blend = dist
					biome_closest_blend = {}
					biome_closest_blend.name = bio_name
					biome_closest_blend.vertical_blend = v_blend
					biome_closest_blend.max_pos = max_pos

				end
			end
		end
	
		-- Carefully tune pseudorandom seed variation to avoid single node dither
		-- and create larger scale blending patterns similar to horizontal biome
		-- blend.
		local seed = math.floor(pos.y + (heat+humid) * 0.9)
		local rng = PseudoRandom(seed)
	
		if biome_closest_blend and dist_min_blend <= dist_min
				and rng:next(0, biome_closest_blend.vertical_blend) >= pos.y - biome_closest_blend.max_pos.y then
			return biome_closest_blend.name
		end
	
		return biome_closest.name
	end
--
	local mapgen_times = {
		noisemaps = {},
		preparation = {},
		loop2d = {},
		loop3d = {},
		biomes = {},
		mainloop = {},
		setdata = {},
		liquid_lighting = {},
		writing = {},
		make_chunk = {},
	}

	local data = {}

	minetest.register_on_generated(function(minp, maxp, seed)
		
		-- Start time of mapchunk generation.
		local t0 = os.clock()
		
		local x1 = maxp.x
		local y1 = maxp.y
		local z1 = maxp.z
		local x0 = minp.x
		local y0 = minp.y
		local z0 = minp.z
	
		local sidelen = maxp.x - minp.x + 1

		local ystridevm = sidelen + 32 -- strides for voxelmanip
		local zstridevm = ystridevm ^ 2
		local ystridepm = sidelen + 2 -- strides for perlinmaps, densitymap, stability map
		local zstridepm = ystridepm ^ 2

		local chulens = {x = sidelen, y = sidelen, z = 1}
		local permapdims2d = {x = sidelen, y = sidelen, z = 0}
		local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}
		local minpos3d = {x = x0, y = y0, z = z0}
		local minpos2d = {x = x0, y = z0}

		nobj_3dterrain = nobj_3dterrain or minetest.get_perlin_map(np_3dterrain, permapdims3d)
		local nvals_3dterrain = nobj_3dterrain:get_3d_map(minpos3d, nbuf_3dterrain)

		nobj_2dterrain = nobj_2dterrain or minetest.get_perlin_map(np_3dterrain, permapdims2d)
		local nvals_2dterrain = nobj_2dterrain:get_2d_map(minpos2d, nbuf_3dterrain)

		nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_v3d_filler_depth, permapdims2d)
		local nvals_filler_depth = nobj_filler_depth:get_2d_map(minpos2d, nbuf_filler_depth)

		--nobj_val_river = nobj_val_river or minetest.get_perlin_map(np_val_river, permapdims2d)
		--local nvals_val_river = nobj_val_river:get_2d_map(minpos2d, nbuf_val_river)

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims3d)
		local nvals_heatmap = nobj_heatmap:get_2d_map({x=minp.x,y=minp.z}, nbuf_heatmap)
		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims3d)
		local nvals_heatblend = nobj_heatblend:get_2d_map({x=minp.x,y=minp.z}, nbuf_heatblend)
		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims3d)
		local nvals_humiditymap = nobj_humiditymap:get_2d_map({x=minp.x,y=minp.z}, nbuf_humiditymap)
		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims3d)
		local nvals_humidityblend = nobj_humidityblend:get_2d_map({x=minp.x,y=minp.z}, nbuf_humidityblend)


		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		--data = vm:get_data()
		--local data = vm:get_data(data_buf)
		vm:get_data(data)
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)


		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	
		local write = false

		local river_size_factor = mg_v3d.mg_river_size / 100

	--2D HEIGHTMAP AND FILL DEPTH CALCULATION

		----local ni3d = 1
		----local ni2d = 1
		local index2d = 0
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local n_y = nvals_2dterrain[z-minp.z+1][x-minp.x+1]

				local n_f = minetest.get_perlin(np_3dterrain):get_3d({x = x, y = n_y, z = z})

				local s_d = (1 - n_y) / (mg_v3d.density * mg_v3d.mg_world_scale)
				local n_t = n_f + s_d

				local t_y = n_t

				gal.mapgen.heightmap[index2d] = t_y

			end
		end

		local t2 = os.clock()


	--2D HEIGHTMAP FROM 3D NOISE GENERATION
		--local ni3d = 1
		--local ni2d = 1
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do

					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

					local n_y = nvals_2dterrain[z-minp.z+1][x-minp.x+1]

					local n_f = nvals_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]

					local s_d = (1 - y) / (mg_v3d.density * mg_v3d.mg_world_scale)
					local n_t = n_f + s_d

					if n_t > 0 then
						gal.mapgen.heightmap[index2d] = y
					end

				end
			end
		end

		local t3 = os.clock()


	--2D BIOME SELECTION
		--local ni3d = 1
		--local ni2d = 1
		local index2d = 0
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local t_y = gal.mapgen.heightmap[index2d]

				mg_v3d.fillermap[index2d] = nvals_filler_depth[z-minp.z+1][x-minp.x+1]

				----local v_rivers = nbuf_val_river[z-minp.z+1][x-minp.x+1]
				--local v_rivers = nbuf_val_river[z-minp.z+1][x-minp.x+1]
				--local abs_rivers = abs(v_rivers)
				--local river_course
				--river_size_factor = (mg_v3d.mg_river_size - (t_y / (40 * mg_world_scale))) / 100
				--if abs_rivers <= river_size_factor then
				--	-- TODO: Add riverbed calculation
				--	river_course = abs_rivers 
				--end
				--mg_v3d.rivermap[index2d] = river_course

				--## Alternately, add ' + get_heat_scalar(z)' for Earth like temperature ranges.
				local nheat = (nvals_heatmap[z-minp.z+1][x-minp.x+1] + nvals_heatblend[z-minp.z+1][x-minp.x+1])
				local nhumid = nvals_humiditymap[z-minp.z+1][x-minp.x+1] + nvals_humidityblend[z-minp.z+1][x-minp.x+1]

				local t_biome_name = gal.mapgen.get_biome_name(nheat,nhumid,t_y)
				--local t_biome_name = calc_biome_from_noise(nheat,nhumid,{x = x, y = t_y, z = z})

				gal.mapgen.biomemap[index2d] = t_biome_name

--## SPAWN SELECTION
				if z == player_spawn_point.z then
					if x == player_spawn_point.x then
						player_spawn_point.y = t_y
					end
				end
				if z == origin_y_val.z then
					if x == origin_y_val.x then
						origin_y_val.y = t_y
					end
				end

			end
		end


		local t4 = os.clock()
	
	--2D HEIGHTMAP RENDER
		--local ni3d = 1
		--local ni2d = 1
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				--local vi = area:index(x0 - 1, y, z)
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local write_3d = false

					local theight = gal.mapgen.heightmap[index2d]
					local t_fillmap = mg_v3d.fillermap[index2d]
					--local t_rivermap = mg_v3d.rivermap[index2d] or (river_size_factor + 1)
					local t_biome_name = gal.mapgen.biomemap[index2d]

					local fill_depth = 4
					local top_depth = 1


	--BUILD BIOMES.
					local t_air = gal.mapgen.c_air
					local t_ignore = gal.mapgen.c_ignore

					local t_top = gal.mapgen.c_top
					local t_filler = gal.mapgen.c_filler
					local t_stone = gal.mapgen.c_stone
					local t_water = gal.mapgen.c_water
					local t_river = gal.mapgen.c_river
					local t_riverbed = gal.mapgen.c_gravel
					local t_riverbed_depth = 5
					local t_ice = gal.mapgen.c_ice
					local t_mud = gal.mapgen.c_mud

					t_stone = gal.mapgen.biome_info[t_biome_name].b_stone
					t_filler = gal.mapgen.biome_info[t_biome_name].b_filler
					local t_filldepth = fill_depth + t_fillmap
					t_top = gal.mapgen.biome_info[t_biome_name].b_top
					top_depth = 1
					t_water = gal.mapgen.biome_info[t_biome_name].b_water
					t_river = gal.mapgen.biome_info[t_biome_name].b_river
					t_riverbed = gal.mapgen.biome_info[t_biome_name].b_riverbed
					t_riverbed_depth = gal.mapgen.biome_info[t_biome_name].b_riverbed_depth

					local t_node = t_ignore

	--3D TERRAIN CARVING

					local n_f = nvals_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]

					local s_d = (1 - y) / (mg_v3d.density * mg_v3d.mg_world_scale)
					local n_t = n_f + s_d

					if y <= mg_v3d.water_level then
						if y > theight then
							write_3d = true
						end
						--if (y <= theight) and ((data[ivm] == t_air) or (data[ivm] == t_ignore)) then
						if (theight > y) and (theight > mg_v3d.water_level) then
							write_3d = true
						end
					end

					if n_t > 0 then
						write_3d = true
					end

	--MOUNTAINS AND RIVERS
					if theight > max_highland then
						t_top = t_stone
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_water
						t_river = t_ice
					end
					if theight > max_mountain then
						t_top = t_ice
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_ice
						t_river = t_ice
					end

					--river_size_factor = (mg_v3d.mg_river_size - (theight / (40 * mg_world_scale))) / 100
					--if t_rivermap <= river_size_factor then
					--	if theight >= (mg_v3d.water_level -1) then
					--		t_filldepth = t_riverbed_depth - (theight / (75 * mg_world_scale))
					--	end
					--end

	--NODE PLACEMENT FROM HEIGHTMAP

				--2D Terrain
					if write_3d == true then

						if y < (theight - (t_filldepth + top_depth)) then
							t_node = t_stone
							if (y <= mg_v3d.water_level) and (theight > mg_v3d.water_level) then
								if not (n_t > 0) then
									t_node = t_water
								end
							end
						elseif y >= (theight - (t_filldepth + top_depth)) and y < (theight - top_depth) then
							--if t_rivermap <= river_size_factor then
							--	if y > (mg_v3d.water_level - 1) then
							--		if y >= (theight - ((t_filldepth - (t_riverbed_depth * 0.5)) + top_depth)) and y < (theight - top_depth) then
							--			t_filler = t_river
							--		else
							--			t_filler = t_riverbed
							--		end
							--		if t_rivermap >= (river_size_factor * 0.7) then
							--			t_filler = t_mud
							--		end
							--	end
							--end
							t_node = t_filler
						elseif y >= (theight - top_depth) and y <= theight then
							--if t_rivermap <= river_size_factor then
							--	if y > mg_v3d.water_level then
							--		t_top = t_air
							--	else
							--		t_top = t_water
							--	end
							--end
							t_node = t_top
						elseif y > theight and y <= mg_v3d.water_level then
						--Water Level (Sea Level)
							t_node = t_water
						end

					end

					data[ivm] = t_node
					write = true

					--ni3d = ni3d + 1
					--ni2d = ni2d + 1
					--vi = vi + 1
				end
				--ni2d = ni2d - ystridepm
			end
			--ni2d = ni2d + ystridepm
		end
		
		local t5 = os.clock()
	
		if write then
			vm:set_data(data)
		end
	
		local t6 = os.clock()
		
		if write then
	
			minetest.generate_ores(vm,minp,maxp)
			minetest.generate_decorations(vm,minp,maxp)
				
			vm:set_lighting({day = 0, night = 0})
			vm:calc_lighting()
			vm:update_liquids()
		end
	
		local t7 = os.clock()
	
		if write then
			vm:write_to_map()
		end
	
		local t8 = os.clock()
	
		-- Print generation time of this mapchunk.
		local chugent = math.ceil((os.clock() - t0) * 1000)
		print ("[mg_v3d] Mapchunk generation time " .. chugent .. " ms")
	
		table.insert(mapgen_times.noisemaps, 0)
		table.insert(mapgen_times.preparation, t1 - t0)
		table.insert(mapgen_times.loop2d, t2 - t1)
		table.insert(mapgen_times.loop3d, t3 - t2)
		table.insert(mapgen_times.biomes, t4 - t3)
		table.insert(mapgen_times.mainloop, t5 - t4)
		table.insert(mapgen_times.setdata, t6 - t5)
		table.insert(mapgen_times.liquid_lighting, t7 - t6)
		table.insert(mapgen_times.writing, t8 - t7)
		table.insert(mapgen_times.make_chunk, t8 - t0)
	
		-- Deal with memory issues. This, of course, is supposed to be automatic.
		local mem = math.floor(collectgarbage("count")/1024)
		if mem > 1000 then
			print("mg_v3d is manually collecting garbage as memory use has exceeded 500K.")
			collectgarbage("collect")
		end
	end)

	local function mean( t )
		local sum = 0
		local count= 0
	
		for k,v in pairs(t) do
			if type(v) == 'number' then
				sum = sum + v
				count = count + 1
			end
		end
	
		return (sum / count)
	end

	minetest.register_on_shutdown(function()

		if mg_v3d.mg_add_voronoi == true then
			mg_v3d.save_neighbors()
		end

		if #mapgen_times.make_chunk == 0 then
			return
		end
	
		local average, standard_dev
		minetest.log("mg_v3d lua Mapgen Times:")
	
		average = mean(mapgen_times.noisemaps)
		minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.preparation)
		minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop2d)
		minetest.log(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop3d)
		minetest.log(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.biomes)
		minetest.log(" Biome loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.mainloop)
		minetest.log(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.setdata)
		minetest.log("  setdata: - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.liquid_lighting)
		minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.writing)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.make_chunk)
		minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)
	end)





minetest.log(S("[MOD] mg_v3d:  Successfully loaded."))


