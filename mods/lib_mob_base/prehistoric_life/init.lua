
local path = minetest.get_modpath("prehistoric_life")

-- Mob Items
--dofile(path .. "/api.lua")
dofile(path .. "/crafts.lua")

-- Tamed
dofile(path .. "/tamed/tyrannosaurus_tamed.lua")
dofile(path .. "/tamed/spinosaurus_tamed.lua")
dofile(path .. "/tamed/allosaurus_tamed.lua")
dofile(path .. "/tamed/velociraptor_tamed.lua")
dofile(path .. "/tamed/triceratops_tamed.lua")

-- Dinosaurs
dofile(path .. "/tyrannosaurus.lua")
dofile(path .. "/spinosaurus.lua")
dofile(path .. "/allosaurus.lua")
dofile(path .. "/velociraptor.lua")
dofile(path .. "/triceratops.lua")

-- Modern Animals
dofile(path .. "/nautilus.lua")

print ("[MOD] Mobs Redo loaded")
