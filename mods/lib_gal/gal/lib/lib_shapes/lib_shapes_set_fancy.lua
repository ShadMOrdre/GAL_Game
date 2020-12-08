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



gal.lib.shapes.register_shape("column_base_050_height_100_width", {
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
gal.lib.shapes.register_shape("column_base_100_height_100_width", {
	description = S("Column Base Full Height Full Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
		   {-0.5, 0.0, -0.25, 0.5, 0.5, 0.25},
		   {-0.25, 0.0, -0.5, 0.25, 0.5, 0.5},
		   {-0.4375, 0.0, -0.4375, 0.4375, 0.4375, 0.4375},
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

gal.lib.shapes.register_shape("column_beam", {
	description = S("Column Beam"), 
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
gal.lib.shapes.register_shape("column_beam_with_support", {
	description = S("Column Beam with Support Column"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		   {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
		   {-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
		   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
		},
	},
})

gal.lib.shapes.register_shape("column_pillar_075_width", {
	description = S("Column Pillar Full Height 3/4 Width"), 
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
gal.lib.shapes.register_shape("column_pillar_050_width", {
	description = S("Column Pillar Full Height 1/2 Width"), 
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
gal.lib.shapes.register_shape("column_pillar_with_slab_100_height_050_width", {
	description = S("Column Pillar Full Height 1/2 Width"), 
	shape_type = "basic",
	node_box = {
		type = "connected",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25}
		},
		connect_front = {
			{-0.25, -0.5, -0.5, 0.25, 0.0, -0.25},
		},
		connect_back = {
			{-0.25, -0.5, 0.25, 0.25, 0.0, 0.5},
		},
		connect_left = {
			{-0.5, -0.5, -0.25, -0.25, 0.0, 0.25},
		},
		connect_right = {
			{0.25, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
	selection_box = {
		type = "connected",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25}
		},
		connect_front = {
			{-0.25, -0.5, -0.5, 0.25, 0.0, -0.25},
		},
		connect_back = {
			{-0.25, -0.5, 0.25, 0.25, 0.0, 0.5},
		},
		connect_left = {
			{-0.5, -0.5, -0.25, -0.25, 0.0, 0.25},
		},
		connect_right = {
			{0.25, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
	collision_box = {
		type = "connected",
		fixed = {
			{-0.5, 0.0, -0.5, 0.5, 0.5, 0.5},
			{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25}
		},
		connect_front = {
			{-0.25, -0.5, -0.5, 0.25, 0.0, -0.25},
		},
		connect_back = {
			{-0.25, -0.5, 0.25, 0.25, 0.0, 0.5},
		},
		connect_left = {
			{-0.5, -0.5, -0.25, -0.25, 0.0, 0.25},
		},
		connect_right = {
			{0.25, -0.5, -0.25, 0.5, 0.0, 0.25},
		},
	},
})

gal.lib.shapes.register_shape("column_pillar_with_full_wall_075_width", {
	description = S("Column Pillar with Full Wall 3/4 Width"), 
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
gal.lib.shapes.register_shape("column_pillar_with_full_wall_050_width", {
	description = S("Column Pillar with Full Wall 1/2 Width"), 
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


gal.lib.shapes.register_shape("steps_open_basic_01", {
	description = S("Steps Basic 01 (Open)"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.0625, -0.25, 0.5, 0, 0},
			{-0.5, 0.1875, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.4375, 0.25, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.0625, -0.25, 0.5, 0, 0},
			{-0.5, 0.1875, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.4375, 0.25, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.0625, -0.25, 0.5, 0, 0},
			{-0.5, 0.1875, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.4375, 0.25, 0.5, 0.5, 0.5},
		},
	},
})
gal.lib.shapes.register_shape("steps_solid_basic_01", {
	description = S("Steps Basic 01 (Solid)"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.25, -0.25, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.25, -0.25, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, -0.25},
			{-0.5, -0.25, -0.25, 0.5, 0, 0},
			{-0.5, 0, 0, 0.5, 0.25, 0.25},
			{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
		},
	},
})


gal.lib.shapes.register_shape("wall_100_height_075_width", {
	description = S("Wall Full Height 3/4 Width"), 
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
gal.lib.shapes.register_shape("wall_100_height_050_width", {
	description = S("Wall Full Height 1/2 Width"), 
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
gal.lib.shapes.register_shape("wall_100_height_025_width", {
	description = S("Wall Full Height 1/4 Width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125}
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
})
gal.lib.shapes.register_shape("wall_100_height_0125_width", {
	description = S("Wall Full Height 1/8 Width"), 
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


gal.lib.shapes.register_shape("wall_junction_with_slab_100_height_050_width", {
	description = S("Wall Junction with Slab Full Height 1/2 Width"), 
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

gal.lib.shapes.register_shape("wall_with_slab_100_height_050_width", {
	description = S("Wall with Slab Full Height 1/2 Width"), 
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

gal.lib.shapes.register_shape("wall_with_deco_01_100_height_050_width", {
	description = S("Wall with Deco 01 1/2 Width"), 
	shape_type = "basic",
	node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0, 0.25},
				{-0.5, 0, -0.3125, 0.5, 0.5, 0.5},
				{-0.5, 0.375, -0.5, 0.5, 0.5, -0.3125},
				{-0.375, 0.125, -0.4375, -0.125, 0.375, -0.3125},
				{0.125, 0.125, -0.4375, 0.375, 0.375, -0.3125},
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0, 0.25},
				{-0.5, 0, -0.3125, 0.5, 0.5, 0.5},
				{-0.5, 0.375, -0.5, 0.5, 0.5, -0.3125},
				{-0.375, 0.125, -0.4375, -0.125, 0.375, -0.3125},
				{0.125, 0.125, -0.4375, 0.375, 0.375, -0.3125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0, 0.25},
				{-0.5, 0, -0.3125, 0.5, 0.5, 0.5},
				{-0.5, 0.375, -0.5, 0.5, 0.5, -0.3125},
				{-0.375, 0.125, -0.4375, -0.125, 0.375, -0.3125},
				{0.125, 0.125, -0.4375, 0.375, 0.375, -0.3125},
		},
	},
})


gal.lib.shapes.register_shape("wall_arch_large_100_height_050_width", {
	description = S("wall_arch_large_100_height_050_width"), 
	shape_type = "basic",
	node_box = {
			type = "fixed",
			fixed = {
				{-0.25, 0.4375, -0.5, 0.25, 0.5, 0.5}, -- NodeBox1
				{-0.25, -0.5, 0.4375, 0.25, 0.5, 0.5}, -- NodeBox2
				{-0.25, -0.3125, 0.375, 0.25, 0.4375, 0.4375}, -- NodeBox3
				{-0.25, 0.375, -0.3125, 0.25, 0.4375, 0.375}, -- NodeBox4
				{-0.25, -0.125, 0.3125, 0.25, 0.375, 0.375}, -- NodeBox5
				{-0.25, 0.3125, -0.125, 0.25, 0.375, 0.3125}, -- NodeBox6
				{-0.25, 0.0, 0.25, 0.25, 0.3125, 0.3125}, -- NodeBox7
				{-0.25, 0.25, 0.0, 0.25, 0.3125, 0.25}, -- NodeBox8
				{-0.25, 0.0625, 0.1875, 0.25, 0.25, 0.25}, -- NodeBox9
				{-0.25, 0.1875, 0.0625, 0.25, 0.25, 0.1875}, -- NodeBox10
				{-0.25, 0.125, 0.125, 0.25, 0.1875, 0.1875}, -- NodeBox11
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.25, 0.4375, -0.5, 0.25, 0.5, 0.5}, -- NodeBox1
				{-0.25, -0.5, 0.4375, 0.25, 0.5, 0.5}, -- NodeBox2
				{-0.25, -0.3125, 0.375, 0.25, 0.4375, 0.4375}, -- NodeBox3
				{-0.25, 0.375, -0.3125, 0.25, 0.4375, 0.375}, -- NodeBox4
				{-0.25, -0.125, 0.3125, 0.25, 0.375, 0.375}, -- NodeBox5
				{-0.25, 0.3125, -0.125, 0.25, 0.375, 0.3125}, -- NodeBox6
				{-0.25, 0.0, 0.25, 0.25, 0.3125, 0.3125}, -- NodeBox7
				{-0.25, 0.25, 0.0, 0.25, 0.3125, 0.25}, -- NodeBox8
				{-0.25, 0.0625, 0.1875, 0.25, 0.25, 0.25}, -- NodeBox9
				{-0.25, 0.1875, 0.0625, 0.25, 0.25, 0.1875}, -- NodeBox10
				{-0.25, 0.125, 0.125, 0.25, 0.1875, 0.1875}, -- NodeBox11
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
				{-0.25, 0.4375, -0.5, 0.25, 0.5, 0.5}, -- NodeBox1
				{-0.25, -0.5, 0.4375, 0.25, 0.5, 0.5}, -- NodeBox2
				{-0.25, -0.3125, 0.375, 0.25, 0.4375, 0.4375}, -- NodeBox3
				{-0.25, 0.375, -0.3125, 0.25, 0.4375, 0.375}, -- NodeBox4
				{-0.25, -0.125, 0.3125, 0.25, 0.375, 0.375}, -- NodeBox5
				{-0.25, 0.3125, -0.125, 0.25, 0.375, 0.3125}, -- NodeBox6
				{-0.25, 0.0, 0.25, 0.25, 0.3125, 0.3125}, -- NodeBox7
				{-0.25, 0.25, 0.0, 0.25, 0.3125, 0.25}, -- NodeBox8
				{-0.25, 0.0625, 0.1875, 0.25, 0.25, 0.25}, -- NodeBox9
				{-0.25, 0.1875, 0.0625, 0.25, 0.25, 0.1875}, -- NodeBox10
				{-0.25, 0.125, 0.125, 0.25, 0.1875, 0.1875}, -- NodeBox11
		},
	},
})

gal.lib.shapes.register_shape("wall_arch_small_100_height_050_width", {
	description = S("wall_arch_small_100_height_050_width"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{0.0625, 0.4375, -0.25, 0.5, 0.5, 0.25}, -- NodeBox1
			{-0.5, 0.4375, -0.25, -0.0625, 0.5, 0.25}, -- NodeBox2
			{-0.5, 0.375, -0.25, -0.125, 0.4375, 0.25}, -- NodeBox10
			{0.125, 0.375, -0.25, 0.5, 0.4375, 0.25}, -- NodeBox11
			{-0.5, 0.3125, -0.25, -0.25, 0.375, 0.25}, -- NodeBox12
			{0.25, 0.3125, -0.25, 0.5, 0.375, 0.25}, -- NodeBox13
			{-0.5, 0.25, -0.25, -0.3125, 0.3125, 0.25}, -- NodeBox14
			{0.3125, 0.25, -0.25, 0.5, 0.3125, 0.25}, -- NodeBox15
			{-0.5, 0.125, -0.25, -0.375, 0.25, 0.25}, -- NodeBox16
			{0.375, 0.125, -0.25, 0.5, 0.25, 0.25}, -- NodeBox17
			{-0.5, -0.5, -0.25, -0.4375, 0.125, 0.25}, -- NodeBox18
			{0.4375, -0.5, -0.25, 0.5, 0.125, 0.25}, -- NodeBox19
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.0625, 0.4375, -0.25, 0.5, 0.5, 0.25}, -- NodeBox1
			{-0.5, 0.4375, -0.25, -0.0625, 0.5, 0.25}, -- NodeBox2
			{-0.5, 0.375, -0.25, -0.125, 0.4375, 0.25}, -- NodeBox10
			{0.125, 0.375, -0.25, 0.5, 0.4375, 0.25}, -- NodeBox11
			{-0.5, 0.3125, -0.25, -0.25, 0.375, 0.25}, -- NodeBox12
			{0.25, 0.3125, -0.25, 0.5, 0.375, 0.25}, -- NodeBox13
			{-0.5, 0.25, -0.25, -0.3125, 0.3125, 0.25}, -- NodeBox14
			{0.3125, 0.25, -0.25, 0.5, 0.3125, 0.25}, -- NodeBox15
			{-0.5, 0.125, -0.25, -0.375, 0.25, 0.25}, -- NodeBox16
			{0.375, 0.125, -0.25, 0.5, 0.25, 0.25}, -- NodeBox17
			{-0.5, -0.5, -0.25, -0.4375, 0.125, 0.25}, -- NodeBox18
			{0.4375, -0.5, -0.25, 0.5, 0.125, 0.25}, -- NodeBox19
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{0.0625, 0.4375, -0.25, 0.5, 0.5, 0.25}, -- NodeBox1
			{-0.5, 0.4375, -0.25, -0.0625, 0.5, 0.25}, -- NodeBox2
			{-0.5, 0.375, -0.25, -0.125, 0.4375, 0.25}, -- NodeBox10
			{0.125, 0.375, -0.25, 0.5, 0.4375, 0.25}, -- NodeBox11
			{-0.5, 0.3125, -0.25, -0.25, 0.375, 0.25}, -- NodeBox12
			{0.25, 0.3125, -0.25, 0.5, 0.375, 0.25}, -- NodeBox13
			{-0.5, 0.25, -0.25, -0.3125, 0.3125, 0.25}, -- NodeBox14
			{0.3125, 0.25, -0.25, 0.5, 0.3125, 0.25}, -- NodeBox15
			{-0.5, 0.125, -0.25, -0.375, 0.25, 0.25}, -- NodeBox16
			{0.375, 0.125, -0.25, 0.5, 0.25, 0.25}, -- NodeBox17
			{-0.5, -0.5, -0.25, -0.4375, 0.125, 0.25}, -- NodeBox18
			{0.4375, -0.5, -0.25, 0.5, 0.125, 0.25}, -- NodeBox19
		},
	},
})



