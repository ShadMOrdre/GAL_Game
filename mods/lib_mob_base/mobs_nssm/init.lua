
local path = minetest.get_modpath("mobs_nssm")

-- mobs
dofile(path .. "/ant_soldier.lua")
dofile(path .. "/ant_worker.lua")
dofile(path .. "/black_widow.lua")
dofile(path .. "/crocodile.lua")
--dofile(path .. "/moonheron.lua")
dofile(path .. "/octopus.lua")
dofile(path .. "/sandworm.lua")
dofile(path .. "/spider.lua")
dofile(path .. "/tarantula.lua")
--dofile(path .. "/tarantula_ridable.lua")
dofile(path .. "/uloboros.lua")
dofile(path .. "/werewolf.lua")
dofile(path .. "/white_werewolf.lua")

-- items
dofile(path .. "/mobs_nssm_materials.lua")

-- where do mobs spawn
dofile(path .. "/spawn.lua")
