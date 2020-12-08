

if gal.mapgen.name ~= "mg_valleys3d" then
	return
end

mg_valleys3d = {}
mg_valleys3d.name = "mg_valleys3d"
mg_valleys3d.ver_max = 0
mg_valleys3d.ver_min = 1
mg_valleys3d.ver_rev = 0
mg_valleys3d.ver_str = mg_valleys3d.ver_max .. "." .. mg_valleys3d.ver_min .. "." .. mg_valleys3d.ver_rev
mg_valleys3d.authorship = "ShadMOrdre.  Additional credits to Termos' Islands mod; Gael-de-Sailleys' Valleys; duane-r Valleys_c, burli mapgen, and paramats' mapgens"
mg_valleys3d.license = "LGLv2.1"
mg_valleys3d.copyright = "2020"
mg_valleys3d.path_mod = minetest.get_modpath(minetest.get_current_modname())
mg_valleys3d.path_world = minetest.get_worldpath()

mg_valleys3d.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] mg_valleys3d:  Loading..."))
minetest.log(S("[MOD] mg_valleys3d:  Version:") .. S(mg_valleys3d.ver_str))
minetest.log(S("[MOD] mg_valleys3d:  Legal Info: Copyright ") .. S(mg_valleys3d.copyright) .. " " .. S(mg_valleys3d.authorship) .. "")
minetest.log(S("[MOD] mg_valleys3d:  License: ") .. S(mg_valleys3d.license) .. "")



	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_valleys3d.fillermap = {}
	mg_valleys3d.rivermap = {}
	mg_valleys3d.surfacemap = {}
	mg_valleys3d.slopemap = {}

	mg_valleys3d.water_level = 1
	mg_valleys3d.use_heat_scalar = false

	mg_valleys3d.mg_world_scale = 1
	local mg_world_scale = mg_valleys3d.mg_world_scale
	mg_valleys3d.mg_river_size = 5
	mg_valleys3d.mg_dim = "3d"
	local max_highland = gal.mapgen.maxheight_highland
	local max_mountain = gal.mapgen.maxheight_mountain


	--mg_valleys3d.mg_noise_spread = 600
	--mg_valleys3d.mg_noise_scale = 25
	--mg_valleys3d.mg_noise_offset = -4
	--mg_valleys3d.mg_noise_octaves = 8
	--mg_valleys3d.mg_noise_persist = 0.3
	--mg_valleys3d.mg_noise_lacunarity = 2.19

	mg_valleys3d.mg_noise_spread = 1024
	mg_valleys3d.mg_noise_scale = 50
	mg_valleys3d.mg_noise_seed = 5202
	mg_valleys3d.mg_noise_offset = -10
	mg_valleys3d.mg_noise_octaves = 6
	mg_valleys3d.mg_noise_persist = 0.4
	mg_valleys3d.mg_noise_lacunarity = 2

	local nobj_val_terrain = nil
	local nbuf_val_terrain = {}
	local nobj_val_river = nil
	local nbuf_val_river = {}
	local nobj_val_depth = nil
	local nbuf_val_depth = {}
	local nobj_val_profile = nil
	local nbuf_val_profile = {}
	local nobj_val_slope = nil
	local nbuf_val_slope = {}
	local nobj_val_fill = nil
	local nbuf_val_fill = {}

	local nobj_val_dirt = nil
	local nbuf_val_dirt = {}

	local nobj_filler_depth = nil
	local nbuf_filler_depth = {}

	local nobj_heatmap = nil
	local nbuf_heatmap = {}
	local nobj_heatblend = nil
	local nbuf_heatblend = {}
	local nobj_humiditymap = nil
	local nbuf_humiditymap = {}
	local nobj_humidityblend = nil
	local nbuf_humidityblend = {}


