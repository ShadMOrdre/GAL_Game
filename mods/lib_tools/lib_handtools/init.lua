
lib_handtools = {}
lib_handtools.name = "lib_handtools"
lib_handtools.ver_max = 0
lib_handtools.ver_min = 0
lib_handtools.ver_rev = 1
lib_handtools.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_handtools.path_world = minetest.get_worldpath()


-- Intllib
lib_handtools.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] lib_handtools:  Loading..."))

function lib_handtools.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "default_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "default_place_node_hard", gain = 1.0}
	return table
end

function lib_handtools.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_wood_footstep", gain = 1.0}
	lib_materials.node_sound_defaults(table)
	return table
end


--dofile(lib_handtools.path_mod.."/lib_handtools_toolcap_modifier.lua")
--dofile(lib_handtools.path_mod.."/lib_handtools_tool_ranks.lua")


		--lib_handtools.read_csv = dofile(lib_handtools.path_mod .. "/csv.lua")

	dofile(lib_handtools.path_mod.."/lib_handtools_overrides.lua")

	dofile(lib_handtools.path_mod.."/lib_handtools_tools.lua")

	dofile(lib_handtools.path_mod.."/lib_handtools_campfire.lua")
	dofile(lib_handtools.path_mod.."/lib_handtools_bonfire.lua")

	dofile(lib_handtools.path_mod.."/lib_handtools_schem_tool.lua")


	dofile(lib_handtools.path_mod.."/lib_handtools_craftrecipes.lua")





minetest.log(S("[MOD] lib_handtools:  Successfully loaded."))




























