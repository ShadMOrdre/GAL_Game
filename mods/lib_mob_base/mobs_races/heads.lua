minetest.register_node( "mobs_races:skeleton_head", {
	description = "Skeleton Skull (WIP)",
	tiles = {
		"mobs_skeleton_top.png",
		"mobs_skeleton_top.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = gal.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_races:skeleton_archer_head", {
	description = "Wither Skeleton Skull (WIP)",
	tiles = {
		"mobs_skeleton2_top.png",
		"mobs_skeleton2_top.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = gal.node_sound_stone_defaults(),
	stack_max = 1,
})