--#	Valleys Noises
--[[
	local np_val_terrain = {
		flags = "defaults",
		lacunarity = 2,
		offset = -10,
		scale = 50,
		spread = {x = 1024, y = 1024, z = 1024},
		seed = 5202,
		octaves = 6,
		persist = 0.4,
	}
--]]
	local np_val_terrain = {
		offset = mg_valleys3d.mg_noise_offset,
		scale = mg_valleys3d.mg_noise_scale * mg_valleys3d.mg_world_scale,
		seed = mg_valleys3d.mg_noise_seed,
		spread = {x = (mg_valleys3d.mg_noise_spread * mg_valleys3d.mg_world_scale), y = (mg_valleys3d.mg_noise_spread * mg_valleys3d.mg_world_scale), z = (mg_valleys3d.mg_noise_spread * mg_valleys3d.mg_world_scale)},
		octaves = mg_valleys3d.mg_noise_octaves,
		persist = mg_valleys3d.mg_noise_persist,
		lacunarity = mg_valleys3d.mg_noise_lacunarity,
		flags = "defaults",
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
	local np_val_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 5,
		scale = 4,
		spread = {x = 512, y = 512, z = 512},
		seed = -1914,
		octaves = 1,
		persist = 1,
	}
	local np_val_profile = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0.6,
		scale = 0.5,
		spread = {x = 512, y = 512, z = 512},
		seed = 777,
		octaves = 1,
		persist = 1,
	}
	local np_val_slope = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0.5,
		scale = 0.5,
		spread = {x = 128, y = 128, z = 128},
		seed = 746,
		octaves = 1,
		persist = 1,
	}
	local np_val_fill = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1,
		spread = {x = 256, y = 512, z = 256},
		seed = 1993,
		octaves = 6,
		persist = 0.8,
	}
	local np_val_dirt = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = 256, y = 256, z = 256},
		seed = 1605,
		octaves = 3,
		persist = 0.5,
	}

	np_vval_filler_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = 150, y = 150, z = 150},
		seed = 261,
		octaves = 3,
		persistence = 0.7,
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

		if mg_valleys3d.use_heat_scalar == true then
			local t_z = abs(z)
			local t_heat = 0
			local t_heat_scale = 0.0071875 
			local t_heat_factor = 0
	
			--local t_heat_mid = ((mg_valleys3d.mg_map_size * mg_valleys3d.mg_world_scale) * 0.25)
			local t_heat_mid = 15000
			local t_diff = abs(t_heat_mid - t_z)
	
			if t_z >= t_heat_mid then
				t_heat_factor = t_heat_scale * -1
			elseif t_z <= t_heat_mid then
				t_heat_factor = t_heat_scale
			end
	
			local t_map_scale = t_heat_factor
			return t_diff * t_map_scale
		else
			return 0
		end
	end

