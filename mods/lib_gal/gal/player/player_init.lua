

gal.player.name = "gal.player"
gal.player.ver_max = 0
gal.player.ver_min = 1
gal.player.ver_rev = 0
gal.player.ver_str = gal.player.ver_max .. "." .. gal.player.ver_min .. "." .. gal.player.ver_rev
gal.player.authorship = "shadmordre, Brandon_Reese"
gal.player.license = "LGLv2.1"
gal.player.copyright = "2020"
gal.player.path_mod = gal.path_mod .. "/player"
gal.player.path_world = gal.path_world

gal.player.engine_translation = minetest.setting_get("lib_player_engine_translation") or false
gal.player.lite = minetest.setting_get("player_lite") or true
--gal.player.lite = false

local S = gal.intllib
gal.player.intllib = gal.intllib



minetest.log(S("[MOD] gal.player:  Loading..."))
minetest.log(S("[MOD] gal.player:  Version:") .. S(gal.player.ver_str))
minetest.log(S("[MOD] gal.player:  Legal Info: Copyright ") .. S(gal.player.copyright) .. " " .. S(gal.player.authorship) .. "")
minetest.log(S("[MOD] gal.player:  License: ") .. S(gal.player.license) .. "")



	gal.player.randomChance = function (percent) 
		--math.randomseed( os.clock() )
		return percent >= ( math.random(1000, 100000) / 1000 )
	end

	gal.player.drop_item = function(pos,itemstack,vel,acc)
		local x = math.random(0, 15)/10 - 0.5
		local z = math.random(0, 15)/10 - 0.5
		--local y = math.random(0, 15)/10 - 2
		local np = { }
		np.x = pos.x + x
		np.z = pos.z + z
		np.y = pos.y + .25
		local obj = minetest.add_item(np, itemstack)
		if obj then
			obj:get_luaentity().collect = true
			if vel ~= nil and acc ~= nil then
				obj:get_luaentity().object:setvelocity(vel)
				obj:get_luaentity().object:setacceleration(acc)
			end
		end
	end

	dofile(gal.player.path_mod.."/player_hand.lua")
	dofile(gal.player.path_mod.."/sethome_init.lua")
	dofile(gal.player.path_mod.."/sneakglitch_init.lua")
	dofile(gal.player.path_mod.."/spawnpoint_init.lua")

	dofile(gal.player.path_mod.."/player_functions.lua")
	dofile(gal.player.path_mod.."/cmsg_init.lua")
	
	dofile(gal.player.path_mod.."/player_api_api.lua")
	dofile(gal.player.path_mod.."/player_api_init.lua")
	
	dofile(gal.player.path_mod.."/appearance_init.lua")
	dofile(gal.player.path_mod.."/armor_api.lua")
	
	dofile(gal.player.path_mod.."/hud_init.lua")
	
	dofile(gal.player.path_mod.."/hunger_init.lua")

	dofile(gal.player.path_mod.."/sprint_init.lua")
	

	--if not gal.player.lite then

		----dofile(gal.player.path_mod.."/thirsty_init.lua")
	
		dofile(gal.player.path_mod.."/whoison_init.lua")
	
		dofile(gal.player.path_mod.."/player_data_init.lua")
	
		dofile(gal.player.path_mod.."/player_stats_init.lua")
	
		dofile(gal.player.path_mod.."/physics_init.lua")
	
		dofile(gal.player.path_mod.."/affects_init.lua")
	
		dofile(gal.player.path_mod.."/energy_init.lua")
	
		----dofile(gal.player.path_mod.."/sickness_init.lua")
	
		dofile(gal.player.path_mod.."/skills_init.lua")
	
		dofile(gal.player.path_mod.."/xp_init.lua")

		dofile(gal.player.path_mod.."/proficiencies_init.lua")
		
		dofile(gal.player.path_mod.."/mana_init.lua")

		dofile(gal.player.path_mod.."/magic_init.lua")
		
		dofile(gal.player.path_mod.."/experience_init.lua")
	
	
		dofile(gal.player.path_mod.."/player_register_functions.lua")

	--end




	minetest.register_on_mods_loaded(function()

	end)



minetest.log(S("[MOD] gal.player:  Successfully loaded."))




























