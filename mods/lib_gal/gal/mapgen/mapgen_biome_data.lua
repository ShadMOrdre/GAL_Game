


--##	
--##	Create a table of biome ids, so I can use the biomemap.
--##	

	function gal.mapgen.update_biomes()
		if gal.mapgen.mg_biome_mode == "full" then
	
	
	
			for name, desc in pairs(minetest.registered_biomes) do
		
				if desc then
		
					gal.mapgen.biome_info[desc.name] = {}
		
					gal.mapgen.biome_info[desc.name].b_name = desc.name
					gal.mapgen.biome_info[desc.name].b_cid = minetest.get_biome_id(name)
		
					gal.mapgen.biome_info[desc.name].b_top = gal.mapgen.c_top
					gal.mapgen.biome_info[desc.name].b_top_depth = 1
					gal.mapgen.biome_info[desc.name].b_filler = gal.mapgen.c_filler
					gal.mapgen.biome_info[desc.name].b_filler_depth = 4
					gal.mapgen.biome_info[desc.name].b_stone = gal.mapgen.c_stone
					gal.mapgen.biome_info[desc.name].b_water_top = gal.mapgen.c_water
					gal.mapgen.biome_info[desc.name].b_water_top_depth = 1
					gal.mapgen.biome_info[desc.name].b_water = gal.mapgen.c_water
					gal.mapgen.biome_info[desc.name].b_river = gal.mapgen.c_river
					gal.mapgen.biome_info[desc.name].b_riverbed = gal.mapgen.c_gravel
					gal.mapgen.biome_info[desc.name].b_riverbed_depth = 2
					gal.mapgen.biome_info[desc.name].b_cave_liquid = gal.mapgen.c_lava
					gal.mapgen.biome_info[desc.name].b_dungeon = gal.mapgen.c_brick
					gal.mapgen.biome_info[desc.name].b_dungeon_alt = gal.mapgen.c_mossy
					gal.mapgen.biome_info[desc.name].b_dungeon_stair = gal.mapgen.c_block
					gal.mapgen.biome_info[desc.name].b_node_dust = gal.mapgen.c_air
					gal.mapgen.biome_info[desc.name].vertical_blend = 0
					gal.mapgen.biome_info[desc.name].min_pos = {x=-31000, y=-31000, z=-31000}
					gal.mapgen.biome_info[desc.name].max_pos = {x=31000, y=31000, z=31000}
					gal.mapgen.biome_info[desc.name].b_miny = -31000
					gal.mapgen.biome_info[desc.name].b_maxy = 31000
					gal.mapgen.biome_info[desc.name].b_heat = 50
					gal.mapgen.biome_info[desc.name].b_humid = 50
				
		
					if desc.node_top and desc.node_top ~= "" then
						gal.mapgen.biome_info[desc.name].b_top = minetest.get_content_id(desc.node_top) or c_dirtgrass
					end
		
					if desc.depth_top and desc.depth_top ~= "" then
						gal.mapgen.biome_info[desc.name].b_top_depth = desc.depth_top or 1
					end
		
					if desc.node_filler and desc.node_filler ~= "" then
						gal.mapgen.biome_info[desc.name].b_filler = minetest.get_content_id(desc.node_filler) or c_dirt
					end
		
					if desc.depth_filler and desc.depth_filler ~= "" then
						gal.mapgen.biome_info[desc.name].b_filler_depth = desc.depth_filler or 4
					end
		
					if desc.node_stone and desc.node_stone ~= "" then
						gal.mapgen.biome_info[desc.name].b_stone = minetest.get_content_id(desc.node_stone) or c_stone
					end
		
					if desc.node_water_top and desc.node_water_top ~= "" then
						gal.mapgen.biome_info[desc.name].b_water_top = minetest.get_content_id(desc.node_water_top) or c_water
					end
		
					if desc.depth_water_top and desc.depth_water_top ~= "" then
						gal.mapgen.biome_info[desc.name].b_water_top_depth = desc.depth_water_top or 1
					end
		
					if desc.node_water and desc.node_water ~= "" then
						gal.mapgen.biome_info[desc.name].b_water = minetest.get_content_id(desc.node_water) or c_water
					end
					if desc.node_river_water and desc.node_river_water ~= "" then
						gal.mapgen.biome_info[desc.name].b_river = minetest.get_content_id(desc.node_river_water) or c_river
					end
		
		--
					if desc.node_riverbed and desc.node_riverbed ~= "" then
						gal.mapgen.biome_info[desc.name].b_riverbed = minetest.get_content_id(desc.node_riverbed)
					end
		
					if desc.depth_riverbed and desc.depth_riverbed ~= "" then
						gal.mapgen.biome_info[desc.name].b_riverbed_depth = desc.depth_riverbed or 2
					end
		
					if desc.node_cave_liquid and desc.node_cave_liquid ~= "" then
						gal.mapgen.biome_info[desc.name].b_cave_liquid = minetest.get_content_id(desc.node_cave_liquid)
					end
		
					if desc.node_dungeon and desc.node_dungeon ~= "" then
						gal.mapgen.biome_info[desc.name].b_dungeon = minetest.get_content_id(desc.node_dungeon)
					end
		
					if desc.node_dungeon_alt and desc.node_dungeon_alt ~= "" then
						gal.mapgen.biome_info[desc.name].b_dungeon_alt = minetest.get_content_id(desc.node_dungeon_alt)
					end
		
					if desc.node_dungeon_stair and desc.node_dungeon_stair ~= "" then
						gal.mapgen.biome_info[desc.name].b_dungeon_stair = minetest.get_content_id(desc.node_dungeon_stair)
					end
		
					if desc.node_dust and desc.node_dust ~= "" then
						gal.mapgen.biome_info[desc.name].b_node_dust = minetest.get_content_id(desc.node_dust)
					end
		--
					if desc.vertical_blend and desc.vertical_blend ~= "" then
						gal.mapgen.biome_info[desc.name].vertical_blend = desc.vertical_blend or 0
					end
		
					if desc.y_min and desc.y_min ~= "" then
						gal.mapgen.biome_info[desc.name].b_miny = desc.y_min or -31000
					end
		
					if desc.y_max and desc.y_max ~= "" then
						gal.mapgen.biome_info[desc.name].b_maxy = desc.y_max or 31000
					end
		
					gal.mapgen.biome_info[desc.name].min_pos = desc.min_pos or {x=-31000, y=-31000, z=-31000}
					if desc.y_min and desc.y_min ~= "" then
						gal.mapgen.biome_info[desc.name].min_pos.y = math.max(gal.mapgen.biome_info[desc.name].min_pos.y, desc.y_min)
					end
		
					gal.mapgen.biome_info[desc.name].max_pos = desc.max_pos or {x=31000, y=31000, z=31000}
					if desc.y_max and desc.y_max ~= "" then
						gal.mapgen.biome_info[desc.name].max_pos.y = math.min(gal.mapgen.biome_info[desc.name].max_pos.y, desc.y_max)
					end
		
					if desc.heat_point and desc.heat_point ~= "" then
						gal.mapgen.biome_info[desc.name].b_heat = desc.heat_point or 50
					end
		
					if desc.humidity_point and desc.humidity_point ~= "" then
						gal.mapgen.biome_info[desc.name].b_humid = desc.humidity_point or 50
					end
		
		
				end
			end
	--
		else
	--
			gal.mapgen.biome_info["default"] = {}
			gal.mapgen.biome_info["default"].b_name = "default"
			gal.mapgen.biome_info["default"].b_cid = 0
			gal.mapgen.biome_info["default"].b_top = c_dirtgrass
			gal.mapgen.biome_info["default"].b_top_depth = 1
			gal.mapgen.biome_info["default"].b_filler = c_dirt
			gal.mapgen.biome_info["default"].b_filler_depth = 4
			gal.mapgen.biome_info["default"].b_stone = c_stone
			gal.mapgen.biome_info["default"].b_water_top = c_water
			gal.mapgen.biome_info["default"].b_water_top_depth = 1
			gal.mapgen.biome_info["default"].b_water = c_water
			gal.mapgen.biome_info["default"].b_river = c_river
			gal.mapgen.biome_info["default"].b_riverbed = c_gravel
			gal.mapgen.biome_info["default"].b_riverbed_depth = 2
			gal.mapgen.biome_info["default"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["default"].b_dungeon = c_brick
			gal.mapgen.biome_info["default"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["default"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["default"].b_node_dust = c_air
			gal.mapgen.biome_info["default"].vertical_blend = 0
			gal.mapgen.biome_info["default"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["default"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["default"].b_miny = -31000
			gal.mapgen.biome_info["default"].b_maxy = 31000
			gal.mapgen.biome_info["default"].b_heat = 50
			gal.mapgen.biome_info["default"].b_humid = 50
	
			gal.mapgen.biome_info["cold_arid"] = {}
			gal.mapgen.biome_info["cold_arid"].b_name = "cold_arid"
			gal.mapgen.biome_info["cold_arid"].b_cid = 1
			gal.mapgen.biome_info["cold_arid"].b_top = c_dirtperm
			gal.mapgen.biome_info["cold_arid"].b_top_depth = 1
			gal.mapgen.biome_info["cold_arid"].b_filler = c_dirtperm
			gal.mapgen.biome_info["cold_arid"].b_filler_depth = 4
			gal.mapgen.biome_info["cold_arid"].b_stone = c_stone
			gal.mapgen.biome_info["cold_arid"].b_water_top = c_water
			gal.mapgen.biome_info["cold_arid"].b_water_top_depth = 1
			gal.mapgen.biome_info["cold_arid"].b_water = c_ice
			gal.mapgen.biome_info["cold_arid"].b_river = c_ice
			gal.mapgen.biome_info["cold_arid"].b_riverbed = c_silversand
			gal.mapgen.biome_info["cold_arid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["cold_arid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["cold_arid"].b_dungeon = c_brick
			gal.mapgen.biome_info["cold_arid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["cold_arid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["cold_arid"].b_node_dust = c_air
			gal.mapgen.biome_info["cold_arid"].vertical_blend = 0
			gal.mapgen.biome_info["cold_arid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["cold_arid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["cold_arid"].b_miny = -31000
			gal.mapgen.biome_info["cold_arid"].b_maxy = 31000
			gal.mapgen.biome_info["cold_arid"].b_heat = m_top1
			gal.mapgen.biome_info["cold_arid"].b_humid = m_top1
	
			gal.mapgen.biome_info["temperate_arid"] = {}
			gal.mapgen.biome_info["temperate_arid"].b_name = "temperate_arid"
			gal.mapgen.biome_info["temperate_arid"].b_cid = 2
			gal.mapgen.biome_info["temperate_arid"].b_top = c_silversand
			gal.mapgen.biome_info["temperate_arid"].b_top_depth = 1
			gal.mapgen.biome_info["temperate_arid"].b_filler = c_silversand
			gal.mapgen.biome_info["temperate_arid"].b_filler_depth = 4
			gal.mapgen.biome_info["temperate_arid"].b_stone = c_silversandstone
			gal.mapgen.biome_info["temperate_arid"].b_water_top = c_water
			gal.mapgen.biome_info["temperate_arid"].b_water_top_depth = 1
			gal.mapgen.biome_info["temperate_arid"].b_water = c_water
			gal.mapgen.biome_info["temperate_arid"].b_river = c_river
			gal.mapgen.biome_info["temperate_arid"].b_riverbed = c_silversand
			gal.mapgen.biome_info["temperate_arid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["temperate_arid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["temperate_arid"].b_dungeon = c_brick
			gal.mapgen.biome_info["temperate_arid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["temperate_arid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["temperate_arid"].b_node_dust = c_air
			gal.mapgen.biome_info["temperate_arid"].vertical_blend = 0
			gal.mapgen.biome_info["temperate_arid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["temperate_arid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["temperate_arid"].b_miny = -31000
			gal.mapgen.biome_info["temperate_arid"].b_maxy = 31000
			gal.mapgen.biome_info["temperate_arid"].b_heat = m_top2
			gal.mapgen.biome_info["temperate_arid"].b_humid = m_top1
	
			gal.mapgen.biome_info["warm_arid"] = {}
			gal.mapgen.biome_info["warm_arid"].b_name = "warm_arid"
			gal.mapgen.biome_info["warm_arid"].b_cid = 3
			gal.mapgen.biome_info["warm_arid"].b_top = c_sand
			gal.mapgen.biome_info["warm_arid"].b_top_depth = 1
			gal.mapgen.biome_info["warm_arid"].b_filler = c_sand
			gal.mapgen.biome_info["warm_arid"].b_filler_depth = 4
			gal.mapgen.biome_info["warm_arid"].b_stone = c_desertsandstone
			gal.mapgen.biome_info["warm_arid"].b_water_top = c_water
			gal.mapgen.biome_info["warm_arid"].b_water_top_depth = 1
			gal.mapgen.biome_info["warm_arid"].b_water = c_water
			gal.mapgen.biome_info["warm_arid"].b_river = c_river
			gal.mapgen.biome_info["warm_arid"].b_riverbed = c_sand
			gal.mapgen.biome_info["warm_arid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["warm_arid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["warm_arid"].b_dungeon = c_brick
			gal.mapgen.biome_info["warm_arid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["warm_arid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["warm_arid"].b_node_dust = c_air
			gal.mapgen.biome_info["warm_arid"].vertical_blend = 0
			gal.mapgen.biome_info["warm_arid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["warm_arid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["warm_arid"].b_miny = -31000
			gal.mapgen.biome_info["warm_arid"].b_maxy = 31000
			gal.mapgen.biome_info["warm_arid"].b_heat = m_top3
			gal.mapgen.biome_info["warm_arid"].b_humid = m_top1
	
			gal.mapgen.biome_info["hot_arid"] = {}
			gal.mapgen.biome_info["hot_arid"].b_name = "hot_arid"
			gal.mapgen.biome_info["hot_arid"].b_cid = 4
			gal.mapgen.biome_info["hot_arid"].b_top = c_desertsand
			gal.mapgen.biome_info["hot_arid"].b_top_depth = 1
			gal.mapgen.biome_info["hot_arid"].b_filler = c_desertsand
			gal.mapgen.biome_info["hot_arid"].b_filler_depth = 4
			gal.mapgen.biome_info["hot_arid"].b_stone = c_desertstone
			gal.mapgen.biome_info["hot_arid"].b_water_top = c_water
			gal.mapgen.biome_info["hot_arid"].b_water_top_depth = 1
			gal.mapgen.biome_info["hot_arid"].b_water = c_water
			gal.mapgen.biome_info["hot_arid"].b_river = c_river
			gal.mapgen.biome_info["hot_arid"].b_riverbed = c_desertsand
			gal.mapgen.biome_info["hot_arid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["hot_arid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["hot_arid"].b_dungeon = c_brick
			gal.mapgen.biome_info["hot_arid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["hot_arid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["hot_arid"].b_node_dust = c_air
			gal.mapgen.biome_info["hot_arid"].vertical_blend = 0
			gal.mapgen.biome_info["hot_arid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["hot_arid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["hot_arid"].b_miny = -31000
			gal.mapgen.biome_info["hot_arid"].b_maxy = 31000
			gal.mapgen.biome_info["hot_arid"].b_heat = m_top4
			gal.mapgen.biome_info["hot_arid"].b_humid = m_top1
	
			gal.mapgen.biome_info["cold_temperate"] = {}
			gal.mapgen.biome_info["cold_temperate"].b_name = "cold_temperate"
			gal.mapgen.biome_info["cold_temperate"].b_cid = 5
			gal.mapgen.biome_info["cold_temperate"].b_top = c_dirtperm
			gal.mapgen.biome_info["cold_temperate"].b_top_depth = 1
			gal.mapgen.biome_info["cold_temperate"].b_filler = c_dirtperm
			gal.mapgen.biome_info["cold_temperate"].b_filler_depth = 4
			gal.mapgen.biome_info["cold_temperate"].b_stone = c_stone
			gal.mapgen.biome_info["cold_temperate"].b_water_top = c_water
			gal.mapgen.biome_info["cold_temperate"].b_water_top_depth = 1
			gal.mapgen.biome_info["cold_temperate"].b_water = c_water
			gal.mapgen.biome_info["cold_temperate"].b_river = c_river
			gal.mapgen.biome_info["cold_temperate"].b_riverbed = c_silversand
			gal.mapgen.biome_info["cold_temperate"].b_riverbed_depth = 2
			gal.mapgen.biome_info["cold_temperate"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["cold_temperate"].b_dungeon = c_brick
			gal.mapgen.biome_info["cold_temperate"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["cold_temperate"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["cold_temperate"].b_node_dust = c_air
			gal.mapgen.biome_info["cold_temperate"].vertical_blend = 0
			gal.mapgen.biome_info["cold_temperate"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["cold_temperate"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["cold_temperate"].b_miny = -31000
			gal.mapgen.biome_info["cold_temperate"].b_maxy = 31000
			gal.mapgen.biome_info["cold_temperate"].b_heat = m_top1
			gal.mapgen.biome_info["cold_temperate"].b_humid = m_top2
	
			gal.mapgen.biome_info["temperate_temperate"] = {}
			gal.mapgen.biome_info["temperate_temperate"].b_name = "temperate_temperate"
			gal.mapgen.biome_info["temperate_temperate"].b_cid = 6
			gal.mapgen.biome_info["temperate_temperate"].b_top = c_dirtgrass
			gal.mapgen.biome_info["temperate_temperate"].b_top_depth = 1
			gal.mapgen.biome_info["temperate_temperate"].b_filler = c_dirtdry
			gal.mapgen.biome_info["temperate_temperate"].b_filler_depth = 4
			gal.mapgen.biome_info["temperate_temperate"].b_stone = c_sandstone
			gal.mapgen.biome_info["temperate_temperate"].b_water_top = c_water
			gal.mapgen.biome_info["temperate_temperate"].b_water_top_depth = 1
			gal.mapgen.biome_info["temperate_temperate"].b_water = c_water
			gal.mapgen.biome_info["temperate_temperate"].b_river = c_river
			gal.mapgen.biome_info["temperate_temperate"].b_riverbed = c_sand
			gal.mapgen.biome_info["temperate_temperate"].b_riverbed_depth = 2
			gal.mapgen.biome_info["temperate_temperate"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["temperate_temperate"].b_dungeon = c_brick
			gal.mapgen.biome_info["temperate_temperate"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["temperate_temperate"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["temperate_temperate"].b_node_dust = c_air
			gal.mapgen.biome_info["temperate_temperate"].vertical_blend = 0
			gal.mapgen.biome_info["temperate_temperate"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["temperate_temperate"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["temperate_temperate"].b_miny = -31000
			gal.mapgen.biome_info["temperate_temperate"].b_maxy = 31000
			gal.mapgen.biome_info["temperate_temperate"].b_heat = m_top2
			gal.mapgen.biome_info["temperate_temperate"].b_humid = m_top2
	
			gal.mapgen.biome_info["warm_temperate"] = {}
			gal.mapgen.biome_info["warm_temperate"].b_name = "warm_temperate"
			gal.mapgen.biome_info["warm_temperate"].b_cid = 7
			gal.mapgen.biome_info["warm_temperate"].b_top = c_dirtgrass
			gal.mapgen.biome_info["warm_temperate"].b_top_depth = 1
			gal.mapgen.biome_info["warm_temperate"].b_filler = c_dirtdry
			gal.mapgen.biome_info["warm_temperate"].b_filler_depth = 4
			gal.mapgen.biome_info["warm_temperate"].b_stone = c_sandstone
			gal.mapgen.biome_info["warm_temperate"].b_water_top = c_water
			gal.mapgen.biome_info["warm_temperate"].b_water_top_depth = 1
			gal.mapgen.biome_info["warm_temperate"].b_water = c_water
			gal.mapgen.biome_info["warm_temperate"].b_river = c_river
			gal.mapgen.biome_info["warm_temperate"].b_riverbed = c_sand
			gal.mapgen.biome_info["warm_temperate"].b_riverbed_depth = 2
			gal.mapgen.biome_info["warm_temperate"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["warm_temperate"].b_dungeon = c_brick
			gal.mapgen.biome_info["warm_temperate"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["warm_temperate"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["warm_temperate"].b_node_dust = c_air
			gal.mapgen.biome_info["warm_temperate"].vertical_blend = 0
			gal.mapgen.biome_info["warm_temperate"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["warm_temperate"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["warm_temperate"].b_miny = -31000
			gal.mapgen.biome_info["warm_temperate"].b_maxy = 31000
			gal.mapgen.biome_info["warm_temperate"].b_heat = m_top3
			gal.mapgen.biome_info["warm_temperate"].b_humid = m_top2
	
			gal.mapgen.biome_info["hot_temperate"] = {}
			gal.mapgen.biome_info["hot_temperate"].b_name = "hot_temperate"
			gal.mapgen.biome_info["hot_temperate"].b_cid = 8
			gal.mapgen.biome_info["hot_temperate"].b_top = c_dirtgrass
			gal.mapgen.biome_info["hot_temperate"].b_top_depth = 1
			gal.mapgen.biome_info["hot_temperate"].b_filler = c_desertsandstone
			gal.mapgen.biome_info["hot_temperate"].b_filler_depth = 4
			gal.mapgen.biome_info["hot_temperate"].b_stone = c_desertstone
			gal.mapgen.biome_info["hot_temperate"].b_water_top = c_water
			gal.mapgen.biome_info["hot_temperate"].b_water_top_depth = 1
			gal.mapgen.biome_info["hot_temperate"].b_water = c_water
			gal.mapgen.biome_info["hot_temperate"].b_river = c_river
			gal.mapgen.biome_info["hot_temperate"].b_riverbed = c_sand
			gal.mapgen.biome_info["hot_temperate"].b_riverbed_depth = 2
			gal.mapgen.biome_info["hot_temperate"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["hot_temperate"].b_dungeon = c_brick
			gal.mapgen.biome_info["hot_temperate"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["hot_temperate"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["hot_temperate"].b_node_dust = c_air
			gal.mapgen.biome_info["hot_temperate"].vertical_blend = 0
			gal.mapgen.biome_info["hot_temperate"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["hot_temperate"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["hot_temperate"].b_miny = -31000
			gal.mapgen.biome_info["hot_temperate"].b_maxy = 31000
			gal.mapgen.biome_info["hot_temperate"].b_heat = m_top4
			gal.mapgen.biome_info["hot_temperate"].b_humid = m_top2
	
			gal.mapgen.biome_info["cold_semihumid"] = {}
			gal.mapgen.biome_info["cold_semihumid"].b_name = "cold_semihumid"
			gal.mapgen.biome_info["cold_semihumid"].b_cid = 9
			gal.mapgen.biome_info["cold_semihumid"].b_top = c_snow
			gal.mapgen.biome_info["cold_semihumid"].b_top_depth = 1
			gal.mapgen.biome_info["cold_semihumid"].b_filler = c_dirt
			gal.mapgen.biome_info["cold_semihumid"].b_filler_depth = 4
			gal.mapgen.biome_info["cold_semihumid"].b_stone = c_stone
			gal.mapgen.biome_info["cold_semihumid"].b_water_top = c_water
			gal.mapgen.biome_info["cold_semihumid"].b_water_top_depth = 1
			gal.mapgen.biome_info["cold_semihumid"].b_water = c_water
			gal.mapgen.biome_info["cold_semihumid"].b_river = c_river
			gal.mapgen.biome_info["cold_semihumid"].b_riverbed = c_silversand
			gal.mapgen.biome_info["cold_semihumid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["cold_semihumid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["cold_semihumid"].b_dungeon = c_brick
			gal.mapgen.biome_info["cold_semihumid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["cold_semihumid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["cold_semihumid"].b_node_dust = c_air
			gal.mapgen.biome_info["cold_semihumid"].vertical_blend = 0
			gal.mapgen.biome_info["cold_semihumid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["cold_semihumid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["cold_semihumid"].b_miny = -31000
			gal.mapgen.biome_info["cold_semihumid"].b_maxy = 31000
			gal.mapgen.biome_info["cold_semihumid"].b_heat = m_top1
			gal.mapgen.biome_info["cold_semihumid"].b_humid = m_top3
	
			gal.mapgen.biome_info["temperate_semihumid"] = {}
			gal.mapgen.biome_info["temperate_semihumid"].b_name = "temperate_semihumid"
			gal.mapgen.biome_info["temperate_semihumid"].b_cid = 10
			gal.mapgen.biome_info["temperate_semihumid"].b_top = c_dirtgrass
			gal.mapgen.biome_info["temperate_semihumid"].b_top_depth = 1
			gal.mapgen.biome_info["temperate_semihumid"].b_filler = c_dirt
			gal.mapgen.biome_info["temperate_semihumid"].b_filler_depth = 4
			gal.mapgen.biome_info["temperate_semihumid"].b_stone = c_stone
			gal.mapgen.biome_info["temperate_semihumid"].b_water_top = c_water
			gal.mapgen.biome_info["temperate_semihumid"].b_water_top_depth = 1
			gal.mapgen.biome_info["temperate_semihumid"].b_water = c_water
			gal.mapgen.biome_info["temperate_semihumid"].b_river = c_river
			gal.mapgen.biome_info["temperate_semihumid"].b_riverbed = c_sand
			gal.mapgen.biome_info["temperate_semihumid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["temperate_semihumid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["temperate_semihumid"].b_dungeon = c_brick
			gal.mapgen.biome_info["temperate_semihumid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["temperate_semihumid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["temperate_semihumid"].b_node_dust = c_air
			gal.mapgen.biome_info["temperate_semihumid"].vertical_blend = 0
			gal.mapgen.biome_info["temperate_semihumid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["temperate_semihumid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["temperate_semihumid"].b_miny = -31000
			gal.mapgen.biome_info["temperate_semihumid"].b_maxy = 31000
			gal.mapgen.biome_info["temperate_semihumid"].b_heat = m_top2
			gal.mapgen.biome_info["temperate_semihumid"].b_humid = m_top3
	
			gal.mapgen.biome_info["warm_semihumid"] = {}
			gal.mapgen.biome_info["warm_semihumid"].b_name = "warm_semihumid"
			gal.mapgen.biome_info["warm_semihumid"].b_cid = 11
			gal.mapgen.biome_info["warm_semihumid"].b_top = c_dirtgrass
			gal.mapgen.biome_info["warm_semihumid"].b_top_depth = 1
			gal.mapgen.biome_info["warm_semihumid"].b_filler = c_dirt
			gal.mapgen.biome_info["warm_semihumid"].b_filler_depth = 4
			gal.mapgen.biome_info["warm_semihumid"].b_stone = c_stone
			gal.mapgen.biome_info["warm_semihumid"].b_water_top = c_water
			gal.mapgen.biome_info["warm_semihumid"].b_water_top_depth = 1
			gal.mapgen.biome_info["warm_semihumid"].b_water = c_water
			gal.mapgen.biome_info["warm_semihumid"].b_river = c_river
			gal.mapgen.biome_info["warm_semihumid"].b_riverbed = c_sand
			gal.mapgen.biome_info["warm_semihumid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["warm_semihumid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["warm_semihumid"].b_dungeon = c_brick
			gal.mapgen.biome_info["warm_semihumid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["warm_semihumid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["warm_semihumid"].b_node_dust = c_air
			gal.mapgen.biome_info["warm_semihumid"].vertical_blend = 0
			gal.mapgen.biome_info["warm_semihumid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["warm_semihumid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["warm_semihumid"].b_miny = -31000
			gal.mapgen.biome_info["warm_semihumid"].b_maxy = 31000
			gal.mapgen.biome_info["warm_semihumid"].b_heat = m_top3
			gal.mapgen.biome_info["warm_semihumid"].b_humid = m_top3
	
			gal.mapgen.biome_info["hot_semihumid"] = {}
			gal.mapgen.biome_info["hot_semihumid"].b_name = "hot_semihumid"
			gal.mapgen.biome_info["hot_semihumid"].b_cid = 12
			gal.mapgen.biome_info["hot_semihumid"].b_top = c_dirtgrass
			gal.mapgen.biome_info["hot_semihumid"].b_top_depth = 1
			gal.mapgen.biome_info["hot_semihumid"].b_filler = c_dirt
			gal.mapgen.biome_info["hot_semihumid"].b_filler_depth = 4
			gal.mapgen.biome_info["hot_semihumid"].b_stone = c_desertstone
			gal.mapgen.biome_info["hot_semihumid"].b_water_top = c_water
			gal.mapgen.biome_info["hot_semihumid"].b_water_top_depth = 1
			gal.mapgen.biome_info["hot_semihumid"].b_water = c_water
			gal.mapgen.biome_info["hot_semihumid"].b_river = c_river
			gal.mapgen.biome_info["hot_semihumid"].b_riverbed = c_sand
			gal.mapgen.biome_info["hot_semihumid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["hot_semihumid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["hot_semihumid"].b_dungeon = c_brick
			gal.mapgen.biome_info["hot_semihumid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["hot_semihumid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["hot_semihumid"].b_node_dust = c_air
			gal.mapgen.biome_info["hot_semihumid"].vertical_blend = 0
			gal.mapgen.biome_info["hot_semihumid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["hot_semihumid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["hot_semihumid"].b_miny = -31000
			gal.mapgen.biome_info["hot_semihumid"].b_maxy = 31000
			gal.mapgen.biome_info["hot_semihumid"].b_heat = m_top4
			gal.mapgen.biome_info["hot_semihumid"].b_humid = m_top3
	
			gal.mapgen.biome_info["temperate_humid"] = {}
			gal.mapgen.biome_info["temperate_humid"].b_name = "temperate_humid"
			gal.mapgen.biome_info["temperate_humid"].b_cid = 13
			gal.mapgen.biome_info["temperate_humid"].b_top = c_coniferous
			gal.mapgen.biome_info["temperate_humid"].b_top_depth = 1
			gal.mapgen.biome_info["temperate_humid"].b_filler = c_dirt
			gal.mapgen.biome_info["temperate_humid"].b_filler_depth = 4
			gal.mapgen.biome_info["temperate_humid"].b_stone = c_desertsandstone
			gal.mapgen.biome_info["temperate_humid"].b_water_top = c_water
			gal.mapgen.biome_info["temperate_humid"].b_water_top_depth = 1
			gal.mapgen.biome_info["temperate_humid"].b_water = c_water
			gal.mapgen.biome_info["temperate_humid"].b_river = c_river
			gal.mapgen.biome_info["temperate_humid"].b_riverbed = c_sand
			gal.mapgen.biome_info["temperate_humid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["temperate_humid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["temperate_humid"].b_dungeon = c_brick
			gal.mapgen.biome_info["temperate_humid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["temperate_humid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["temperate_humid"].b_node_dust = c_air
			gal.mapgen.biome_info["temperate_humid"].vertical_blend = 0
			gal.mapgen.biome_info["temperate_humid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["temperate_humid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["temperate_humid"].b_miny = -31000
			gal.mapgen.biome_info["temperate_humid"].b_maxy = 31000
			gal.mapgen.biome_info["temperate_humid"].b_heat = m_top2
			gal.mapgen.biome_info["temperate_humid"].b_humid = m_top4
	
			gal.mapgen.biome_info["hot_humid"] = {}
			gal.mapgen.biome_info["hot_humid"].b_name = "hot_humid"
			gal.mapgen.biome_info["hot_humid"].b_cid = 14
			gal.mapgen.biome_info["hot_humid"].b_top = c_rainforest
			gal.mapgen.biome_info["hot_humid"].b_top_depth = 1
			gal.mapgen.biome_info["hot_humid"].b_filler = c_dirt
			gal.mapgen.biome_info["hot_humid"].b_filler_depth = 4
			gal.mapgen.biome_info["hot_humid"].b_stone = c_desertstone
			gal.mapgen.biome_info["hot_humid"].b_water_top = c_water
			gal.mapgen.biome_info["hot_humid"].b_water_top_depth = 1
			gal.mapgen.biome_info["hot_humid"].b_water = c_water
			gal.mapgen.biome_info["hot_humid"].b_river = c_river
			gal.mapgen.biome_info["hot_humid"].b_riverbed = c_desertsand
			gal.mapgen.biome_info["hot_humid"].b_riverbed_depth = 2
			gal.mapgen.biome_info["hot_humid"].b_cave_liquid = c_lava
			gal.mapgen.biome_info["hot_humid"].b_dungeon = c_brick
			gal.mapgen.biome_info["hot_humid"].b_dungeon_alt = c_mossy
			gal.mapgen.biome_info["hot_humid"].b_dungeon_stair = c_block
			gal.mapgen.biome_info["hot_humid"].b_node_dust = c_air
			gal.mapgen.biome_info["hot_humid"].vertical_blend = 0
			gal.mapgen.biome_info["hot_humid"].min_pos = {x=-31000, y=-31000, z=-31000}
			gal.mapgen.biome_info["hot_humid"].max_pos = {x=31000, y=31000, z=31000}
			gal.mapgen.biome_info["hot_humid"].b_miny = -31000
			gal.mapgen.biome_info["hot_humid"].b_maxy = 31000
			gal.mapgen.biome_info["hot_humid"].b_heat = m_top4
			gal.mapgen.biome_info["hot_humid"].b_humid = m_top4
	--
		end
	end


