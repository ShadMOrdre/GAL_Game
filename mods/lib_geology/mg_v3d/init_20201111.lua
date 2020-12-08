lib_mg_v3d = {}
lib_mg_v3d.name = "lib_mg_v3d"
lib_mg_v3d.ver_max = 0
lib_mg_v3d.ver_min = 1
lib_mg_v3d.ver_rev = 0
lib_mg_v3d.ver_str = lib_mg_v3d.ver_max .. "." .. lib_mg_v3d.ver_min .. "." .. lib_mg_v3d.ver_rev
lib_mg_v3d.authorship = "ShadMOrdre.  Additional credits to Termos' Islands mod; Gael-de-Sailleys' Valleys; duane-r Valleys_c, burli mapgen, and paramats' mapgens"
lib_mg_v3d.license = "LGLv2.1"
lib_mg_v3d.copyright = "2020"
lib_mg_v3d.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_mg_v3d.path_world = minetest.get_worldpath()

local S
local NS
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	-- S = function(s) return s end
	-- internationalization boilerplate
	S, NS = dofile(lib_mg_v3d.path_mod.."/intllib.lua")
end
lib_mg_v3d.intllib = S

minetest.log(S("[MOD] lib_mg_v3d:  Loading..."))
minetest.log(S("[MOD] lib_mg_v3d:  Version:") .. S(lib_mg_v3d.ver_str))
minetest.log(S("[MOD] lib_mg_v3d:  Legal Info: Copyright ") .. S(lib_mg_v3d.copyright) .. " " .. S(lib_mg_v3d.authorship) .. "")
minetest.log(S("[MOD] lib_mg_v3d:  License: ") .. S(lib_mg_v3d.license) .. "")


	lib_mg_v3d.heightmap = {}
	lib_mg_v3d.biomemap = {} 
	lib_mg_v3d.heatmap = {} 
	lib_mg_v3d.humiditymap = {} 

	lib_mg_v3d.water_level = 1
	local elevation_chill = 0.5
	local function set_elevation_chill(ec)
		elevation_chill = ec
	end
	lib_mg_v3d.mg_base_height = 240

	local min_ocean = lib_materials.ocean_depth
	local min_beach = lib_materials.beach_depth
	local max_beach = lib_materials.maxheight_beach
	local max_highland = lib_materials.maxheight_highland
	local max_mountain = lib_materials.maxheight_mountain

	local m_top1 = 12.5
	local m_top2 = 37.5
	local m_top3 = 62.5
	local m_top4 = 87.5

	local m_biome1 = 25
	local m_biome2 = 50
	local m_biome3 = 75

	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local nobj_3dterrain = nil
	local nbuf_3dterrain = nil

	--local nobj_terrain = nil
	--local nbuf_terrain = nil

	local nobj_heatmap = nil
	local nbuf_heatmap = nil
	local nobj_heatblend = nil
	local nbuf_heatblend = nil
	local nobj_humiditymap = nil
	local nbuf_humiditymap = nil
	local nobj_humidityblend = nil
	local nbuf_humidityblend = nil

	local c_air			= minetest.get_content_id("air")
	local c_ignore			= minetest.get_content_id("ignore")
