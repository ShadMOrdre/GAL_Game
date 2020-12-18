
-------------------------------------------------------------
-- gal_geology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------


gal_geology = {}
gal_geology.name = "gal_geology"
gal_geology.ver_max = 0
gal_geology.ver_min = 1
gal_geology.ver_rev = 0
gal_geology.ver_str = gal_geology.ver_max .. "." .. gal_geology.ver_min .. "." .. gal_geology.ver_rev
gal_geology.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, VannessaE, runs, and numerous others."
gal_geology.license = "LGLv2.1"
gal_geology.copyright = "2019"
gal_geology.path_mod = minetest.get_modpath(minetest.get_current_modname())
gal_geology.path_world = minetest.get_worldpath()
gal_geology.path = gal_geology.path_mod

gal_geology.intllib = gal.intllib

local S = gal.intllib

minetest.log(S("[MOD] gal_geology:  Loading..."))
minetest.log(S("[MOD] gal_geology:  Version:") .. S(gal_geology.ver_str))
minetest.log(S("[MOD] gal_geology:  Legal Info: Copyright ") .. S(gal_geology.copyright) .. " " .. S(gal_geology.authorship) .. "")
minetest.log(S("[MOD] gal_geology:  License: ") .. S(gal_geology.license) .. "")


--gal_geology.mgv7_mapgen_scale_factor = minetest.setting_get("gal_geology_mgv7_mapgen_scale_factor") or 8
gal_geology.mapgen_scale_factor = minetest.setting_get("gal_geology_mgv7_mapgen_scale_factor") or 8
gal_geology.biome_altitude_range = minetest.setting_get("gal_geology_biome_altitude_range") or 40				--10, 20, 30, 40

--[[
if minetest.setting_get("gal_geology_clear_biomes") and minetest.setting_get("gal_geology_clear_biomes") == "true" then
	gal_geology.clear_biomes = true
else
	gal_geology.clear_biomes = false
end
if minetest.setting_get("gal_geology_clear_decos") and minetest.setting_get("gal_geology_clear_decos") == "true" then
	gal_geology.clear_decos = true
else
	gal_geology.clear_decos = false
end
if minetest.setting_get("gal_geology_clear_ores") and minetest.setting_get("gal_geology_clear_ores") == "true" then
	gal_geology.clear_ores = true
else
	gal_geology.clear_ores = false
end
--]]

if minetest.setting_get("gal_geology_color_grass_reg") and minetest.setting_get("gal_geology_color_grass_reg") == "true" then
	gal_geology.color_grass_reg = true
else
	gal_geology.color_grass_reg = false
end
if minetest.setting_get("gal_geology_color_grass_use") and minetest.setting_get("gal_geology_color_grass_use") == "true" then
	gal_geology.color_grass_use = true
else
	gal_geology.color_grass_use = false
end


--if minetest.setting_get("gal_geology_enable_lakes") and minetest.setting_get("gal_geology_enable_lakes") == "true"then
--	gal_geology.enable_lakes = true
--else
--	gal_geology.enable_lakes = false
--end
--if minetest.setting_get("gal_geology_enable_rivers") and minetest.setting_get("gal_geology_enable_rivers") == "true"then
--	gal_geology.enable_rivers = true
--else
--	gal_geology.enable_rivers = false
--end
--if minetest.setting_get("gal_geology_enable_waterdynamics") and minetest.setting_get("gal_geology_enable_waterdynamics") == "true"then
	--gal_geology.enable_waterdynamics = true
--else
	--gal_geology.enable_waterdynamics = false
--end
--if minetest.setting_get("gal_geology_enable_waterfalls") and minetest.setting_get("gal_geology_enable_waterfalls") == "true"then
--	gal_geology.enable_waterfalls = true
--else
--	gal_geology.enable_waterfalls = false
--end
--if minetest.setting_get("gal_geology_enable_lib_shapes_support") and minetest.setting_get("gal_geology_enable_lib_shapes_support") == "true"then
--	gal_geology.enable_lib_shapes = true
--else
--	gal_geology.enable_lib_shapes = false
--end
--if minetest.setting_get("gal_geology_enable_mapgen_aliases") and minetest.setting_get("gal_geology_enable_mapgen_aliases") == "true"then
--	gal_geology.enable_mapgen_aliases = true
--else
--	gal_geology.enable_mapgen_aliases = false
--end

	gal_geology.enable_lib_shapes = true
	--gal_geology.enable_waterdynamics = true
	--gal_geology.enable_mapgen_aliases = false
	gal_geology.config = "default"	--default, gal_geology, mcl?
	gal_geology.biome_data_file = "gal_geology_biomes"
	gal_geology.ore_data_file = "gal_geology_ores"
	gal_geology.ecosystem_data_file = "gal_geology_ecosystems"
	gal_geology.nodes_data_file = "gal_geology_nodes"


gal_geology.mg_params = minetest.get_mapgen_params()
gal_geology.mg_seed = gal_geology.mg_params.seed

--DEFAULTS
-- -192, -4, 0, 4, 30, 60, 90, 120, 150, 285, 485, 1250
-- -192, -4, 0, 4, 40, 80, 120, 160, 200, 380, 780, 1800
gal_geology.ocean_depth = -192
gal_geology.beach_depth = -4
gal_geology.maxheight_beach = 4
gal_geology.sea_level = 0
gal_geology.water_level = 1

