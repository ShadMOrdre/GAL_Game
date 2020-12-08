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



gal.lib.shapes.register_shape("lamp_bulb", {
	description = "Light Bulb", 
	shape_type = "light",
	tiles = {
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
		"(overlay_alpha_light_lamp_frame.png^new_node_tiles^overlay_alpha_light_lamp_frame.png^[makealpha:255,126,126)^(overlay_alpha_light_lamp_bulb.png^default_cloud.png^overlay_alpha_light_lamp_bulb.png^[makealpha:255,126,126)",
	},
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.125, 0.125},
		},
		connect_front = {
			{-0.0625, -0.0625, -0.5, 0.0625, 0.0625, -0.125},
		},
		connect_back = {
			{-0.0625, -0.0625, 0.125, 0.0625, 0.0625, 0.5},
		},
		connect_left = {
			{-0.5, -0.0625, -0.0625, -0.125, 0.0625, 0.0625},
		},
		connect_right = {
			{0.125, -0.0625, -0.0625, 0.5, 0.0625, 0.0625},
		},
		connect_bottom = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.125, 0.0625},
		},
		connect_top = {
			{-0.0625, 0.125, -0.0625, 0.0625, 0.5, 0.0625},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.125, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.125, 0.125},
		},
	},
})

gal.lib.shapes.register_shape("lamp_simple_01", {
	description = "Simple Lamp 01", 
	shape_type = "light",
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125},
		},
	},
})

gal.lib.shapes.register_shape("lamp_01", {
	description = "Lamp 01", 
	shape_type = "light",
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.25, 0.125}, -- BASE
			{-0.25, -0.5, -0.25, 0.25, -0.125, 0.25}, -- BOTTOM
			{-0.25, -0.125, 0.1875, -0.1875, 0.3125, 0.25}, -- REARLEFT
			{0.1875, -0.125, 0.1875, 0.25, 0.3125, 0.25}, -- REARRIGHT
			{-0.25, 0.3125, -0.25, 0.25, 0.375, 0.25}, -- TOP
			{-0.25, -0.125, -0.25, -0.1875, 0.3125, -0.1875}, -- FRONTLEFT
			{0.1875, -0.125, -0.25, 0.25, 0.3125, -0.1875}, -- FRONTRIGHT
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.25, 0.125}, -- BASE
			{-0.25, -0.5, -0.25, 0.25, -0.125, 0.25}, -- BOTTOM
			{-0.25, -0.125, 0.1875, -0.1875, 0.3125, 0.25}, -- REARLEFT
			{0.1875, -0.125, 0.1875, 0.25, 0.3125, 0.25}, -- REARRIGHT
			{-0.25, 0.3125, -0.25, 0.25, 0.375, 0.25}, -- TOP
			{-0.25, -0.125, -0.25, -0.1875, 0.3125, -0.1875}, -- FRONTLEFT
			{0.1875, -0.125, -0.25, 0.25, 0.3125, -0.1875}, -- FRONTRIGHT
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.125, -0.125, 0.125, 0.25, 0.125}, -- BASE
			{-0.25, -0.5, -0.25, 0.25, -0.125, 0.25}, -- BOTTOM
			{-0.25, -0.125, 0.1875, -0.1875, 0.3125, 0.25}, -- REARLEFT
			{0.1875, -0.125, 0.1875, 0.25, 0.3125, 0.25}, -- REARRIGHT
			{-0.25, 0.3125, -0.25, 0.25, 0.375, 0.25}, -- TOP
			{-0.25, -0.125, -0.25, -0.1875, 0.3125, -0.1875}, -- FRONTLEFT
			{0.1875, -0.125, -0.25, 0.25, 0.3125, -0.1875}, -- FRONTRIGHT
		},
	},
})

gal.lib.shapes.register_shape("lamp_02", {
	description = "Lamp 02", 
	shape_type = "light",
	node_box = {
		type = "connected",
		fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125},
				{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625},
				{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
				{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125},
				{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625},
				{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
				{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.0, 0.125},
				{-0.0625, 0.0, -0.0625, 0.0625, 0.125, 0.0625},
				{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
				{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
		},
	},
})

gal.lib.shapes.register_shape("light_overhead", {
	description = "Light - Overhead", 
	shape_type = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.250000,-0.250000,0.500000,0.407216,0.250000},
			{-0.500000,0.312500,-0.062500,0.500000,0.500000,0.062500}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.250000,-0.250000,0.500000,0.407216,0.250000},
			{-0.500000,0.312500,-0.062500,0.500000,0.500000,0.062500}, 
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.250000,-0.250000,0.500000,0.407216,0.250000},
			{-0.500000,0.312500,-0.062500,0.500000,0.500000,0.062500}, 
		},
	},
})

