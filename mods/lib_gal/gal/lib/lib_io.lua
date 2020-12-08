
--IO Library

gal.lib.io = {}
gal.lib.io.name = "lib_io"
gal.lib.io.path = gal.lib.path .. "/lib_io"
gal.lib.io.ver_maj = 0
gal.lib.io.ver_min = 0
gal.lib.io.ver_rev = 1


gal.lib.io.get_file_list = dofile(gal.lib.io.path .. "/lib_io_get_file_list.lua")

gal.lib.io.get_file_list_by_type = dofile(gal.lib.io.path .. "/lib_io_get_file_list_by_type.lua")


gal.lib.io.load = dofile(gal.lib.io.path .. "/lib_io_load.lua")

gal.lib.io.save = dofile(gal.lib.io.path .. "/lib_io_save.lua")