--[[
	local c_desertsand		= minetest.get_content_id("default:desert_sand")
	local c_desertsandstone		= minetest.get_content_id("default:desert_sandstone")
	local c_desertstone		= minetest.get_content_id("default:desert_stone")
	local c_sand			= minetest.get_content_id("default:sand")
	local c_sandstone		= minetest.get_content_id("default:sandstone")
	local c_silversand		= minetest.get_content_id("default:silver_sand")
	local c_silversandstone		= minetest.get_content_id("default:silver_sandstone")
	local c_stone			= minetest.get_content_id("default:stone")
	local c_brick			= minetest.get_content_id("default:stonebrick")
	local c_block			= minetest.get_content_id("default:stone_block")
	local c_desertstoneblock	= minetest.get_content_id("default:desert_stone_block")
	local c_desertstonebrick	= minetest.get_content_id("default:desert_stonebrick")
	local c_obsidian		= minetest.get_content_id("default:obsidian")
	local c_dirt			= minetest.get_content_id("default:dirt")
	local c_dirtdry			= minetest.get_content_id("default:dry_dirt")
	local c_dirtgrass		= minetest.get_content_id("default:dirt_with_grass")
	local c_dirtdrygrass		= minetest.get_content_id("default:dirt_with_dry_grass")
	local c_dirtdrydrygrass		= minetest.get_content_id("default:dry_dirt_with_dry_grass")
	local c_dirtperm		= minetest.get_content_id("default:permafrost")
	local c_top			= minetest.get_content_id("default:dirt_with_grass")
	local c_coniferous		= minetest.get_content_id("default:dirt_with_coniferous_litter")
	local c_rainforest		= minetest.get_content_id("default:dirt_with_rainforest_litter")
	local c_snow			= minetest.get_content_id("default:dirt_with_snow")
	local c_ice			= minetest.get_content_id("default:ice")
	local c_water			= minetest.get_content_id("default:water_source")
--]]


	local c_mossy			= minetest.get_content_id("lib_materials:stone_cobble_mossy")
	local c_gravel			= minetest.get_content_id("lib_materials:stone_gravel")
	local c_lava			= minetest.get_content_id("lib_materials:liquid_lava_source")

	local c_desertsand		= minetest.get_content_id("lib_materials:sand_desert")
	local c_desertsandstone		= minetest.get_content_id("lib_materials:stone_sandstone_desert")
	local c_desertstone		= minetest.get_content_id("lib_materials:stone_desert")
	local c_sand			= minetest.get_content_id("lib_materials:sand")
	local c_sandstone		= minetest.get_content_id("lib_materials:stone_sandstone")
	local c_silversand		= minetest.get_content_id("lib_materials:sand_silver")
	local c_silversandstone		= minetest.get_content_id("lib_materials:stone_sandstone_silver")
	local c_stone			= minetest.get_content_id("lib_materials:stone")
	local c_brick			= minetest.get_content_id("lib_materials:stone_brick")
	local c_block			= minetest.get_content_id("lib_materials:stone_block")
	local c_desertstoneblock	= minetest.get_content_id("lib_materials:stone_desert_brick")
	local c_desertstonebrick	= minetest.get_content_id("lib_materials:stone_desert_block")
	local c_obsidian		= minetest.get_content_id("lib_materials:stone_obsidian")
	local c_dirt			= minetest.get_content_id("lib_materials:dirt")
	local c_dirtdry			= minetest.get_content_id("lib_materials:dirt_dry")
	local c_dirtgrass		= minetest.get_content_id("lib_materials:dirt_with_grass")
	local c_dirtdrygrass		= minetest.get_content_id("lib_materials:dirt_with_grass_dry")
	local c_dirtdrydrygrass		= minetest.get_content_id("lib_materials:dirt_dry_with_grass_dry")
	local c_dirtbrowngrass		= minetest.get_content_id("lib_materials:dirt_with_grass_brown")
	local c_dirtgreengrass		= minetest.get_content_id("lib_materials:dirt_with_grass_green")
	local c_dirtjunglegrass		= minetest.get_content_id("lib_materials:dirt_with_grass_jungle_01")
	local c_dirtperm		= minetest.get_content_id("lib_materials:dirt_permafrost")
	local c_top			= minetest.get_content_id("lib_materials:dirt_with_grass")
	local c_coniferous		= minetest.get_content_id("lib_materials:dirt_with_litter_coniferous")
	local c_rainforest		= minetest.get_content_id("lib_materials:dirt_with_litter_rainforest")
	local c_snow			= minetest.get_content_id("lib_materials:dirt_with_snow")
	local c_ice			= minetest.get_content_id("lib_materials:ice")
	local c_water			= minetest.get_content_id("lib_materials:liquid_water_source")
	local c_river			= minetest.get_content_id("lib_materials:liquid_water_river_source")
	local c_muddy			= minetest.get_content_id("lib_materials:liquid_water_river_muddy_source")
	local c_swamp			= minetest.get_content_id("lib_materials:liquid_water_swamp_source")


	local np_3dterrain = {
		offset = 0,
		scale = 1,
		spread = {x = 384, y = 192, z = 384},
		seed = 5934,
		octaves = 8,
		persist = 0.3,
		lacunarity = 2.11,
		--flags = ""
	}
