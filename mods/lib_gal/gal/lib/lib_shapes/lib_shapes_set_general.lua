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



gal.lib.shapes.register_shape("cylinder_100_height_100_width", {
	description = S("Cylinder Full Height Full Width"), 
	shape_type = "basic",
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
})
gal.lib.shapes.register_shape("cylinder_100_height_075_width", {
	description = S("Cylinder Full Height 3/4 Width"), 
	shape_type = "basic",
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
})
gal.lib.shapes.register_shape("cylinder_100_height_050_width", {
	description = S("Cylinder Full Height 1/2 Width"), 
	shape_type = "basic",
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
})
gal.lib.shapes.register_shape("cylinder_100_height_025_width", {
	description = S("Cylinder Full Height 1/4 Width"), 
	shape_type = "basic",
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
})


gal.lib.shapes.register_shape("linkage_050x050", {
	description = S("Linkage (Medium)"), 
	shape_type = "connected",
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.25,-0.25,0.25,0.25,0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.25,-0.25,0.25,0.25,0.25},
		},
	},
})
gal.lib.shapes.register_shape("linkage_025x025", {
	description = S("Linkage (Small)"), 
	shape_type = "connected",
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125,-0.125,-0.125,0.125,0.125,0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125,-0.125,-0.125,0.125,0.125,0.125},
		},
	},
})
gal.lib.shapes.register_shape("linkage_round_050x050", {
	description = S("Linkage Round(Medium)"), 
	shape_type = "connected",
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.25,-0.25,0.25,0.25,0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.25,-0.25,0.25,0.25,0.25},
		},
	},
})
gal.lib.shapes.register_shape("linkage_round_025x025", {
	description = S("Linkage Round (Small)"), 
	shape_type = "connected",
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, -0.0625, 0.125, 0.0625, 0.0625}, -- Base_x
			{-0.0625, -0.125, -0.0625, 0.0625, 0.125, 0.0625}, -- Base_y
			{-0.0625, -0.0625, -0.125, 0.0625, 0.0625, 0.125}, -- Base_z
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, -0.0625, 0.125, 0.0625, 0.0625}, -- Base_x
			{-0.0625, -0.125, -0.0625, 0.0625, 0.125, 0.0625}, -- Base_y
			{-0.0625, -0.0625, -0.125, 0.0625, 0.0625, 0.125}, -- Base_z
		},
	},
})




--[[gal.lib.shapes.register_shape("crate_large", {
	description = S("Crate Large"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- Base
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375}, -- Front_h_zneg
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- Back_h_zpos
			{-0.5, -0.375, -0.5, -0.375, 0.375, -0.375}, -- NodeBox16
			{-0.5, -0.375, 0.375, -0.375, 0.375, 0.5}, -- NodeBox17
			{0.375, -0.375, -0.5, 0.5, 0.375, -0.375}, -- NodeBox18
			{0.375, -0.375, 0.375, 0.5, 0.375, 0.5}, -- NodeBox19
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
})
--]]

--[[gal.lib.shapes.register_shape("cylinder_to_cross", {
	description = S("Cylinder to Cross"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.4375, 0.25, 0.25, 0.4375}, -- Middle_z
			{-0.4375, -0.5, -0.25, 0.4375, 0.25, 0.25}, -- Middle_x
			{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- Outer_z
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- Outer_x
			{-0.3125, -0.5, -0.375, 0.3125, -0.125, 0.375}, -- Inner_z
			{-0.375, -0.5, -0.3125, 0.375, -0.125, 0.3125}, -- Inner_x
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
})
--]]

--[[gal.lib.shapes.register_shape("octagon", {
	description = S("Octagon"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.4375, 0.25, 0.5, 0.4375}, -- Middle_z
			{-0.4375, -0.5, -0.25, 0.4375, 0.5, 0.25}, -- Middle_x
			{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- Outer_z
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- Outer_x
			{-0.3125, -0.5, -0.375, 0.3125, 0.5, 0.375}, -- Inner_z
			{-0.375, -0.5, -0.3125, 0.375, 0.5, 0.3125}, -- Inner_x
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
})
--]]

--[[gal.lib.shapes.register_shape("square_to_cylinder_large", {
	description = S("Square to Cylinder Large"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- Base
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- Front_h_zneg
			{-0.25, -0.5, -0.5, 0.25, 0.5, 0.5}, -- Back_h_zpos
			{-0.375, -0.5, -0.4375, 0.375, 0.5, 0.4375}, -- NodeBox16
			{-0.4375, -0.5, -0.375, 0.4375, 0.5, 0.375}, -- NodeBox17
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
})
--]]

--[[gal.lib.shapes.register_shape("square_to_round_large", {
	description = S("Square to Round Large"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- Front_h_zneg
			{-0.1875, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- Back_h_zpos
			{-0.3125, -0.5, -0.4375, 0.3125, 0.5, 0.4375}, -- NodeBox16
			{-0.4375, -0.5, -0.3125, 0.4375, 0.5, 0.3125}, -- NodeBox17
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox20
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox21
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
})
--]]

--[[gal.lib.shapes.register_shape("square_beveled_sides_large", {
	description = S("Square with Beveled Sides Large"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375}, -- Base
			{-0.375, -0.5, -0.5, 0.375, 0.5, 0.5}, -- Front_h_zneg
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.375}, -- Back_h_zpos
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
})
--]]






