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
	"shape_somename",							--All shape names should begin with 'shape_'.  This allows shapes to be sorted together in inventory.
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


gal.lib.shapes.register_shape("door_centered", {
	description = S("Door (Solid) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_right", {
	description = S("Door (Solid) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
})

gal.lib.shapes.register_shape("door_centered_with_window", {
	description = S("Door (with Window) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 0.5, 1.0}, --Base
			{-0.5, 0.5, 0, -0.375, 0.625, 1.0}, -- Bottom_x
			{-0.5, 1.375, 0, -0.375, 1.5, 1.0}, -- Top_x
			{-0.5, 0.625, 0.875, -0.375, 1.375, 1.0}, -- Right_y
			{-0.5, 0.625, 0, -0.375, 1.375, 0.125}, -- Left_y
			{-0.5, 0.9375, 0.125, -0.375, 1.0625, 0.9375}, -- Center_x
			{-0.5, 0.625, 0.4375, -0.375, 1.375, 0.5625}, -- Center_y
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}, --Base
			{-0.5, 0.5, -0.0625, 0.5, 0.625, 0.0625}, -- Bottom_x
			{-0.5, 1.375, -0.0625, 0.5, 1.5, 0.0625}, -- Top_x
			{0.375, 0.625, -0.0625, 0.5, 1.375, 0.0625}, -- Right_y
			{-0.5, 0.625, -0.0625, -0.375, 1.375, 0.0625}, -- Left_y
			{-0.375, 0.9375, -0.0625, 0.375, 1.0625, 0.0625}, -- Center_x
			{-0.0625, 0.625, -0.0625, 0.0625, 1.375, 0.0625}, -- Center_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 0.5, 1.0}, --Base
			{-0.5, 0.5, 0, -0.375, 0.625, 1.0}, -- Bottom_x
			{-0.5, 1.375, 0, -0.375, 1.5, 1.0}, -- Top_x
			{-0.5, 0.625, 0.875, -0.375, 1.375, 1.0}, -- Right_y
			{-0.5, 0.625, 0, -0.375, 1.375, 0.125}, -- Left_y
			{-0.5, 0.9375, 0.125, -0.375, 1.0625, 0.9375}, -- Center_x
			{-0.5, 0.625, 0.4375, -0.375, 1.375, 0.5625}, -- Center_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_with_window_right", {
	description = S("Door (with Window) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}, --Base
			{-0.5, 0.5, -0.0625, 0.5, 0.625, 0.0625}, -- Bottom_x
			{-0.5, 1.375, -0.0625, 0.5, 1.5, 0.0625}, -- Top_x
			{0.375, 0.625, -0.0625, 0.5, 1.375, 0.0625}, -- Right_y
			{-0.5, 0.625, -0.0625, -0.375, 1.375, 0.0625}, -- Left_y
			{-0.375, 0.9375, -0.0625, 0.375, 1.0625, 0.0625}, -- Center_x
			{-0.0625, 0.625, -0.0625, 0.0625, 1.375, 0.0625}, -- Center_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
})

gal.lib.shapes.register_shape("door_centered_sliding", {
	description = S("Door Sliding (Solid) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, -0.375, 1.5, 0.0625},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, -0.375, 1.5, 0.0625},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, -0.375, 1.5, 0.0625},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_sliding_right", {
	description = S("Door Sliding (Solid) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
})

gal.lib.shapes.register_shape("door_centered_300_height_150_width", {
	description = S("Door (Solid Medium 3x1.5) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.0, 2.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.0, 2.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.0, 2.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 2.5, 1.5},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 2.5, 1.5},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 2.5, 1.5},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_300_height_150_width_right", {
	description = S("Door (Solid Medium 3x1.5) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-1.0, -0.5, -0.0625, 0.5, 2.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.0, -0.5, -0.0625, 0.5, 2.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.0, -0.5, -0.0625, 0.5, 2.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 2.5, 1.5},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 2.5, 1.5},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 2.5, 1.5},
		},
	},
})

gal.lib.shapes.register_shape("door_centered_400_height_200_width", {
	description = S("Door (Solid Large 4x2) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.5, 3.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.5, 3.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 1.5, 3.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 3.5, 2.0},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 3.5, 2.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 3.5, 2.0},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_400_height_200_width_right", {
	description = S("Door (Solid Large 4x2) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.0625, 0.5, 3.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.0625, 0.5, 3.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.0625, 0.5, 3.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 3.5, 2.0},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 3.5, 2.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 3.5, 2.0},
		},
	},
})

gal.lib.shapes.register_shape("door_centered_400_height_250_width", {
	description = S("Door (Solid Large 4x2.5) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 2.0, 3.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.0625, 2.0, 3.5, 0.0625}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 2.0, 3.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, -0.375, 3.5, 2.5}
	},
	open_selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, -0.375, 3.5, 2.5}
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 3.5, 2.5},
		},
	},
})
gal.lib.shapes.register_shape("door_centered_400_height_250_width_right", {
	description = S("Door (Solid Large 4x2.5) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {-2.0, -0.5, -0.0625, 0.5, 3.5, 0.0625}
	},
	selection_box = {
		type = "fixed",
		fixed = {-2.0, -0.5, -0.0625, 0.5, 3.5, 0.0625}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-2.0, -0.5, -0.0625, 0.5, 3.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {0.375, -0.5, 0, 0.5, 3.5, 2.5}
	},
	open_selection_box = {
		type = "fixed",
		fixed = {0.375, -0.5, 0, 0.5, 3.5, 2.5}
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 3.5, 2.5},
		},
	},
})

gal.lib.shapes.register_shape("trapdoor_solid", {
	description = S("Trap Door - Solid"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			-0.5, -0.5, 0.375, 0.5, 0.5, 0.5
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("trapdoor_with_window", {
	description = S("Trap Door with Window"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, --   X- (Left)
			{-0.0625, -0.5, -0.5, 0.0625, -0.375, 0.5}, --   X0  (Center)
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, --   X+  (Right)
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, --   Z-  (Front)
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625}, --   Z0 (Center)
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, --   Z+  (Back)
			{-0.125, -0.5, -0.125, 0.125, -0.375, 0.125}, --   Center Square
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, --   X- (Left)
			{-0.0625, -0.5, 0.375, 0.0625, 0.5, 0.5}, --   X0  (Center)
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, --   X+  (Right)
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, --   Z-  (Front)
			{-0.5, -0.0625, 0.375, 0.5, 0.0625, 0.5}, --   Z0 (Center)
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, --   Z+  (Back)
			{-0.125, -0.125, 0.375, 0.125, 0.125, 0.5}, --   Center Square
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
		},
	},
})


--[[gal.lib.shapes.register_shape("shape_door_centered_panel_framed_basic_01", {
	description = S("Door (Solid) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.0405737, 0.375, 0.375, 0.0473361}, -- NodeBox1
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625}, -- NodeBox6
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625}, -- NodeBox9
			{-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox18
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.0405737, 0.375, 0.375, 0.0473361}, -- NodeBox1
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625}, -- NodeBox6
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625}, -- NodeBox9
			{-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox18
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.0405737, 0.375, 0.375, 0.0473361}, -- NodeBox1
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625}, -- NodeBox6
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625}, -- NodeBox9
			{-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox18
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
})
--]]
--[[gal.lib.shapes.register_shape("shape_door_centered_panel_framed_basic_01_right", {
	description = S("Door (Solid) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.0405737, 0.375, 0.375, 0.0473361}, -- NodeBox1
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625}, -- NodeBox6
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625}, -- NodeBox9
			{-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox18
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
})
--]]

