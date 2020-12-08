--ALL CODE LICENSED LGPLv2.1 by Shad MOrdre
--	(shadmordre@minetest.net, shadmordre@gmail.com) aka Steven Merchant.  Copyright 2019

lib_handtools = {}

lib_handtools.version = "1.0"

-- path to all lib_handtools code
lib_handtools.path = minetest.get_modpath(minetest.get_current_modname())

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_handtools.path.."/intllib.lua")
	end
end
lib_handtools.intllib = S

minetest.log(S("[MOD] lib_handtools:  Loading..."))


dofile(lib_handtools.path.."/lib_handtools_stoneage.lua")




dofile(lib_handtools.path.."/lib_handtools_schem_tool.lua")




--dofile(lib_handtools.path.."/lib_handtools_testnode.lua")










minetest.log(S("[MOD] lib_handtools:  Successfully loaded."))
