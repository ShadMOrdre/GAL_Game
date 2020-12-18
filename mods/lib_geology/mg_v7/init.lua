

if gal.mapgen.name ~= "mg_v7" then
	return
end

mg_v7 = {}
mg_v7.name = "mg_v7"
mg_v7.ver_max = 0
mg_v7.ver_min = 1
mg_v7.ver_rev = 0
mg_v7.ver_str = mg_v7.ver_max .. "." .. mg_v7.ver_min .. "." .. mg_v7.ver_rev
mg_v7.authorship = "ShadMOrdre.  Additional credits to Termos' Islands mod; Gael-de-Sailleys' Valleys; duane-r Valleys_c, burli mapgen, and paramats' mapgens"
mg_v7.license = "LGLv2.1"
mg_v7.copyright = "2020"
mg_v7.path_mod = minetest.get_modpath(minetest.get_current_modname())
mg_v7.path_world = minetest.get_worldpath()

mg_v7.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] mg_v7:  Loading..."))
minetest.log(S("[MOD] mg_v7:  Version:") .. S(mg_v7.ver_str))
minetest.log(S("[MOD] mg_v7:  Legal Info: Copyright ") .. S(mg_v7.copyright) .. " " .. S(mg_v7.authorship) .. "")
minetest.log(S("[MOD] mg_v7:  License: ") .. S(mg_v7.license) .. "")



	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_v7.heightmap = {}
	mg_v7.fillermap = {}
	mg_v7.cliffmap = {}
	mg_v7.biomemap = {} 
	mg_v7.biome_info = {}
	mg_v7.rivermap = {}

	mg_v7.water_level = 1
	mg_v7.use_heat_scalar = false

	mg_v7.mg_world_scale = gal.mapgen.mg_world_scale
	mg_v7.mg_alt_scale_scale = 1
	mg_v7.mg_base_scale_scale = 1
	local mg_world_scale = mg_v7.mg_world_scale
	mg_v7.mg_river_size = 5

	local max_highland = gal.mapgen.maxheight_highland
	local max_mountain = gal.mapgen.maxheight_mountain

	mg_v7.mg_noise_spread = (1200 * mg_v7.mg_alt_scale_scale) * mg_v7.mg_world_scale
	mg_v7.mg_noise_scale = 25
	mg_v7.mg_alt_noise_scale = mg_v7.mg_noise_scale * mg_v7.mg_world_scale
	mg_v7.mg_base_noise_scale = ((mg_v7.mg_noise_scale * 2.8) * mg_v7.mg_base_scale_scale) * mg_v7.mg_world_scale
	mg_v7.mg_noise_offset = -4 * mg_v7.mg_world_scale
	mg_v7.mg_noise_octaves = 7
	mg_v7.mg_noise_persist = 0.4
	mg_v7.mg_noise_lacunarity = 2.19

	mg_v7.mg_height_noise_spread = 1000 * mg_v7.mg_world_scale
	mg_v7.mg_persist_noise_spread = 2000 * mg_v7.mg_world_scale


	local nobj_alt = nil
	local nbuf_alt = {}

	local nobj_base = nil
	local nbuf_base = {}

	local nobj_height = nil
	local nbuf_height = {}

	local nobj_persist = nil
	local nbuf_persist = {}

	local nobj_cliffs = nil
	local nbuf_cliffs = {}

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

	local np_v7_alt = {
		offset = mg_v7.mg_noise_offset,
		scale = mg_v7.mg_alt_noise_scale,
		seed = 5934,
		spread = {x = mg_v7.mg_noise_spread, y = mg_v7.mg_noise_spread, z = mg_v7.mg_noise_spread},
		octaves = mg_v7.mg_noise_octaves,
		persist = mg_v7.mg_noise_persist,
		lacunarity = mg_v7.mg_noise_lacunarity,
		--flags = "defaults"
	}
	local np_v7_base = {
		offset = mg_v7.mg_noise_offset * mg_v7.mg_base_scale_scale,
		scale = mg_v7.mg_base_noise_scale,
		--seed = 82341,
		seed = 5934,
		spread = {x = mg_v7.mg_noise_spread, y = mg_v7.mg_noise_spread, z = mg_v7.mg_noise_spread},
		octaves = mg_v7.mg_noise_octaves,
		persist = mg_v7.mg_noise_persist,
		lacunarity = mg_v7.mg_noise_lacunarity,
		flags = "defaults"
	}

	local np_v7_height = {
		flags = "defaults",
		lacunarity = mg_v7.mg_noise_lacunarity,
		--offset = 0.25,
		offset = 0.5,
		scale = 1,
		spread = {x = mg_v7.mg_height_noise_spread, y = mg_v7.mg_height_noise_spread, z = mg_v7.mg_height_noise_spread},
		seed = 4213,
		octaves = mg_v7.mg_noise_octaves,
		persist = mg_v7.mg_noise_persist,
	}
	local np_v7_persist = {
		flags = "defaults",
		lacunarity = mg_v7.mg_noise_lacunarity,
		offset = 0.6,
		scale = 0.1,
		spread = {x = mg_v7.mg_persist_noise_spread, y = mg_v7.mg_persist_noise_spread, z = mg_v7.mg_persist_noise_spread},
		seed = 539,
		octaves = 3,
		persist = 0.6,
	}


