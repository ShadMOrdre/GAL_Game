local S = gal.intllib



gal.lib.node.register_to_game("" .. "gal_testnode", {
	description = S("testnode - state1"),
	tiles = {"lib_materials_stone_brown.png"},
	is_ground_content = true,
	groups = {cracky = 3, stone = 1, level = 2},
	drop = 'gal:stone_brown',
	legacy_mineral = true,
	sounds = gal.node_sound_stone_defaults(),

	on_rightclick = function(pos, node, clicker, itemstack)

		--local new_cloned_node = table.copy(minetest.registered_nodes["gal:"..node_name..""])
		--local n = table.copy(minetest.registered_nodes["gal:"..node_name..""])
		--local n = minetest.get_node(pos)

		--local posnode = minetest.get_node(pos)
		--local nn = posnode.name
		--local n = table.copy(minetest.registered_nodes[nn])
		local n = table.copy(minetest.get_node(pos))

		n.description = S("testnode - state2")
		--n.drawtype = "nodebox"
		n.tiles = {"lib_materials_stone_sand.png"}
		--n.param2 = minetest.dir_to_facedir(pos)
		--n.node_box = {type = "fixed", fixed = {{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},}}
		minetest.swap_node(pos, n)

	end,
	
})



