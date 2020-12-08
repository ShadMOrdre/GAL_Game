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




---------
-- BEDS
---------

	--"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
	gal.lib.shapes.register_shape("bed_simple", {
		description = S("Bed - Simple"), 
		shape_type = "basic",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.375, 0.5, 0, 1.375},
				{-0.5, -0.5, 1.375, 0.5, 0.5, 1.5},
				{-0.5, -0.5, -0.5, 0.5, 0.1875, -0.375},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.375, 0.5, 0, 1.375},
				{-0.5, -0.5, 1.375, 0.5, 0.5, 1.5},
				{-0.5, -0.5, -0.5, 0.5, 0.1875, -0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.375, 0.5, 0, 1.375},
				{-0.5, -0.5, 1.375, 0.5, 0.5, 1.5},
				{-0.5, -0.5, -0.5, 0.5, 0.1875, -0.375},
			},
		},
	})



---------
-- CHAIRS
---------
	gal.lib.shapes.register_shape("chair_arm_01", {
		description = S("Chair (with armrests) 01"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
				{-0.5, 0, 0.25, 0.5, 0.5, 0.5}, -- NodeBox2
				{-0.5, 0, -0.5, -0.375, 0.25, 0.25}, -- NodeBox3
				{0.375, 0, -0.5, 0.5, 0.25, 0.25}, -- NodeBox4
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
				{-0.5, 0, 0.25, 0.5, 0.5, 0.5}, -- NodeBox2
				{-0.5, 0, -0.5, -0.375, 0.25, 0.25}, -- NodeBox3
				{0.375, 0, -0.5, 0.5, 0.25, 0.25}, -- NodeBox4
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
				{-0.5, 0, 0.25, 0.5, 0.5, 0.5}, -- NodeBox2
				{-0.5, 0, -0.5, -0.375, 0.25, 0.25}, -- NodeBox3
				{0.375, 0, -0.5, 0.5, 0.25, 0.25}, -- NodeBox4
			},
		},
	})

	gal.lib.shapes.register_shape("chair_arm_02", {
		description = S("Chair (with armrests) 02"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.125, -0.5, 0.375, 0, 0.5}, -- NodeBox1
				{-0.4375, 0, 0.25, 0.4375, 0.5, 0.5}, -- NodeBox2
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5}, -- NodeBox3
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox4
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.125, -0.5, 0.375, 0, 0.5}, -- NodeBox1
				{-0.4375, 0, 0.25, 0.4375, 0.5, 0.5}, -- NodeBox2
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5}, -- NodeBox3
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox4
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.125, -0.5, 0.375, 0, 0.5}, -- NodeBox1
				{-0.4375, 0, 0.25, 0.4375, 0.5, 0.5}, -- NodeBox2
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5}, -- NodeBox3
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox4
			},
		},
	})

	gal.lib.shapes.register_shape("chair_basic_01", {
		description = S("Chair Basic 01"), 
		shape_type = "seat",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125}, -- NodeBox1
				{-0.3125, 0, 0.1875, 0.3125, 0.5, 0.3125}, -- NodeBox2
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875}, -- NodeBox3
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875}, -- NodeBox5
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125}, -- NodeBox6
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125}, -- NodeBox7
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125}, -- NodeBox1
				{-0.3125, 0, 0.1875, 0.3125, 0.5, 0.3125}, -- NodeBox2
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875}, -- NodeBox3
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875}, -- NodeBox5
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125}, -- NodeBox6
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125}, -- NodeBox7
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125}, -- NodeBox1
				{-0.3125, 0, 0.1875, 0.3125, 0.5, 0.3125}, -- NodeBox2
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875}, -- NodeBox3
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875}, -- NodeBox5
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125}, -- NodeBox6
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125}, -- NodeBox7
			},
		},
	})


