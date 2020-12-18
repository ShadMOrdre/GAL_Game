
lib_armor = {}
lib_armor.name = "lib_armor"
lib_armor.ver_max = 0
lib_armor.ver_min = 0
lib_armor.ver_rev = 1
lib_armor.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_armor.path_world = minetest.get_worldpath()


-- Intllib
local S
local NS
if minetest.get_modpath("gal") then
	S = gal.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_armor.path_mod.."/intllib.lua")
	end
end
lib_armor.intllib = S

minetest.log(S("[MOD] lib_armor:  Loading..."))

	function lib_armor.node_sound_defaults(table)
		table = table or {}
		table.footstep = table.footstep or
				{name = "", gain = 1.0}
		table.dug = table.dug or
				{name = "default_dug_node", gain = 0.25}
		table.place = table.place or
				{name = "default_place_node_hard", gain = 1.0}
		return table
	end
	
	function lib_armor.node_sound_wood_defaults(table)
		table = table or {}
		table.footstep = table.footstep or
				{name = "default_wood_footstep", gain = 0.3}
		table.dug = table.dug or
				{name = "default_wood_footstep", gain = 1.0}
		gal.node_sound_defaults(table)
		return table
	end
	
	
	
	--dofile(lib_armor.path_mod .. "/armor_config.lua")
	dofile(lib_armor.path_mod .. "/armor.lua")
	dofile(lib_armor.path_mod .. "/wieldview.lua")
	dofile(lib_armor.path_mod .. "/armor_stand.lua")
	
	
	
	--if not minetest.global_exists("sfinv") then
	--	minetest.log("warning", S("3d_armor_sfinv: Mod loaded but unused."))
	--	return
	--end
	
	gal.sfinv.register_page("lib_armor:armor", {
		title = S("Armor"),
		get = function(self, player, context)
			local name = player:get_player_name()
			local formspec = gal.player.armor:get_armor_formspec(name, true)
			return gal.sfinv.make_formspec(player, context, formspec, false)
		end
	})
	
	gal.player.armor:register_on_update(function(player)
		if gal.sfinv.enabled then
			gal.sfinv.set_player_inventory_formspec(player)
		end
	end)



minetest.log(S("[MOD] lib_armor:  Successfully loaded."))

