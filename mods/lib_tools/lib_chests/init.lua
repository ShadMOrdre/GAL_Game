
lib_chests = {}
lib_chests.name = "lib_chests"
lib_chests.ver_max = 0
lib_chests.ver_min = 0
lib_chests.ver_rev = 1
lib_chests.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_chests.path_world = minetest.get_worldpath()


-- Intllib
local S
local NS
S, NS = dofile(lib_chests.path_mod.."/intllib.lua")
lib_chests.intllib = S or minetest.get_translator(lib_chests.name)

minetest.log(S("[MOD] lib_chests:  Loading..."))

	function lib_chests.node_sound_defaults(table)
		table = table or {}
		table.footstep = table.footstep or
				{name = "", gain = 1.0}
		table.dug = table.dug or
				{name = "default_dug_node", gain = 0.25}
		table.place = table.place or
				{name = "default_place_node_hard", gain = 1.0}
		return table
	end
	
	function lib_chests.node_sound_wood_defaults(table)
		table = table or {}
		table.footstep = table.footstep or
				{name = "default_wood_footstep", gain = 0.3}
		table.dug = table.dug or
				{name = "default_wood_footstep", gain = 1.0}
		gal.node_sound_defaults(table)
		return table
	end

	dofile(lib_chests.path_mod .. "/chest.lua")

	dofile(lib_chests.path_mod .. "/lib_chests_connected.lua")

	dofile(lib_chests.path_mod .. "/chest_functions.lua")


	if minetest.global_exists("default") then
		--Alias default chests to new definitions.
			minetest.register_alias("default:chest", "lib_chests:chest")
			minetest.register_alias("default:chest_locked", "lib_chests:chest_locked")
	end

	--if not minetest.global_exists("default") then
	--	default = {}
	--end

	--Aliases default functionality to new definitions.
		--default.chest = lib_chests.chest
		--default.chest.chest_lid_obstructed = lib_chests.chest.chest_lid_obstructed
		--default.chest.chest_lid_close = lib_chests.chest.chest_lid_close
	
		--default.chest.open_chests = lib_chests.chest.open_chests
	
		--default.register_chest = lib_chests.chest.register_chest
		--default.chest.register_chest = lib_chests.chest.register_chest



minetest.log(S("[MOD] lib_chests:  Successfully loaded."))

