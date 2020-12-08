
lib_general = {}

local _lib_general = {}



function lib_general.register_nodes(node_name, node_desc, node_texture, node_craft_mat, node_sounds)

--CONNECTED LINKS

	lib_general.register_linkage_050x050(node_name .. "_linkage_050x050", node_desc .. "Linkage 1/2", node_texture, node_craft_mat, node_sounds)
	lib_general.register_linkage_025x025(node_name .. "_linkage_025x025", node_desc .. "Linkage 1/4", node_texture, node_craft_mat, node_sounds)
	lib_general.register_linkage_round_050x050(node_name .. "_linkage_round_050x050", node_desc .. "Linkage Round 1/2", node_texture, node_craft_mat, node_sounds)
	lib_general.register_linkage_round_025x025(node_name .. "_linkage_round_025x025", node_desc .. "Linkage Round 1/4", node_texture, node_craft_mat, node_sounds)

--CYLINDERS

	lib_general.register_cylinder_100_height_100_width(node_name .. "_cylinder_100_height_100_width", node_desc .. "Cylinder", node_texture, node_craft_mat, node_sounds)
	lib_general.register_cylinder_100_height_075_width(node_name .. "_cylinder_100_height_075_width", node_desc .. "Cylinder 3/4", node_texture, node_craft_mat, node_sounds)
	lib_general.register_cylinder_100_height_050_width(node_name .. "_cylinder_100_height_050_width", node_desc .. "Cylinder 1/2", node_texture, node_craft_mat, node_sounds)
	lib_general.register_cylinder_100_height_025_width(node_name .. "_cylinder_100_height_025_width", node_desc .. "Cylinder 1/4", node_texture, node_craft_mat, node_sounds)


	
end


