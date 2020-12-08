--[[
Add natural slopes to Minetest Game
--]]



--Leaves slopes
	natural_slopes.register_slope("lib_ecology:tree_conifers_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_conifers_leaves.png"},
		description = "Conifer Leaves slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_pine_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_pine_leaves.png"},
		description = "Pine Leaves slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_pine_lodgepole_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_pine_lodgepole_leaves.png"},
		description = "Lodgepole Pine Leaves slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_pine_pinyon_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_pine_pinyon_leaves.png"},
		description = "Pinyon Pine Leaves slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_fir_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_fir_leaves.png"},
		description = "Fir Needles slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_fir_coast_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_fir_coast_leaves.png"},
		description = "Coast Fir Needles slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)
	natural_slopes.register_slope("lib_ecology:tree_fir_doug_leaves", {
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		tiles = {"lib_ecology_tree_fir_doug_leaves.png"},
		description = "Doaglas Fir Needles slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "node_sound_leaves_defaults", ['gain'] = 0.25},})
		},
		10
	)

--Sand Slopes
	natural_slopes.register_slope("lib_materials:sand", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_default.png"},
		description = "Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_beach", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_beach.png"},
		description = "Beach Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_beach_wet", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_beach_wet.png"},
		description = "Beach Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_black", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_black.png"},
		description = "Black Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_desert", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_desert_default.png"},
		description = "Desert Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_iron", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"aotearoa_iron_sand.png"},
		description = "Iron Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_red", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_red.png"},
		description = "Red Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_silver", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_silver_default.png"},
		description = "Silver Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:sand_volcanic", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_volcanic.png"},
		description = "Volcanic Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("lib_materials:sand_volcanic2", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"aotearoa_volcanic_sand.png"},
		description = "Volcanic2 Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("lib_materials:sand_white", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_white.png"},
		description = "White Sand slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		1
	)

--Stone Slopes
	natural_slopes.register_slope("lib_materials:stone_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_gravel_default.png"},
		description = "Stone - Gravel slope",
		sounds = lib_materials.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:stone_desert_gravel", {
		groups = {crumbly = 3, falling_node = 1, gravel = 1},
		tiles = {"lib_materials_stone_desert_gravel.png"},
		description = "Stone - Desert Stone Gravel slope",
		sounds = lib_materials.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:stone_sandstone_desert_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_sandstone_desert_gravel.png"},
		description = "Stone - Desert Sandstone Gravel slope",
		sounds = lib_materials.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:stone_sandstone_white_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_sandstone_white_gravel.png"},
		description = "Stone -  - White Sandstone Gravel slope",
		sounds = lib_materials.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("lib_materials:seashells", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"aotearoa_seashells.png"},
		description = "Seashells slope",
		sounds = lib_materials.node_sound_gravel_defaults()},
		5
	)

