
lib_forge = {}
lib_forge.name = "lib_forge"
lib_forge.ver_max = 0
lib_forge.ver_min = 0
lib_forge.ver_rev = 1
lib_forge.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_forge.path_world = minetest.get_worldpath()


-- Intllib
local S
local NS
--if minetest.get_modpath("game") then
--	S = game.intllib
--else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_forge.path_mod.."/intllib.lua")
	end
--end
lib_forge.intllib = S

minetest.log(S("[MOD] lib_forge:  Loading..."))

function lib_forge.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "default_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "default_place_node_hard", gain = 1.0}
	return table
end

function lib_forge.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_hard_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_hard_footstep", gain = 1.0}
	lib_forge.node_sound_defaults(table)
	return table
end

function lib_forge.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_glass_footstep", gain = 0.3}
	table.dig = table.dig or
			{name = "default_glass_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "default_break_glass", gain = 1.0}
	lib_forge.node_sound_defaults(table)
	return table
end

function lib_forge.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "default_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "default_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "default_place_node_metal", gain = 0.5}
	lib_forge.node_sound_defaults(table)
	return table
end

dofile(lib_forge.path_mod .. "/anvil.lua")

dofile(lib_forge.path_mod .. "/furnace.lua")
dofile(lib_forge.path_mod .. "/dual_furnace.lua")
dofile(lib_forge.path_mod .. "/blast_forge.lua")

dofile(lib_forge.path_mod .. "/lib_forge_functions.lua")


--[[
minetest.register_alias("castle:anvil", "lib_forge:anvil")
minetest.register_alias("anvil:anvil", "lib_forge:anvil")
minetest.register_alias("cottages:anvil", "lib_forge:anvil")
minetest.register_alias("castle:anvil_hammer", "lib_forge:anvil_hammer")
minetest.register_alias("anvil:anvil_hammer", "lib_forge:anvil_hammer")
minetest.register_alias("cottages:anvil_hammer", "lib_forge:anvil_hammer")

minetest.register_alias("default:furnace", "lib_forge:furnace")
minetest.register_alias("default:furnace_active", "lib_forge:furnace_active")
minetest.register_alias("furnace:furnace", "lib_forge:furnace")
minetest.register_alias("furnace:furnace_active", "lib_forge:furnace_active")
--]]

minetest.log(S("[MOD] lib_forge:  Successfully loaded."))