lib_general.register_linkage_050x050 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_architecture", "group:lib_doors", "group:lib_fences", "group:lib_general", "group:lib_lights" },
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "connected",
			fixed = {
				{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
			},
			connect_front = {
				{-0.25, -0.25, -0.5, 0.25, 0.25, -0.25},
			},
			connect_back = {
				{-0.25, -0.25, 0.25, 0.25, 0.25, 0.5},
			},
			connect_left = {
				{-0.5, -0.25, -0.25, -0.25, 0.25, 0.25},
			},
			connect_right = {
				{0.25, -0.25, -0.25, 0.5, 0.25, 0.25},
			},
			connect_bottom = {
				{-0.25, -0.5, -0.25, 0.25, -0.25, 0.25},
			},
			connect_top = {
				{-0.25, 0.25, -0.25, 0.25, 0.5, 0.25},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_linkage_050x050", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_linkage_025x025= function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_architecture", "group:lib_doors", "group:lib_fences", "group:lib_general", "group:lib_lights"},
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "connected",
			fixed = {
				{-0.125, -0.125, -0.125, 0.125, 0.125, 0.125},
			},
			connect_front = {
				{-0.125, -0.125, -0.5, 0.125, 0.125, -0.125},
			},
			connect_back = {
				{-0.125, -0.125, 0.125, 0.125, 0.125, 0.5},
			},
			connect_left = {
				{-0.5, -0.125, -0.125, -0.125, 0.125, 0.125},
			},
			connect_right = {
				{0.125, -0.125, -0.125, 0.5, 0.125, 0.125},
			},
			connect_bottom = {
				{-0.125, -0.5, -0.125, 0.125, -0.125, 0.125},
			},
			connect_top = {
				{-0.125, 0.125, -0.125, 0.125, 0.5, 0.125},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_linkage_025x025", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_linkage_round_050x050 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_architecture", "group:lib_doors", "group:lib_fences", "group:lib_general", "group:lib_lights"},
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "connected",
			fixed = {
				{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
			},
			connect_front = {
				{-0.25, -0.125, -0.5, 0.25, 0.125, -0.25}, -- Front_h_zneg
				{-0.125, -0.25, -0.5, 0.125, 0.25, -0.25}, -- Front_v_zneg
			},
			connect_back = {
				{-0.25, -0.125, 0.25, 0.25, 0.125, 0.5}, -- Back_h_zpos
				{-0.125, -0.25, 0.25, 0.125, 0.25, 0.5}, -- Back_v_zpos
			},
			connect_left = {
				{-0.5, -0.125, -0.25, -0.25, 0.125, 0.25}, -- Left_h_xneg
				{-0.5, -0.25, -0.125, -0.25, 0.25, 0.125}, -- Left_v_xneg
			},
			connect_right = {
				{0.25, -0.125, -0.25, 0.5, 0.125, 0.25}, -- Right_h_xpos
				{0.25, -0.25, -0.125, 0.5, 0.25, 0.125}, -- Right_v_xpos
			},
			connect_bottom = {
				{-0.125, -0.5, -0.25, 0.125, -0.25, 0.25}, -- Bottom_z_yneg
				{-0.25, -0.5, -0.125, 0.25, -0.25, 0.125}, -- Bottom_x_yneg
			},
			connect_top = {
				{-0.125, 0.25, -0.25, 0.125, 0.5, 0.25}, -- Top_z_ypos
				{-0.25, 0.25, -0.125, 0.25, 0.5, 0.125}, -- Top_x_ypos
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_linkage_round_050x050", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_linkage_round_025x025 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_architecture", "group:lib_doors", "group:lib_fences", "group:lib_general", "group:lib_lights"},
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "connected",
			fixed = {
				{-0.125, -0.0625, -0.0625, 0.125, 0.0625, 0.0625}, -- Base_x
				{-0.0625, -0.125, -0.0625, 0.0625, 0.125, 0.0625}, -- Base_y
				{-0.0625, -0.0625, -0.125, 0.0625, 0.0625, 0.125}, -- Base_z
			},
			connect_front = {
				{-0.125, -0.0625, -0.5, 0.125, 0.0625, -0.0625}, -- Front_h_zneg
				{-0.0625, -0.125, -0.5, 0.0625, 0.125, -0.0625}, -- Front_v_zneg
			},
			connect_back = {
				{-0.125, -0.0625, 0.0625, 0.125, 0.0625, 0.5}, -- Back_h_zpos
				{-0.0625, -0.125, 0.0625, 0.0625, 0.125, 0.5}, -- Back_v_zpos
			},
			connect_left = {
				{-0.5, -0.0625, -0.125, -0.0625, 0.0625, 0.125}, -- Left_h_xneg
				{-0.5, -0.125, -0.0625, -0.0625, 0.125, 0.0625}, -- Left_v_xneg
			},
			connect_right = {
				{0.0625, -0.0625, -0.125, 0.5, 0.0625, 0.125}, -- Right_h_xpos
				{0.0625, -0.125, -0.0625, 0.5, 0.125, 0.0625}, -- Right_v_xpos
			},
			connect_bottom = {
				{-0.125, -0.5, -0.0625, 0.125, -0.0625, 0.0625}, -- Bottom_x_yneg
				{-0.0625, -0.5, -0.125, 0.0625, -0.0625, 0.125}, -- Bottom_z_yneg
			},
			connect_top = {
				{-0.125, 0.0625, -0.0625, 0.125, 0.5, 0.0625}, -- Top_x_ypos
				{-0.0625, 0.0625, -0.125, 0.0625, 0.5, 0.125}, -- Top_z_ypos
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_linkage_round_025x025", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_general.register_cylinder_100_height_100_width = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_general" },
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5},
				{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
				{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
				{-0.3125, -0.5, -0.4375, 0.3125, 0.5, 0.4375},
				{-0.4375, -0.5, -0.3125, 0.4375, 0.5, 0.3125},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_cylinder_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_cylinder_100_height_075_width = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_general" },
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
				{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
				{-0.25, -0.5, -0.3125, 0.25, 0.5, 0.3125},
				{-0.3125, -0.5, -0.25, 0.3125, 0.5, 0.25},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.375,-0.5,-0.375,0.375,0.5,0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.375,-0.5,-0.375,0.375,0.5,0.375},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_cylinder_100_height_075_width", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_cylinder_100_height_050_width = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_general" },
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.125, 0.25, 0.5, 0.125}, -- Front_h_zneg
				{-0.125, -0.5, -0.25, 0.125, 0.5, 0.25}, -- Back_h_zpos
				{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox16
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25,-0.5,-0.25,0.25,0.5,0.25},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.25,-0.5,-0.25,0.25,0.5,0.25},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_cylinder_100_height_050_width", ''},
			{ '', wall_mat, ''},
		}
	})

end
lib_general.register_cylinder_100_height_025_width = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node("lib_general:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_general" },
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2, lib_general = 1 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, -0.0625, 0.125, 0.5, 0.0625}, -- Front_h_zneg
				{-0.0625, -0.5, -0.125, 0.0625, 0.5, 0.125}, -- Back_h_zpos
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.125,-0.5,-0.125,0.125,0.5,0.125},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.125,-0.5,-0.125,0.125,0.5,0.125},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_general:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_cylinder_100_height_025_width", ''},
			{ '', wall_mat, ''},
		}
	})

