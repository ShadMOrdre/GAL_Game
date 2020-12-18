
--mobs_animals_2

-- the mod object
mobs_animals_2 = {}
mobs_animals_2.version = "1.0"
mobs_animals_2.path = minetest.get_modpath(minetest.get_current_modname())

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(mobs_animals_2.path.."/intllib.lua")
	end
end
mobs_animals_2.intllib = S

minetest.log(S("[MOD]: mobs_animals_2:  Loading..."))


--Materials
dofile(mobs_animals_2.path .. "/ma2_materials.lua")


-- Animals
dofile(mobs_animals_2.path .. "/ma2_ammonites.lua")
dofile(mobs_animals_2.path .. "/ma2_arachnid.lua") -- farlands game
dofile(mobs_animals_2.path .. "/ma2_badger.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_bat.lua") -- Model and textures from Defense Subgame	License of defense mod GPL	License of media (models, textures ) (CC BY-SA 3.0)  Sounds from bigsoundbank and WTFPL ( confirmed by email )
dofile(mobs_animals_2.path .. "/ma2_bears.lua")
dofile(mobs_animals_2.path .. "/ma2_birds.lua") -- CC-BY-SA 3.0, Author sapier
dofile(mobs_animals_2.path .. "/ma2_birds_small.lua")
dofile(mobs_animals_2.path .. "/ma2_butterflies.lua") -- Model/Textures: unknown	Author: AspireMint	texture modification by: blert2112
dofile(mobs_animals_2.path .. "/ma2_butterfly.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_cat.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/ma2_chicken2.lua") -- farlands game
dofile(mobs_animals_2.path .. "/ma2_cows.lua") -- mob_cows	MIT License (MIT)	Copyright (c) 2014 Krupnov Pavel and 2016 TenPlus1
dofile(mobs_animals_2.path .. "/ma2_crocodile.lua") -- Model/Textures: GPL v3	Author: Team NPX
dofile(mobs_animals_2.path .. "/ma2_deer.lua") -- PilzAdam
dofile(mobs_animals_2.path .. "/ma2_dolphin.lua")
dofile(mobs_animals_2.path .. "/ma2_elephant.lua") -- PilzAdam
--dofile(mobs_animals_2.path .. "/ma2_equines_01.lua") -- KrupnoPavel
dofile(mobs_animals_2.path .. "/ma2_equines_02.lua") -- KrupnoPavel
dofile(mobs_animals_2.path .. "/ma2_equines_03.lua") -- farlands game
dofile(mobs_animals_2.path .. "/ma2_fish.lua") -- Model/Textures: CC-BY-SA 3.0	Author: Sapier
dofile(mobs_animals_2.path .. "/ma2_fish_02.lua")
dofile(mobs_animals_2.path .. "/ma2_fox.lua") -- ExeterDad
dofile(mobs_animals_2.path .. "/ma2_goat.lua") --GrailTest
dofile(mobs_animals_2.path .. "/ma2_hedgehog.lua") -- Jordach/BFD
dofile(mobs_animals_2.path .. "/ma2_horse.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/ma2_jeraf.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_jellyfish.lua") -- WTFPL Author: blert2112	Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
dofile(mobs_animals_2.path .. "/ma2_llama.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/ma2_mammoth.lua") -- farlands game
--dofile(mobs_animals_2.path .. "/ma2_medved.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_mule.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/ma2_owl.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ostrich.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_panda.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_parrot.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/penguin.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_pig.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_pig_evil.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_pirana.lua")
--dofile(mobs_animals_2.path .. "/ma2_polar_bear.lua") -- farlands game
dofile(mobs_animals_2.path .. "/ma2_rabbit.lua") -- ShadMOrdre
dofile(mobs_animals_2.path .. "/ma2_sharks.lua") -- Model/Textures:	CC-BY-SA 3.0	Author: Sapier	texture modification by: blert2112
dofile(mobs_animals_2.path .. "/ma2_sheep.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_smilodon.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_tortoise.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_trilobyte.lua")
dofile(mobs_animals_2.path .. "/ma2_turtles.lua") -- Model/textures: unknown	Author: AspireMint
dofile(mobs_animals_2.path .. "/walrus.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_wasps.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_whale.lua") -- D00Med
dofile(mobs_animals_2.path .. "/ma2_wolf.lua") -- D00Med

dofile(mobs_animals_2.path .. "/spawn.lua") -- ShadMOrdre


--print (S("[MOD] Mobs Redo 'Animals 2' loaded"))
minetest.log(S("[MOD]: mobs_animals_2:  Successfully Loaded."))

