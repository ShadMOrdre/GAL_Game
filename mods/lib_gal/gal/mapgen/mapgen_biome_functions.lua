


	local m_top1 = 12.5
	local m_top2 = 37.5
	local m_top3 = 62.5
	local m_top4 = 87.5

	local m_biome1 = 25
	local m_biome2 = 50
	local m_biome3 = 75



--# FUNCTIONS
	local function rangelim(v, min, max)
		if v < min then return min end
		if v > max then return max end
		return v
	end

	function gal.mapgen.get_biome_name(heat,humid,y)

		local t_heat, t_humid, t_altitude, t_name

		if gal.mapgen.mg_biome_mode == "full" then

			if heat < m_top1 then
				t_heat = "cold"
			elseif heat >= m_top1 and heat < m_top2 then
				t_heat = "cool"
			elseif heat >= m_top2 and heat < m_top3 then
				t_heat = "temperate"
			elseif heat >= m_top3 and heat < m_top4 then
				t_heat = "warm"
			elseif heat >= m_top4 then
				t_heat = "hot"
			else
	
			end
	
			if humid < m_top1 then
				t_humid = "_arid"
			elseif humid >= m_top1 and humid < m_top2 then
				t_humid = "_semiarid"
			elseif humid >= m_top2 and humid < m_top3 then
				t_humid = "_temperate"
			elseif humid >= m_top3 and humid < m_top4 then
				t_humid = "_semihumid"
			elseif humid >= m_top4 then
				t_humid = "_humid"
			else
	
			end
	
			if y < gal.mapgen.beach_depth then
				t_altitude = "_ocean"
			elseif y >= gal.mapgen.beach_depth and y < gal.mapgen.maxheight_beach then
				t_altitude = "_beach"
			elseif y >= gal.mapgen.maxheight_beach and y < gal.mapgen.maxheight_highland then
				t_altitude = ""
			elseif y >= gal.mapgen.maxheight_highland and y < gal.mapgen.maxheight_mountain then
				t_altitude = "_mountain"
			elseif y >= gal.mapgen.maxheight_mountain then
				t_altitude = "_strato"
			else
				t_altitude = ""
			end
	
			if t_heat and t_heat ~= "" and t_humid and t_humid ~= "" then
				t_name = t_heat .. t_humid .. t_altitude
			else
				if (t_heat == "hot") and (t_humid == "_humid") and (heat > 90) and (humid > 90) and (t_altitude == "_beach") then
					t_name = "hot_humid_swamp"
				elseif (t_heat == "hot") and (t_humid == "_semihumid") and (heat > 90) and (humid > 80) and (t_altitude == "_beach") then
					t_name = "hot_semihumid_swamp"
				elseif (t_heat == "warm") and (t_humid == "_humid") and (heat > 80) and (humid > 90) and (t_altitude == "_beach") then
					t_name = "warm_humid_swamp"
				elseif (t_heat == "temperate") and (t_humid == "_humid") and (heat > 57) and (humid > 90) and (t_altitude == "_beach") then
					t_name = "temperate_humid_swamp"
				else
					t_name = "temperate_temperate"
				end
			end
	
			if y >= -31000 and y < -20000 then
				t_name = "generic_mantle"
			elseif y >= -20000 and y < -15000 then
				t_name = "stone_basalt_01_layer"
			elseif y >= -15000 and y < -10000 then
				t_name = "stone_brown_layer"
			elseif y >= -10000 and y < -6000 then
				t_name = "stone_sand_layer"
			elseif y >= -6000 and y < -5000 then
				t_name = "desert_stone_layer"
			elseif y >= -5000 and y < -4000 then
				t_name = "desert_sandstone_layer"
			elseif y >= -4000 and y < -3000 then
				t_name = "generic_stone_limestone_01_layer"
			elseif y >= -3000 and y < -2000 then
				t_name = "generic_granite_layer"
			elseif y >= -2000 and y < gal.mapgen.ocean_depth then
				t_name = "generic_stone_layer"
			else
				
			end

		elseif gal.mapgen.mg_biome_mode == "lite" then

			if nhumid <= 25 then
				if nheat <= 25 then
					t_name = "cold_arid"
				elseif nheat <= 50 and nheat > 25 then
					t_name = "temperate_arid"
				elseif nheat <= 75 and nheat > 50 then
					t_name = "warm_arid"
				else
					t_name = "hot_arid"
				end
			elseif nhumid <= 50 and nhumid > 25 then
				if nheat <= 25 then
					t_name = "cold_temperate"
				elseif nheat <= 50 and nheat > 25 then
					t_name = "temperate_temperate"
				elseif nheat <= 75 and nheat > 50 then
					t_name = "warm_temperate"
				else
					t_name = "hot_temperate"
				end
			elseif nhumid <= 75 and nhumid > 50 then
				if nheat <= 25 then
					t_name = "cold_semihumid"
				elseif nheat <= 50 and nheat > 25 then
					t_name = "temperate_semihumid"
				elseif nheat <= 75 and nheat > 50 then
					t_name = "warm_semihumid"
				else
					t_name = "hot_semihumid"
				end
			else
				if nheat <= 50 then
					t_name = "temperate_humid"
				else
					t_name = "hot_humid"
				end
			end

		else
			t_name = "default"
		end

		return t_name

	end

	function gal.mapgen.get_heat_scalar(z)

		if gal.mapgen.use_heat_scalar == true then
			local t_z = abs(z)
			local t_heat = 0
			local t_heat_scale = 0.0071875 
			local t_heat_factor = 0
	
			local t_heat_mid = ((gal.mapgen.mg_map_size * gal.mapgen.mg_world_scale) * 0.25)
			local t_diff = abs(t_heat_mid - t_z)
	
			if t_z >= t_heat_mid then
				t_heat_factor = t_heat_scale * -1
			elseif t_z <= t_heat_mid then
				t_heat_factor = t_heat_scale
			end
	
			local t_map_scale = t_heat_factor / gal.mapgen.mg_world_scale
			return t_diff * t_map_scale
		else
			return 0
		end
	end

