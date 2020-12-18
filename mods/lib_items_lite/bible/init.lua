

minetest.register_node("bible:bible_open", {
	tiles = {
	"bible_opened_top.png",
	"bible_opened_bottom.png^[transformFY",
	"bible_opened_bottom.png^[transformFY",
	"bible_opened_bottom.png^[transformFY",
	"bible_opened_bottom.png",
	"bible_opened_bottom.png"
	},
	groups = {oddly_breakable_by_hand = 3, dig_immediate = 1, flammable = 3, not_in_creative_inventory = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 3,
	buildable_to = false,
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.3125, 0.5, -0.4375, 0.3125},
			{-0.4375, -0.4375, -0.3125, 0.4375, -0.375, 0.3125},
		}
	},
	drop = "bible:bible_closed",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string('infotext', "King James Bible");
	end,
	on_rightclick = function(pos, node, player)
		minetest.sound_play("bible_page",{pos = pos, gain = 0.5, max_hear_distance = 3})
		mt_biblebot.show_verse()
	end,
	on_punch = function(pos, node, player)
		minetest.sound_play("bible_close",{pos = pos, gain = 0.5, max_hear_distance = 3})
		minetest.swap_node(pos, {name="bible:bible_closed", param2 = node.param2})
	end,
})

minetest.register_node("bible:bible_closed", {
	description = "KJV Bible",
	inventory_image = "bible_inv.png",
	wield_image = "bible_inv.png",
	tiles = {
	"bible_closed_top.png",
	"bible_closed_bottom.png^[transformFYR90",
	"bible_closed_bottom.png^[transformFY",
	"bible_closed_bottom.png",
	"bible_closed_top.png^[transformFXR90",
	"bible_closed_top.png^[transformR90"
	},
	groups = {oddly_breakable_by_hand = 3, dig_immediate = 1, flammable = 3},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 3,
	buildable_to = false,
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.3125, 0.25, -0.25, 0.3125},
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string('infotext', "King James Bible");
	end,
	on_punch= function(pos, node, player)
		minetest.sound_play("bible_open",{pos = pos, gain = 0.5, max_hear_distance = 3})
		minetest.sound_play("bible_page",{pos = pos, gain = 0.5, max_hear_distance = 3})
		minetest.swap_node(pos, {name="bible:bible_open", param2 = node.param2})
	end,
})
