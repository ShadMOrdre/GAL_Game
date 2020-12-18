-- the mod object
mobs_races = {}
mobs_races.version = "1.0"
mobs_races.path = minetest.get_modpath(minetest.get_current_modname())

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(mobs_races.path.."/intllib.lua")
	end
end
mobs_races.intllib = S

minetest.log(S("[MOD]: mobs_races:  Loading..."))

mobs_races.dragons = true
mobs_races.regulars = true
mobs_races.destructive = false
mobs_races.eggtimer = 100


-- Table cloning to reduce code repetition
mobs_races.deepclone = function(t) -- deep-copy a table -- from https://gist.github.com/MihailJP/3931841
	if type(t) ~= "table" then return t end

	local target = {}

	for k, v in pairs(t) do
		if k ~= "__index" and type(v) == "table" then -- omit circular reference
			target[k] = mobs_races.deepclone(v)
		else
			target[k] = v
		end
	end
	return target
end




dofile(mobs_races.path.."/api.lua")

dofile(mobs_races.path.."/mobs_races_barbarians.lua")
dofile(mobs_races.path.."/mobs_races_gnorm.lua")
dofile(mobs_races.path.."/mobs_races_golem.lua")
dofile(mobs_races.path.."/mobs_races_golem_friendly.lua")
dofile(mobs_races.path.."/mummy.lua")
dofile(mobs_races.path.."/ninja.lua")
dofile(mobs_races.path.."/mobs_races_ogre.lua")
dofile(mobs_races.path.."/mobs_races_orc.lua")
dofile(mobs_races.path.."/mobs_races_skeleton.lua")
dofile(mobs_races.path.."/skeleton.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(mobs_races.path.."/heads.lua") -- maikerumine
dofile(mobs_races.path.."/mobs_races_snowwalker.lua")
--dofile(mobs_races.path.."/mobs_races_snowwalkers.lua")
--dofile(mobs_races.path.."/mobs_races_witch.lua")
dofile(mobs_races.path.."/oerkki.lua")
dofile(mobs_races.path.."/mobs_races_zombie.lua")
dofile(mobs_races.path.."/mobs_races_zombie_soldier.lua")
dofile(mobs_races.path.."/mobs_races_zombie_brute.lua")

dofile(mobs_races.path.."/mobs_races_balrog.lua")
dofile(mobs_races.path.."/mobs_races_banshee.lua")
dofile(mobs_races.path.."/mobs_races_dwarves.lua")
dofile(mobs_races.path.."/mobs_races_goblins.lua")
dofile(mobs_races.path.."/mobs_races_ent.lua")

--
--dofile(mobs_races.path.."/dragons/dragon_normal.lua")
--    OR
dofile(mobs_races.path.."/dragons/main.lua")
dofile(mobs_races.path.."/dragons/dragon1.lua")
dofile(mobs_races.path.."/dragons/dragon2.lua")
dofile(mobs_races.path.."/dragons/dragon3.lua")
dofile(mobs_races.path.."/dragons/dragon4.lua")
dofile(mobs_races.path.."/dragons/great_dragon.lua")
dofile(mobs_races.path.."/dragons/mobs_races_dragon_king.lua")
dofile(mobs_races.path.."/dragons/water_dragon.lua")
dofile(mobs_races.path.."/dragons/wyvern.lua")

dofile(mobs_races.path.."/dragons/eggs.lua")

dofile(mobs_races.path.."/arrows/dragonfire.lua")
dofile(mobs_races.path.."/arrows/dragonarrows.lua")
dofile(mobs_races.path.."/arrows/fire_explosive.lua")
--    OR
--dofile(mobs_races.path.."/arrows/fire.lua")
--

dofile(mobs_races.path.."/arrows/sting.lua")

dofile(mobs_races.path.."/spawn.lua")




--golem

minetest.register_node("mobs_races:golem_stone", {
	description = "Golem Stone",
	tiles = {"dmobs_golem_stone.png",},
	groups = {cracky=1},
	on_construct = function(pos, node, _)
		local node1 = minetest.env:get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local node2 = minetest.env:get_node({x=pos.x, y=pos.y-2, z=pos.z}).name
		local node3 = minetest.env:get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		if node1 == "gal:stone" and node2 == "gal:stone" and node3 == "air" then
		minetest.env:add_entity(pos, "mobs_races:golem_friendly")
		minetest.env:remove_node({x=pos.x, y=pos.y-1, z=pos.z})
		minetest.env:remove_node({x=pos.x, y=pos.y-2, z=pos.z})
		minetest.env:remove_node({x=pos.x, y=pos.y, z=pos.z})
		end
	end,
})


minetest.log(S("[MOD]: mobs_races:  Successfully Loaded."))

