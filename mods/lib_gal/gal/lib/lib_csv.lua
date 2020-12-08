
--CSV library

gal.lib.csv = {}
gal.lib.csv.name = "lib_csv"
gal.lib.csv.path = gal.lib.path .. "/lib_csv"
gal.lib.csv.ver_maj = 0
gal.lib.csv.ver_min = 0
gal.lib.csv.ver_rev = 1

gal.lib.csv.read = dofile(gal.lib.csv.path .. "/lib_csv_read.lua")

gal.lib.csv.load = dofile(gal.lib.csv.path .. "/lib_csv_load.lua")

gal.lib.csv.save = dofile(gal.lib.csv.path .. "/lib_csv_save.lua")


gal.lib.csv.load_modpath = dofile(gal.lib.csv.path .. "/lib_csv_load_default.lua")

gal.lib.csv.save_modpath = dofile(gal.lib.csv.path .. "/lib_csv_save_default.lua")



