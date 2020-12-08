
lib_relic = {}

local _lib_relic = {}

lib_relic.register_cat = function()

	--minetest.register_node("lib_relic:" .. wall_name, {
	minetest.register_node("lib_relic:cat", {
		--description = wall_desc,
		description = "Cat",
		drawtype = "nodebox",
		--tiles = { wall_texture, },
		tiles = {
			"lib_relic_cat_top.png",
			"lib_relic_cat_bottom.png",
			"lib_relic_cat_side_right.png",
			"lib_relic_cat_side_left.png",
			"lib_relic_cat_back.png",
			"lib_relic_cat_front.png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { choppy = 1, fleshy = 1, lib_relic = 3, oddly_breakable_by_hand = 1 },
		--sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, 0.0625, -0.0625, -0.375, 0.125}, -- back_right_leg
				{-0.125, -0.5, -0.1875, -0.0625, -0.375, -0.125}, -- front_right_leg
				{0, -0.5, -0.1875, 0.0625, -0.375, -0.125}, -- front_left_leg
				{0, -0.5, 0.0625, 0.0625, -0.375, 0.125}, -- back_left_leg
				{-0.125, -0.375, -0.1875, 0.0625, -0.25, 0.125}, -- body
				{-0.125, -0.3125, -0.3125, 0.0625, -0.125, -0.125}, -- head
				{-0.0625, -0.3125, 0.125, 0.0, -0.25, 0.1875}, -- top_tail
				{-0.125, -0.125, -0.25, -0.0625, -0.0625, -0.1875}, -- right_ear
				{-0.0625, -0.375, 0.1875, 0.0, -0.3125, 0.3125}, -- bottom_tail
				{0, -0.125, -0.25, 0.0625, -0.0625, -0.1875}, -- left_ear
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
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
		output = "lib_relic:cat 1",
		recipe = {
			{ '', '', '' },
			{ '', "mobs:meat", ''},
			{ '', "lib_materials:sand", ''},
		}
	})

	--minetest.register_node("lib_relic:" .. wall_name, {
	minetest.register_node("lib_relic:cat_siamese", {
		--description = wall_desc,
		description = "Cat - Siamese",
		drawtype = "nodebox",
		--tiles = { wall_texture, },
		tiles = {
			"lib_relic_cat_siamese_top.png",
			"lib_relic_cat_siamese_bottom.png",
			"lib_relic_cat_siamese_side_right.png",
			"lib_relic_cat_siamese_side_left.png",
			"lib_relic_cat_siamese_back.png",
			"lib_relic_cat_siamese_front.png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { choppy = 1, fleshy = 1, lib_relic = 3, oddly_breakable_by_hand = 1 },
		--sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, 0.0625, -0.0625, -0.375, 0.125}, -- back_right_leg
				{-0.125, -0.5, -0.1875, -0.0625, -0.375, -0.125}, -- front_right_leg
				{0, -0.5, -0.1875, 0.0625, -0.375, -0.125}, -- front_left_leg
				{0, -0.5, 0.0625, 0.0625, -0.375, 0.125}, -- back_left_leg
				{-0.125, -0.375, -0.1875, 0.0625, -0.25, 0.125}, -- body
				{-0.125, -0.3125, -0.3125, 0.0625, -0.125, -0.125}, -- head
				{-0.0625, -0.3125, 0.125, 0.0, -0.25, 0.1875}, -- top_tail
				{-0.125, -0.125, -0.25, -0.0625, -0.0625, -0.1875}, -- right_ear
				{-0.0625, -0.375, 0.1875, 0.0, -0.3125, 0.3125}, -- bottom_tail
				{0, -0.125, -0.25, 0.0625, -0.0625, -0.1875}, -- left_ear
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
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
		output = "lib_relic:cat 1",
		recipe = {
			{ '', '', '' },
			{ '', "mobs:meat", ''},
			{ '', "lib_materials:dirt", ''},
		}
	})

end

lib_relic.register_cat()

function lib_relic.register_nodes(node_name, node_desc, node_texture, node_craft_mat, node_sounds)

	

--COLUMNS
	lib_relic.register_vase_large_01(node_name .. "_vase_large_01", node_desc .. "_vase_large_01", node_texture, node_craft_mat, node_sounds)
	
	lib_relic.register_vase_large_02(node_name .. "_vase_large_02", node_desc .. "_vase_large_02", node_texture, node_craft_mat, node_sounds)
	
	
	lib_relic.register_bowl(node_name .. "_bowl", node_desc .. "_bowl", node_texture, node_craft_mat, node_sounds)


	lib_relic.register_cauldron(node_name .. "_cauldron", node_desc .. "_cauldron", node_texture, node_craft_mat, node_sounds)
	
	lib_relic.register_mortar_pestle(node_name .. "_mortar_pestle", node_desc .. "_mortar_pestle", node_texture, node_craft_mat, node_sounds)
	
	


end


lib_relic.register_vase_large_01 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "mesh",
		mesh = "vase.obj",
		tiles = { wall_texture, },
		visual_scale = 0.5,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.375, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.375, 0.25},
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_column_base_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_vase_large_02 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.25, 0.125}, -- NodeBox1
				{-0.25, -0.375, -0.25, 0.25, 0.0625, 0.25}, -- NodeBox2
				{-0.3125, -0.25, -0.3125, 0.3125, 0, 0.3125}, -- NodeBox2
				{-0.1875, 0.125, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox3
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_column_base_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_bowl = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
				type = "fixed",
				fixed = {
					{-0.375, -0.5, -0.375, 0, -0.4375, 0}, -- NodeBox1
					{-0.375, -0.4375, -0.4375, 0, -0.25, -0.375}, -- NodeBox2
					{-0.375, -0.4375, 0, 0, -0.25, 0.0625}, -- NodeBox3
					{-0.4375, -0.4375, -0.375, -0.375, -0.25, 0}, -- NodeBox4
					{0, -0.4375, -0.375, 0.0625, -0.25, 0}, -- NodeBox5
					{0.1875, -0.5, 0.1875, 0.3125, -0.4375, 0.3125}, -- NodeBox6
					{0.125, -0.4375, 0.1875, 0.1875, -0.0625, 0.3125}, -- NodeBox7
					{0.3125, -0.4375, 0.1875, 0.375, -0.0625, 0.3125}, -- NodeBox8
					{0.1875, -0.4375, 0.125, 0.3125, -0.0625, 0.1875}, -- NodeBox9
					{0.1875, -0.4375, 0.3125, 0.3125, -0.0625, 0.375}, -- NodeBox10
				},
			},
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.375, -0.5, -0.375, 0, -0.4375, 0}, -- NodeBox1
					{-0.375, -0.4375, -0.4375, 0, -0.25, -0.375}, -- NodeBox2
					{-0.375, -0.4375, 0, 0, -0.25, 0.0625}, -- NodeBox3
					{-0.4375, -0.4375, -0.375, -0.375, -0.25, 0}, -- NodeBox4
					{0, -0.4375, -0.375, 0.0625, -0.25, 0}, -- NodeBox5
					{0.1875, -0.5, 0.1875, 0.3125, -0.4375, 0.3125}, -- NodeBox6
					{0.125, -0.4375, 0.1875, 0.1875, -0.0625, 0.3125}, -- NodeBox7
					{0.3125, -0.4375, 0.1875, 0.375, -0.0625, 0.3125}, -- NodeBox8
					{0.1875, -0.4375, 0.125, 0.3125, -0.0625, 0.1875}, -- NodeBox9
					{0.1875, -0.4375, 0.3125, 0.3125, -0.0625, 0.375}, -- NodeBox10
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
					{-0.375, -0.5, -0.375, 0, -0.4375, 0}, -- NodeBox1
					{-0.375, -0.4375, -0.4375, 0, -0.25, -0.375}, -- NodeBox2
					{-0.375, -0.4375, 0, 0, -0.25, 0.0625}, -- NodeBox3
					{-0.4375, -0.4375, -0.375, -0.375, -0.25, 0}, -- NodeBox4
					{0, -0.4375, -0.375, 0.0625, -0.25, 0}, -- NodeBox5
					{0.1875, -0.5, 0.1875, 0.3125, -0.4375, 0.3125}, -- NodeBox6
					{0.125, -0.4375, 0.1875, 0.1875, -0.0625, 0.3125}, -- NodeBox7
					{0.3125, -0.4375, 0.1875, 0.375, -0.0625, 0.3125}, -- NodeBox8
					{0.1875, -0.4375, 0.125, 0.3125, -0.0625, 0.1875}, -- NodeBox9
					{0.1875, -0.4375, 0.3125, 0.3125, -0.0625, 0.375}, -- NodeBox10
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_steps_open_basic_01", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_cauldron = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
				type = "fixed",
				fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
					{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
					{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
					{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
					{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
					{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
				},
			},
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
					{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
					{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
					{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
					{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
					{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
					{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
					{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
					{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
					{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
					{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
					{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_wall_100_height_050_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_mortar_pestle = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { wall_texture, },
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
					{-0.1875, -0.4375, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, -0.1875, 0.125, 0.3125}, -- NodeBox3
					{0.1875, -0.375, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox4
					{-0.3125, -0.375, -0.3125, 0.3125, 0.125, -0.1875}, -- NodeBox5
					{-0.3125, -0.375, 0.1875, 0.3125, 0.125, 0.3125}, -- NodeBox6
					{-0.1875, -0.375, -0.1875, 0.25, -0.0625, 0.1875}, -- NodeBox7
					{-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.375}, -- NodeBox8
				},
			},
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
					{-0.1875, -0.4375, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, -0.1875, 0.125, 0.3125}, -- NodeBox3
					{0.1875, -0.375, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox4
					{-0.3125, -0.375, -0.3125, 0.3125, 0.125, -0.1875}, -- NodeBox5
					{-0.3125, -0.375, 0.1875, 0.3125, 0.125, 0.3125}, -- NodeBox6
					{-0.1875, -0.375, -0.1875, 0.25, -0.0625, 0.1875}, -- NodeBox7
					{-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.375}, -- NodeBox8
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
					{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
					{-0.1875, -0.4375, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox2
					{-0.3125, -0.375, -0.3125, -0.1875, 0.125, 0.3125}, -- NodeBox3
					{0.1875, -0.375, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox4
					{-0.3125, -0.375, -0.3125, 0.3125, 0.125, -0.1875}, -- NodeBox5
					{-0.3125, -0.375, 0.1875, 0.3125, 0.125, 0.3125}, -- NodeBox6
					{-0.1875, -0.375, -0.1875, 0.25, -0.0625, 0.1875}, -- NodeBox7
					{-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.375}, -- NodeBox8
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_wall_100_height_050_width", ''},
			{ '', wall_mat, ''},
		}
	})

end




lib_relic.register_jackel_guardian = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { "nmobs_jackel_guardian_top.png",
			"nmobs_jackel_guardian_bottom.png", 
			"nmobs_jackel_guardian_right.png",
			"nmobs_jackel_guardian_left.png", 
			"nmobs_jackel_guardian_back.png",
			"nmobs_jackel_guardian_front.png", 
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
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
		output = "lib_architecture:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_geometric_stone_01_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_scorpion = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { "nmobs_scorpion_top.png",
			"nmobs_scorpion_bottom.png", 
			"nmobs_scorpion_right.png",
			"nmobs_scorpion_left.png", 
			"nmobs_scorpion_back.png",
			"nmobs_scorpion_front.png", 
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.0625, -0.375, -0.25, 0.0625, -0.25, -0.125}, -- segment4
				{-0.1, -0.4375, -0.125, 0.1, -0.25, 0}, -- segment3
				{-0.03, -0.25, -0.375, 0.03, -0.0625, -0.3125}, -- tail2
				{-0.125, -0.4375, 0, 0.125, -0.25, 0.25}, -- segment2
				{-0.1, -0.4375, 0.25, 0.1, -0.25, 0.375}, -- segment1
				{-0.03, -0.125, -0.4375, 0.03, 0.1875, -0.375}, -- tail3
				{-0.03, 0.125, -0.375, 0.03, 0.3125, -0.3125}, -- tail4
				{-0.03, 0.3125, -0.25, 0.03, 0.375, 0.0625}, -- tail6
				{-0.03, 0.25, 0, 0.03, 0.3125, 0.1875}, -- tail7
				{-0.025, 0.225, 0.1875, 0.025, 0.275, 0.25}, -- tail8
				{-0.03, 0.25, -0.3125, 0.03, 0.3125, -0.1875}, -- tail5
				{-0.0625, -0.25, -0.3125, 0.0625, -0.1875, -0.1875}, -- tail1
				{-0.3125, -0.3125, 0.1875, -0.125, -0.25, 0.25}, -- leftarm1
				{-0.3125, -0.3125, 0.25, -0.25, -0.25, 0.375}, -- leftarm2
				{-0.375, -0.3125, 0.3125, -0.3125, -0.25, 0.4375}, -- leftpincer1
				{-0.25, -0.3125, 0.3125, -0.1875, -0.25, 0.4375}, -- leftpincer2
				{0.1875, -0.3125, 0.3125, 0.25, -0.25, 0.4375}, -- rightpincer2
				{0.125, -0.3125, 0.1875, 0.3125, -0.25, 0.25}, -- rightarm1
				{0.25, -0.3125, 0.25, 0.3125, -0.25, 0.375}, -- rightarm2
				{0.3125, -0.3125, 0.3125, 0.375, -0.25, 0.4375}, -- rightpincer1
				{0.1, -0.5, -0.0625, 0.1625, -0.375, 0}, -- rightleg3
				{0.125, -0.5, 0.0625, 0.1875, -0.375, 0.125}, -- rightleg2
				{0.125, -0.5, 0.1875, 0.1875, -0.375, 0.25}, -- rightleg1
				{-0.1875, -0.5, 0.1875, -0.125, -0.375, 0.25}, -- leftleg1
				{-0.1875, -0.5, 0.0625, -0.125, -0.375, 0.125}, -- leftleg2
				{-0.1625, -0.5, -0.0625, -0.1, -0.375, 0}, -- leftleg3
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.0625, -0.375, -0.25, 0.0625, -0.25, -0.125}, -- segment4
				{-0.1, -0.4375, -0.125, 0.1, -0.25, 0}, -- segment3
				{-0.03, -0.25, -0.375, 0.03, -0.0625, -0.3125}, -- tail2
				{-0.125, -0.4375, 0, 0.125, -0.25, 0.25}, -- segment2
				{-0.1, -0.4375, 0.25, 0.1, -0.25, 0.375}, -- segment1
				{-0.03, -0.125, -0.4375, 0.03, 0.1875, -0.375}, -- tail3
				{-0.03, 0.125, -0.375, 0.03, 0.3125, -0.3125}, -- tail4
				{-0.03, 0.3125, -0.25, 0.03, 0.375, 0.0625}, -- tail6
				{-0.03, 0.25, 0, 0.03, 0.3125, 0.1875}, -- tail7
				{-0.025, 0.225, 0.1875, 0.025, 0.275, 0.25}, -- tail8
				{-0.03, 0.25, -0.3125, 0.03, 0.3125, -0.1875}, -- tail5
				{-0.0625, -0.25, -0.3125, 0.0625, -0.1875, -0.1875}, -- tail1
				{-0.3125, -0.3125, 0.1875, -0.125, -0.25, 0.25}, -- leftarm1
				{-0.3125, -0.3125, 0.25, -0.25, -0.25, 0.375}, -- leftarm2
				{-0.375, -0.3125, 0.3125, -0.3125, -0.25, 0.4375}, -- leftpincer1
				{-0.25, -0.3125, 0.3125, -0.1875, -0.25, 0.4375}, -- leftpincer2
				{0.1875, -0.3125, 0.3125, 0.25, -0.25, 0.4375}, -- rightpincer2
				{0.125, -0.3125, 0.1875, 0.3125, -0.25, 0.25}, -- rightarm1
				{0.25, -0.3125, 0.25, 0.3125, -0.25, 0.375}, -- rightarm2
				{0.3125, -0.3125, 0.3125, 0.375, -0.25, 0.4375}, -- rightpincer1
				{0.1, -0.5, -0.0625, 0.1625, -0.375, 0}, -- rightleg3
				{0.125, -0.5, 0.0625, 0.1875, -0.375, 0.125}, -- rightleg2
				{0.125, -0.5, 0.1875, 0.1875, -0.375, 0.25}, -- rightleg1
				{-0.1875, -0.5, 0.1875, -0.125, -0.375, 0.25}, -- leftleg1
				{-0.1875, -0.5, 0.0625, -0.125, -0.375, 0.125}, -- leftleg2
				{-0.1625, -0.5, -0.0625, -0.1, -0.375, 0}, -- leftleg3
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.0625, -0.375, -0.25, 0.0625, -0.25, -0.125}, -- segment4
				{-0.1, -0.4375, -0.125, 0.1, -0.25, 0}, -- segment3
				{-0.03, -0.25, -0.375, 0.03, -0.0625, -0.3125}, -- tail2
				{-0.125, -0.4375, 0, 0.125, -0.25, 0.25}, -- segment2
				{-0.1, -0.4375, 0.25, 0.1, -0.25, 0.375}, -- segment1
				{-0.03, -0.125, -0.4375, 0.03, 0.1875, -0.375}, -- tail3
				{-0.03, 0.125, -0.375, 0.03, 0.3125, -0.3125}, -- tail4
				{-0.03, 0.3125, -0.25, 0.03, 0.375, 0.0625}, -- tail6
				{-0.03, 0.25, 0, 0.03, 0.3125, 0.1875}, -- tail7
				{-0.025, 0.225, 0.1875, 0.025, 0.275, 0.25}, -- tail8
				{-0.03, 0.25, -0.3125, 0.03, 0.3125, -0.1875}, -- tail5
				{-0.0625, -0.25, -0.3125, 0.0625, -0.1875, -0.1875}, -- tail1
				{-0.3125, -0.3125, 0.1875, -0.125, -0.25, 0.25}, -- leftarm1
				{-0.3125, -0.3125, 0.25, -0.25, -0.25, 0.375}, -- leftarm2
				{-0.375, -0.3125, 0.3125, -0.3125, -0.25, 0.4375}, -- leftpincer1
				{-0.25, -0.3125, 0.3125, -0.1875, -0.25, 0.4375}, -- leftpincer2
				{0.1875, -0.3125, 0.3125, 0.25, -0.25, 0.4375}, -- rightpincer2
				{0.125, -0.3125, 0.1875, 0.3125, -0.25, 0.25}, -- rightarm1
				{0.25, -0.3125, 0.25, 0.3125, -0.25, 0.375}, -- rightarm2
				{0.3125, -0.3125, 0.3125, 0.375, -0.25, 0.4375}, -- rightpincer1
				{0.1, -0.5, -0.0625, 0.1625, -0.375, 0}, -- rightleg3
				{0.125, -0.5, 0.0625, 0.1875, -0.375, 0.125}, -- rightleg2
				{0.125, -0.5, 0.1875, 0.1875, -0.375, 0.25}, -- rightleg1
				{-0.1875, -0.5, 0.1875, -0.125, -0.375, 0.25}, -- leftleg1
				{-0.1875, -0.5, 0.0625, -0.125, -0.375, 0.125}, -- leftleg2
				{-0.1625, -0.5, -0.0625, -0.1, -0.375, 0}, -- leftleg3
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
		output = "lib_architecture:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "lib_shapes:shape_geometric_stone_01_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_statue_01 = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)

	minetest.register_node("lib_relic:" .. wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		tiles = { "nmobs_jackel_guardian_top.png",
			"nmobs_jackel_guardian_bottom.png", 
			"nmobs_jackel_guardian_right.png",
			"nmobs_jackel_guardian_left.png", 
			"nmobs_jackel_guardian_back.png",
			"nmobs_jackel_guardian_front.png", 
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = { cracky = 3, stone = 2, lib_relic = 3 },
		sounds = wall_sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.04, 0.34375, -0.0625, 0.04, 0.42, 0.03}, -- head
				{-0.09375, 0.035, -0.0625, 0.09375, 0.25, 0.125}, -- chest
				{-0.09375, -0.125, -0.0625, 0.09375, 0, 0.1}, -- pelvis
				{0.02, -0.5, -0.04, 0.09, -0.125, 0.05}, -- rightleg
				{-0.07, 0, -0.0625, 0.07, 0.28, 0.08}, -- spine
				{-0.09, -0.5, -0.04, -0.02, -0.125, 0.05}, -- leftleg
				{0.09375, 0.2, 0, 0.3, 0.25, 0.04}, -- rightarm1
				{0.25, 0.2, 0, 0.3, 0.24, 0.24}, -- rightarm2
				{-0.3, 0.2, 0, -0.09375, 0.25, 0.04}, -- leftarm1
				{-0.3, 0.2, 0, -0.25, 0.24, 0.24}, -- leftarm2
				{-0.09, -0.5, -0.02, -0.02, -0.47, 0.12}, -- leftfoot
				{0.02, -0.5, -0.02, 0.09, -0.47, 0.12}, -- rightfoot
				{-0.31, 0.21, 0.24, -0.24, 0.23, 0.32}, -- lefthand
				{0.25, 0.19, 0.24, 0.3, 0.25, 0.32}, -- righthand
				{-0.025, 0.33, -0.0625, 0.025, 0.38, 0.15}, -- snout2
				{-0.03, 0.33, -0.0625, 0.03, 0.4, 0.1}, -- snout1
				{-0.05, 0.4, -0.06, -0.02, 0.5, -0.03}, -- leftear
				{0.02, 0.4, -0.06, 0.05, 0.5, -0.03}, -- rightear
				{-0.03, 0.25, -0.06, 0.03, 0.34375, 0.04}, -- neck
				{0.26, -0.5, 0.26, 0.28, 0.5, 0.29}, -- staff
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
		output = "lib_relic:" .. wall_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', "gal.lib.shapes:shape_geometric_stone_01_100_height_100_width", ''},
			{ '', wall_mat, ''},
		}
	})

end

lib_relic.register_statues = function()

	minetest.register_node("lib_relic:dm_statue", {
		description = "DM Statue",
		tiles = {
			"caverealms_dm_stone.png",
			"caverealms_dm_stone.png",
			"caverealms_dm_stone.png",
			"caverealms_dm_stone.png",
			"caverealms_dm_stone.png",
			"caverealms_stone_eyes.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky=2},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, -0.5, -0.4375, 0.4375, -0.3125, 0.4375}, -- NodeBox1
				{-0.25, -0.125, -0.1875, 0.25, 0.5, 0.1875}, -- NodeBox2
				{-0.375, 0, -0.125, -0.25, 0.4375, 0.125}, -- NodeBox3
				{0.25, 0.125, -0.4375, 0.375, 0.375, 0.1875}, -- NodeBox4
				{-0.25, -0.5, -0.125, -0.125, -0.125, 0.125}, -- NodeBox5
				{0.125, -0.3125, -0.125, 0.25, 0, 0.125}, -- NodeBox6
			}
		},
		selection_box = {
			type = "regular"
		}
	})

	minetest.register_node("lib_relic:gargoyle", {
		description = "Gargoyle",
		tiles = {"default_stone.png^[colorize:#000000:60"},
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = { type = "fixed",
			fixed = {
				{0.2, 0.23, -0.17, -0.1, -0.5, 0.17},   -- body f
				{-0.1, -0.07, -0.17, -0.27, -0.5, 0.17},   -- body r
				{0.17, 0.5, -0.07, 0, 0.23, 0.07}, -- head
				{0.27, 0.2, 0.1, 0.13, -0.5, 0.23}, -- leg fl
				{0.27, 0.2, -0.23, 0.13, -0.5, -0.1}, -- leg fr
				{0.03, -0.1, 0.17, -0.2, -0.5, 0.27}, -- leg rl
				{0.03, -0.1, -0.27, -0.2, -0.5, -0.17}, -- leg rl
				{-0.1, 0.23, -0.4, -0.17, 0.13, 0.4}, -- wing u
				{-0.1, 0.13, -0.3, -0.17, 0.03, 0.3}, -- wing u
			} },
		groups = {cracky = 3, level=1, stone = 1},
		drop = "default:cobble",
		on_place = minetest.rotate_and_place,
		sounds = gal.node_sound_stone_defaults(),
	})
	
end



lib_relic.register_jackel_guardian("jackel_guardian", "Jackel Guardian ", "default_sandstone.png",
		"default:sandstone", gal.node_sound_stone_defaults())
lib_relic.register_scorpion("scorpion", "Scorpion ", "default_sandstone.png",
		"default:sandstone", gal.node_sound_stone_defaults())
lib_relic.register_statue_01("statue_01", "Statue 01 ", "default_sandstone.png",
		"default:sandstone", gal.node_sound_stone_defaults())
lib_relic.register_statues()

minetest.register_node("lib_relic:rosace", {
	description = "Rose Window",
	tiles = {"darkage_rosace.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = gal.node_sound_stone_defaults()
})

minetest.register_craftitem("lib_relic:scroll", {
	description = "Scroll",
	inventory_image = "darkage_scroll.png",
})



--[[
lib_relic.register_nodes("cobble", "Cobblestone ", "default_cobble.png", "default:cobble", default.node_sound_stone_defaults())
lib_relic.register_nodes("mossycobble", "Mossy Cobblestone ", "default_mossycobble.png", "default:mossycobble", default.node_sound_stone_defaults())
lib_relic.register_nodes("desertcobble", "Desert Cobblestone ", "default_desert_cobble.png", "default:desert_cobble", default.node_sound_stone_defaults())
--]]

--lib_relic.register_nodes("baked_clay_red", "Red Baked Clay ", "baked_clay_red.png", "lib_materials:baked_clay_red", default.node_sound_stone_defaults())
--lib_relic.register_nodes("baked_clay_orange", "Orange Baked Clay ", "baked_clay_orange.png", "lib_materials:baked_clay_orange", default.node_sound_stone_defaults())
--lib_relic.register_nodes("baked_clay_grey", "Grey Baked Clay ", "baked_clay_grey.png", "lib_materials:baked_clay_grey", default.node_sound_stone_defaults())



--lib_relic.register_nodes("sandstone", "Sandstone ", "default_sandstone.png", "default:sandstone", default.node_sound_stone_defaults())
--lib_relic.register_nodes("desert_stone", "Desert Stone ", "default_desert_stone.png", "default:desert_stone", default.node_sound_stone_defaults())
--lib_relic.register_nodes("desert_sandstone", "Desert Sand Stone ", "default_desert_sandstone.png", "default:desert_sandstone", default.node_sound_stone_defaults())
--lib_relic.register_nodes("stone", "Stone ", "default_stone.png", "default:stone", default.node_sound_stone_defaults())
--lib_relic.register_nodes("obsidian", "Obsidian ", "default_obsidian.png", "default:obsidian", default.node_sound_stone_defaults())

--[[
lib_relic.register_nodes("sandstone_block", "Sandstone Block ", "default_sandstone_block.png",
		"default:sandstone_block", default.node_sound_stone_defaults())
lib_relic.register_nodes("desert_stone_block", "Desert Stone Block ", "default_desert_stone_block.png",
		"default:desert_stone_block", default.node_sound_stone_defaults())
lib_relic.register_nodes("desert_sandstone_block", "Desert Sand Stone Block ",
		"default_desert_sandstone_block.png","default:desert_sandstone_block", default.node_sound_stone_defaults())
lib_relic.register_nodes("stone_block", "Stone Block ", "default_stone_block.png",
		"default:stone_block", default.node_sound_stone_defaults())
lib_relic.register_nodes("obsidian_block", "Obsidian Block ", "default_obsidian_block.png",
		"default:obsidian_block", default.node_sound_stone_defaults())

lib_relic.register_nodes("sandstone_brick", "Sandstone Brick ", "default_sandstone_brick.png",
		"default:sandstonebrick", default.node_sound_stone_defaults())
lib_relic.register_nodes("desertstone_brick", "Desert Stone Brick ", "default_desert_stone_brick.png",
		"default:desert_stonebrick", default.node_sound_stone_defaults())
lib_relic.register_nodes("desert_sandstone_brick", "Desert Stone Brick ",
		"default_desert_sandstone_brick.png","default:desert_sandstone_brick", default.node_sound_stone_defaults())
lib_relic.register_nodes("stone_brick", "Stone Brick ", "default_stone_brick.png",
		"default:stonebrick", default.node_sound_stone_defaults())
lib_relic.register_nodes("obsidian_brick", "Obsidian Brick ", "default_obsidian_brick.png",
		"default:obsidianbrick", default.node_sound_stone_defaults())
--]]

--lib_relic.register_nodes("steelblock", "Steel ", "default_steel_block.png", "default:steelblock", default.node_sound_metal_defaults())
--lib_relic.register_nodes("copperblock", "Copper ", "default_copper_block.png", "default:copperblock", default.node_sound_metal_defaults())
--lib_relic.register_nodes("tinblock", "Tin ", "default_tin_block.png", "default:tinblock", default.node_sound_metal_defaults())
--lib_relic.register_nodes("bronzeblock", "Bronze ", "default_bronze_block.png", "default:bronzeblock", default.node_sound_metal_defaults())
--lib_relic.register_nodes("goldblock", "Gold ", "default_gold_block.png", "default:goldblock", default.node_sound_metal_defaults())
--lib_relic.register_nodes("diamondblock", "Diamond ", "default_diamond_block.png", "default:diamondblock", default.node_sound_glass_defaults())

--lib_relic.register_nodes("glass", "Glass ", "default_glass.png", "default:glass", default.node_sound_stone_defaults())

--[[
		
lib_architecture.register_nodes("tree", "Tree ", "default_tree.png",
		"default:tree", default.node_sound_stone_defaults())
lib_architecture.register_nodes("wood", "Wood ", "default_wood.png",
		"default:wood", default.node_sound_stone_defaults())
lib_architecture.register_nodes("jungletree", "Jungle Tree ", "default_jungletree.png",
		"default:jungletree", default.node_sound_stone_defaults())
lib_architecture.register_nodes("junglewood", "Jungle Wood ", "default_junglewood.png",
		"default:junglewood", default.node_sound_stone_defaults())

lib_architecture.register_nodes("acacia_tree", "Acacia Tree ", "default_acacia_tree.png",
		"default:acacia_tree", default.node_sound_stone_defaults())
lib_architecture.register_nodes("acacia_wood", "Acacia Wood ", "default_acacia_wood.png",
		"default:acacia_wood", default.node_sound_stone_defaults())

--]]