gal_geology.maxheight_coastal = gal_geology.sea_level + gal_geology.biome_altitude_range
gal_geology.maxheight_lowland = gal_geology.maxheight_coastal + gal_geology.biome_altitude_range
gal_geology.maxheight_shelf = gal_geology.maxheight_lowland + gal_geology.biome_altitude_range
gal_geology.maxheight_highland = gal_geology.maxheight_shelf + gal_geology.biome_altitude_range
gal_geology.maxheight_mountain = gal_geology.maxheight_highland + gal_geology.biome_altitude_range
gal_geology.minheight_snow = gal_geology.maxheight_mountain + gal_geology.biome_altitude_range
gal_geology.maxheight_snow = gal_geology.minheight_snow  + (gal_geology.biome_altitude_range * 2)
gal_geology.maxheight_strato = gal_geology.maxheight_mountain  + (gal_geology.biome_altitude_range * (gal_geology.mapgen_scale_factor / 2))

-- 100, 75, 50, 25, 0
-- 90, 75, 50, 25, 10
-- 90, 70, 50, 30, 10
gal_geology.temperature_hot = 100
gal_geology.temperature_warm = 75
gal_geology.temperature_temperate = 50
gal_geology.temperature_cool = 25
gal_geology.temperature_cold = 0
gal_geology.humidity_humid = 100
gal_geology.humidity_semihumid = 75
gal_geology.humidity_temperate = 50
gal_geology.humidity_semiarid = 25
gal_geology.humidity_arid = 0

-- 8, 4
gal_geology.biome_vertical_blend = gal_geology.biome_altitude_range / 5

gal_geology.liquids = {}

if gal_geology.clear_biomes then
	--minetest.clear_registered_biomes()
end
if gal_geology.clear_decos then
	--minetest.clear_registered_decorations()
end
if gal_geology.clear_ores then
	--minetest.clear_registered_ores()
end



minetest.log(S("[MOD] gal_geology:  Loading..."))


		--gal_geology.read_csv = dofile(gal_geology.path .. "/csv.lua")

		--dofile(gal_geology.path.."/gal_geology_sound_defaults.lua")

		--dofile(gal_geology.path.."/gal_geology_nodeio.lua")
		--dofile(gal_geology.path.."/gal_geology_fluid_lib.lua")

	dofile(gal_geology.path.."/gal_geology_node_registration.lua")

	dofile(gal_geology.path.."/gal_geology_testnode.lua")

	--dofile(gal_geology.path.."/gal_geology_caves.lua")

	dofile(gal_geology.path.."/gal_geology_liquid_containers.lua")

	dofile(gal_geology.path.."/gal_geology_vessels.lua")

	dofile(gal_geology.path.."/gal_geology_fire.lua")

	dofile(gal_geology.path.."/gal_geology_craftitems.lua")

	dofile(gal_geology.path.."/gal_geology_craftrecipes.lua")

		--dofile(gal_geology.path.."/gal_geology_schematics.lua")

	dofile(gal_geology.path.."/gal_geology_biomes.lua")

	dofile(gal_geology.path.."/gal_geology_ores.lua")

	dofile(gal_geology.path.."/gal_geology_ecosystems.lua")

	dofile(gal_geology.path.."/gal_geology_decorations.lua")

	dofile(gal_geology.path.."/gal_geology_abms.lua")

	dofile(gal_geology.path.."/gal_geology_chatcommands.lua")
--
	--if gal_geology.enable_waterdynamics == true then
	--	dofile(gal_geology.path.."/gal_geology_water_dynamics.lua")
	--end

	--if gal_geology.enable_waterfalls == true then
	--	dofile(gal_geology.path.."/gal_geology_waterfalls.lua")
	--end

	gal.mapgen.update_biomes()

	gal.mapgen.c_air				= minetest.get_content_id("air")
	gal.mapgen.c_ignore				= minetest.get_content_id("ignore")
	
	gal.mapgen.c_top				= minetest.get_content_id("gal:dirt_with_grass")
	gal.mapgen.c_filler				= minetest.get_content_id("gal:dirt")
	gal.mapgen.c_stone				= minetest.get_content_id("gal:stone")
	gal.mapgen.c_water				= minetest.get_content_id("gal:liquid_water_source")
	gal.mapgen.c_river				= minetest.get_content_id("gal:liquid_water_river_source")
	gal.mapgen.c_gravel				= minetest.get_content_id("gal:stone_gravel")
	
	gal.mapgen.c_lava				= minetest.get_content_id("gal:liquid_lava_source")
	gal.mapgen.c_ice				= minetest.get_content_id("gal:ice")
	gal.mapgen.c_mud				= minetest.get_content_id("gal:dirt_mud_01")
	
	gal.mapgen.c_cobble				= minetest.get_content_id("gal:stone_cobble")
	gal.mapgen.c_mossy				= minetest.get_content_id("gal:stone_cobble_mossy")
	gal.mapgen.c_block				= minetest.get_content_id("gal:stone_block")
	gal.mapgen.c_brick				= minetest.get_content_id("gal:stone_brick")
	gal.mapgen.c_sand				= minetest.get_content_id("gal:sand")
	gal.mapgen.c_dirt				= minetest.get_content_id("gal:dirt")
	gal.mapgen.c_dirtperm				= minetest.get_content_id("gal:dirt_permafrost")
	gal.mapgen.c_dirtgrass				= minetest.get_content_id("gal:dirt_with_grass")


	minetest.register_alias("mapgen_stone", "gal:stone")
	minetest.register_alias("mapgen_water_source", "gal:liquid_water_source")
	minetest.register_alias("mapgen_river_water_source", "gal:liquid_water_river_source")


minetest.log(S("[MOD] gal_geology:  Successfully loaded."))