--[[
	local np_terrain = {
		flags = "defaults",
		offset = -4,
		scale = 25,
		spread = {x = 600, y = 600, z = 600},
		seed = 5934,
		octaves = 8,
		persist = 0.3,
		lacunarity = 2.19,
	}
--]]
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




--##	
--##	Create a table of biome ids, so I can use the biomemap.
--##	

	lib_mg_v3d.biome_info = {}

	for name, desc in pairs(minetest.registered_biomes) do

		if desc then

			lib_mg_v3d.biome_info[desc.name] = {}

			lib_mg_v3d.biome_info[desc.name].b_cid = minetest.get_biome_id(name)

			lib_mg_v3d.biome_info[desc.name].b_top = c_dirtgrass
			lib_mg_v3d.biome_info[desc.name].b_top_depth = 1
			lib_mg_v3d.biome_info[desc.name].b_filler = c_dirt
			lib_mg_v3d.biome_info[desc.name].b_filler_depth = 4
			lib_mg_v3d.biome_info[desc.name].b_stone = c_stone
			lib_mg_v3d.biome_info[desc.name].b_water = c_water
			lib_mg_v3d.biome_info[desc.name].b_miny = -31000
			lib_mg_v3d.biome_info[desc.name].b_maxy = 31000
			lib_mg_v3d.biome_info[desc.name].b_heat = 50
			lib_mg_v3d.biome_info[desc.name].b_humid = 50
		

			if desc.node_top and desc.node_top ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_top = minetest.get_content_id(desc.node_top)
			end

			if desc.depth_top then
				lib_mg_v3d.biome_info[desc.name].b_top_depth = desc.depth_top or ""
			end

			if desc.node_filler and desc.node_filler ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_filler = minetest.get_content_id(desc.node_filler)
			end

			if desc.depth_filler then
				lib_mg_v3d.biome_info[desc.name].b_filler_depth = desc.depth_filler
			end

			if desc.node_stone and desc.node_stone ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_stone = minetest.get_content_id(desc.node_stone)
			end
			if desc.node_water and desc.node_water ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_water = minetest.get_content_id(desc.node_water)
			end

			if desc.vertical_blend then
				lib_mg_v3d.biome_info[desc.name].b_vertical_blend = desc.vertical_blend or 0
			end

			lib_mg_v3d.biome_info[desc.name].min_pos = desc.min_pos or {x=-31000, y=-31000, z=-31000}
			if desc.y_min then
				lib_mg_v3d.biome_info[desc.name].min_pos.y = math.max(lib_mg_v3d.biome_info[desc.name].min_pos.y, desc.y_min)
			end

			lib_mg_v3d.biome_info[desc.name].max_pos = desc.max_pos or {x=31000, y=31000, z=31000}
			if desc.y_max then
				lib_mg_v3d.biome_info[desc.name].max_pos.y = math.min(lib_mg_v3d.biome_info[desc.name].max_pos.y, desc.y_max)
			end

			if desc.heat_point and desc.heat_point ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_heat = desc.heat_point or ""
			end

			if desc.humidity_point and desc.humidity_point ~= "" then
				lib_mg_v3d.biome_info[desc.name].b_humid = desc.humidity_point
			end

		end
	end

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

	local function calc_biome_from_noise(heat, humid, pos)
		local biome_closest = nil
		local biome_closest_blend = nil
		local dist_min = 31000
		local dist_min_blend = 31000
	
		for i, biome in pairs(lib_mg_v3d.biome_info) do
			local min_pos, max_pos = biome.b_miny, biome.b_maxy
			if pos.y >= min_pos.y and pos.y <= max_pos.y+biome.vertical_blend
					and pos.x >= min_pos.x and pos.x <= max_pos.x
					and pos.z >= min_pos.z and pos.z <= max_pos.z then
				local d_heat = heat - biome.heat_point
				local d_humid = humid - biome.humidity_point
				local dist = d_heat*d_heat + d_humid*d_humid -- Pythagorean distance
	
				if pos.y <= max_pos.y then -- Within y limits of biome
					if dist < dist_min then
						dist_min = dist
						biome_closest = biome
					end
				elseif dist < dist_min_blend then -- Blend area above biome
					dist_min_blend = dist
					biome_closest_blend = biome
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
			return biome_closest_blend
		end
	
		return biome_closest
	end
