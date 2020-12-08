

gal.sfinv.name = "gal.sfinv"
gal.sfinv.ver_max = 0
gal.sfinv.ver_min = 1
gal.sfinv.ver_rev = 0
gal.sfinv.ver_str = gal.sfinv.ver_max .. "." .. gal.sfinv.ver_min .. "." .. gal.sfinv.ver_rev
gal.sfinv.authorship = "shadmordre, rubenwardy, bell07, and others.  See credits.txt"
gal.sfinv.license = "LGLv2.1"
gal.sfinv.copyright = "2020"
gal.sfinv.path_mod = gal.path_mod .. "/sfinv"
gal.sfinv.path_world = gal.path_world

local S = gal.intllib
gal.sfinv.intllib = gal.intllib

minetest.log(S("[MOD] gal.sfinv:  Loading..."))
minetest.log(S("[MOD] gal.sfinv:  Version:") .. S(gal.sfinv.ver_str))
minetest.log(S("[MOD] gal.sfinv:  Legal Info: Copyright ") .. S(gal.sfinv.copyright) .. " " .. S(gal.sfinv.authorship) .. "")
minetest.log(S("[MOD] gal.sfinv:  License: ") .. S(gal.sfinv.license) .. "")



	dofile(gal.sfinv.path_mod.."/sfinv_api.lua")
	dofile(gal.sfinv.path_mod.."/sfinv_init.lua")


	gal.sfinv.creative = {}
	dofile(gal.sfinv.path_mod.."/creative_init.lua")
	dofile(gal.sfinv.path_mod.."/player_gamemode_init.lua")


	gal.sfinv.smart_sfinv_api = {}
	dofile(gal.sfinv.path_mod.."/smart_sfinv_api.lua")
	dofile(gal.sfinv.path_mod.."/smart_sfinv_creative_bymod_init.lua")
	dofile(gal.sfinv.path_mod.."/smart_sfinv_creative_sitebar_init.lua")
	dofile(gal.sfinv.path_mod.."/smart_sfinv_tweaks_init.lua")

	dofile(gal.sfinv.path_mod.."/sfinv_buttons_init.lua")


	dofile(gal.sfinv.path_mod.."/inventory_chatcommands.lua")
	--dofile(gal.sfinv.path_mod.."/inventory_chatcommands.lua")




	--minetest.register_on_mods_loaded(function()

	--end)



minetest.log(S("[MOD] gal.sfinv:  Successfully loaded."))




