--[[
	local function get_valleys_height(z,x,dim)

		if (dim ~= "2d") or (dim ~= "3d") then
			dim = "2d"
		end

		-- Mapgen parameters
		local river_size_factor = mg_valleys3d.mgvalleys_river_size / 100
		local water_level       = mg_valleys3d.water_level

		-- Check if in a river channel
		local v_rivers = minetest.get_perlin(np_val_river):get_2d({x=x,y=z})
			--if abs(v_rivers) <= river_size_factor then
			--	-- TODO: Add riverbed calculation
			--	return nil
			--end
	
		local valley    = minetest.get_perlin(np_val_depth):get_2d({x=x,y=z})
		local valley_d  = valley * valley
		local base      = valley_d + minetest.get_perlin(np_val_terrain):get_2d({x=x,y=z})
		local river     = abs(v_rivers) - river_size_factor
		local tv        = max(river / minetest.get_perlin(np_val_profile):get_2d({x=x,y=z}), 0)
		local valley_h  = valley_d * (1 - math.exp(-tv * tv))
		local surface_y = base + valley_h
		local slope     = valley_h * minetest.get_perlin(np_val_slope):get_2d({x=x,y=z})

--# 2D Generation
		if dim == "2d" then

			local n_fill = minetest.get_perlin(np_val_fill):get_3d({x=x,y=surface_y,z=z})

			local surface_delta = n_fill - surface_y;
			local density = slope * n_fill - surface_delta;
	
			return density
		end
--
	
--# 3D Noise
		if dim == "3d" then
			-- TODO: Find proper limits for this check
			for y = 128, -128, -1 do
				-- TODO: May be better if this 3D noise map is fetched for the hole Y column at once
				local surface_delta = y - surface_y;
				local n_fill = minetest.get_perlin(np_val_fill):get_3d({x=x,y=y,z=z})
					--local density = slope * nobj_val_fill:get_3d({x=x, y=y, z=z}) - surface_delta;
					--local density = slope * nobj_val_fill:get_2d({x=x,y=z}) - surface_delta;
				local density = slope * n_fill - surface_delta;
		
				if density > 0 then -- If solid
					return y + 1;
				end
			end
		end
--

		return nil;
	end
--]]

	local mapgen_times = {
		liquid_lighting = {},
		loop2d = {},
		loop3d = {},
		mainloop = {},
		make_chunk = {},
		noisemaps = {},
		preparation = {},
		setdata = {},
		writing = {},
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
		local permapdims2d = {x = sidelen, y = sidelen, z = 0}
		local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}
		local minpos3d = {x = x0, y = y0, z = z0}
		local minpos2d = {x = x0, y = z0}

		nobj_val_terrain = nobj_val_terrain or minetest.get_perlin_map(np_val_terrain, permapdims2d)
		nbuf_val_terrain = nobj_val_terrain:get_2d_map(minpos2d)
		nobj_val_river = nobj_val_river or minetest.get_perlin_map(np_val_river, permapdims2d)
		nbuf_val_river = nobj_val_river:get_2d_map(minpos2d)
		nobj_val_depth = nobj_val_depth or minetest.get_perlin_map(np_val_depth, permapdims2d)
		nbuf_val_depth = nobj_val_depth:get_2d_map(minpos2d)
		nobj_val_profile = nobj_val_profile or minetest.get_perlin_map(np_val_profile, permapdims2d)
		nbuf_val_profile = nobj_val_profile:get_2d_map(minpos2d)
		nobj_val_slope = nobj_val_slope or minetest.get_perlin_map(np_val_slope, permapdims2d)
		nbuf_val_slope = nobj_val_slope:get_2d_map(minpos2d)
		--nobj_val_fill = nobj_val_fill or minetest.get_perlin_map(np_val_fill, permapdims2d)
		--nbuf_val_fill = nobj_val_fill:get_2d_map({x=minp.x,y=minp.z})
		nobj_val_fill = nobj_val_fill or minetest.get_perlin_map(np_val_fill, permapdims3d)
		nbuf_val_fill = nobj_val_fill:get_3d_map(minpos3d)
	
		nobj_val_dirt = nobj_val_dirt or minetest.get_perlin_map(np_val_dirt, permapdims2d)
		nbuf_val_dirt = nobj_val_dirt:get_2d_map(minpos2d)
		nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_vval_filler_depth, permapdims2d)
		nbuf_filler_depth = nobj_filler_depth:get_2d_map(minpos2d)

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims2d)
		nbuf_heatmap = nobj_heatmap:get_2d_map(minpos2d)
		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims2d)
		nbuf_heatblend = nobj_heatblend:get_2d_map(minpos2d)
		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims2d)
		nbuf_humiditymap = nobj_humiditymap:get_2d_map(minpos2d)
		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims3d)
		nbuf_humidityblend = nobj_humidityblend:get_2d_map(minpos2d)
	
		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		vm:get_data(data)
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)
	
		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	
		local write = false

		-- Mapgen parameters
		local river_size_factor = mg_valleys3d.mg_river_size / 100
		local water_level       = mg_valleys3d.water_level
		local mg_dim = mg_valleys3d.mg_dim	