gal.lib.shapes.register_shape("light_chandelier_01", {
	description = "Light - Lamp Desktop", 
	shape_type = "light",
	node_box = {
		type = "connected",
		fixed = {
				{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
				{-0.375, -0.25, -0.5, 0.375, -0.125, -0.375}, -- NodeBox2
				{-0.375, -0.25, 0.375, 0.375, -0.125, 0.5}, -- NodeBox3
				{-0.5, -0.25, -0.375, -0.375, -0.125, 0.375}, -- NodeBox4
				{0.375, -0.25, -0.375, 0.5, -0.125, 0.375}, -- NodeBox5
				{-0.4375, -0.3125, -0.4375, -0.375, 0.0, -0.375}, -- NodeBox6
				{-0.4375, -0.3125, 0.375, -0.375, 0.0, 0.4375}, -- NodeBox7
				{0.375, -0.3125, 0.375, 0.4375, 0.0, 0.4375}, -- NodeBox8
				{0.375, -0.3125, -0.4375, 0.4375, 0.0, -0.375}, -- NodeBox9
				{-0.25, -0.3125, -0.25, -0.1875, 0.0, -0.1875}, -- NodeBox11
				{-0.25, -0.3125, 0.1875, -0.1875, 0.0, 0.25}, -- NodeBox12
				{0.1875, -0.3125, -0.25, 0.25, 0.0, -0.1875}, -- NodeBox10
				{0.1875, -0.3125, 0.1875, 0.25, 0.0, 0.25}, -- NodeBox13
				{-0.0625, -0.25, -0.375, 0.0625, -0.125, 0.375}, -- NodeBox14
				{-0.375, -0.25, -0.0625, 0.375, -0.125, 0.0625}, -- NodeBox15
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
				{-0.375, -0.25, -0.5, 0.375, -0.125, -0.375}, -- NodeBox2
				{-0.375, -0.25, 0.375, 0.375, -0.125, 0.5}, -- NodeBox3
				{-0.5, -0.25, -0.375, -0.375, -0.125, 0.375}, -- NodeBox4
				{0.375, -0.25, -0.375, 0.5, -0.125, 0.375}, -- NodeBox5
				{-0.4375, -0.3125, -0.4375, -0.375, 0.0, -0.375}, -- NodeBox6
				{-0.4375, -0.3125, 0.375, -0.375, 0.0, 0.4375}, -- NodeBox7
				{0.375, -0.3125, 0.375, 0.4375, 0.0, 0.4375}, -- NodeBox8
				{0.375, -0.3125, -0.4375, 0.4375, 0.0, -0.375}, -- NodeBox9
				{-0.25, -0.3125, -0.25, -0.1875, 0.0, -0.1875}, -- NodeBox11
				{-0.25, -0.3125, 0.1875, -0.1875, 0.0, 0.25}, -- NodeBox12
				{0.1875, -0.3125, -0.25, 0.25, 0.0, -0.1875}, -- NodeBox10
				{0.1875, -0.3125, 0.1875, 0.25, 0.0, 0.25}, -- NodeBox13
				{-0.0625, -0.25, -0.375, 0.0625, -0.125, 0.375}, -- NodeBox14
				{-0.375, -0.25, -0.0625, 0.375, -0.125, 0.0625}, -- NodeBox15
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
				{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
				{-0.375, -0.25, -0.5, 0.375, -0.125, -0.375}, -- NodeBox2
				{-0.375, -0.25, 0.375, 0.375, -0.125, 0.5}, -- NodeBox3
				{-0.5, -0.25, -0.375, -0.375, -0.125, 0.375}, -- NodeBox4
				{0.375, -0.25, -0.375, 0.5, -0.125, 0.375}, -- NodeBox5
				{-0.4375, -0.3125, -0.4375, -0.375, 0.0, -0.375}, -- NodeBox6
				{-0.4375, -0.3125, 0.375, -0.375, 0.0, 0.4375}, -- NodeBox7
				{0.375, -0.3125, 0.375, 0.4375, 0.0, 0.4375}, -- NodeBox8
				{0.375, -0.3125, -0.4375, 0.4375, 0.0, -0.375}, -- NodeBox9
				{-0.25, -0.3125, -0.25, -0.1875, 0.0, -0.1875}, -- NodeBox11
				{-0.25, -0.3125, 0.1875, -0.1875, 0.0, 0.25}, -- NodeBox12
				{0.1875, -0.3125, -0.25, 0.25, 0.0, -0.1875}, -- NodeBox10
				{0.1875, -0.3125, 0.1875, 0.25, 0.0, 0.25}, -- NodeBox13
				{-0.0625, -0.25, -0.375, 0.0625, -0.125, 0.375}, -- NodeBox14
				{-0.375, -0.25, -0.0625, 0.375, -0.125, 0.0625}, -- NodeBox15
		},
	},
})