--[[
	local np_v7_alt = {
		flags = "eased",
		lacunarity = 2.0,
		offset = -4,
		scale = 25,
		spread = {x = 600, y = 600, z = 600},
		seed = 5934,
		octaves = 8,
		persist = 0.3,
	}
	local np_v7_base = {
		flags = "eased",
		lacunarity = 2.0,
		offset = -4,
		scale = 70,
		spread = {x = 600, y = 600, z = 600},
		seed = 5934,
		octaves = 8,
		persist = 0.3,
	}

	local np_v7_height = {
		flags = "eased",
		lacunarity = 2.0,
		offset = 0.25,
		scale = 1,
		spread = {x = 500, y = 500, z = 500},
		seed = 4213,
		octaves = 8,
		persist = 0.3,
	}
	local np_v7_persist = {
		flags = "eased",
		lacunarity = 2.0,
		offset = 0.6,
		scale = 0.1,
		spread = {x = 2000, y = 2000, z = 2000},
		seed = 539,
		octaves = 3,
		persist = 0.6,
	}
--]]

	np_v7_filler_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = 150, y = 150, z = 150},
		seed = 261,
		octaves = 3,
		persistence = 0.7,
	}
	local np_v7_cliffs = {
		offset = 0,					
		scale = 0.72,
		spread = {x = 180, y = 180, z = 180},
		seed = 78901,
		octaves = 5,
		persist = 0.5,
		lacunarity = 2.19,
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
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = (1000 * mg_v7.mg_world_scale), y = (1000 * mg_v7.mg_world_scale), z = (1000 * mg_v7.mg_world_scale)},
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
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = (1000 * mg_v7.mg_world_scale), y = (1000 * mg_v7.mg_world_scale), z = (1000 * mg_v7.mg_world_scale)},
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

