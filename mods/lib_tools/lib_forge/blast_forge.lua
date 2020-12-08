



minetest.register_node("lib_forge:furnace_blast_empty", {
	description = "Blast Furnace",
	drawtype = "nodebox",
	groups = {cracky=2, oddly_breakable_by_hand=1},
	tiles = {"lib_forge_furnace_bottom.png", "lib_forge_furnace_bottom.png", "lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png"},
	infotext = "Blast Furnace (empty)",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		},
	},
	--on_rotate = screwdriver.rotate_simple,
	--on_construct = function(pos)
	--	cauldron.stop_sound(pos)
	--end,
	--on_rightclick = cauldron.filling,
})

minetest.register_node("lib_forge:furnace_blast_idle", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	tiles = {
			{image="lib_forge_furnace_blase_embers_animated.png",backface_culling=false,animation={type="vertical_frames",aspect_w=16,aspect_h=16,length=1.5}},"lib_forge_furnace_blast_bottom.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png"
		 },
	drop = "lib_tools:furnace_blast_empty",
	infotext = "Blast Furnace (idle)",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		},
	},
	--on_rotate = screwdriver.rotate_simple,
	--on_rightclick = cauldron.filling,
	--on_construct = cauldron.idle_construct,
	--on_timer = cauldron.idle_timer
})

minetest.register_node("lib_forge:furnace_blast_boiling", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	drop = "lib_tools:furnace_blast_empty",
	infotext = "Blast Furnace (active) - Drop foods inside to make a soup",
	damage_per_second = 2,
	tiles = {
			{image="lib_forge_furnace_blase_embers_animated.png",backface_culling=false,animation={type="vertical_frames",aspect_w=16,aspect_h=16,length=1.5}},"lib_materials_tech_forge_bottom.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png"
		 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		},
	},
	--on_rotate = screwdriver.rotate_simple,
	--on_rightclick = cauldron.filling,
	--on_construct = cauldron.boiling_construct,
	--on_destruct = function(pos)
	--	cauldron.stop_sound(pos)
	--end,
	--on_timer = cauldron.boiling_timer
})

minetest.register_node("lib_forge:furnace_blast_soup", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	drop = "lib_tools:furnace_blast_empty",
	infotext = "Blast Furnace (active) - Use a bowl to eat the soup",
	damage_per_second = 2,
	tiles = {
			{image="lib_forge_furnace_blase_embers_animated.png",backface_culling=false,animation={type="vertical_frames",aspect_w=16,aspect_h=16,length=1.5}},"lib_materials_tech_forge_bottom.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png",
			"lib_forge_furnace_blast_side.png", "lib_forge_furnace_blast_side.png"
		 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		},
	},
	--on_rotate = screwdriver.rotate_simple,
	--on_rightclick = cauldron.take_soup,
	--on_destruct = function(pos)
	--	cauldron.stop_sound(pos)
	--end
})