--[[
	local function get_biome_at_index(i, pos)
		local heat = heatmap[i] - math.max(pos.y, water_level)*elevation_chill
		local humid = humidmap[i]
		return calc_biome_from_noise(heat, humid, pos)
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
		
		local sidelen = maxp.x - minp.x + 1
		local permapdims2d = {x = sidelen, y = sidelen, z = 0}
		local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}

		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		data = vm:get_data()
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)
	
		nobj_3dterrain = nobj_3dterrain or minetest.get_perlin_map(np_3dterrain, permapdims3d)
		nbuf_3dterrain = nobj_3dterrain:get_3d_map({x=minp.x,y=minp.y,z=minp.z})

		--nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, permapdims2d)
		--nbuf_terrain = nobj_terrain:get_2d_map({x=minp.x,y=minp.z})

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims3d)
		nbuf_heatmap = nobj_heatmap:get_2d_map({x=minp.x,y=minp.z})
		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims3d)
		nbuf_heatblend = nobj_heatblend:get_2d_map({x=minp.x,y=minp.z})
		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims3d)
		nbuf_humiditymap = nobj_humiditymap:get_2d_map({x=minp.x,y=minp.z})
		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims3d)
		nbuf_humidityblend = nobj_humidityblend:get_2d_map({x=minp.x,y=minp.z})
	
		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	

	--2D HEIGHTMAP GENERATION

		local write = false
		local noise_hmap = false


		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local t_y = -31000

				lib_mg_v3d.heightmap[index2d] = t_y

