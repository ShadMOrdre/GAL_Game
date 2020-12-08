

minetest.set_mapgen_setting('mg_name','singlenode',true)
minetest.set_mapgen_setting('flags','nolight',true)
--minetest.set_mapgen_params({mgname="singlenode"})


	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_voronoi.cliffmap = {}
	mg_voronoi.fillermap = {}
	mg_voronoi.edgemap = {}

	mg_voronoi.mg_world_scale = gal.mapgen.mg_world_scale
	local mg_world_scale = mg_voronoi.mg_world_scale
	mg_voronoi.mg_river_size = 5

	mg_voronoi.water_level = gal.mapgen.water_level
	mg_voronoi.use_heat_scalar = false

	local b_mult = 1
	local dist_metric = gal.mapgen.distance_metric
	--gal.lib.voronoi.distance_metric = dist_metric
	--gal.lib.metrics.set_dist_func(gal.lib.voronoi.distance_metric)

	local mg_base_height = 300 * mg_world_scale

	local max_highland = 160 * mg_world_scale
	local max_mountain = 240 * mg_world_scale

	local edge_detection_list = {
		minetest.get_content_id("gal:stone_rune_tile"),
		minetest.get_content_id("gal:stone_sea_circular"),
		minetest.get_content_id("gal:stone_tile_02"),
		minetest.get_content_id("gal:stone_circle_tile"),
		minetest.get_content_id("gal:stone_iron_tile_checker"),
		minetest.get_content_id("gal:stone_tile_01"),
		minetest.get_content_id("gal:stone_marker")
	}

	local v_cscale = 0.05
	local v_pscale = 0.1
	local v_mscale = 0.125
	local v_cmscale = 0.1
	local v_pmscale = 0.2
	local v_mmscale = 0.25
	local v_csscale = 0.2
	local v_psscale = 0.4
	local v_msscale = 0.5
	local p_cscale = 0.66
	local p_pscale = 1.33
	local p_mscale = 2.64575131106

	mg_voronoi.mg_noise_spread = 1200
--##	(2400 * 0.1) * 0.25 == 240 / 4 == 60
	mg_voronoi.mg_noise_scale = 25
	mg_voronoi.mg_noise_offset = -4 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_octaves = 7
	mg_voronoi.mg_noise_persist = 0.4
	mg_voronoi.mg_noise_lacunarity = 2.19


	local nobj_terrain = nil
	local nbuf_terrain = {}

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

	np_terrain = {
		offset = mg_voronoi.mg_noise_offset,
		scale = mg_voronoi.mg_noise_scale * mg_voronoi.mg_world_scale,
		seed = 5934,
		spread = {x = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale), y = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale), z = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale)},
		octaves = mg_voronoi.mg_noise_octaves,
		persist = mg_voronoi.mg_noise_persist,
		lacunarity = mg_voronoi.mg_noise_lacunarity,
		--flags = "defaults"
	}
	local np_cliffs = {
		offset = 0,					
		scale = 0.72,
		spread = {x = 180, y = 180, z = 180},
		seed = 78901,
		octaves = 5,
		persist = 0.5,
		lacunarity = 2.19,
	}
	np_filler_depth = {
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
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = (1000 * mg_voronoi.mg_world_scale), y = (1000 * mg_voronoi.mg_world_scale), z = (1000 * mg_voronoi.mg_world_scale)},
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
		spread = {x = (1000 * mg_voronoi.mg_world_scale), y = (1000 * mg_voronoi.mg_world_scale), z = (1000 * mg_voronoi.mg_world_scale)},
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



	local cliffs_thresh = floor((np_terrain.scale) * 0.5)

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

	mg_voronoi.current_cell = {
		m = 0,
		p = 0,
		c = 0
	}

	local data = {}
	local get_cell = gal.lib.voronoi.get_nearest_cell
	local get_neighbor = gal.lib.voronoi.get_cell_neighbors

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
		local minpos2d = {x = x0, y = z0}

		nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, permapdims2d)
		nbuf_terrain = nobj_terrain:get_2d_map(minpos2d)
	
		nobj_cliffs = nobj_cliffs or minetest.get_perlin_map(np_cliffs, permapdims2d)
		nbuf_cliffs = nobj_cliffs:get_2d_map(minpos2d)
	
		nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_filler_depth, permapdims2d)
		nbuf_filler_depth = nobj_filler_depth:get_2d_map(minpos2d)

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims2d)
		nbuf_heatmap = nobj_heatmap:get_2d_map(minpos2d)
		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims2d)
		nbuf_heatblend = nobj_heatblend:get_2d_map(minpos2d)
		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims2d)
		nbuf_humiditymap = nobj_humiditymap:get_2d_map(minpos2d)
		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims2d)
		nbuf_humidityblend = nobj_humidityblend:get_2d_map(minpos2d)
	
		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		vm:get_data(data)
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)

		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	
		local write = false

		local water_level       = mg_voronoi.water_level
		--local edges = {}