--[[gal.lib.shapes.register_shape("door_centered_paneled_window_basic_01", {
	description = S("Door (Paneled with Window) Centered Basic 01"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 0.5, 1.0}, --Base
			{-0.5, 0.5, 0, -0.375, 0.625, 1.0}, -- Bottom_x
			{-0.5, 1.375, 0, -0.375, 1.5, 1.0}, -- Top_x
			{-0.5, 0.625, 0.875, -0.375, 1.375, 1.0}, -- Right_y
			{-0.5, 0.625, 0, -0.375, 1.375, 0.125}, -- Left_y
			{-0.5, 0.9375, 0.125, -0.375, 1.0625, 0.9375}, -- Center_x
			{-0.5, 0.625, 0.4375, -0.375, 1.375, 0.5625}, -- Center_y
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.03125, 0.375, 0.5, 0.03125}, -- NodeBox1
			{-0.375, -0.5, -0.0625, 0.375, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.5, -0.0625, -0.375, 1.5, 0.0625}, -- NodeBox6
			{0.375, -0.5, -0.0625, 0.5, 1.5, 0.0625}, -- NodeBox9
			{-0.375, 1.375, -0.0625, 0.375, 1.5, 0.0625}, -- NodeBox18
			{-0.0625, 0.53125, -0.03125, 0.0625, 1.4375, 0.03125}, -- NodeBox19
			{-0.5, 1.03125, -0.03125, 0.5, 0.9375, 0.03125}, -- NodeBox20
			{-0.5, 0.4375, -0.0625, 0.5, 0.5625, 0.0625}, -- NodeBox21
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.4685, -0.375, 0.0625, -0.4125, 0.5, 0.9375}, -- NodeBox1
			{-0.5, -0.5, 0.0625, -0.375, -0.375, 0.9375}, -- NodeBox3
			{-0.5, -0.5, 0, -0.375, 1.5, 0.125}, -- NodeBox6
			{-0.5, -0.5, 0.875, -0.375, 1.5, 1}, -- NodeBox9
			{-0.5, 1.375, 0.0625, -0.375, 1.5, 0.9375}, -- NodeBox18
			{-0.46875, 0.53125, 0.46875, -0.40625, 1.46875, 0.53125}, -- NodeBox19
			{-0.5, 0.96875, 0, -0.40625, 1.03125, 1}, -- NodeBox20
			{-0.5, 0.4375, 0, -0.375, 0.5625, 1}, -- NodeBox21
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
})
--]]
--[[gal.lib.shapes.register_shape("shape_door_centered_paneled_window_basic_01_right", {
	description = S("Door (Solid) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.03125, 0.375, 0.5, 0.03125}, -- NodeBox1
			{-0.375, -0.5, -0.0625, 0.375, -0.375, 0.0625}, -- NodeBox3
			{-0.5, -0.5, -0.0625, -0.375, 1.5, 0.0625}, -- NodeBox6
			{0.375, -0.5, -0.0625, 0.5, 1.5, 0.0625}, -- NodeBox9
			{-0.375, 1.375, -0.0625, 0.375, 1.5, 0.0625}, -- NodeBox18
			{-0.0625, 0.53125, -0.03125, 0.0625, 1.4375, 0.03125}, -- NodeBox19
			{-0.5, 1.03125, -0.03125, 0.5, 0.9375, 0.03125}, -- NodeBox20
			{-0.5, 0.4375, -0.0625, 0.5, 0.5625, 0.0625}, -- NodeBox21
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 0.5, 1.0}, --Base
			{0.375, 0.5, 0, 0.5, 0.625, 1.0}, -- Bottom_x
			{0.375, 1.375, 0, 0.5, 1.5, 1.0}, -- Top_x
			{0.375, 0.625, 0, 0.5, 1.375, 0.125}, -- Right_y
			{0.375, 0.625, 0.875, 0.5, 1.375, 1.0}, -- Left_y
			{0.375, 0.9375, 0.0625, 0.5, 1.0625, 0.9375}, -- Center_x
			{0.375, 0.625, 0.4375, 0.5, 1.375, 0.5625}, -- Center_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0, 0.5, 1.5, 1.0},
		},
	},
})
--]]


