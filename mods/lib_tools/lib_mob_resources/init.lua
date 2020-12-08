
lib_mob_resources = {}
lib_mob_resources.name = "lib_mob_resources"
lib_mob_resources.ver_max = 0
lib_mob_resources.ver_min = 1
lib_mob_resources.ver_rev = 0
lib_mob_resources.ver_str = lib_mob_resources.ver_max .. "." .. lib_mob_resources.ver_min .. "." .. lib_mob_resources.ver_rev
lib_mob_resources.authorship = "shadmordre"
lib_mob_resources.license = "LGLv2.1"
lib_mob_resources.copyright = "2019"
lib_mob_resources.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_mob_resources.path_world = minetest.get_worldpath()

local S
local NS
S, NS = dofile(lib_mob_resources.path_mod.."/intllib.lua")

lib_mob_resources.intllib = S

minetest.log(S("[MOD] lib_mob_resources:  Loading..."))
minetest.log(S("[MOD] lib_mob_resources:  Version:") .. S(lib_mob_resources.ver_str))
minetest.log(S("[MOD] lib_mob_resources:  Legal Info: Copyright ") .. S(lib_mob_resources.copyright) .. " " .. S(lib_mob_resources.authorship) .. "")
minetest.log(S("[MOD] lib_mob_resources:  License: ") .. S(lib_mob_resources.license) .. "")



	
	lib_mob_resources.read_csv = dofile(lib_mob_resources.path_mod .. "/csv.lua")

	dofile(lib_mob_resources.path_mod.."/lib_mob_resources_craftitems.lua")
	




minetest.log(S("[MOD] lib_mob_resources:  Successfully loaded."))




























