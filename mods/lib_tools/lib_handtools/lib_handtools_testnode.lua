local S = lib_handtools.intllib



minetest.register_node("lib_handtools:testnode", {
	description = S("testnode - state1"),
	tiles = {"lib_materials_stone_brown.png"},
	is_ground_content = true,
	groups = {cracky = 3, stone = 1, level = 2},
	--drop = 'lib_materials:stone_brown',
	legacy_mineral = true,
	--sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(pos, node, clicker, itemstack)

		local n = minetest.get_node(pos)
		n.description = S("testnode - state2")
		n.drawtype = "nodebox"
		n.tiles = "lib_materials_stone_sand"
		n.param2 = minetest.dir_to_facedir(pos)
		n.node_box = {type = "fixed", fixed = {{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},}}
		minetest.swap_node(pos, n)

	end,
	
})



