
-------------------------------------------------------------
-- GAL (Game Abstraction Layer)  ©2020 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------


gal = {}
gal.name = "gal"
gal.version = "1.0"
gal.ver_max = 0
gal.ver_min = 1
gal.ver_rev = 0
gal.ver_str = gal.ver_max .. "." .. gal.ver_min .. "." .. gal.ver_rev
gal.authorship = "ShadMordre and others.  See credits.txt"
gal.license = "LGLv2.1"
gal.copyright = "2020"
gal.path_mod = minetest.get_modpath(minetest.get_current_modname())
gal.path_world = minetest.get_worldpath()

-- Intllib
local S
local NS
--if minetest.get_modpath("intllib") then
--	S = intllib.Getter()
--else
	S, NS = dofile(gal.path_mod.."/intllib.lua")
--end
gal.intllib = S

minetest.log(S("[MOD] gal:  Loading..."))

--gal.world_type = minetest.settings:get("gal_world_type")
--minetest.log(S("[MOD]: gal:  Using world type " .. tostring(game.world_type)))


gal.gui = {}  --controls basic gui formspec and background images

gal.sfinv = {}  --container for sfinv and smart_sfinv and other inventory control mods

dofile(gal.path_mod .. "/gal_sound_defaults.lua")

gal.lib = {} --Provides access to libraries functions called JIT.

gal.api = {}  --provides hooks for accessing the installed APIs

gal.player = {}  --controls all aspects of player.  Sets the definition of and controls attributes of(avatar and game stats)

gal.mapgen = {}  --Provides general world data during runtime

--gal.rules = {}  --Provides a library of functions for creating the "rules" of a game based on the type of game chosen.

--gal.nodes = {}  --Provides registration and runtime access to inworld nodes


--??	assert(loadfile(modpath .. "/gal_lib.lua"))(gal.path_mod, gal.name)

--??	assert(loadfile(modpath .. "/gal_api.lua"))(gal.path_mod, gal.name)


dofile(gal.path_mod .. "/gal/gui_init.lua")

dofile(gal.path_mod .. "/sfinv/inventory_init.lua")

dofile(gal.path_mod .. "/player/player_init.lua")

dofile(gal.path_mod .. "/gal_helper_functions.lua")

dofile(gal.path_mod .. "/gal_lib.lua")

--dofile(gal.path_mod .. "/gal_api.lua")

dofile(gal.path_mod .. "/gal_mapgen.lua")




		--GAL functionality.  This is concept, not official.  May not even possilble.
		--gal.register_lib = function(name, def)
		--gal.register_api = function(name, def)
		--gal.register_player = function(player, def)
		--gal.register_ruleset = function(ruleset, def)
		
		--gal.callbacks = function(name, callbacks)





minetest.log(S("[MOD] gal:  Successfully loaded."))

