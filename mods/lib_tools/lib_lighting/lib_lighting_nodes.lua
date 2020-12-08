

local S = lib_lighting.intllib





-- Candle from Wax and String/Cotton
minetest.register_node("lib_lighting:candle_small", {
	description = S("Small Candle"),
	drawtype = "plantlike",
	inventory_image = "candle_static.png",
	wield_image = "candle_static.png",
	tiles = {
		{
			name = "candle.png",
			animation={
				type="vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.0
			}
		},
	},	
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = gal.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0, 0.15 }
	},
})

--minetest.register_craft({
--	output = "lib_lighting:candle_small 2",
--	recipe = {
--		{"farming:cotton"},
--		{"lib_ecology:palm_wax"},
--		{"lib_ecology:palm_wax"},
--	}
--})










minetest.register_node("lib_lighting:lantern", {
	description = "Lantern",
	drawtype = "mesh",
	mesh = "lantern_floor.obj",
	inventory_image = "decoblocks_lantern_item.png",
	wield_image = "decoblocks_lantern_item.png",
	tiles = {{
		    name = "decoblocks_lantern.png",
		    animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "lib_lighting:lantern",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = gal.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("lib_lighting:lantern_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("lib_lighting:lantern")
		else
			fakestack:set_name("lib_lighting:lantern_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("lib_lighting:lantern")

		return itemstack
	end
})

minetest.register_abm({
	nodenames = {"lib_lighting:lantern", "lib_lighting:lantern_ceiling"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if minetest.get_timeofday() <= 0.6 and minetest.get_timeofday() >= 0.2 then
		return 
		end
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 15,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "mapgen_glow.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2.00},
			glow = 9
		})
	end
})

minetest.register_node("lib_lighting:lantern_wall", {
	drawtype = "mesh",
	mesh = "lantern_wall.obj",
	tiles = {{
		    name = "decoblocks_lantern.png",
		    animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "lib_lighting:lantern",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = gal.node_sound_wood_defaults(),
})

minetest.register_abm({
	nodenames = {"lib_lighting:lantern_wall"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if minetest.get_timeofday() <= 0.6 and minetest.get_timeofday() >= 0.2 then
		return 
		end
		local dir = minetest.facedir_to_dir(node.param2)
		--minetest.chat_send_all(dir.x.." z:"..dir.z)
		local particle_pos = {x=pos.x-0.22*dir.z*1.2, y=pos.y-0.1, z=pos.z-0.25*dir.x*1.2}
		if dir.x == 0 and dir.z == 0 then
		particle_pos = {x=pos.x, y=pos.y-0.1, z=pos.z+0.25}
		elseif dir.x == -1 and dir.z == 0 then
		particle_pos = {x=pos.x-0.25, y=pos.y-0.1, z=pos.z}
		elseif dir.x == 0 and dir.z == -1 then
		particle_pos = {x=pos.x+0.25, y=pos.y-0.1, z=pos.z}
		end
		minetest.add_particle({
			pos = particle_pos,
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 15,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "mapgen_glow.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 0.20},
			glow = 9
		})
	end
})

minetest.register_node("lib_lighting:lantern_ceiling", {
	drawtype = "mesh",
	mesh = "lantern_ceiling.obj",
	tiles = {{
		    name = "decoblocks_lantern.png",
		    animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "lib_lighting:lantern",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = gal.node_sound_wood_defaults(),
})

minetest.register_lbm({
	name = "lib_lighting:3dlantern",
	nodenames = {"lib_lighting:lantern", "lib_lighting:lantern_ceiling", "lib_lighting:lantern_wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "lib_lighting:lantern_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "lib_lighting:lantern",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "lib_lighting:lantern_wall",
				param2 = node.param2})
		end
	end
})













minetest.register_node("lib_lighting:candle", {
	description = "Candle",
	light_source = 12,
	drawtype = "torchlike",
	inventory_image = "xdecor_candle_inv.png",
	wield_image = "xdecor_candle_wield.png",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {dig_immediate=3, attached_node=1},
	tiles = {{name = "xdecor_candle_floor.png",
			animation = {type="vertical_frames", length=1.5}},
		{name = "xdecor_candle_floor.png",
			animation = {type="vertical_frames", length=1.5}},
		{name = "xdecor_candle_wall.png",
			animation = {type="vertical_frames", length=1.5}}
	},
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.25, -0.5, -0.25, 0.25, 0.1, 0.25},
		wall_bottom = {-0.25, -0.5, -0.25, 0.25, 0.1, 0.25},
		wall_side = {-0.5, -0.35, -0.15, -0.15, 0.4, 0.15}
	}
})


minetest.register_node("lib_lighting:lantern_small", {
	description = "Small Lantern",
	light_source = 13,
	drawtype = "plantlike",
	inventory_image = "xdecor_lantern_inv.png",
	wield_image = "xdecor_lantern_inv.png",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {dig_immediate=3, attached_node=1},
	tiles = {{name = "xdecor_lantern.png", animation = {type="vertical_frames", length=1.5}}},
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0, 0.15 }
	},
})





















