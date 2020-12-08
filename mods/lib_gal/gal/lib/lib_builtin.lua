
--BuiltIn Library

gal.lib.builtin = {}
gal.lib.builtin.name = "lib_builtin"
gal.lib.builtin.path = gal.lib.path .. "/lib_builtin"
gal.lib.builtin.ver_maj = 0
gal.lib.builtin.ver_min = 0
gal.lib.builtin.ver_rev = 1



gal.lib.builtin.item_drop = dofile(gal.lib.builtin.path .. "/lib_builtin_item_drops.lua")

gal.lib.builtin.item_drop = dofile(gal.lib.builtin.path .. "/lib_builtin_item_entity.lua")

gal.lib.builtin.item_drop = dofile(gal.lib.builtin.path .. "/lib_builtin_item_falling.lua")



