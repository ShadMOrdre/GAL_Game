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
	S("shape_somename"),					--All shape names WILL BE prefixed with 'shape_'.  This allows shapes to be sorted together in inventory.
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



gal.lib.shapes.register_shape("beam", {
	description = S("Beam"), 
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
gal.lib.shapes.register_shape("beam_with_support", {
	description = S("Beam with Support"), 
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

gal.lib.shapes.register_shape("pillar_thick", {
	description = S("Thick Pillar (0.75W)"), 
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
gal.lib.shapes.register_shape("pillar", {
	description = S("Pillar"), 
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

gal.lib.shapes.register_shape("pillar_thin", {
	description = S("Thin Pillar (0.25W)"), 
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

gal.lib.shapes.register_shape("pillar_with_wall_thick", {
	description = S("Pillar with Thick Wall (0.75W)"), 
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
gal.lib.shapes.register_shape("pillar_with_wall", {
	description = S("Pillar with Wall"), 
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


gal.lib.shapes.register_shape("roof", {
	description = S("Roof"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
})


gal.lib.shapes.register_shape("stairs", {
	description = S("Stairs"), 
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
gal.lib.shapes.register_shape("stairs_inner", {
	description = S("Inner Stairs"), 
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
gal.lib.shapes.register_shape("stairs_outer", {
	description = S("Outer Stairs"), 
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
gal.lib.shapes.register_shape("slab", {
	description = S("Slab"), 
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
gal.lib.shapes.register_shape("step", {
	description = S("Step"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5}
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5}
		},
	},
})

gal.lib.shapes.register_shape("ceiling", {
	description = S("Ceiling"), 
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
gal.lib.shapes.register_shape("ceiling_with_pillar", {
	description = S("Ceiling with Pillar"), 
	shape_type = "connected",
		node_box = {
			type = "connected",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.5, 0.5},
				{-0.25, -0.5, -0.25, 0.25, 0.0625, 0.25}
			},
			connect_front = {
				{-0.25, -0.5, -0.5, 0.25, 0.0625, -0.25},
			},
			connect_back = {
				{-0.25, -0.5, 0.25, 0.25, 0.0625, 0.5},
			},
			connect_left = {
				{-0.5, -0.5, -0.25, -0.25, 0.0625, 0.25},
			},
			connect_right = {
				{0.25, -0.5, -0.25, 0.5, 0.0625, 0.25},
			},
		},
		selection_box = {
			type = "connected",
			fixed = {
				{-0.5, 0.0625, -0.5, 0.5, 0.5, 0.5},
				{-0.25, -0.5, -0.25, 0.25, 0.0625, 0.25}
			},
			connect_front = {
				{-0.25, -0.5, -0.5, 0.25, 0.0625, -0.25},
			},
			connect_back = {
				{-0.25, -0.5, 0.25, 0.25, 0.0625, 0.5},
			},
			connect_left = {
				{-0.5, -0.5, -0.25, -0.25, 0.0625, 0.25},
			},
			connect_right = {
				{0.25, -0.5, -0.25, 0.5, 0.0625, 0.25},
			},
		},
		collision_box = {
			type = "connected",
			fixed = {
				{-0.5, 0.0625, -0.5, 0.5, 0.5, 0.5},
				{-0.25, -0.5, -0.25, 0.25, 0.0625, 0.25}
			},
			connect_front = {
				{-0.25, -0.5, -0.5, 0.25, 0.0625, -0.25},
			},
			connect_back = {
				{-0.25, -0.5, 0.25, 0.25, 0.0625, 0.5},
			},
			connect_left = {
				{-0.5, -0.5, -0.25, -0.25, 0.0625, 0.25},
			},
			connect_right = {
				{0.25, -0.5, -0.25, 0.5, 0.0625, 0.25},
			},
		},
})
gal.lib.shapes.register_shape("ceiling_with_wall", {
	description = S("Ceiling with Wall"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
})

gal.lib.shapes.register_shape("pane", {
	description = S("Pane"), 
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
gal.lib.shapes.register_shape("pane_centered", {
	description = S("Pane Centered"), 
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
gal.lib.shapes.register_shape("pane_pillar", {
	description = S("Pillar with Wall"), 
	shape_type = "connected",
	node_box = {
		type = "connected",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		},
		connect_front = {
			{-0.0625, -0.5, -0.5,  0.0625, 0.5, -0.0625}
		},
		connect_left = {
			{-0.5, -0.5, -0.0625, -0.0625, 0.5,  0.0625}
		},
		connect_back = {
			{-0.0625, -0.5,  0.0625,  0.0625, 0.5,  0.5}
		},
		connect_right = {
			{ 0.0625, -0.5, -0.0625,  0.5, 0.5,  0.0625}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		},
	},
})



gal.lib.shapes.register_shape("wall_thick", {
	description = S("Thick Wall (0.75W)"), 
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
gal.lib.shapes.register_shape("wall_centered_thick", {
	description = S("Thick Wall Centered (0.75W)"), 
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
gal.lib.shapes.register_shape("wall", {
	description = S("Wall"), 
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
gal.lib.shapes.register_shape("wall_centered", {
	description = S("Wall Centered"), 
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





