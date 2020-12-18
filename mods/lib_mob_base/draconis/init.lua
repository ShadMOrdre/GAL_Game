draconis = {}

local path = minetest.get_modpath("draconis")

-- Items
dofile(path .. "/craftitems.lua")
dofile(path .. "/bestiary.lua")

-- Nodes
dofile(path .. "/nodes.lua")

-- Mobs
dofile(path .. "/mobs/fire_dragon.lua")
dofile(path .. "/mobs/fire_wyvern.lua")
dofile(path .. "/mobs/ice_wyvern.lua")
dofile(path .. "/mobs/jungle_wyvern.lua")

-- Nests
dofile(path .. "/nests.lua")

-- ABMs
dofile(path .. "/abms.lua")

-- Map Generation
dofile(path .. "/spawn_lairs.lua")
dofile(path .. "/spawn.lua")

minetest.log("action", "[MOD] Draconis v0.11 Beta loaded")