--[[
	-- ## BIOME SELECTION (lib_materials biome defs)

				local nheat = (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]) + get_heat_scalar(z)
				local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

				local t_heat, t_humid, t_altitude, t_name

				if nheat < m_top1 then
					t_heat = "cold"
				elseif nheat >= m_top1 and nheat < m_top2 then
					t_heat = "cool"
				elseif nheat >= m_top2 and nheat < m_top3 then
					t_heat = "temperate"
				elseif nheat >= m_top3 and nheat < m_top4 then
					t_heat = "warm"
				elseif nheat >= m_top4 then
					t_heat = "hot"
				else

				end

				if nhumid < m_top1 then
					t_humid = "_arid"
				elseif nhumid >= m_top1 and nhumid < m_top2 then
					t_humid = "_semiarid"
				elseif nhumid >= m_top2 and nhumid < m_top3 then
					t_humid = "_temperate"
				elseif nhumid >= m_top3 and nhumid < m_top4 then
					t_humid = "_semihumid"
				elseif nhumid >= m_top4 then
					t_humid = "_humid"
				else

				end

				if t_y < min_beach then
					t_altitude = "_ocean"
				elseif t_y >= min_beach and t_y < max_beach then
					t_altitude = "_beach"
				elseif t_y >= max_beach and t_y < max_highland then
					t_altitude = ""
				elseif t_y >= max_highland and t_y < max_mountain then
					t_altitude = "_mountain"
				elseif t_y >= max_mountain then
					t_altitude = "_strato"
				else
					
				end

				if t_heat and t_heat ~= "" and t_humid and t_humid ~= "" then
					t_name = t_heat .. t_humid .. t_altitude
				else
					if (t_heat == "hot") and (t_humid == "_humid") and (nheat > 90) and (nhumid > 90) and (t_altitude == "_beach") then
						t_name = "hot_humid_swamp"
					elseif (t_heat == "hot") and (t_humid == "_semihumid") and (nheat > 90) and (nhumid > 80) and (t_altitude == "_beach") then
						t_name = "hot_semihumid_swamp"
					elseif (t_heat == "warm") and (t_humid == "_humid") and (nheat > 80) and (nhumid > 90) and (t_altitude == "_beach") then
						t_name = "warm_humid_swamp"
					elseif (t_heat == "temperate") and (t_humid == "_humid") and (nheat > 57) and (nhumid > 90) and (t_altitude == "_beach") then
						t_name = "temperate_humid_swamp"
					else
						t_name = "temperate_temperate"
					end
				end

				if t_y >= -31000 and t_y < -20000 then
					t_name = "generic_mantle"
				elseif t_y >= -20000 and t_y < -15000 then
					t_name = "stone_basalt_01_layer"
				elseif t_y >= -15000 and t_y < -10000 then
					t_name = "stone_brown_layer"
				elseif t_y >= -10000 and t_y < -6000 then
					t_name = "stone_sand_layer"
				elseif t_y >= -6000 and t_y < -5000 then
					t_name = "desert_stone_layer"
				elseif t_y >= -5000 and t_y < -4000 then
					t_name = "desert_sandstone_layer"
				elseif t_y >= -4000 and t_y < -3000 then
					t_name = "generic_stone_limestone_01_layer"
				elseif t_y >= -3000 and t_y < -2000 then
					t_name = "generic_granite_layer"
				elseif t_y >= -2000 and t_y < min_ocean then
					t_name = "generic_stone_layer"
				else
					
				end

				lib_mg_v3d.biomemap[index2d] = t_name
--]]

			end
		end
	
		local t2 = os.clock()
	

	--3D HEIGHTMAP MODIFICATIONS
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do

					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

					local density_noise = nbuf_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]

					local density_gradient = (1 - y) / 128
					local density_height = density_noise + density_gradient

					if density_height > 0 then
						lib_mg_v3d.heightmap[index2d] = y
					end
				end
			end
		end

		local t3 = os.clock()


	--2D HEIGHTMAP RENDER
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local write_3d = false

					local theight = lib_mg_v3d.heightmap[index2d]

					local fill_depth = 4
					local top_depth = 1
	
					local density_noise = nbuf_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]
					local density_gradient = (1 - y) / 128
					local density_height = density_noise + density_gradient

					if density_height > 0 then
						write_3d = true
					elseif y <= lib_mg_v3d.water_level then
						if theight <= lib_mg_v3d.water_level then
							write_3d = true
						end
					end

	--BUILD BIOMES