--
	--2D HEIGHTMAP GENERATION
		local index2d = 0
	
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

	--## VALLEYS CALCULATION

				-- Check if in a river channel
				local v_rivers = minetest.get_perlin(np_val_river):get_2d({x=x,y=z})
				local abs_rivers = abs(v_rivers)
	
	--## HEIGHTMAP CALCULATION
				local valley    = nbuf_val_depth[z-minp.z+1][x-minp.x+1]
				local valley_d  = valley * valley
				local base      = valley_d + nbuf_val_terrain[z-minp.z+1][x-minp.x+1]
				local river     = abs_rivers - river_size_factor
				local tv        = max(river / nbuf_val_profile[z-minp.z+1][x-minp.x+1])
				local valley_h  = valley_d * (1 - math.exp(-tv * tv))
				local surface_y = base + valley_h
				local slope     = valley_h * nbuf_val_slope[z-minp.z+1][x-minp.x+1]

				mg_valleys3d.surfacemap[index2d] = surface_y
				mg_valleys3d.slopemap[index2d] = slope

			--# 2D Generation
				local n_fill = minetest.get_perlin(np_val_fill):get_3d({x=x,y=surface_y,z=z})
				--#This struct used in 3D loop below:
				--local n_fill = nbuf_val_fill[z-minp.z+1][y-minp.y+1][x-minp.x+1]

				local surface_delta = n_fill - surface_y;
				local density = slope * n_fill - surface_delta;

				local t_y = density

				gal.mapgen.heightmap[index2d] = t_y

	--## RIVERS CALCULATION
				local river_course
				if abs_rivers <= river_size_factor then
					-- TODO: Add riverbed calculation
					river_course = abs_rivers
				end
				mg_valleys3d.rivermap[index2d] = river_course

	--## FILLER CALCULATION

				--mg_valleys3d.fillermap[index2d] = nbuf_filler_depth[z-minp.z+1][x-minp.x+1]
				mg_valleys3d.fillermap[index2d] = nbuf_filler_depth[z-minp.z+1][x-minp.x+1] + nbuf_val_dirt[z-minp.z+1][x-minp.x+1]

	--## BIOME GENERATION
				--local nheat = (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]) + get_heat_scalar(z)
				local nheat = (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1])
				local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_y)

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
--
		local t2 = os.clock()

--
	--2D HEIGHTMAP FROM 3D NOISE GENERATION
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do

					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

		--## HEIGHTMAP CALCULATION
					local surface_y = mg_valleys3d.surfacemap[index2d]
					local slope     = mg_valleys3d.slopemap[index2d]

					local surface_delta = y - surface_y;
					--#This struct used in 2D loop above:
					--local n_fill = minetest.get_perlin(np_val_fill):get_3d({x=x,y=y,z=z})
					local n_fill = nbuf_val_fill[z-minp.z+1][y-minp.y+1][x-minp.x+1]
					local density = slope * n_fill - surface_delta;

					if density > 0 then -- If solid
						gal.mapgen.heightmap[index2d] = y + 1;
					end

				end
			end
		end