end



lib_general.register_nodes("steelblock", "Steel ", "default_steel_block.png",
		"default:steelblock", default.node_sound_metal_defaults())
lib_general.register_nodes("copperblock", "Copper ", "default_copper_block.png",
		"default:copperblock", default.node_sound_metal_defaults())
lib_general.register_nodes("tinblock", "Tin ", "default_tin_block.png",
		"default:tinblock", default.node_sound_metal_defaults())
lib_general.register_nodes("bronzeblock", "Bronze ", "default_bronze_block.png",
		"default:bronzeblock", default.node_sound_metal_defaults())
lib_general.register_nodes("goldblock", "Gold ", "default_gold_block.png",
		"default:goldblock", default.node_sound_stone_defaults())
lib_general.register_nodes("diamondblock", "Diamond ", "default_diamond_block.png",
		"default:diamondblock", default.node_sound_stone_defaults())

lib_general.register_nodes("glass", "Glass ", "default_glass.png",
		"default:glass", default.node_sound_stone_defaults())




--[[
lib_general.register_nodes("cobble", "Cobblestone ", "default_cobble.png",
		"default:cobble", default.node_sound_stone_defaults())
lib_general.register_nodes("mossycobble", "Mossy Cobblestone ", "default_mossycobble.png",
		"default:mossycobble", default.node_sound_stone_defaults())
lib_general.register_nodes("desertcobble", "Desert Cobblestone ", "default_desert_cobble.png",
		"default:desert_cobble", default.node_sound_stone_defaults())

--]]

lib_general.register_nodes("sandstone", "Sandstone ", "default_sandstone.png",
		"default:sandstone", default.node_sound_stone_defaults())
lib_general.register_nodes("desert_stone", "Desert Stone ", "default_desert_stone.png",
		"default:desert_stone", default.node_sound_stone_defaults())
lib_general.register_nodes("stone", "Stone ", "default_stone.png",
		"default:stone", default.node_sound_stone_defaults())
lib_general.register_nodes("obsidian", "Obsidian ", "default_obsidian.png",
		"default:obsidian", default.node_sound_stone_defaults())


--[[
lib_general.register_nodes("sandstone_block", "Sandstone Block ", "default_sandstone_block.png",
		"default:sandstone_block", default.node_sound_stone_defaults())
lib_general.register_nodes("desert_stone_block", "Desert Stone Block ", "default_desert_stone_block.png",
		"default:desert_stone_block", default.node_sound_stone_defaults())
lib_general.register_nodes("stone_block", "Stone Block ", "default_stone_block.png",
		"default:stone_block", default.node_sound_stone_defaults())
lib_general.register_nodes("obsidian_block", "Obsidian Block ", "default_obsidian_block.png",
		"default:obsidian_block", default.node_sound_stone_defaults())

lib_general.register_nodes("sandstone_brick", "Sandstone Brick ", "default_sandstone_brick.png",
		"default:sandstonebrick", default.node_sound_stone_defaults())
lib_general.register_nodes("desertstone_brick", "Desert Stone Brick ", "default_desert_stone_brick.png",
		"default:desert_stonebrick", default.node_sound_stone_defaults())
lib_general.register_nodes("stone_brick", "Stone Brick ", "default_stone_brick.png",
		"default:stonebrick", default.node_sound_stone_defaults())
lib_general.register_nodes("obsidian_brick", "Obsidian Brick ", "default_obsidian_brick.png",
		"default:obsidianbrick", default.node_sound_stone_defaults())


lib_general.register_nodes("glass", "Glass ", "default_glass.png",
		"default:glass", default.node_sound_stone_defaults())
lib_general.register_nodes("tree", "Tree ", "default_tree.png",
		"default:tree", default.node_sound_stone_defaults())
lib_general.register_nodes("wood", "Wood ", "default_wood.png",
		"default:wood", default.node_sound_stone_defaults())
lib_general.register_nodes("jungletree", "Jungle Tree ", "default_jungletree.png",
		"default:jungletree", default.node_sound_stone_defaults())
lib_general.register_nodes("junglewood", "Jungle Wood ", "default_junglewood.png",
		"default:junglewood", default.node_sound_stone_defaults())

lib_general.register_nodes("acacia_tree", "Acacia Tree ", "default_acacia_tree.png",
		"default:acacia_tree", default.node_sound_stone_defaults())
lib_general.register_nodes("acacia_wood", "Acacia Wood ", "default_acacia_wood.png",
		"default:acacia_wood", default.node_sound_stone_defaults())

--]]





