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


gal.lib.shapes.register_shape("fence", {
	description = S("Fence"), 
	shape_type = "connected",
	tiles = {

		"(overlay_fence_top_post.png^(wall_texture^[transformR90)^overlay_fence_top_post.png^[makealpha:255,126,126)^(overlay_fence_top_rail.png^wall_texture^overlay_fence_top_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_top_post.png^(wall_texture^[transformR90)^overlay_fence_top_post.png^[makealpha:255,126,126)^(overlay_fence_top_rail.png^wall_texture^overlay_fence_top_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^(wall_texture^[transformR90)^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^(wall_texture^[transformR90)^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^(wall_texture^[transformR90)^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^(wall_texture^[transformR90)^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

	},
	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		},
		connect_front = {
			{-0.0625, 0.1875, -0.5, 0.0625, 0.4375, -0.125}, -- Top
			{-0.0625, -0.3125, -0.5, 0.0625, -0.125, -0.125}, -- Bottom
		},
		connect_back = {
			{-0.0625, 0.1875, 0.125, 0.0625, 0.4375, 0.5}, -- Top
			{-0.0625, -0.3125, 0.125, 0.0625, -0.125, 0.5}, -- Bottom
		},
		connect_left = {
			{-0.5, 0.1875, -0.0625, -0.125, 0.4375, 0.0625}, -- Top
			{-0.5, -0.3125, -0.0625, -0.125, -0.125, 0.0625}, -- Bottom
		},
		connect_right = {
			{0.125, 0.1875, -0.0625, 0.5, 0.4375, 0.0625}, -- Top
			{0.125, -0.3125, -0.0625, 0.5, -0.125, 0.0625}, -- Bottom
		},
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
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})


gal.lib.shapes.register_shape("fence_stone_cobble_post", {
	description = S("Fence with Cobblestone Post"), 
	shape_type = "connected",
	tiles = {

		"(overlay_fence_top_post.png^lib_materials_stone_cobble_default.png^overlay_fence_top_post.png^[makealpha:255,126,126)^(overlay_fence_top_rail.png^wall_texture^overlay_fence_top_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_top_post.png^lib_materials_stone_cobble_default.png^overlay_fence_top_post.png^[makealpha:255,126,126)^(overlay_fence_top_rail.png^wall_texture^overlay_fence_top_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^lib_materials_stone_cobble_default.png^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^lib_materials_stone_cobble_default.png^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^lib_materials_stone_cobble_default.png^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

		"(overlay_fence_side_post.png^lib_materials_stone_cobble_default.png^overlay_fence_side_post.png^[makealpha:255,126,126)^(overlay_fence_side_rail.png^wall_texture^overlay_fence_side_rail.png^[makealpha:255,126,126)",

	},

	node_box = {
		type = "connected",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		},
		connect_front = {
			{-0.0625, 0.1875, -0.5, 0.0625, 0.4375, -0.125}, -- Top
			{-0.0625, -0.3125, -0.5, 0.0625, -0.125, -0.125}, -- Bottom
		},
		connect_back = {
			{-0.0625, 0.1875, 0.125, 0.0625, 0.4375, 0.5}, -- Top
			{-0.0625, -0.3125, 0.125, 0.0625, -0.125, 0.5}, -- Bottom
		},
		connect_left = {
			{-0.5, 0.1875, -0.0625, -0.125, 0.4375, 0.0625}, -- Top
			{-0.5, -0.3125, -0.0625, -0.125, -0.125, 0.0625}, -- Bottom
		},
		connect_right = {
			{0.125, 0.1875, -0.0625, 0.5, 0.4375, 0.0625}, -- Top
			{0.125, -0.3125, -0.0625, 0.5, -0.125, 0.0625}, -- Bottom
		},
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
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})


gal.lib.shapes.register_shape("rail", {
	description = S("Rail"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.1875, -0.5, 0.4375, -0.125, 0.375, 0.5}, -- support2 from front
			{0.0625, -0.5, 0.4375, 0.125, 0.375, 0.5}, -- support3 from front
			{0.3125, -0.5, 0.4375, 0.375, 0.375, 0.5}, -- support4 from front
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- top rail
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.1875, -0.5, 0.4375, -0.125, 0.375, 0.5}, -- support2 from front
			{0.0625, -0.5, 0.4375, 0.125, 0.375, 0.5}, -- support3 from front
			{0.3125, -0.5, 0.4375, 0.375, 0.375, 0.5}, -- support4 from front
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- top rail
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.1875, -0.5, 0.4375, -0.125, 0.375, 0.5}, -- support2 from front
			{0.0625, -0.5, 0.4375, 0.125, 0.375, 0.5}, -- support3 from front
			{0.3125, -0.5, 0.4375, 0.375, 0.375, 0.5}, -- support4 from front
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- top rail
		},
	},
})

gal.lib.shapes.register_shape("rail_stair", {
	description = S("Rail Stair"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.5, 0.375, 0.375, -0.25, 0.5, 0.5}, -- top rail
			{-0.1875, -0.5, 0.4375, -0.125, 0.125, 0.5}, -- support2 from front
			{-0.25, 0.125, 0.375, 0.0, 0.25, 0.5}, -- top rail
			{0.0625, -1.0, 0.4375, 0.125, -0.125, 0.5}, -- support3 from front
			{0.0, -0.125, 0.375, 0.25, 0.0, 0.5}, -- top rail
			{0.3125, -1.0, 0.4375, 0.375, -0.375, 0.5}, -- support4 from front
			{0.25, -0.375, 0.375, 0.5, -0.25, 0.5}, -- top rail
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.5, 0.375, 0.375, -0.25, 0.5, 0.5}, -- top rail
			{-0.1875, -0.5, 0.4375, -0.125, 0.125, 0.5}, -- support2 from front
			{-0.25, 0.125, 0.375, 0.0, 0.25, 0.5}, -- top rail
			{0.0625, -1.0, 0.4375, 0.125, -0.125, 0.5}, -- support3 from front
			{0.0, -0.125, 0.375, 0.25, 0.0, 0.5}, -- top rail
			{0.3125, -1.0, 0.4375, 0.375, -0.375, 0.5}, -- support4 from front
			{0.25, -0.375, 0.375, 0.5, -0.25, 0.5}, -- top rail
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.375, 0.375, 0.5}, -- support1 from front
			{-0.5, 0.375, 0.375, -0.25, 0.5, 0.5}, -- top rail
			{-0.1875, -0.5, 0.4375, -0.125, 0.125, 0.5}, -- support2 from front
			{-0.25, 0.125, 0.375, 0.0, 0.25, 0.5}, -- top rail
			{0.0625, -1.0, 0.4375, 0.125, -0.125, 0.5}, -- support3 from front
			{0.0, -0.125, 0.375, 0.25, 0.0, 0.5}, -- top rail
			{0.3125, -1.0, 0.4375, 0.375, -0.375, 0.5}, -- support4 from front
			{0.25, -0.375, 0.375, 0.5, -0.25, 0.5}, -- top rail
		},
	},
})

gal.lib.shapes.register_shape("rail_post", {
	description = S("Rail Post"), 
	shape_type = "basic",
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, -- support1 from front
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, -- support1 from front
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, -- support1 from front
		},
	},
})