--Dirt Slopes
	natural_slopes.register_slope("lib_materials:dirt_with_stone_cobble", {
		groups = {crumbly = 3, falling_node = 1},
		tiles = {"lib_materials_stone_cobble_default.png^(lib_materials_dirt.png^[mask:lib_materials_mask_cobble.png)"},
		description = "Dirt with Stone Cobble slope",
		sounds = lib_materials.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_bamboo", {
		groups = {crumbly = 3},
		description = "Dirt with Bamboo Grass slope",
		tiles = {top = "lib_materials_grass_bamboo_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_bamboo_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_bamboo_side.png",tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_crystal", {
		groups = {crumbly = 3},
		description = "Dirt with Crystal Grass slope",
		tiles = {top = "lib_materials_grass_crystal_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_crystal_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_crystal_side.png",tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_cold", {
		groups = {crumbly = 3},
		description = "Dirt with Cold Grass slope",
		tiles = {top = "lib_materials_grass_cold_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_cold_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_cold_side.png",tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_fungi", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Fungi Covered slope",
		tiles = {top = "lib_materials_grass_fungi_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_fungi_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_fungi_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_gray", {
		groups = {crumbly = 3},
		description = "Dirt with Gray Grass slope",
		tiles = {top = "lib_materials_grass_gray_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_gray_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_gray_side.png",	tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_green", {
		description = "Dirt with Green Grass slope",
		tiles = {top = "lib_materials_grass_green_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_green_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_green_side.png", tileable_vertical = false}},
		groups = {crumbly = 3},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_grove", {
		groups = {crumbly = 3},
		description = "Dirt with Grove Grass slope",
		tiles = {top = "lib_materials_grass_grove_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_grove_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_grove_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_jungle_01", {
		groups = {crumbly = 3},
		description = "Dirt with Jungle 01 Grass slope",
		tiles = {top = "lib_materials_grass_jungle_01_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_jungle_01_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_jungle_01_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_jungle_02", {
		groups = {crumbly = 3},
		description = "Dirt with Jungle 02 Grass slope",
		tiles = {top = "lib_materials_grass_jungle_02_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_jungle_02_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_jungle_02_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_leafy", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Leaf Covered slope",
		tiles = {top = "lib_materials_grass_leafy_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_leafy_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_leafy_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_mushroom", {
		groups = {crumbly = 3},
		description = "Dirt with Mushroom Grass slope",
		tiles = {top = "lib_materials_grass_mushroom_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_mushroom_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_mushroom_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_prairie", {
		groups = {crumbly = 3},
		description = "Dirt with Prairie Grass slope",
		tiles = {top = "lib_materials_grass_prairie_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_prairie_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_prairie_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:dirt_with_grass_swamp", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Swamp slope",
		tiles = {top = "lib_materials_grass_swamp_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_swamp_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_swamp_side.png", tileable_vertical = false}},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)

--Grass slopes
local function register_dirt_slopes(readname)

	local name = readname:lower()
	local itemstr_dirt = "lib_materials:" .. name
	local tilestr = "lib_materials_" .. name .. ".png"


	natural_slopes.register_slope(itemstr_dirt, {
		groups = {crumbly = 3},
		tiles = {tilestr},
		description = "Dirt slope",
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)

	natural_slopes.register_slope("lib_materials:" .. name .. "_with_litter_coniferous", {
		description = readname .. " with Coniferous Litter slope",
		tiles = {top = "lib_materials_litter_coniferous.png",
			bottom = tilestr,
			front = "lib_materials_litter_coniferous.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:" .. name .. "_with_litter_rainforest", {
		description = readname .. " with Rainforest Litter slope",
		tiles = {top = "lib_materials_litter_rainforest.png",
			bottom = tilestr,
			front = "lib_materials_litter_rainforest.png",
			side = {name = tilestr .. "^lib_materials_litter_rainforest_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

	natural_slopes.register_slope("lib_materials:" .. name .. "_with_soil", {
		description = readname .. " with Soil slope",
		tiles = {top = tilestr .. "^lib_materials_dirt_soil_mask.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_dirt_soil_mask.png",
			side = {name = tilestr,
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_dirt_footstep", gain = 0.15},})
		},
		1
	)
	natural_slopes.register_slope("lib_materials:" .. name .. "_with_soil_wet", {
		description = readname .. " with Wet Soil slope",
		tiles = {top = tilestr .. "^lib_materials_dirt_soil_wet_mask.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_dirt_soil_wet_mask.png",
			side = {name = tilestr .. "^lib_materials_ground_soil_wet_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_dirt_footstep", gain = 0.15},})
		},
		1
	)

	natural_slopes.register_slope("lib_materials:" .. name .. "_with_snow", {
		description = readname .. " with Snow slope",
		tiles = {top = "lib_materials_snow.png",
			bottom = tilestr,
			front = "lib_materials_snow.png",
			side = {name = tilestr .. "^lib_materials_snow.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, snowy = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_snow_footstep", gain = 0.15},})
		},
		1
	)

	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_fungi", {
		description = readname .. " with Fungal Litter",
		tiles = {top = "lib_materials_grass_fungi_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_fungi_top.png",
			side = {name = tilestr .. "^lib_materials_grass_fungi_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_leaf_01", {
		description = readname .. " with Leaf Litter 01",
		tiles = {top = tilestr .. "^lib_materials_litter_leaf_01.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_leaf_01.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_leaf_02", {
		description = readname .. " with Leaf Litter 02",
		tiles = {top = tilestr .. "^lib_materials_litter_leaf_02.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_leaf_02.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_stones", {
		description = readname .. " with Stone Litter",
		tiles = {top = tilestr .. "^lib_materials_litter_stones.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_stones.png",
			side = {name = tilestr .. "^lib_materials_litter_stones_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_vine", {
		description = readname .. " with Vine Litter",
		tiles = {top = tilestr .. "^lib_materials_litter_vine.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_vine.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)

	natural_slopes.register_slope("lib_materials:" .. name .. "_with_grass", {
		description = readname .. " with Grass slope",
		tiles = {top = "lib_materials_grass_default_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_default_top.png",
			side = {name = tilestr .. "^lib_materials_grass_default_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	
	natural_slopes.register_slope("lib_materials:" .. name .. "_with_grass_dry", {
		description = readname .. " with Dry Grass slope",
		tiles = {top = "lib_materials_grass_dry_default_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_dry_default_top.png",
			side = {name = tilestr .. "^lib_materials_grass_dry_default_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
--[[
	 natural_slopes.register_slope("lib_materials:dirt_with_grass_brown", {
		 description = "Dirt with Brown Grass slope",
		 tiles = {top = "lib_materials_grass_brown_top.png",
			 bottom = "lib_materials_dirt.png",
			 front = "lib_materials_grass_brown_top.png",
			 side = {name = "lib_materials_dirt.png^(lib_materials_grass_brown_side.png)",
				 tileable_vertical = false}},
		 groups = {crumbly = 3, soil = 1},
		 sounds = lib_materials.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		 },
		 1
	 )
--]]
end


	register_dirt_slopes("Dirt")
	register_dirt_slopes("Dirt_Black")
	register_dirt_slopes("Dirt_Brown")
	register_dirt_slopes("Dirt_Clay")
	register_dirt_slopes("Dirt_Clay_Red")
	register_dirt_slopes("Dirt_Clay_White")
	register_dirt_slopes("Dirt_Clayey")
	register_dirt_slopes("Dirt_Coarse")
	register_dirt_slopes("Dirt_Compacted")
	register_dirt_slopes("Dirt_Dark")
	register_dirt_slopes("Dirt_Dried")
	register_dirt_slopes("Dirt_Dry")
	register_dirt_slopes("Dirt_Loam")
	register_dirt_slopes("Dirt_Mud_01")
	register_dirt_slopes("Dirt_Mud_02")
	register_dirt_slopes("Dirt_Mud_Dried")
	register_dirt_slopes("Dirt_Peat")
	register_dirt_slopes("Dirt_Permafrost")
	register_dirt_slopes("Dirt_Red")
	register_dirt_slopes("Dirt_Sandy")
	register_dirt_slopes("Dirt_Silt_01")
	register_dirt_slopes("Dirt_Silt_02")
	register_dirt_slopes("Dirt_Silt_03")
	register_dirt_slopes("Dirt_Silty")
	register_dirt_slopes("Dirt_Sod")








