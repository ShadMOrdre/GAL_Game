-------------------------------------------------------------
-- lib_ecology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------

-- the mod object
gal_ecology_trees = {}
gal_ecology_trees.name = "gal_ecology_trees"
gal_ecology_trees.ver_max = 5
gal_ecology_trees.ver_min = 0
gal_ecology_trees.ver_rev = 2
gal_ecology_trees.ver_str = gal_ecology_trees.ver_max .. "." .. gal_ecology_trees.ver_min .. "." .. gal_ecology_trees.ver_rev
gal_ecology_trees.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, VannessaE, runs, and numerous others."
gal_ecology_trees.license = "LGLv2.1"
gal_ecology_trees.copyright = "2019"
gal_ecology_trees.path_mod = minetest.get_modpath(minetest.get_current_modname())
gal_ecology_trees.path_world = minetest.get_worldpath()
gal_ecology_trees.path = gal_ecology_trees.path_mod


-- Intllib
gal_ecology_trees.intllib = gal.intllib
local S = gal.intllib



minetest.log(S("[MOD] gal_ecology_trees:  Loading..."))
minetest.log(S("[MOD] gal_ecology_trees:  Version:") .. S(gal_ecology_trees.ver_str))
minetest.log(S("[MOD] gal_ecology_trees:  Legal Info: Copyright ") .. S(gal_ecology_trees.copyright) .. " " .. S(gal_ecology_trees.authorship) .. "")
minetest.log(S("[MOD] gal_ecology_trees:  License: ") .. S(gal_ecology_trees.license) .. "")


gal_ecology_trees.nodes_data_file = "gal_ecology_trees_nodes"
gal_ecology_trees.decorations_data_file = "gal_trees_plants_decorations"
gal_ecology_trees.craftitem_file = "gal_ecology_trees_craftitem"
gal_ecology_trees.craftrecipe_file = "gal_ecology_trees_craftrecipe"


gal_ecology_trees.time_factor = 10
gal_ecology_trees.mgv7_mapgen_scale_factor = gal.mapgen.mgv7_mapgen_scale_factor or 8
gal_ecology_trees.biome_vertical_range = gal.mapgen.biome_vertical_range or 40
gal_ecology_trees.biome_vertical_blend = gal_ecology_trees.biome_vertical_range / 5

--DEFAULTS
--0, 4, 30, 60, 90, 120, 150, 1800
gal_ecology_trees.ocean_depth = gal.mapgen.ocean_depth or -192
gal_ecology_trees.beach_depth = gal.mapgen.beach_depth or -4
gal_ecology_trees.sea_level = gal.mapgen.sea_level or 0
gal_ecology_trees.maxheight_beach = gal.mapgen.maxheight_beach or 4

gal_ecology_trees.maxheight_coastal = gal_ecology_trees.sea_level + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.maxheight_lowland = gal_ecology_trees.maxheight_coastal + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.maxheight_shelf = gal_ecology_trees.maxheight_lowland + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.maxheight_highland = gal_ecology_trees.maxheight_shelf + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.maxheight_mountain = gal_ecology_trees.maxheight_highland + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.minheight_snow = gal_ecology_trees.maxheight_mountain + gal_ecology_trees.biome_vertical_range
gal_ecology_trees.maxheight_snow = gal_ecology_trees.minheight_snow  + (gal_ecology_trees.biome_vertical_range * 2)
gal_ecology_trees.maxheight_strato = gal_ecology_trees.maxheight_mountain  + (gal_ecology_trees.biome_vertical_range * (gal_ecology_trees.biome_vertical_blend / 2))

gal_ecology_trees.temperature_hot = gal.mapgen.temperature_hot or 90
gal_ecology_trees.temperature_warm = gal.mapgen.temperature_warm or 75
gal_ecology_trees.temperature_temperate = gal.mapgen.temperature_temperate or 50
gal_ecology_trees.temperature_cool = gal.mapgen.temperature_cool or 25
gal_ecology_trees.temperature_cold = gal.mapgen.temperature_cold or 10
gal_ecology_trees.humidity_humid = gal.mapgen.humidity_humid or 90
gal_ecology_trees.humidity_semihumid = gal.mapgen.humidity_semihumid or 75
gal_ecology_trees.humidity_temperate = gal.mapgen.humidity_temperate or 50
gal_ecology_trees.humidity_semiarid = gal.mapgen.humidity_semiarid or 25
gal_ecology_trees.humidity_arid = gal.mapgen.humidity_arid or 10


minetest.set_gen_notify("alternative_cave")

		-- clear default mapgen biomes, decorations and ores
		--minetest.clear_registered_biomes()
		--minetest.clear_registered_decorations()
		--minetest.clear_registered_ores()

		--gal_ecology_trees.read_csv = dofile(gal_ecology_trees.path .. "/csv.lua")
	
	gal_ecology_trees.N = {}
	gal_ecology_trees.schem = dofile(gal_ecology_trees.path.."/gal_ecology_trees_schem.lua")
	dofile(gal_ecology_trees.path.."/gal_ecology_trees_schematic.lua")

		--dofile(gal_ecology_trees.path.."/lib_ecology_sound_defaults.lua")

	dofile(gal_ecology_trees.path.."/useful_code_samples.lua")
		--dofile(gal_ecology_trees.path.."/gal_ecology_plants_utils.lua")


--Trees
	dofile(gal_ecology_trees.path.."/gal_ecology_trees_utils.lua")

	dofile(gal_ecology_trees.path.."/gal_ecology_trees_node_registration.lua")

	--dofile(gal_ecology_trees.path.."/mushrooms.lua")

	dofile(gal_ecology_trees.path.."/gal_ecology_trees_schematics.lua")

--Plants

	dofile(gal_ecology_trees.path .. "/gal_ecology_trees_craftitems.lua")

	dofile(gal_ecology_trees.path .. "/gal_ecology_trees_craftrecipes.lua")

	--minetest.clear_registered_decorations()
	dofile(gal_ecology_trees.path.."/gal_ecology_trees_deco_registration.lua")


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




minetest.log(S("[MOD]: gal_ecology_trees:  Successfully loaded."))