gal.lib.shapes.register_shape("fencegate_centered", {
	description = S("Fence Gate (Rail) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, 0.375, -0.0625, 0.375, 0.5, 0.0625}, -- TopRail_x
			{-0.4375, -0.375, -0.0625, 0.375, -0.25, 0.0625}, -- BottomRail_x
			{0.375, -0.375, -0.0625, 0.5, 0.5, 0.0625}, -- OuterSupport_y
			{-0.25, 0, -0.0625, 0.375, 0.125, 0.0625}, -- InnerRail_x
			{-0.375, -0.25, -0.0625, -0.25, 0.375, 0.0625}, -- HingeSupport_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, 0.375, 0, -0.3125, 0.5, 0.875}, -- TopRail_x
			{-0.4375, -0.375, 0, -0.3125, -0.25, 0.875}, -- BottomRail_x
			{-0.4375, -0.375, 0.875, -0.3125, 0.5, 1.0}, -- OuterSupport_y
			{-0.4375, 0, 0.125, -0.3125, 0.125, 0.875}, -- InnerRail_x
			{-0.4375, -0.25, 0, -0.3125, 0.375, 0.125}, -- HingeSupport_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
})
gal.lib.shapes.register_shape("fencegate_centered_right", {
	description = S("Fence Gate (Rail) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{-0.375, 0.375, -0.0625, 0.4375, 0.5, 0.0625}, -- TopRail_x
			{-0.375, -0.375, -0.0625, 0.4375, -0.25, 0.0625}, -- BottomRail_x
			{-0.5, -0.375, -0.0625, -0.375, 0.5, 0.0625}, -- OuterSupport_y
			{-0.375, 0, -0.0625, 0.25, 0.125, 0.0625}, -- InnerRail_x
			{0.25, -0.25, -0.0625, 0.375, 0.375, 0.0625}, -- HingeSupport_y
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{0.3125, 0.375, 0, 0.4375, 0.5, 0.875}, -- TopRail_x
			{0.3125, -0.375, 0, 0.4375, -0.25, 0.875}, -- BottomRail_x
			{0.3125, -0.375, 0.875, 0.4375, 0.5, 1.0}, -- OuterSupport_y
			{0.3125, 0, 0.0625, 0.4375, 0.125, 0.875}, -- InnerRail_x
			{0.3125, -0.25, 0, 0.4375, 0.375, 0.125}, -- HingeSupport_y
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
})

gal.lib.shapes.register_shape("fencegate_centered_solid", {
	description = S("Fence Gate (Solid) Centered"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.375, -0.375, -0.0625, 0.5, 0.4375, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.375, 0.5, 0.125}, -- Post_y
			{-0.4375, -0.375, 0, -0.3125, 0.4375, 0.875},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.3125, 0.5, 1.0},
		},
	},
})
gal.lib.shapes.register_shape("fencegate_centered_solid_right", {
	description = S("Fence Gate (Solid) Centered Right"), 
	shape_type = "door",
	inv_node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	inv_collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.375, 1.5, 1.0},
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{-0.5, -0.375, -0.0625, 0.375, 0.4375, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		},
	},
	open_node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.125, 0.5, 0.5, 0.125}, -- Post_y
			{0.3125, -0.5, 0, 0.4375, 0.5, 0.875},
		},
	},
	open_selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
	open_collision_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.125, 0.5, 0.5, 1.0},
		},
	},
})

