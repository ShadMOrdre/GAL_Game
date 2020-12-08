--[[ TEMPLATE
	lib_shapes.register_shape(name, description, node_box, selection_box, collision_box)
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

lib_node_shapes.register_shape(
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

local S = lib_shapes.intllib



lib_shapes.register_shape("slope", {
	description = "Slope", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		},
	},
})
lib_shapes.register_shape("beam_with_support", {
	description = "Beam with Support", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875},
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

lib_shapes.register_shape("pillar_thick", {
	description = "Thick Pillar (0.75W)", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_shapes.register_shape("pillar", {
	description = "Pillar", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})

lib_shapes.register_shape("pillar_thin", {
	description = "Thin Pillar (0.25W)", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		},
	},
})

lib_shapes.register_shape("pillar_with_wall_thick", {
	description = "Pillar with Thick Wall (0.75W)", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.5, -0.375}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.375, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.375,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.375, -0.5, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375},
		},
	},
})
lib_shapes.register_shape("pillar_with_wall", {
	description = "Pillar with Wall", 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
		connect_front = {
			{-0.1875, -0.5, -0.5,  0.1875, 0.5, -0.25}
		},
		connect_left = {
			{-0.5, -0.5, -0.1875, -0.25, 0.5,  0.1875}
		},
		connect_back = {
			{-0.1875, -0.5,  0.25,  0.1875, 0.5,  0.5}
		},
		connect_right = {
			{ 0.25, -0.5, -0.1875,  0.5, 0.5,  0.1875}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		},
	},
})


lib_shapes.register_shape("stairs", {
	description = "Stairs", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
})
lib_shapes.register_shape("stairs_inner", {
	description = "Inner Stairs", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{0, 0, -0.5, 0.5, 0.5, 0},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{0, 0, -0.5, 0.5, 0.5, 0},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
			{0, 0, -0.5, 0.5, 0.5, 0},
		},
	},
})
lib_shapes.register_shape("stairs_outer", {
	description = "Outer Stairs", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{0, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{0, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{0, 0, 0, 0.5, 0.5, 0.5},
		},
	},
})
lib_shapes.register_shape("slab", {
	description = "Slab", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	},
})
lib_shapes.register_shape("ceiling", {
	description = "Ceiling", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.5, 0.5}
		},
	},
})

lib_shapes.register_shape("pane", {
	description = "Pane", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}
		},
	},
})
lib_shapes.register_shape("pane_centered", {
	description = "Pane Centered", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625},
		},
	},
})

lib_shapes.register_shape("wall_thick", {
	description = "Thick Wall (0.75W)", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
		},
	},
})
lib_shapes.register_shape("wall_centered_thick", {
	description = "Thick Wall Centered (0.75W)", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.375}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.375},
		},
	},
})
lib_shapes.register_shape("wall", {
	description = "Wall", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}
		},
	},
})
lib_shapes.register_shape("wall_centered", {
	description = "Wall Centered", 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25}
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





