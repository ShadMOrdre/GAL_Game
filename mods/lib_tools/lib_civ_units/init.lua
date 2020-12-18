
lib_civ_units = {}
lib_civ_units.name = "lib_civ_units"
lib_civ_units.ver_max = 0
lib_civ_units.ver_min = 1
lib_civ_units.ver_rev = 0
lib_civ_units.ver_str = lib_civ_units.ver_max .. "." .. lib_civ_units.ver_min .. "." .. lib_civ_units.ver_rev
lib_civ_units.authorship = "shadmordre"
lib_civ_units.license = "LGLv2.1"
lib_civ_units.copyright = "2019"
lib_civ_units.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_civ_units.path_world = minetest.get_worldpath()


lib_civ_units.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] lib_civ_units:  Loading..."))
minetest.log(S("[MOD] lib_civ_units:  Version:") .. S(lib_civ_units.ver_str))
minetest.log(S("[MOD] lib_civ_units:  Legal Info: Copyright ") .. S(lib_civ_units.copyright) .. " " .. S(lib_civ_units.authorship) .. "")
minetest.log(S("[MOD] lib_civ_units:  License: ") .. S(lib_civ_units.license) .. "")


--lite or full or empty
lib_civ_units.mode = ""



	dofile(lib_civ_units.path_mod.."/lib_civ_units_nodes.lua")



if gal.mapgen.mg_world_scale == 0.01 then
--if lib_civ_units.mode ~= "lite" then

	minetest.clear_registered_decorations()

	local __ = {name = "air",param2 = 0,prob = 254}
	local aa = {name = "air",param2 = 0,prob = 0}
	local D0 = {name = "lib_materials:dirt", param2 = 0, prob = 254}
	local T0 = {name = "lib_civ_units:tree_jungle_palm", param2 = 0, prob = 254}
	local T1 = {name = "lib_civ_units:trees_jungle_palm", param2 = 0, prob = 254}
	lib_civ_units.schem_tree = {
		size = {x = 1,y = 3,z = 1},
		data = {
			D0,
			__,
			T0
		},
		yslice_prob = {
			{prob = 254, ypos = 0},
			{prob = 254, ypos = 1},
			{prob = 254, ypos = 2}
		}
	}
	lib_civ_units.schem_trees = {
		size = {x = 1,y = 3,z = 1},
		data = {
			D0,
			__,
			T1
		},
		yslice_prob = {
			{prob = 254, ypos = 0},
			{prob = 254, ypos = 1},
			{prob = 254, ypos = 2}
		}
	}
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"group:grass", "group:soil", },
		sidelen = 80,
		fill_ratio = 0.02,
		y_min = 1,
		y_max = gal.mapgen.maxheight_highland,
		schematic = lib_civ_units.schem_tree,
		biomes = {"hot_humid", "hot_semihumid", "hot_temperate", "warm_humid", "warm_semihumid", "warm_temperate", "temperate_humid", "temperate_semihumid", "temperate_temperate", "cool_humid", "cool_semihumid", "cool_temperate", },
		flags = "force_placement, place_center_x, place_center_z",
		rotation = "random",
	})
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"group:grass", "group:soil", },
		sidelen = 80,
		fill_ratio = 0.02,
		y_min = 1,
		y_max = gal.mapgen.maxheight_highland,
		schematic = lib_civ_units.schem_trees,
		biomes = {"hot_humid", "hot_semihumid", "hot_temperate", "warm_humid", "warm_semihumid", "warm_temperate", "temperate_humid", "temperate_semihumid", "temperate_temperate", "cool_humid", "cool_semihumid", "cool_temperate", },
		flags = "force_placement, place_center_x, place_center_z",
		rotation = "random",
	})
end


minetest.log(S("[MOD] lib_civ_units:  Successfully loaded."))




























