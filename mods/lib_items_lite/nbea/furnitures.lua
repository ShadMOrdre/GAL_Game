screwdriver = screwdriver or {}



minetest.register_node("nbea:deco_desk_left", {
	description = "Desk (left)",
    tiles = {"default_pine_wood.png",
        "default_pine_wood.png",
        "default_pine_wood.png^[transformFYR90",
        "default_pine_wood.png^[transformFXR90",
        "default_pine_wood.png^[transformR90",
        "default_pine_wood.png"
    },
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.375, 0.4375, 0.5, 0.4375, 0.5},
			{-0.375, -0.375, -0.4375, -0.3125, 0.4375, 0.5},
			{-0.375, -0.0625, -0.4375, 0.4375, 0.0625, 0.4375},
			{0.4375, -0.375, -0.4375, 0.5, 0.4375, 0.5},
			{-0.4375, -0.4375, -0.4375, 0.5, -0.375, 0.5},
			{-0.4375, 0.375, -0.4375, 0.5, 0.4375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{-0.299199, -0.375, -0.419976, 0.418879, 0.375, -0.367285},
			{-0.0625, -0.25, -0.460269, 0.125, -0.1875, -0.375},
			{-0.0625, 0.1875, -0.460269, 0.125, 0.25, -0.375},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
})

minetest.register_node("nbea:deco_desk_right", {
	description = "Desk (right)",
    tiles = {"default_pine_wood.png",
        "default_pine_wood.png",
        "default_pine_wood.png^[transformFYR90",
        "default_pine_wood.png^[transformFXR90",
        "default_pine_wood.png^[transformR90",
        "default_pine_wood.png"
    },
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, 0.4375, 0.4375, 0.375, 0.5},
			{0.3125, -0.4375, -0.4375, 0.375, 0.375, 0.5},
			{-0.4375, -0.0625, -0.4375, 0.375, 0.0625, 0.4375},
			{-0.5, -0.4375, -0.4375, -0.4375, 0.375, 0.5},
			{-0.5, 0.375, -0.4375, 0.4375, 0.4375, 0.5},
			{-0.5, -0.4375, -0.4375, 0.4375, -0.375, 0.5},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.418879, -0.375, -0.419976, 0.299199, 0.375, -0.367285},
			{-0.125, 0.1875, -0.460269, 0.0625, 0.25, -0.375},
			{-0.125, -0.25, -0.460269, 0.0625, -0.1875, -0.375},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
})

minetest.register_node("nbea:deco_desk_center", {
	description = "Desk",
    inventory_image = "nbea_desk_inv.png",
    wield_image = "nbea_desk_inv.png",
    tiles = {"default_pine_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
    drop = "",
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.4375, 0.5, 0.4375, 0.5},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
  after_place_node =function(pos, placer)
		local wheretoplace = minetest.dir_to_facedir(placer:get_look_dir())
		local p1 = {x=pos.x, y=pos.y, z=pos.z} -- player's left
		local p2 = {x=pos.x, y=pos.y, z=pos.z} -- player's right
		if wheretoplace == 0 then --facing direction z
			p1 = {x=pos.x-1, y=pos.y, z=pos.z}  -- -x
			p2 = {x=pos.x+1, y=pos.y, z=pos.z} -- x
		elseif wheretoplace == 1 then -- facing direction x
			p1 = {x=pos.x, y=pos.y, z=pos.z+1}  -- +z
			p2 = {x=pos.x, y=pos.y, z=pos.z-1} -- -z
		elseif wheretoplace == 2 then -- facing direction -z
			p1 = {x=pos.x+1, y=pos.y, z=pos.z}  -- x
			p2 = {x=pos.x-1, y=pos.y, z=pos.z}  -- -x
		else  -- facing direction -x
			p1 = {x=pos.x, y=pos.y, z=pos.z-1}  -- -z
			p2 = {x=pos.x, y=pos.y, z=pos.z+1}  -- +z
		end
		local n1 = minetest.get_node(p1)
		local n2 = minetest.get_node(p2)
			if n1.name == "air" then
				minetest.add_node(p1,{name="nbea:deco_desk_left", param2=minetest.dir_to_facedir(placer:get_look_dir())})
			end
			if n2.name == "air" then
				minetest.add_node(p2,{name="nbea:deco_desk_right", param2=minetest.dir_to_facedir(placer:get_look_dir())})
			end
		end,
})

minetest.register_node("nbea:deco_dresser_left", {
	description = "dresser (left)",
    tiles = {"default_pine_wood.png",
        "default_pine_wood.png",
        "default_pine_wood.png^[transformFYR90",
        "default_pine_wood.png^[transformFXR90",
        "default_pine_wood.png^[transformR90",
        "default_pine_wood.png"
    },
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.4375, -0.4375, -0.4375, 0.5, -0.375, 0.5},
			{-0.375, -0.375, -0.375, -0.3125, 0.5, 0.4375},
			{-0.375, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{0.4375, -0.5, -0.3125, 0.5, 0.5, 0.4375},
			{-0.4375, 0.4375, -0.375, 0.5, 0.5, 0.5},
			{-0.3125, 0, -0.375, 0.5, 0.0625, 0.5},
			{-0.300761, 0.0804026, -0.343648, 0.5, 0.426752, -0.306013},
			{-0.300761, -0.358719, -0.343648, 0.5, -0.015462, -0.306013},
			{0, -0.1875, -0.375, 0.1875, -0.125, -0.332196},
			{0, 0.25, -0.375, 0.1875, 0.3125, -0.332196},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
})