--
-- ## VORONOI SELECTION

		local center_of_chunk_x = maxp.x - (sidelen / 2)
		local center_of_chunk_z = maxp.z - (sidelen / 2)

		local mn_idx, mn_dist, mn_rise, mn_run, mn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 1)
		get_neighbor(mn_idx)
		local pn_idx, pn_dist, pn_rise, pn_run, pn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 2)
		get_neighbor(pn_idx)
		local cn_idx, cn_dist, cn_rise, cn_run, cn_edge = get_cell({x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 3)
		get_neighbor(cn_idx)

		--local m_pos = {x=gal.lib.voronoi.points[mn_idx].x,z=gal.lib.voronoi.points[mn_idx].z}
		--local p_pos = {x=gal.lib.voronoi.points[pn_idx].x,z=gal.lib.voronoi.points[pn_idx].z}
		--local c_pos = {x=gal.lib.voronoi.points[cn_idx].x,z=gal.lib.voronoi.points[cn_idx].z}

		--mg_voronoi.current_cell.m = mn_idx
		--mg_voronoi.current_cell.p = pn_idx
		--mg_voronoi.current_cell.c = cn_idx

		--local mncontinental = mn_dist * v_cscale
		--local pncontinental = pn_dist * v_pscale
		--local cncontinental = cn_dist * v_mscale
		--local vncontinental = (mncontinental + pncontinental + cncontinental)

		local XRS = 150
		--local XRS = 150 * mg_world_scale

		----CREDITS:  Dokimi mg_tectonic
		--local v_gradient = mncontinental / mg_base_height
		--local v_mup = (1 - v_gradient) + (-1 * v_gradient)
		--local v_whs = 1 - v_gradient
		--local v_roll = XRS + (XRS * v_gradient)
		--local v_wav = (v_whs * math.sin(mncontinental/v_roll))    -- north south wave (main ranges)
		--local v_den_base = (v_wav ^ 3) + v_mup + ((vncontinental ^2) * v_whs)

	--2D HEIGHTMAP GENERATION - Uses permapdims2d
		local index2d = 0
	
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				--local nterrain = minetest.get_perlin(np_terrain):get_2d({x=x,y=z})
				local nterrain = nbuf_terrain[z-minp.z+1][x-minp.x+1]

				local ncliff = nbuf_cliffs[z-minp.z+1][x-minp.x+1]
				local n_y, n_c = get_terrain_height_cliffs(nterrain,ncliff)

				local nfill = nbuf_filler_depth[z-minp.z+1][x-minp.x+1]
				mg_voronoi.fillermap[index2d] = nfill

-- ## VORONOI DISTANCE CALCULATIONS

				local c_idx, c_dist, c_rise, c_run, c_edge = get_cell({x = x, z = z}, dist_metric, 3)
				local p_idx, p_dist, p_rise, p_run, p_edge = get_cell({x = x, z = z}, dist_metric, 2)
				local m_idx, m_dist, m_rise, m_run, m_edge = get_cell({x = x, z = z}, dist_metric, 1)

				--local mcontinental = (m_dist * mg_world_scale) * v_cscale
				--local pcontinental = (p_dist * mg_world_scale) * v_pscale
				--local ccontinental = (c_dist * mg_world_scale) * v_mscale
				local mcontinental = m_dist * v_cscale
				local pcontinental = p_dist * v_pscale
				local ccontinental = c_dist * v_mscale
				local vcontinental = (mcontinental + pcontinental + ccontinental)

-- ## TERRAIN GENERATION
				local vterrain = (mg_base_height - vcontinental) + (mg_base_height * 0.4)
				----local vheight = (vterrain + nterrain) * (1/vcontinental)
				local vheight = (vterrain + n_y) * (1/vcontinental)
				local velevation = vheight * (mg_world_scale/0.01)

				------CREDITS:  Dokimi mg_tectonic
				local v_gradient = mcontinental / mg_base_height
 				local v_mup = (1 - v_gradient) + (-1 * v_gradient)
				local v_whs = 1 - v_gradient
				local v_roll = XRS + (XRS * v_gradient)
				local v_wav = (v_whs * math.sin(mcontinental / v_roll))    -- north south wave (main ranges)
				local v_den_base = (v_wav ^3) + v_mup + ((velevation ^2) * v_whs)
				--local t_base = 0.01 * y
				--local den_soft = (den_base * 1.5) + ((nfill ^3) * 0.5) - v_gradient
				--local t_soft = 0.03 * y - 1.5
				--local den_allu = (den_soft * 1.01) - (v_gradient * 1.5)
				--local t_allu = 0.056 * y - 2.98
				--local den_sedi = (den_allu * 1.1)
				--local t_sedi = 0.057 * y - 3.2


				local v_tectonic = (v_den_base * 0.1) * mg_world_scale
				--local v_tectonic = v_den_base

				--local t_y = v_tectonic
				--local t_y = velevation + v_tectonic

				local t_y, t_c = get_terrain_height_cliffs((velevation + v_tectonic),ncliff)
				mg_voronoi.cliffmap[index2d] = t_c


				gal.mapgen.heightmap[index2d] = t_y

--## BIOMES GENERATION
				--local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1] + gal.mapgen.get_heat_scalar(z)
				local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]
				local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_y)

