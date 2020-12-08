
lib_climbing = {}
lib_climbing.name = "lib_climbing"
lib_climbing.ver_max = 0
lib_climbing.ver_min = 1
lib_climbing.ver_rev = 0
lib_climbing.ver_str = lib_climbing.ver_max .. "." .. lib_climbing.ver_min .. "." .. lib_climbing.ver_rev
lib_climbing.authorship = "shadmordre"
lib_climbing.license = "LGLv2.1"
lib_climbing.copyright = "2019"
lib_climbing.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_climbing.path_world = minetest.get_worldpath()

--lib_climbing.intllib = minetest.setting_get("lib_climbing_engine_translation") or false

local S
local NS
--if not lib_climbing.intllib then
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		-- S = function(s) return s end
		-- internationalization boilerplate
		S, NS = dofile(lib_climbing.path_mod.."/intllib.lua")
	end
--else
--	S = minetest.get_translator(lib_climbing.name)
--end

lib_climbing.intllib = S

minetest.log(S("[MOD] lib_climbing:  Loading..."))
minetest.log(S("[MOD] lib_climbing:  Version:") .. S(lib_climbing.ver_str))
minetest.log(S("[MOD] lib_climbing:  Legal Info: Copyright ") .. S(lib_climbing.copyright) .. " " .. S(lib_climbing.authorship) .. "")
minetest.log(S("[MOD] lib_climbing:  License: ") .. S(lib_climbing.license) .. "")






	

	dofile(lib_climbing.path_mod.."/lib_climbing_nodes.lua")
	





minetest.log(S("[MOD] lib_climbing:  Successfully loaded."))




























