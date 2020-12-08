
gal.gui.gui_bg = "bgcolor[#080808BB;true]"
gal.gui.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
gal.gui.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function gal.gui.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

gal.gui.gui_survival_form = "size[8,8.5]"..
			gal.gui.gui_bg..
			gal.gui.gui_bg_img..
			gal.gui.gui_slots..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			gal.gui.get_hotbar_bg(0,4.25)


--if not minetest.global_exists("default") then
--	default = {}
--end
--default.gui_bg = gal.gui.gui_bg
--default.gui_bg_img = gal.gui.gui_bg_img
--default.gui_slots = gal.gui.gui_slots
--default.get_hotbar_bg = gal.gui.get_hotbar_bg
--default.gui_survival_form = gal.gui.gui_survival_form

print("Gui mod loaded")
