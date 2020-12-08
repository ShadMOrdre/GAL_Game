

local MODPATH = minetest.get_modpath("medieval")
medieval = {}

--formspec background
medieval.formbg = (gal.gui.gui_bg or "")..
	(gal.gui.gui_bg_img or "")..
	(gal.gui.gui_slots or "")


-- Load other files --

--dofile(MODPATH.."/mod_files/coloured_glass.lua")
--dofile(MODPATH.."/mod_files/bars_and_plaster.lua") 
dofile(MODPATH.."/mod_files/medieval_tools.lua")
dofile(MODPATH.."/mod_files/nodes.lua")
dofile(MODPATH.."/mod_files/signs.lua")