--[[
					local t_name = lib_mg_v3d.get_biome_name(nheat,nhumid,theight)

					local b_name, b_cid, b_top, b_top_d, b_fill, b_fill_d, b_stone, b_water_top, b_water_top_d, b_water, b_river, b_riverbed, b_riverbed_d, b_caveliquid, b_dungeon, b_dungeonalt, b_dungeonstair, b_dust, b_ymin, b_ymax, b_heat, b_humid = unpack(lib_mg_v3d.biome_info[t_name]:split("|", false))

					t_stone = b_stone
					t_dirt = b_fill
					if t_cliff > 0 then
						t_dirt = b_stone
					end
					fill_depth = tonumber(b_fill_d) or 6
					t_top = b_top
					top_depth = tonumber(b_top_d) or 1
					t_water_top = b_water_top
					t_river = b_river

					t_biome_name = t_name
					lib_mg_v3d.biomemap[index2d] = t_name
--]]
--[[
					local t_air = c_air
					local t_ignore = c_ignore
					local t_top = c_top
					local t_filler = c_dirt
					local t_stone = c_stone
					local t_sand = c_sand
					local t_water = c_water
					local t_water_top = c_water

					if nhumid <= 25 then
						if nheat <= 25 then
							t_top = c_ice
							t_filler = c_dirtperm
							t_stone = c_stone
							t_sand = c_silversand
							t_water = c_ice
						elseif nheat <= 50 and nheat > 25 then
							t_top = c_silversand
							t_filler = c_silversand
							t_stone = c_silversandstone
							t_sand = c_silversand
							t_water = c_water
						elseif nheat <= 75 and nheat > 50 then
							t_top = c_sand
							t_filler = c_sand
							t_stone = c_desertsandstone
							t_sand = c_sand
							t_water = c_water
						else
							t_top = c_desertsand
							t_filler = c_desertsand
							t_stone = c_desertstone
							t_sand = c_desertsand
							t_water = c_water
						end
					elseif nhumid <= 50 and nhumid > 25 then
						if nheat <= 25 then
							t_top = c_dirtperm
							t_filler = c_dirtperm
							t_stone = c_stone
							t_sand = c_silversand
							t_water = c_water
						elseif nheat <= 50 and nheat > 25 then
							t_top = c_dirtdrygrass
							t_filler = c_dirtdry
							t_stone = c_sandstone
							t_sand = c_sand
							t_water = c_water
						elseif nheat <= 75 and nheat > 50 then
							t_top = c_dirtdrydrygrass
							t_filler = c_dirtdry
							t_stone = c_sandstone
							t_sand = c_sand
							t_water = c_water
						else
							t_top = c_dirtdry
							t_filler = c_desertsandstone
							t_stone = c_desertstone
							t_sand = c_sand
							t_water = c_water
						end
					elseif nhumid <= 75 and nhumid > 50 then
						if nheat <= 25 then
							t_top = c_snow
							t_filler = c_dirt
							t_stone = c_stone
							t_sand = c_silversand
							t_water = c_water
						elseif nheat <= 50 and nheat > 25 then
							t_top = c_dirtdrygrass
							t_filler = c_dirt
							t_stone = c_stone
							t_sand = c_sand
							t_water = c_water
						elseif nheat <= 75 and nheat > 50 then
							t_top = c_dirtgrass
							t_filler = c_dirt
							t_stone = c_stone
							t_sand = c_sand
							t_water = c_water
						else
							t_top = c_dirtgrass
							t_filler = c_dirt
							t_stone = c_desertstone
							t_sand = c_sand
							t_water = c_water
						end
					else
						if nheat <= 50 then
							t_top = c_coniferous
							t_filler = c_dirt
							t_stone = c_desertsandstone
							t_sand = c_sand
							t_water = c_water
						else
							t_top = c_rainforest
							t_filler = c_dirt
							t_stone = c_desertstone
							t_sand = c_desertsand
							t_water = c_water
						end
					end
--]]

	-- ## BIOME SELECTION (lib_materials biome defs)

					local pos = {x=x, y=y, z=z}

					--local nheat = (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]) + get_heat_scalar(z)
					local nheat = ((nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]) + get_heat_scalar(z)) - max(pos.y, lib_mg_v3d.water_level)*elevation_chill
					local nhumid = nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]