--## EDGE MAP
				local t_edge = ""
				if m_edge then
					t_edge = 1
				end
				if p_edge then
					t_edge = 2
				end
				if c_edge then
					t_edge = 4
				end
				mg_voronoi.edgemap[index2d] = t_edge

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
	
		local t2 = os.clock()
	
		local t3 = os.clock()
	--
	--2D HEIGHTMAP RENDER
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				--local vi = area:index(minp.x, y, z)
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local nheat = nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]
					local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

					local theight = gal.mapgen.heightmap[index2d]
					local t_biome_name = gal.mapgen.biomemap[index2d]
					local t_cliff = mg_voronoi.cliffmap[index2d] or 0
					local t_fillmap = mg_voronoi.fillermap[index2d]
					local t_edge = mg_voronoi.edgemap[index2d]

					local fill_depth = 4
					local top_depth = 1

-- ## BIOME GENERATION
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

					if t_edge ~= "" then
						t_top = t_stone
						t_top = edge_detection_list[t_edge]
					end

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

-- ## NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if y < (theight - (fill_depth + top_depth)) then
						t_node = t_stone
					elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
						t_node = t_filler
					elseif y >= (theight - top_depth) and y <= theight then
						t_node = t_top
					elseif y > theight and y <= mg_voronoi.water_level then
					--Water Level (Sea Level)
						t_node = t_water
					end

					--data[vi] = t_node
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
		print ("[mg_voronoi] Mapchunk generation time " .. chugent .. " ms")
	
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
			print("mg_voronoi is manually collecting garbage as memory use has exceeded 500K.")
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
		minetest.log("mg_voronoi lua Mapgen Times:")
	
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


	local function mg_voronoi_spawnplayer(player)
	
		if player_spawn_point then
			print ("[mg_voronoi] spawn player (" .. player_spawn_point.x .. " " .. player_spawn_point.y .. " " .. player_spawn_point.z .. ")")
			player:setpos({x = player_spawn_point.x, y = player_spawn_point.y, z = player_spawn_point.z})
		else	
			print ("[mg_voronoi] no suitable spawn found")
			local y_height = origin_y_val.y
			if y_height then
				player:setpos({x = 0, y = y_height, z = 0})
			else
				player:setpos({x = 0, y = 5, z = 0})
			end
		end

	end
	
	minetest.register_on_newplayer(function(player)
		mg_voronoi_spawnplayer(player)
	end)
	
	minetest.register_on_respawnplayer(function(player)
		mg_voronoi_spawnplayer(player)
		return true
	end)




