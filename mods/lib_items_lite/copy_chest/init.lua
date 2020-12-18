local infinite_chest_formspec =
	"size[8,6]" ..
	gal.gui.gui_bg ..
	gal.gui.gui_bg_img ..
	gal.gui.gui_slots ..
	'label[2.5,-0.2;Input]' ..
	"list[context;put_in;2.5,0.3;1,1;]" ..
	"list[current_player;main;0,1.85;8,1;]" ..
	"list[current_player;main;0,3.08;8,3;8]" ..
	"listring[current_player;main]" ..
	"listring[context;put_in]" ..
	"listring[current_player;main]" ..
	'label[4.5,-0.2;Output]' ..
	"list[context;take_from;4.5,0.3;1,1;]" ..
	"listring[context;take_from]" ..
	"listring[current_player;main]" ..
	gal.gui.get_hotbar_bg(0,1.85)

local function get_infinite_chest_formspec(inv)
	local formspec = infinite_chest_formspec
	return formspec
end

minetest.register_node("copy_chest:chest", {
	description = "Copy Chest",
	tiles = {"default_chest_top.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	--sounds = default.node_sound_wood_defaults(),
	sounds = gal.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(nil))
		meta:set_string( 'infotext', ('Copy Chest'))
		local inv = meta:get_inventory()
		inv:set_size('put_in', 1 * 1)
		inv:set_size('take_from', 1 * 1)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to copy chest at " .. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from copy chest at " .. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(meta:get_inventory()))
	end,
})

minetest.register_abm({
	nodenames = {'copy_chest:chest'},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack('put_in', 1)
		local item = stack:get_name('put_in')
		if inv:is_empty('take_from') and not inv:is_empty('put_in') then
			inv:add_item('take_from', stack)
		end
	end
})

if minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil then
	hopper:add_container({
		{"top", "copy_chest:chest", "take_from"},
	})
end