--[[
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
--]]

	local cliffs_thresh = floor((np_v7_alt.scale) * 0.5)

	local function rangelim(v, min, max)
		if v < min then return min end
		if v > max then return max end
		return v
	end

	local function get_terrain_height_cliffs(theight,cheight)
			-- cliffs
		local t_cliff = 0
		if theight > 1 and theight < cliffs_thresh then 
			local clifh = max(min(cheight,1),0) 
			if clifh > 0 then
				clifh = -1 * (clifh - 1) * (clifh - 1) + 1
				t_cliff = clifh
				theight = theight + (cliffs_thresh - theight) * clifh * ((theight < 2) and theight - 1 or 1)
			end
		end
		return theight, t_cliff
	end

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

	local get_cell = gal.lib.voronoi.get_nearest_cell

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
		--local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}
		--local minpos3d = {x = x0, y = y0, z = z0}
		local minpos2d = {x = x0, y = z0}
	
		--nobj_alt = nobj_alt or minetest.get_perlin_map(np_v7_alt, permapdims2d)
		----nbuf_alt = nobj_alt:get_2d_map(minpos2d)
		--local nvals_alt = nobj_alt:get_2d_map(minpos2d, nbuf_alt)
	
		--nobj_base = nobj_base or minetest.get_perlin_map(np_v7_base, permapdims2d)
		----nbuf_height = nobj_base:get_2d_map(minpos2d)
		--local nvals_base = nobj_base:get_2d_map(minpos2d, nbuf_base)
	
		--nobj_height = nobj_height or minetest.get_perlin_map(np_v7_height, permapdims2d)
		--nbuf_height = nobj_height:get_2d_map(minpos2d)
		----local nvals_height = nobj_height:get_2d_map(minpos2d, nbuf_height)
	
		--nobj_persist = nobj_persist or minetest.get_perlin_map(np_v7_persist, permapdims2d)
		--nbuf_persist = nobj_persist:get_2d_map(minpos2d)
		----local nvals_persist = nobj_persist:get_2d_map(minpos2d, nbuf_persist)
	
		nobj_cliffs = nobj_cliffs or minetest.get_perlin_map(np_v7_cliffs, permapdims2d)
		nbuf_cliffs = nobj_cliffs:get_2d_map(minpos2d)
		----local nvals_cliffs = nobj_cliffs:get_2d_map(minpos2d, nbuf_cliffs)
	
		nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_v7_filler_depth, permapdims2d)
		nbuf_filler_depth = nobj_filler_depth:get_2d_map(minpos2d)
		----local nvals_filler_depth = nobj_filler_depth:get_2d_map(minpos2d, nbuf_filler_depth)

		--nobj_val_river = nobj_val_river or minetest.get_perlin_map(np_val_river, permapdims2d)
		--nbuf_val_river = nobj_val_river:get_2d_map(minpos2d, nbuf_val_river)
		----local nvals_val_river = nobj_val_river:get_2d_map(minpos2d, nbuf_val_river)

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims2d)
		nbuf_heatmap = nobj_heatmap:get_2d_map(minpos2d)
		----local nvals_heatmap = nobj_heatmap:get_2d_map(minpos2d, nbuf_heatmap)

		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims2d)
		nbuf_heatblend = nobj_heatblend:get_2d_map(minpos2d)
		----local nvals_heatblend = nobj_heatblend:get_2d_map(minpos2d, nbuf_heatblend)

		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims2d)
		nbuf_humiditymap = nobj_humiditymap:get_2d_map(minpos2d)
		----local nvals_humiditymap = nobj_humiditymap:get_2d_map(minpos2d, nbuf_humiditymap)

		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims2d)
		nbuf_humidityblend = nobj_humidityblend:get_2d_map(minpos2d)
		----local nvals_humidityblend = nobj_humidityblend:get_2d_map(minpos2d, nbuf_humidityblend)
	
		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		vm:get_data(data)
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)
	
		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	
		--local center_of_chunk = { 
		--	x = maxp.x - gal.mapgen.mg_half_chunk_size, 
		--	y = maxp.y - gal.mapgen.mg_half_chunk_size, 
		--	z = maxp.z - gal.mapgen.mg_half_chunk_size
		--}
		--current_chunk = center_of_chunk

		local center_of_chunk_x = maxp.x - (sidelen / 2)
		local center_of_chunk_z = maxp.z - (sidelen / 2)

		local mn_idx, mn_dist, mn_rise, mn_run, mn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 1)
		local pn_idx, pn_dist, pn_rise, pn_run, pn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 2)
		local cn_idx, cn_dist, cn_rise, cn_run, cn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 3)

		gal.mapgen.chunk_voronoi_cells = {
			m = mn_idx,
			p = pn_idx,
			c = cn_idx
		}

		local write = false
		
		local river_size_factor = mg_v7.mg_river_size / 100