--
		local t3 = os.clock()

		--local t4 = os.clock()
	

	--2D HEIGHTMAP RENDER
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local write_3d = false

					local theight = gal.mapgen.heightmap[index2d]
					local t_fillmap = mg_valleys3d.fillermap[index2d]
					local t_biome_name = gal.mapgen.biomemap[index2d]
					local t_rivermap = mg_valleys3d.rivermap[index2d] or (river_size_factor + 1)

					local fill_depth = 4
					local top_depth = 1

	--## TERRAIN 3D GENERATION
					local surface_y = mg_valleys3d.surfacemap[index2d]
					local slope     = mg_valleys3d.slopemap[index2d]

					local surface_delta = y - surface_y;
					--local n_fill = minetest.get_perlin(np_val_fill):get_3d({x=x,y=y,z=z})
					local n_fill = nbuf_val_fill[z-minp.z+1][y-minp.y+1][x-minp.x+1]
					local density = slope * n_fill - surface_delta;

					if density > 0 then -- If solid
						write_3d = true
					elseif y <= mg_valleys3d.water_level then
						if theight <= mg_valleys3d.water_level then
							write_3d = true
						end
					end
	
	--## BIOME GENERATION

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

					river_size_factor = (mg_valleys3d.mg_river_size - (theight / (40 * mg_world_scale))) / 100
					if t_rivermap <= river_size_factor then
						if theight >= (gal.mapgen.water_level -1) then
							t_filldepth = t_riverbed_depth - (theight / (75 * mg_world_scale))
						end
					end


	--## NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if write_3d == true then
						if y < (theight - (fill_depth + top_depth)) then
							t_node = t_stone
						elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
							if t_rivermap <= river_size_factor then
								if y > (mg_valleys3d.water_level - 1) then
									if y >= (theight - ((fill_depth - (t_riverbed_depth * 0.5)) + top_depth)) and y < (theight - top_depth) then
										t_filler = t_river
									else
										t_filler = t_riverbed
									end
									if t_rivermap >= (river_size_factor * 0.7) then
										t_filler = t_mud
									end
								end
							end
							t_node = t_filler
						elseif y >= (theight - top_depth) and y <= theight then
							if t_rivermap <= river_size_factor then
								if y > mg_valleys3d.water_level then
									t_top = t_air
								else
									t_top = t_water
								end
							end
							t_node = t_top
						elseif y > theight and y <= mg_valleys3d.water_level then
						--Water Level (Sea Level)
							t_node = t_water
						end
					end

					data[ivm] = t_node
					write = true

				end
			end
		end
		
		local t4 = os.clock()
	
		if write then
			vm:set_data(data)
		end
	
		local t5 = os.clock()
		
		if write then
	
			minetest.generate_ores(vm,minp,maxp)
			minetest.generate_decorations(vm,minp,maxp)
				
			vm:set_lighting({day = 0, night = 0})
			vm:calc_lighting()
			vm:update_liquids()
		end
	
		local t6 = os.clock()
	
		if write then
			vm:write_to_map()
		end
	
		local t7 = os.clock()
	
		-- Print generation time of this mapchunk.
		local chugent = math.ceil((os.clock() - t0) * 1000)
		print ("[mg_valleys3d] Mapchunk generation time " .. chugent .. " ms")
	
		table.insert(mapgen_times.noisemaps, 0)
		table.insert(mapgen_times.preparation, t1 - t0)
		table.insert(mapgen_times.loop2d, t2 - t1)
		table.insert(mapgen_times.loop3d, t3 - t2)
		table.insert(mapgen_times.mainloop, t4 - t3)
		table.insert(mapgen_times.setdata, t5 - t4)
		table.insert(mapgen_times.liquid_lighting, t6 - t5)
		table.insert(mapgen_times.writing, t7 - t6)
		table.insert(mapgen_times.make_chunk, t7 - t0)
	
		-- Deal with memory issues. This, of course, is supposed to be automatic.
		local mem = math.floor(collectgarbage("count")/1024)
		if mem > 1000 then
			print("mg_valleys3d is manually collecting garbage as memory use has exceeded 500K.")
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

		if #mapgen_times.make_chunk == 0 then
			return
		end
	
		local average, standard_dev
		minetest.log("mg_valleys3d lua Mapgen Times:")
	
		average = mean(mapgen_times.liquid_lighting)
		minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop2d)
		minetest.log(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop3d)
		minetest.log(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.mainloop)
		minetest.log(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.make_chunk)
		minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.noisemaps)
		minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.preparation)
		minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.setdata)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.writing)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
	end)





minetest.log(S("[MOD] mg_valleys3d:  Successfully loaded."))


