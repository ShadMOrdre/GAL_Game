
-- Animals

--dofile(minetest.get_modpath("mobs_soldiers").."/wolf.lua") -- KrupnoPavel
dofile(minetest.get_modpath("mobs_soldiers").."/dog.lua") -- CProgrammerRU

-- Monsters

--dofile(minetest.get_modpath("pmobs").."/ninja.lua") -- CProgrammerRU
--dofile(minetest.get_modpath("pmobs").."/yeti.lua") -- TenPlus1

-- NPC
--dofile(minetest.get_modpath("pmobs").."/npc.lua") -- TenPlus1
--dofile(minetest.get_modpath("pmobs").."/npc_women.lua") -- CProgrammerRU (texture by TenPlus1)
--dofile(minetest.get_modpath("pmobs").."/npc_nurse.lua") -- CProgrammerRU
dofile(minetest.get_modpath("mobs_soldiers").."/guard.lua") -- CProgrammerRU
dofile(minetest.get_modpath("mobs_soldiers").."/archer.lua") -- CProgrammerRU

dofile(minetest.get_modpath("mobs_soldiers").."/throwing.lua")
dofile(minetest.get_modpath("mobs_soldiers").."/arrow.lua")
dofile(minetest.get_modpath("mobs_soldiers").."/fire_arrow.lua")


if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs_soldiers loaded")
end

