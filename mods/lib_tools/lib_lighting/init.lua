
lib_lighting = {}
lib_lighting.name = "lib_lighting"
lib_lighting.ver_max = 0
lib_lighting.ver_min = 1
lib_lighting.ver_rev = 0
lib_lighting.ver_str = lib_lighting.ver_max .. "." .. lib_lighting.ver_min .. "." .. lib_lighting.ver_rev
lib_lighting.authorship = "shadmordre"
lib_lighting.license = "LGLv2.1"
lib_lighting.copyright = "2019"
lib_lighting.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_lighting.path_world = minetest.get_worldpath()


lib_lighting.intllib = gal.intllib
local S = lib_lighting.intllib


minetest.log(S("[MOD] lib_lighting:  Loading..."))
minetest.log(S("[MOD] lib_lighting:  Version:") .. S(lib_lighting.ver_str))
minetest.log(S("[MOD] lib_lighting:  Legal Info: Copyright ") .. S(lib_lighting.copyright) .. " " .. S(lib_lighting.authorship) .. "")
minetest.log(S("[MOD] lib_lighting:  License: ") .. S(lib_lighting.license) .. "")





	

	dofile(lib_lighting.path_mod.."/lib_lighting_nodes.lua")
	





minetest.log(S("[MOD] lib_lighting:  Successfully loaded."))




























