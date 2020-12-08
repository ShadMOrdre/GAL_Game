--[[ TEMPLATE
	gal.lib.shapes.register_shape(name, description, node_box, selection_box, collision_box)
		Name			Name of the shape within the library
		Description		Full Text description of above name
		Node_Box		node_box = {
							type = "fixed",
							fixed = {
								{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
							},
						},


							(above example for a static node_box
											OR
							below example for a connected node_box)


						node_box = {
							type = "connected",
							fixed = {
								{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
							},
							connect_front = {
								{-0.125, -0.0625, -0.5, 0.125, 0.0625, -0.0625}, -- Front_h_zneg
							},
							connect_back = {
								{-0.125, -0.0625, 0.0625, 0.125, 0.0625, 0.5}, -- Back_h_zpos
							},
							connect_left = {
								{-0.5, -0.0625, -0.125, -0.0625, 0.0625, 0.125}, -- Left_h_xneg
							},
							connect_right = {
								{0.0625, -0.0625, -0.125, 0.5, 0.0625, 0.125}, -- Right_h_xpos
							},
							connect_bottom = {
								{-0.125, -0.5, -0.0625, 0.125, -0.0625, 0.0625}, -- Bottom_x_yneg
							},
							connect_top = {
								{-0.125, 0.0625, -0.0625, 0.125, 0.5, 0.0625}, -- Top_x_ypos
							},
						},

		Selection_Box	Follows the same as above for fixed node_box.  Standard definition.
		Collision_Box	Follows the same as above for fixed node_box.  Standard definition.

EXAMPLE:

gal.lib.shapes.register_shape(
	"shape_somename",					--All shape names WILL BE prefixed with 'shape_'.  This allows shapes to be sorted together in inventory.
	"Unique text description of the shape",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, 0, -0.5, 0.25, 0.5, 0.5},
		},
	},
)

--]]

local S = gal.lib.shapes.intllib


gal.lib.shapes.register_shape("geometric_stone_01_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("geometric_stone_02_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		   {-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("geometric_stone_03_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.1875, 0.5, -0.4375}, -- NodeBox8
			{-0.1875, 0.1875, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox9
			{0.1875, -0.5, -0.5, 0.5, -0.1875, -0.4375}, -- NodeBox10
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("geometric_stone_04_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.1875, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, -0.1875, -0.4375}, -- NodeBox10
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("geometric_stone_05_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.1875, 0.5, -0.4375}, -- NodeBox9
			{0.1875, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox10
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("geometric_stone_06_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, -0.4375}, -- NodeBox9
			{0.1875, -0.5, -0.5, 0.5, -0.1875, -0.4375}, -- NodeBox10
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, -0.4375}, -- NodeBox11
			{0.1875, 0.1875, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox12
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("stone_embossed_01_100_height_100_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.46875, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.46875, -0.375, -0.5, 0.46875, 0.375, -0.4375}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox10
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox11
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("wall_block_100_height_050_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.25}, -- NodeBox1
			{-0.46875, -0.46875, -0.25, 0.46875, 0.46875, -0.1875}, -- NodeBox2
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25},
		},
	},
})
gal.lib.shapes.register_shape("wall_brick_100_height_050_width", {
	description = S("Column Base Half Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.25}, -- NodeBox1
			{-0.46875, 0.03125, -0.25, 0.46875, 0.46875, -0.1875}, -- NodeBox2
			{0.03125, -0.46875, -0.25, 0.5, -0.03125, -0.1875}, -- NodeBox3
			{-0.5, -0.46875, -0.25, -0.03125, -0.03125, -0.1875}, -- NodeBox4
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25},
		},
	},
})