---------
-- SOFAS
---------

	gal.lib.shapes.register_shape("sofa_basic_01_corner", {
		description = S("Sofa Corner (Basic) 01"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.25, 0, 0.25},
				{-0.5, -0.5, 0.25, 0.25, 0.5, 0.5},
				{0.25, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.25, 0, 0.25},
				{-0.5, -0.5, 0.25, 0.25, 0.5, 0.5},
				{0.25, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.25, 0, 0.25},
				{-0.5, -0.5, 0.25, 0.25, 0.5, 0.5},
				{0.25, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
	})

	gal.lib.shapes.register_shape("sofa_basic_01_left", {
		description = S("Sofa Left End (Basic) 01"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.375, -0.375, 0.25, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.375, -0.375, 0.25, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.375, -0.375, 0.25, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5},
			},
		},
	})

	gal.lib.shapes.register_shape("sofa_basic_01_right", {
		description = S("Sofa Right End (Basic) 01"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.375, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.375, 0.5, 0.5},
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.375, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.375, 0.5, 0.5},
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.375, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.375, 0.5, 0.5},
				{0.375, -0.5, -0.5, 0.5, 0.25, 0.5},
			},
		},
	})

	gal.lib.shapes.register_shape("sofa_basic_01_section", {
		description = S("Sofa Section (Basic) 01"), 
		shape_type = "seat",
		tiles = {
			"(overlay_alpha_chair_top_frame.png^wall_texture^overlay_alpha_chair_top_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_top_fabric.png^wool_grey.png^overlay_alpha_chair_top_fabric.png^[makealpha:255,126,126)",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"wall_texture",
			"(overlay_alpha_chair_front_frame.png^wall_texture^overlay_alpha_chair_front_frame.png^[makealpha:255,126,126)^(overlay_alpha_chair_front_fabric.png^wool_grey.png^overlay_alpha_chair_front_fabric.png^[makealpha:255,126,126)",
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.375, -0.5, 0.5, 0, 0.25},
				{-0.5, -0.375, 0.25, 0.5, 0.5, 0.5},
			},
		},
	})
	
	
	
---------
-- TABLES	
---------
	gal.lib.shapes.register_shape("table_basic_01", {
		description = S("Table Basic 01"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
				{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
				{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox5
				{-0.375, -0.5, 0.25, -0.25, 0.375, 0.375}, -- NodeBox6
				{0.25, -0.5, 0.25, 0.375, 0.375, 0.375}, -- NodeBox7
				{-0.3125, -0.125, -0.3125, 0.3125, -0.0625, 0.3125}, -- NodeBox8
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
				{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
				{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox5
				{-0.375, -0.5, 0.25, -0.25, 0.375, 0.375}, -- NodeBox6
				{0.25, -0.5, 0.25, 0.375, 0.375, 0.375}, -- NodeBox7
				{-0.3125, -0.125, -0.3125, 0.3125, -0.0625, 0.3125}, -- NodeBox8
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
				{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
				{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox5
				{-0.375, -0.5, 0.25, -0.25, 0.375, 0.375}, -- NodeBox6
				{0.25, -0.5, 0.25, 0.375, 0.375, 0.375}, -- NodeBox7
				{-0.3125, -0.125, -0.3125, 0.3125, -0.0625, 0.3125}, -- NodeBox8
			},
		},
	})

	gal.lib.shapes.register_shape("table_basic_02", {
		description = S("Table Basic 02"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5},
				{-0.4000, -0.5, -0.4000, -0.1000, -0.0625, -0.1000},
				{0.1000, -0.5, -0.4000, 0.4000, -0.0625, -0.1000},
				{-0.4000, -0.5, 0.1000, -0.1000, -0.0625, 0.4000},
				{0.1000, -0.5, 0.1000, 0.4000, -0.0625, 0.4000},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5},
				{-0.4000, -0.5, -0.4000, -0.1000, -0.0625, -0.1000},
				{0.1000, -0.5, -0.4000, 0.4000, -0.0625, -0.1000},
				{-0.4000, -0.5, 0.1000, -0.1000, -0.0625, 0.4000},
				{0.1000, -0.5, 0.1000, 0.4000, -0.0625, 0.4000},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5},
				{-0.4000, -0.5, -0.4000, -0.1000, -0.0625, -0.1000},
				{0.1000, -0.5, -0.4000, 0.4000, -0.0625, -0.1000},
				{-0.4000, -0.5, 0.1000, -0.1000, -0.0625, 0.4000},
				{0.1000, -0.5, 0.1000, 0.4000, -0.0625, 0.4000},
			},
		},
	})

	gal.lib.shapes.register_shape("table_half_01", {
		description = S("Table Half 01"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
					{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
					{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox6
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
					{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
					{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox6
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
					{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
					{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox6
			},
		},
	})

	gal.lib.shapes.register_shape("table_section_01", {
		description = S("Table Section 01"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
					{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			},
		},
	})



---------
-- STOOLS
---------
	gal.lib.shapes.register_shape("stool_basic_01", {
		description = S("Stool Basic 01"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.0625, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
	})



---------
-- CABINETS
---------
	gal.lib.shapes.register_shape("cabinet_basic_01", {
		description = S("Cabinet Basic 01"), 
		shape_type = "basic",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.5, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.5, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.0625, -0.3125, 0.3125, 0.5, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, -0.0625, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, -0.0625, -0.1875},
				{-0.3125, -0.5, 0.1875, -0.1875, -0.0625, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, -0.0625, 0.3125},
			},
		},
	})
	
	


