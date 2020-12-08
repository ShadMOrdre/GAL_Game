-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.125, -0.4375, 0, 0.125, 0.4375}, -- z_axis
			{-0.375, -0.125, -0.0625, 0.3125, 0.125, 0.0625}, -- x_axis
			{-0.125, -0.1875, -0.375, 0.0625, 0.1875, 0.375}, -- NodeBox3
			{-0.3125, -0.1875, -0.125, 0.25, 0.1875, 0.125}, -- NodeBox4
			{-0.1875, -0.25, -0.3125, 0.125, 0.25, 0.3125}, -- NodeBox5
			{-0.25, -0.25, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox6
			{-0.125, -0.3125, -0.25, 0.0625, 0.3125, 0.25}, -- NodeBox8
			{-0.1875, -0.3125, -0.125, 0.125, 0.3125, 0.125}, -- NodeBox9
			{-0.0625, -0.375, -0.125, 0, 0.375, 0.125}, -- NodeBox10
		}
	}
})

