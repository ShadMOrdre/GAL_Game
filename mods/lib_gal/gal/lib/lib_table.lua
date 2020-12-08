
--Table Library

gal.lib.table = {}
gal.lib.table.name = "table"
gal.lib.table.path = gal.lib.path .. "/lib_table"
gal.lib.table.ver_maj = 0
gal.lib.table.ver_min = 0
gal.lib.table.ver_rev = 1

gal.lib.table.contains_substring = dofile(gal.lib.table.path .. "/lib_table_contains_substring.lua")