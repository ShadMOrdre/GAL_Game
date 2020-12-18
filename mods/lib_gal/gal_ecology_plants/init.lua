-------------------------------------------------------------
-- lib_ecology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------

-- the mod object
gal_ecology_plants = {}
gal_ecology_plants.name = "gal_ecology_plants"
gal_ecology_plants.ver_max = 5
gal_ecology_plants.ver_min = 0
gal_ecology_plants.ver_rev = 2
gal_ecology_plants.ver_str = gal_ecology_plants.ver_max .. "." .. gal_ecology_plants.ver_min .. "." .. gal_ecology_plants.ver_rev
gal_ecology_plants.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, VannessaE, runs, and numerous others."
gal_ecology_plants.license = "LGLv2.1"
gal_ecology_plants.copyright = "2019"
gal_ecology_plants.path_mod = minetest.get_modpath(minetest.get_current_modname())
gal_ecology_plants.path_world = minetest.get_worldpath()
gal_ecology_plants.path = gal_ecology_plants.path_mod


-- Intllib
gal_ecology_plants.intllib = gal.intllib
local S = gal.intllib


minetest.log(S("[MOD] gal_ecology_plants:  Loading..."))
minetest.log(S("[MOD] gal_ecology_plants:  Version:") .. S(gal_ecology_plants.ver_str))
minetest.log(S("[MOD] gal_ecology_plants:  Legal Info: Copyright ") .. S(gal_ecology_plants.copyright) .. " " .. S(gal_ecology_plants.authorship) .. "")
minetest.log(S("[MOD] gal_ecology_plants:  License: ") .. S(gal_ecology_plants.license) .. "")


gal_ecology_plants.nodes_data_file = "gal_ecology_plants_nodes"
gal_ecology_plants.decorations_data_file = "gal_ecology_plants_decorations"
gal_ecology_plants.craftitem_file = "gal_ecology_plants_craftitem"
gal_ecology_plants.craftrecipe_file = "gal_ecology_plants_craftrecipe"


gal_ecology_plants.time_factor = 10
gal_ecology_plants.mgv7_mapgen_scale_factor = gal.mapgen.mgv7_mapgen_scale_factor or 8
gal_ecology_plants.biome_vertical_range = gal.mapgen.biome_vertical_range or 40
gal_ecology_plants.biome_vertical_blend = gal_ecology_plants.biome_vertical_range / 5

--DEFAULTS
--0, 4, 30, 60, 90, 120, 150, 1800
gal_ecology_plants.ocean_depth = gal.mapgen.ocean_depth or -192
gal_ecology_plants.beach_depth = gal.mapgen.beach_depth or -4
gal_ecology_plants.sea_level = gal.mapgen.sea_level or 0
gal_ecology_plants.maxheight_beach = gal.mapgen.maxheight_beach or 4

gal_ecology_plants.maxheight_coastal = gal_ecology_plants.sea_level + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.maxheight_lowland = gal_ecology_plants.maxheight_coastal + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.maxheight_shelf = gal_ecology_plants.maxheight_lowland + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.maxheight_highland = gal_ecology_plants.maxheight_shelf + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.maxheight_mountain = gal_ecology_plants.maxheight_highland + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.minheight_snow = gal_ecology_plants.maxheight_mountain + gal_ecology_plants.biome_vertical_range
gal_ecology_plants.maxheight_snow = gal_ecology_plants.minheight_snow  + (gal_ecology_plants.biome_vertical_range * 2)
gal_ecology_plants.maxheight_strato = gal_ecology_plants.maxheight_mountain  + (gal_ecology_plants.biome_vertical_range * (gal_ecology_plants.biome_vertical_blend / 2))

gal_ecology_plants.temperature_hot = gal.mapgen.temperature_hot or 90
gal_ecology_plants.temperature_warm = gal.mapgen.temperature_warm or 75
gal_ecology_plants.temperature_temperate = gal.mapgen.temperature_temperate or 50
gal_ecology_plants.temperature_cool = gal.mapgen.temperature_cool or 25
gal_ecology_plants.temperature_cold = gal.mapgen.temperature_cold or 10
gal_ecology_plants.humidity_humid = gal.mapgen.humidity_humid or 90
gal_ecology_plants.humidity_semihumid = gal.mapgen.humidity_semihumid or 75
gal_ecology_plants.humidity_temperate = gal.mapgen.humidity_temperate or 50
gal_ecology_plants.humidity_semiarid = gal.mapgen.humidity_semiarid or 25
gal_ecology_plants.humidity_arid = gal.mapgen.humidity_arid or 10


minetest.set_gen_notify("alternative_cave")

		-- clear default mapgen biomes, decorations and ores
		--minetest.clear_registered_biomes()
		--minetest.clear_registered_decorations()
		--minetest.clear_registered_ores()

		--gal_ecology_plants.read_csv = dofile(gal_ecology_plants.path .. "/csv.lua")
	
	--gal_ecology_plants.N = {}
	--gal_ecology_plants.schem = dofile(gal_ecology_plants.path.."/lib_ecology_schem.lua")
	--dofile(gal_ecology_plants.path.."/lib_ecology_schematic.lua")

		--dofile(gal_ecology_plants.path.."/lib_ecology_sound_defaults.lua")

	dofile(gal_ecology_plants.path.."/useful_code_samples.lua")
	dofile(gal_ecology_plants.path.."/gal_ecology_plants_utils.lua")


--Trees
		--dofile(gal_ecology_plants.path.."/lib_ecology_tree_utils.lua")

	dofile(gal_ecology_plants.path.."/gal_ecology_plants_node_registration.lua")

	dofile(gal_ecology_plants.path.."/gal_ecology_plants_mushrooms.lua")

	--dofile(gal_ecology_plants.path.."/lib_ecology_schematics.lua")

--Plants

	--dofile(gal_ecology_plants.path .. "/lib_ecology_craftitems.lua")

	--dofile(gal_ecology_plants.path .. "/lib_ecology_craftrecipes.lua")

	--dofile(gal_ecology_plants.path.."/lib_ecology_deco_registration.lua")


--[[
--v6 Mapgen Aliases
	minetest.register_alias("mapgen_tree", "lib_ecology:tree_default_trunk")
	minetest.register_alias("mapgen_leaves", "lib_ecology:tree_default_leaves")
	minetest.register_alias("mapgen_apple", "lib_ecology:fruit_apple")
	minetest.register_alias("mapgen_jungletree", "lib_ecology:tree_jungle_01_trunk")
	minetest.register_alias("mapgen_jungleleaves", "lib_ecology:tree_jungle_01_leaves")
	minetest.register_alias("mapgen_junglegrass", "lib_ecology:shrub_jungle")
	minetest.register_alias("mapgen_pine_tree", "lib_ecology:tree_pine_01_trunk")
	minetest.register_alias("mapgen_pine_needles", "lib_ecology:tree_pine_01_leaves")
--]]




minetest.log(S("[MOD]: gal_ecology_plants:  Successfully loaded."))