--
	--2D HEIGHTMAP GENERATION
		local index2d = 0
		
		local mean_alt = 0

		for z = z0, z1 do
			for x = x0, x1 do

				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local n_terrain = 0

				local nfiller = nbuf_filler_depth[z-minp.z+1][x-minp.x+1]
				local ncliff = nbuf_cliffs[z-minp.z+1][x-minp.x+1]

				local hselect = minetest.get_perlin(np_v7_height):get_2d({x=x,y=z})
				--local hselect = nbuf_height[z-minp.z+1][x-minp.x+1]
				local hselect = rangelim(hselect, 0, 1)

				local persist = minetest.get_perlin(np_v7_persist):get_2d({x=x,y=z})
				--local persist = nbuf_persist[z-minp.z+1][x-minp.x+1]

				np_v7_base.persistence = persist;
				local height_base = minetest.get_perlin(np_v7_base):get_2d({x=x,y=z})
	
				np_v7_alt.persistence = persist;
				local height_alt = minetest.get_perlin(np_v7_alt):get_2d({x=x,y=z})
	
				if (height_alt > height_base) then
					n_terrain = floor(height_alt)
				else
					n_terrain = floor((height_base * hselect) + (height_alt * (1 - hselect)))
				end

				local h_terrain = n_terrain * math.sin(nfiller)

				local vterrain = n_terrain + h_terrain
				--local vterrain = n_terrain


				local t_y, t_c = get_terrain_height_cliffs(vterrain,ncliff)

				gal.mapgen.heightmap[index2d] = t_y
				mg_v7.cliffmap[index2d] = t_c

				mg_v7.fillermap[index2d] = nfiller

				--local v_rivers = nbuf_val_river[z-minp.z+1][x-minp.x+1]
				--local abs_rivers = abs(v_rivers)
				--local river_course
				--river_size_factor = (mg_v7.mg_river_size - (t_y / (40 * mg_world_scale))) / 100
				--if abs_rivers <= river_size_factor then
				--	-- TODO: Add riverbed calculation
				--	river_course = abs_rivers 
				--end
				--mg_v7.rivermap[index2d] = river_course

				local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]
				local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_y)
				if z == center_of_chunk_z and x == center_of_chunk_x then
					gal.mapgen.chunk_biome = gal.mapgen.biomemap[index2d]
				end

				mean_alt = mean_alt + t_y

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

		gal.mapgen.chunk_mean_altitude = mean_alt / ((x1 - x0) * (z1 - z0))

		local t2 = os.clock()
	
		local t3 = os.clock()

	--2D HEIGHTMAP RENDER

		local index2d = 0
		for z = z0, z1 do
			for y = y0, y1 do
				for x = x0, x1 do

					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)


					local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]
					local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

					local theight = gal.mapgen.heightmap[index2d]
					local t_fillmap = mg_v7.fillermap[index2d]
					local t_cliff = mg_v7.cliffmap[index2d] or 0
					--local t_rivermap = mg_v7.rivermap[index2d] or (river_size_factor + 1)
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

					if t_cliff > 0 then
						t_filler = t_stone
					end

					local max_high = max_highland + (nheat * mg_world_scale) - (nhumid * mg_world_scale)
					local max_mount = max_mountain + (nheat * mg_world_scale) - (nhumid * mg_world_scale)
					if theight > max_high then
						t_top = t_stone
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_water
						t_river = t_ice
					end
					if theight > max_mount then
						t_top = t_ice
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_ice
						t_river = t_ice
					end

					--river_size_factor = (mg_v7.mg_river_size - (theight / (40 * mg_world_scale))) / 100
					--if t_rivermap <= river_size_factor then
					--	if theight >= (gal.mapgen.water_level -1) then
					--		t_filldepth = t_riverbed_depth - (theight / (75 * mg_world_scale))
					--	end
					--end


--NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if y < (theight - (t_filldepth + top_depth)) then
						t_node = t_stone
					elseif y >= (theight - (t_filldepth + top_depth)) and y < (theight - top_depth) then
						--if t_rivermap <= river_size_factor then
						--	if y > (gal.mapgen.water_level - 1) then
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
						--	if y > gal.mapgen.water_level then
						--		t_top = t_air
						--	else
						--		t_top = t_water
						--	end
						--end
						t_node = t_top
					elseif y > theight and y <= gal.mapgen.water_level then
					--Water Level (Sea Level)
						t_node = t_water
					end

--[[
					if y < (theight - (fill_depth + top_depth)) then
						t_node = t_stone
					elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
						t_node = t_filler
					elseif y >= (theight - top_depth) and y <= theight then
						if y <= gal.mapgen.water_level then
							t_top = c_sand
						end
						t_node = t_top
					elseif y > theight and y <= gal.mapgen.water_level then
					--Water Level (Sea Level)
						t_node = t_water
					end
--]]
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
		print ("[mg_v7] Mapchunk generation time " .. chugent .. " ms")
	
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
			print("mg_v7 is manually collecting garbage as memory use has exceeded 500K.")
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
		minetest.log("mg_v7 lua Mapgen Times:")
	
		average = mean(mapgen_times.noisemaps)
		minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.preparation)
		minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop2d)
		minetest.log(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop3d)
		minetest.log(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.mainloop)
		minetest.log(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.setdata)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.liquid_lighting)
		minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.writing)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)

		average = mean(mapgen_times.make_chunk)
		minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)
	
	end)





minetest.log(S("[MOD] mg_v7:  Successfully loaded."))


