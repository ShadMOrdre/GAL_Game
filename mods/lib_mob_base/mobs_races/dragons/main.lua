--thanks to diriel, blert2112 and taikedz 

mobs_races.dragon = {}

--dofile(minetest.get_modpath("dmobs").."/dragons/piloting.lua")
dofile(mobs_races.path.."/dragons/piloting.lua")

local tamed_dragons = {}

--items and tools

minetest.register_craftitem("mobs_races:dragon_gem_lightning", {
	description = "Lightning Gem",
	inventory_image = "dmobs_gem_lightning.png"
})
minetest.register_craftitem("mobs_races:dragon_gem_ice", {
	description = "Ice Gem",
	inventory_image = "dmobs_gem_ice.png"
})
minetest.register_craftitem("mobs_races:dragon_gem_fire", {
	description = "Fire Gem",
	inventory_image = "dmobs_gem_fire.png"
})
minetest.register_craftitem("mobs_races:dragon_gem_poison", {
	description = "Poison Gem",
	inventory_image = "dmobs_gem_poison.png"
})

minetest.register_craftitem("mobs_races:dragon_gem", {
	description = "Dragon Gem",
	inventory_image = "dmobs_gem.png"
})


--spawns and eggs
--moved to spawn.lua

