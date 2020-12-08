
local C = lib_mg_v7.C
local b_mult = lib_mg_v7.mg_biome_scale


--##	
--##	Create a table of biome ids, so I can use the biomemap.
--##	

	lib_mg_v7.biome_info = {}

	for name, desc in pairs(minetest.registered_biomes) do

		if desc then

			local b_cid = minetest.get_biome_id(name)
--[[
			local b_top = C["c_dirtgrass"]
			local b_top_depth = 1
			local b_filler = C["c_dirt"]
			local b_filler_depth = 4
			local b_stone = C["c_stone"]
			local b_water_top = C["c_water"]
			local b_water_top_depth = 2
			local b_water = C["c_water"]
			local b_river = C["c_river"]
			local b_riverbed = C["c_gravel"]
			local b_riverbed_depth = 2
			local b_cave_liquid = C["c_lava"]
			local b_dungeon = C["c_mossy"]
			local b_dungeon_alt = C["c_brick"]
			local b_dungeon_stair = C["c_block"]
			local b_node_dust = C["c_air"]
--]]
			local b_top = minetest.get_content_id("ignore")
			local b_top_depth = 0
			local b_filler = minetest.get_content_id("ignore")
			local b_filler_depth = 0
			local b_stone = minetest.get_content_id("ignore")
			local b_water_top = minetest.get_content_id("ignore")
			local b_water_top_depth = 0
			local b_water = minetest.get_content_id("ignore")
			local b_river = minetest.get_content_id("ignore")
			local b_riverbed = minetest.get_content_id("ignore")
			local b_riverbed_depth = 0
			local b_cave_liquid = minetest.get_content_id("ignore")
			local b_dungeon = minetest.get_content_id("ignore")
			local b_dungeon_alt = minetest.get_content_id("ignore")
			local b_dungeon_stair = minetest.get_content_id("ignore")
			local b_node_dust = minetest.get_content_id("ignore")

			local b_miny = -31000
			local b_maxy = 31000
			local b_heat = 50
			local b_humid = 50
		

			if desc.node_top and desc.node_top ~= "" then
				b_top = minetest.get_content_id(desc.node_top)
			end

			if desc.depth_top and desc.depth_top ~= "" then
				b_top_depth = desc.depth_top or ""
			end

			if desc.node_filler and desc.node_filler ~= "" then
				b_filler = minetest.get_content_id(desc.node_filler)
			end

			if desc.depth_filler and desc.depth_filler ~= "" then
				b_filler_depth = desc.depth_filler
			end

			if desc.node_stone and desc.node_stone ~= "" then
				b_stone = minetest.get_content_id(desc.node_stone)
			end

			if desc.node_water_top and desc.node_water_top ~= "" then
				b_water_top = minetest.get_content_id(desc.node_water_top)
			end

			if desc.depth_water_top and desc.depth_water_top ~= "" then
				b_water_top_depth = desc.depth_water_top
			end

			if desc.node_water and desc.node_water ~= "" then
				b_water = minetest.get_content_id(desc.node_water)
			end

			if desc.node_river_water and desc.node_river_water ~= "" then
				b_river = minetest.get_content_id(desc.node_river_water)
			end

			if desc.node_riverbed and desc.node_riverbed ~= "" then
				b_riverbed = minetest.get_content_id(desc.node_riverbed)
			end

			if desc.depth_riverbed and desc.depth_riverbed ~= "" then
				b_riverbed_depth = desc.depth_riverbed or ""
			end

			if desc.node_cave_liquid and desc.node_cave_liquid ~= "" then
				b_cave_liquid = minetest.get_content_id(desc.node_cave_liquid)
			end

			if desc.node_dungeon and desc.node_dungeon ~= "" then
				b_dungeon = minetest.get_content_id(desc.node_dungeon)
			end

			if desc.node_dungeon_alt and desc.node_dungeon_alt ~= "" then
				b_dungeon_alt = minetest.get_content_id(desc.node_dungeon_alt)
			end

			if desc.node_dungeon_stair and desc.node_dungeon_stair ~= "" then
				b_dungeon_stair = minetest.get_content_id(desc.node_dungeon_stair)
			end

			if desc.node_dust and desc.node_dust ~= "" then
				b_node_dust = minetest.get_content_id(desc.node_dust)
			end

			if desc.y_min and desc.y_min ~= "" then
				b_miny = desc.y_min or ""
			end

			if desc.y_max and desc.y_max ~= "" then
				b_maxy = desc.y_max or ""
			end

			if desc.heat_point and desc.heat_point ~= "" then
				b_heat = desc.heat_point or ""
			end

			if desc.humidity_point and desc.humidity_point ~= "" then
				b_humid = desc.humidity_point
			end
	
			lib_mg_v7.biome_info[desc.name] = desc.name .. "|" .. b_cid .. "|" .. b_top .. "|" .. b_top_depth .. "|" .. b_filler .. "|" .. b_filler_depth .. "|" .. b_stone .. "|" .. b_water_top
					.. "|" .. b_water_top_depth .. "|" .. b_water .. "|" .. b_river .. "|" .. b_riverbed .. "|" .. b_riverbed_depth .. "|" .. b_cave_liquid .. "|" .. b_dungeon
					.. "|" .. b_dungeon_alt .. "|" .. b_dungeon_stair .. "|" .. b_node_dust .. "|" .. b_miny .. "|" .. b_maxy .. "|" .. b_heat .. "|" .. b_humid .. "\n"


		end
	end