--[[
					local t_heat, t_humid, t_altitude, t_name

					if nheat < m_top1 then
						t_heat = "cold"
					elseif nheat >= m_top1 and nheat < m_top2 then
						t_heat = "cool"
					elseif nheat >= m_top2 and nheat < m_top3 then
						t_heat = "temperate"
					elseif nheat >= m_top3 and nheat < m_top4 then
						t_heat = "warm"
					elseif nheat >= m_top4 then
						t_heat = "hot"
					else

					end

					if nhumid < m_top1 then
						t_humid = "_arid"
					elseif nhumid >= m_top1 and nhumid < m_top2 then
						t_humid = "_semiarid"
					elseif nhumid >= m_top2 and nhumid < m_top3 then
						t_humid = "_temperate"
					elseif nhumid >= m_top3 and nhumid < m_top4 then
						t_humid = "_semihumid"
					elseif nhumid >= m_top4 then
						t_humid = "_humid"
					else

					end

					if theight < min_beach then
						t_altitude = "_ocean"
					elseif theight >= min_beach and theight < max_beach then
						t_altitude = "_beach"
					elseif theight >= max_beach and theight < max_highland then
						t_altitude = ""
					elseif theight >= max_highland and theight < max_mountain then
						t_altitude = "_mountain"
					elseif theight >= max_mountain then
						t_altitude = "_strato"
					else
					
					end

					if t_heat and t_heat ~= "" and t_humid and t_humid ~= "" then
						t_name = t_heat .. t_humid .. t_altitude
					else
						if (t_heat == "hot") and (t_humid == "_humid") and (nheat > 90) and (nhumid > 90) and (t_altitude == "_beach") then
							t_name = "hot_humid_swamp"
						elseif (t_heat == "hot") and (t_humid == "_semihumid") and (nheat > 90) and (nhumid > 80) and (t_altitude == "_beach") then
							t_name = "hot_semihumid_swamp"
						elseif (t_heat == "warm") and (t_humid == "_humid") and (nheat > 80) and (nhumid > 90) and (t_altitude == "_beach") then
							t_name = "warm_humid_swamp"
						elseif (t_heat == "temperate") and (t_humid == "_humid") and (nheat > 57) and (nhumid > 90) and (t_altitude == "_beach") then
							t_name = "temperate_humid_swamp"
						else
							t_name = "temperate_temperate"
						end
					end

					if theight >= -31000 and theight < -20000 then
						t_name = "generic_mantle"
					elseif theight >= -20000 and theight < -15000 then
						t_name = "stone_basalt_01_layer"
					elseif theight >= -15000 and theight < -10000 then
						t_name = "stone_brown_layer"
					elseif theight >= -10000 and theight < -6000 then
						t_name = "stone_sand_layer"
					elseif theight >= -6000 and theight < -5000 then
						t_name = "desert_stone_layer"
					elseif theight >= -5000 and theight < -4000 then
						t_name = "desert_sandstone_layer"
					elseif theight >= -4000 and theight < -3000 then
						t_name = "generic_stone_limestone_01_layer"
					elseif theight >= -3000 and theight < -2000 then
						t_name = "generic_granite_layer"
					elseif theight >= -2000 and theight < min_ocean then
						t_name = "generic_stone_layer"
					else
					
					end
--]]
					--lib_mg_v3d.biomemap[index2d] = t_name
					local t_biome_name = calc_biome_from_noise(nheat, nhumid, pos)
					lib_mg_v3d.biomemap[index2d] = t_biome_name

	-- ## BIOME GENERATION

					--local t_biome_name = lib_mg_v3d.biomemap[index2d]

					local t_air = c_air
					local t_ignore = c_ignore
					local t_top = c_top
					local t_filler = c_dirt
					local t_stone = c_stone
					local t_water = c_water

					t_stone = lib_mg_v3d.biome_info[t_biome_name].b_stone
					t_filler = lib_mg_v3d.biome_info[t_biome_name].b_filler
					fill_depth = lib_mg_v3d.biome_info[t_biome_name].b_filler_depth or 6
					t_top = lib_mg_v3d.biome_info[t_biome_name].b_top
					top_depth = lib_mg_v3d.biome_info[t_biome_name].b_top_depth or 1
					t_water = lib_mg_v3d.biome_info[t_biome_name].b_water

	--NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if write_3d == true then
						if y < (theight - (fill_depth + top_depth)) then
							t_node = t_stone
						elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
							t_node = t_filler
						elseif y >= (theight - top_depth) and y <= theight then
							t_node = t_top
						elseif y > theight and y <= lib_mg_v3d.water_level then
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
		print ("[lib_mg_v3d] Mapchunk generation time " .. chugent .. " ms")
	
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
			print("lib_mg_v3d is manually collecting garbage as memory use has exceeded 500K.")
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

		if lib_mg_v3d.mg_add_voronoi == true then
			lib_mg_v3d.save_neighbors()
		end

		if #mapgen_times.make_chunk == 0 then
			return
		end
	
		local average, standard_dev
		minetest.log("lib_mg_v3d lua Mapgen Times:")
	
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





minetest.log(S("[MOD] lib_mg_v3d:  Successfully loaded."))


