-- Advanced NPC mod by Zorman2000
--Renamed to a_npc by ShadMOrdre.  This is version 1 of Zormans Adv_NPC.  Version 2 is an API, with additional mods for the NPCs.
--First Version, that had everything included.
--This version modified by ShadMOrdre, to run concurrently with API version of Advanced NPC.
local path = minetest.get_modpath("a_npc")

-- Intllib
mobs.intllib = gal.intllib
local S = gal.intllib


a_npc = {}


-- NPC
dofile(path .. "/npc_appearance.lua")
dofile(path .. "/npc.lua")
dofile(path .. "/spawner.lua")
dofile(path .. "/relationships.lua")
dofile(path .. "/dialogue.lua")
dofile(path .. "/trade/trade.lua")
dofile(path .. "/trade/prices.lua")
dofile(path .. "/actions/actions.lua")
dofile(path .. "/actions/places.lua")
dofile(path .. "/actions/pathfinder.lua")
dofile(path .. "/actions/jumper.lua")
dofile(path .. "/actions/node_registry.lua")
dofile(path .. "/random_data.lua")

dofile(path .. "/trader.lua")


print (S("[Mod] A NPC loaded"))
