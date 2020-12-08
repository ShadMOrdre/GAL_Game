--ALL CODE LICENSED LGPLv2.1 by Shad MOrdre
--	(shadmordre@minetest.net, shadmordre@gmail.com) aka Steven Merchant.  Copyright 2019

lib_pottery = {}

lib_pottery.version = "1.0"

-- path to all lib_pottery code
lib_pottery.path = minetest.get_modpath(minetest.get_current_modname())

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_pottery.path.."/intllib.lua")
	end
end
lib_pottery.intllib = S

minetest.log(S("[MOD] lib_pottery:  Loading..."))


-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.

lib_pottery.dyes = {
	{"white",      "White",      "basecolor_white"},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}


dofile(lib_pottery.path.."/lib_pottery_vase.lua")
--dofile(lib_pottery.path.."/lib_pottery_bowl.lua")


minetest.log(S("[MOD] lib_pottery:  Successfully loaded."))
