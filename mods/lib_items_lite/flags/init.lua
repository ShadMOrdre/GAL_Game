
flags = {}
flags.modpath = minetest.get_modpath("flags");

--dofile(flags.modpath .. "/flag_func.lua")

-- The flag
		-- The following lines were removed from the node def below for the flag pole node.
				-- on_punch = flags.on_punch,
				-- on_rightclick = flags.on_rightclick,
				-- on_construct = flags.on_construct,
		-- The following lines were removed from the node def below for the flag node.
				-- on_punch = flags.on_punch_top,
				-- on_rightclick = flags.on_rightclick_top,

minetest.register_node("flags:white", {
	description = "White Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_silver2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_white"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s white flag")
	end
})
minetest.register_node("flags:flag_top_white",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_silver2.png",
		"flag_silver.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:white",
	recipe = {
		{"default:stick", "wool:white"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:red", {
	description = "Red Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_red2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_red"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s red flag")
	end
})
minetest.register_node("flags:flag_top_red",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_red2.png",
		"flag_red.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:red",
	recipe = {
		{"default:stick", "wool:red"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:blue", {
	description = "Blue Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_blue2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_blue"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s blue flag")
	end
})
minetest.register_node("flags:flag_top_blue",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_blue2.png",
		"flag_blue.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:blue",
	recipe = {
		{"default:stick", "wool:blue"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:green", {
	description = "Green Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_green2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_green"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s green flag")
	end
})
minetest.register_node("flags:flag_top_green",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_green2.png",
		"flag_green.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:green",
	recipe = {
		{"default:stick", "wool:green"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:yellow", {
	description = "Yellow Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_yellow2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_yellow"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s yellow flag")
	end
})
minetest.register_node("flags:flag_top_yellow",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_yellow2.png",
		"flag_yellow.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:yellow",
	recipe = {
		{"default:stick", "wool:yellow"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:black", {
	description = "Black Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_black2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_black"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s black flag")
	end
})
minetest.register_node("flags:flag_top_black",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_black2.png",
		"flag_black.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:black",
	recipe = {
		{"default:stick", "wool:black"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:gray", {
	description = "Gray Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_gray2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_gray"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s gray flag")
	end
})
minetest.register_node("flags:flag_top_gray",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_gray2.png",
		"flag_gray.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:gray",
	recipe = {
		{"default:stick", "wool:gray"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:cyan", {
	description = "Cyan Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_cyan2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_cyan"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s cyan flag")
	end
})
minetest.register_node("flags:flag_top_cyan",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_cyan2.png",
		"flag_cyan.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:cyan",
	recipe = {
		{"default:stick", "wool:cyan"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:gold", {
	description = "Gold Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_gold2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_gold"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s gold flag")
	end
})
minetest.register_node("flags:flag_top_gold",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_gold2.png",
		"flag_gold.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:gold",
	recipe = {
		{"default:stick", "wool:gold"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:orange", {
	description = "orange Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_orange2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_orange"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s orange flag")
	end
})
minetest.register_node("flags:flag_top_orange",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_orange2.png",
		"flag_orange.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:orange",
	recipe = {
		{"default:stick", "wool:orange"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})

minetest.register_node("flags:pink", {
	description = "Pink Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_pink2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_pink"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s pink flag")
	end
})
minetest.register_node("flags:flag_top_pink",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_pink2.png",
		"flag_pink.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:pink",
	recipe = {
		{"default:stick", "wool:pink"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})


minetest.register_node("flags:purple", {
	description = "Purple Flag",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	inventory_image = "flag_purple2.png",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_bottom=1},
	after_place_node = function(pos, placer)
		local name = placer:get_player_name()
		if not pos or not name then
			minetest.set_node(pos, {name="air"})
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			minetest.set_node(pos, {name="air"})
			return
		end

		local pos2 = {
			x = pos.x,
			y = pos.y + 1,
			z = pos.z
		}

		minetest.set_node(pos2, {name="flags:flag_top_purple"})

		local meta2 = minetest.get_meta(pos2)

		meta2:set_string("infotext", name.."'s purple flag")
	end
})
minetest.register_node("flags:flag_top_purple",{
	description = "You are not meant to have this! - flag top",
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"flag_purple2.png",
		"flag_purple.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
			{-0.5,0,0.000000,0.250000,0.500000,0.062500}
		}
	},
	groups = {is_flag=1,flag_top=1,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = "flags:purple",
	recipe = {
		{"default:stick", "wool:purple"},
		{"default:stick", "",},
		{"default:stick", ""}
	}
})









--[[

for color, _ in pairs(ctf.flag_colors) do
	minetest.register_node("ctf_flag:flag_top_"..color,{
		description = "You are not meant to have this! - flag top",
		drawtype="nodebox",
		paramtype = "light",
		walkable = false,
		tiles = {
			"default_wood.png",
			"default_wood.png",
			"default_wood.png",
			"default_wood.png",
			"flag_"..color.."2.png",
			"flag_"..color..".png"
		},
		node_box = {
			type = "fixed",
			fixed = {
				{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500},
				{-0.5,0,0.000000,0.250000,0.500000,0.062500}
			}
		},
		groups = {immortal=1,is_flag=1,flag_top=1,not_in_creative_inventory=1},
		on_punch = ctf_flag.on_punch_top,
		on_rightclick = ctf_flag.on_rightclick_top
	})
end

minetest.register_node("ctf_flag:flag_captured_top",{
	description = "You are not meant to have this! - flag captured",
	drawtype = "nodebox",
	paramtype = "light",
	walkable = false,
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.250000,-0.500000,0.000000,0.312500,0.500000,0.062500}
		}
	},
	groups = {immortal=1,is_flag=1,flag_top=1,not_in_creative_inventory=1},
	on_punch = ctf_flag.on_punch_top,
	on_rightclick = ctf_flag.on_rightclick_top
})

minetest.register_abm({
	nodenames = {"group:flag_bottom"},
	inteval = 5,
	chance = 1,
	action = ctf_flag.update
})

--]]