--##	
--##	GET BIOME (lib_materials)
--##	

	function lib_mg_v7.get_biome_name(pheat, phumid, palt)
	
		local t_heat, t_humid, t_altitude, t_name
	
	
		if pheat < 12.5 then
			t_heat = "cold"
		elseif pheat >= 12.5 and pheat < 37.5 then
			t_heat = "cool"
		elseif pheat >= 37.5 and pheat < 62.5 then
			t_heat = "temperate"
		elseif pheat >= 62.5 and pheat < 87.5 then
			t_heat = "warm"
		elseif pheat >= 87.5 then
			t_heat = "hot"
		else
			--t_heat = ""
		end
	
		if phumid < 12.5 then
			t_humid = "arid"
		elseif phumid >= 12.5 and phumid < 37.5 then
			t_humid = "semiarid"
		elseif phumid >= 37.5 and phumid < 62.5 then
			t_humid = "temperate"
		elseif phumid >= 62.5 and phumid < 87.5 then
			t_humid = "semihumid"
		elseif phumid >= 87.5 then
			t_humid = "humid"
		else
			--t_humid = ""
		end
	
		if palt < (lib_materials.beach_depth * b_mult) then
			t_altitude = "_ocean"
		elseif palt >= (lib_materials.beach_depth * b_mult) and palt < (lib_materials.maxheight_beach * b_mult) then
			t_altitude = "_beach"
		elseif palt >= (lib_materials.maxheight_beach * b_mult) and palt < (lib_materials.maxheight_highland * b_mult) then
			t_altitude = ""
		--elseif palt >= (lib_materials.maxheight_beach * b_mult) and palt < (lib_materials.maxheight_coastal * b_mult) then
		--	t_altitude = "coastal"
		--elseif palt >= (lib_materials.maxheight_coastal * b_mult) and palt < (lib_materials.maxheight_lowland * b_mult) then
		--	t_altitude = "lowland"
		--elseif palt >= (lib_materials.maxheight_lowland * b_mult) and palt < (lib_materials.maxheight_shelf * b_mult) then
		--	t_altitude = "shelf"
		--elseif palt >= (lib_materials.maxheight_shelf * b_mult) and palt < (lib_materials.maxheight_highland * b_mult) then
		--	t_altitude = "highland"
		elseif palt >= (lib_materials.maxheight_highland * b_mult) and palt < (lib_materials.maxheight_mountain * b_mult) then
			t_altitude = "_mountain"
		elseif palt >= (lib_materials.maxheight_mountain * b_mult) then
			t_altitude = "_strato"
		else
			--t_altitude = ""
		end
	
		if t_heat and t_heat ~= "" and t_humid and t_humid ~= "" then
			t_name = t_heat .. "_" .. t_humid .. t_altitude
		else
			t_name = "temperate_temperate"
		end
	
		if palt >= -31000 and palt < -20000 then
			t_name = "generic_mantle"
		elseif palt >= -20000 and palt < -15000 then
			t_name = "stone_basalt_01_layer"
		elseif palt >= -15000 and palt < -10000 then
			t_name = "stone_brown_layer"
		elseif palt >= -10000 and palt < -6000 then
			t_name = "stone_sand_layer"
		elseif palt >= -6000 and palt < -5000 then
			t_name = "desert_stone_layer"
		elseif palt >= -5000 and palt < -4000 then
			t_name = "desert_sandstone_layer"
		elseif palt >= -4000 and palt < -3000 then
			t_name = "generic_stone_limestone_01_layer"
		elseif palt >= -3000 and palt < -2000 then
			t_name = "generic_granite_layer"
		elseif palt >= -2000 and palt < lib_materials.ocean_depth then
			t_name = "generic_stone_layer"
		else
			
		end
	
		return t_name
	
	end
	