minetest.register_node("nbea:deco_dresser_right", {
	description = "dresser (right)",
    tiles = {"default_pine_wood.png",
        "default_pine_wood.png",
        "default_pine_wood.png^[transformFYR90",
        "default_pine_wood.png^[transformFXR90",
        "default_pine_wood.png^[transformR90",
        "default_pine_wood.png"
    },
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.4375, -0.4375, 0.4375, -0.375, 0.5},
			{0.3125, -0.375, -0.375, 0.375, 0.5, 0.4375},
			{-0.5, -0.5, 0.4375, 0.375, 0.5, 0.5},
			{-0.5, -0.5, -0.3125, -0.4375, 0.5, 0.4375},
			{-0.5, 0.4375, -0.375, 0.4375, 0.5, 0.5},
			{-0.5, 0, -0.375, 0.3125, 0.0625, 0.5},
			{-0.5, 0.080403, -0.343648, 0.289648, 0.426752, -0.306013},
			{-0.5, -0.358719, -0.343648, 0.289648, -0.015462, -0.306013},
			{-0.125, -0.1875, -0.375, 0.0625, -0.125, -0.332196},
			{-0.125, 0.25, -0.375, 0.0625, 0.3125, -0.332196},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
})

minetest.register_node("nbea:deco_dresser_center", {
	description = "dresser",
    inventory_image = "nbea_dresser_inv.png",
    wield_image = "nbea_dresser_inv.png",
    tiles = {"default_pine_wood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
    drop = "",
	groups = {oddly_breakable_by_hand=1, choppy = 3},
	sounds = gal.node_sound_wood_defaults(),
    on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, -0.4375, 0.5},
			{-0.5, -0.4375, -0.375, 0.5, -0.375, 0.5},
			{0.4375, -0.375, -0.3125, 0.5, 0.5, 0.4375},
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.3125, -0.4375, 0.5, 0.4375},
			{-0.5, 0.4375, -0.375, 0.5, 0.5, 0.5},
			{-0.5, 0, -0.375, 0.5, 0.0625, 0.4375},
			{-0.5, 0.080403, -0.343648, 0.5, 0.426752, -0.306013},
			{-0.5, -0.358719, -0.343648, 0.5, -0.015462, -0.306013},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
  after_place_node =function(pos, placer)
		local wheretoplace = minetest.dir_to_facedir(placer:get_look_dir())
		local p1 = {x=pos.x, y=pos.y, z=pos.z} -- player's left
		local p2 = {x=pos.x, y=pos.y, z=pos.z} -- player's right
		if wheretoplace == 0 then --facing direction z
			p1 = {x=pos.x-1, y=pos.y, z=pos.z}  -- -x
			p2 = {x=pos.x+1, y=pos.y, z=pos.z} -- x
		elseif wheretoplace == 1 then -- facing direction x
			p1 = {x=pos.x, y=pos.y, z=pos.z+1}  -- +z
			p2 = {x=pos.x, y=pos.y, z=pos.z-1} -- -z
		elseif wheretoplace == 2 then -- facing direction -z
			p1 = {x=pos.x+1, y=pos.y, z=pos.z}  -- x
			p2 = {x=pos.x-1, y=pos.y, z=pos.z}  -- -x
		else  -- facing direction -x
			p1 = {x=pos.x, y=pos.y, z=pos.z-1}  -- -z
			p2 = {x=pos.x, y=pos.y, z=pos.z+1}  -- +z
		end
		local n1 = minetest.get_node(p1)
		local n2 = minetest.get_node(p2)
			if n1.name == "air" then
				minetest.add_node(p1,{name="nbea:deco_dresser_left", param2=minetest.dir_to_facedir(placer:get_look_dir())})
			end
			if n2.name == "air" then
				minetest.add_node(p2,{name="nbea:deco_dresser_right", param2=minetest.dir_to_facedir(placer:get_look_dir())})
			end
		end,
})

minetest.register_node("nbea:deco_pedestal", {
	description = "Pedestal",
    tiles = {"default_coral_skeleton.png"},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {oddly_breakable_by_hand=1, cracky = 3},
	sounds = gal.node_sound_stone_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{0.4375, 0.3125, -0.4375, 0.5, 0.5, 0.4375},
			{-0.5, 0.3125, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, 0.3125, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
			{-0.3125, -0.3125, -0.375, 0.3125, 0.3125, 0.375},
			{-0.4375, 0.25, -0.4375, 0.4375, 0.3125, 0.4375},
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.25, 0.4375},
			{-0.375, -0.5, -0.3125, 0.375, 0.25, 0.3125},
		},
	},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
})
