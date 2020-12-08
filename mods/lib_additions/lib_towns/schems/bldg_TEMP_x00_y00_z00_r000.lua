




local T = lib_towns.schems.T



--Air, Lava, and Water constants used throughout schematics
		local __ = T["_____"] or {name = "air", param2 = 0, prob = 0}
		local wt = T["wwwww"] or {name = "lib_materials:liquid_water_source", param2 = 0, prob = 254}
		local lv = T["lllll"] or {name = "lib_materials:liquid_lava_source", param2 = 0, prob = 254}
		local lf = T["llfll"] or {name = "lib_materials:liquid_lava_flowing", param2 = 0, prob = 254}
		
--Node Definitions
		local M0 = T["S0m00"] or {name = "lib_materials:stone", param2 = 0, prob = 254}
		local M1 = T["C0m00"] or {name = "lib_materials:stone_cobble", param2 = 0, prob = 254}
		local M2 = T["K0m00"] or {name = "lib_materials:stone_brick", param2 = 0, prob = 254}
		local M3 = T["X0m00"] or {name = "lib_materials:stone_block", param2 = 0, prob = 254}
		--local M4 = T[""] or {name = "lib_materials:stone_stucco", param2 = 0, prob = 254}
		local M5 = T["K0L03"] or {name = "lib_materials:stone_brick_slab", param2 = 3, prob = 254}
		local M6 = T["C0S00"] or {name = "lib_materials:stone_cobble_stairs", param2 = 0, prob = 254}
		local M7 = T["K0L00"] or {name = "lib_materials:stone_brick_slab", param2 = 0, prob = 254}
		local M8 = T["C0L23"] or {name = "lib_materials:stone_cobble_slab", param2 = 23, prob = 254}
		--local M9 = {name = "", param2 = 0, prob = 254}
		--local MX = {name = "", param2 = 4, prob = 254}
		--local MZ = {name = "", param2 = 8, prob = 254}

		local N1 = T["sssss"] or {name = "lib_materials:sand", param2 = 0, prob = 254}
		local N2 = T["V0m00"] or {name = "lib_materials:stone_gravel", param2 = 0, prob = 254}
		local N3 = T["C0m00"] or {name = "lib_materials:stone_cobble_mossy", param2 = 0, prob = 254}
		local N4 = T["K0m00"] or {name = "lib_materials:stone_brick_mossy", param2 = 0, prob = 254}
		--local N5 = {name = "lib_materials:stone_tile", param2 = 0, prob = 254}
		--local N6 = {name = "lib_materials:stone_tile_with_dirt", param2 = 0, prob = 254}
		--local N7 = {name = "lib_materials:stone_tile_mossy", param2 = 0, prob = 254}
		--local N8 = {name = "lib_materials:stone_tile_crumbled", param2 = 0, prob = 254}
		local N9 = T["W0m00"] or {name = "lib_ecology:tree_default_wood", param2 = 0, prob = 254}
		local NY = T["T0m00"] or {name = "lib_ecology:tree_default_trunk", param2 = 0, prob = 254}
		local NZ = T["T0m04"] or {name = "lib_ecology:tree_default_trunk", param2 = 4, prob = 254}
		local NX = T["T0m08"] or {name = "lib_ecology:tree_default_trunk", param2 = 8, prob = 254}

		--T[""] or 
		--T["S0i00"] or 

		local S0 = T["K0S00"] or {name = "lib_materials:stone_brick_stairs", param2 = 0, prob = 254}
		local S1 = T["K0S01"] or {name = "lib_materials:stone_brick_stairs", param2 = 1, prob = 254}
		local S2 = T["K0S02"] or {name = "lib_materials:stone_brick_stairs", param2 = 2, prob = 254}
		local S3 = T["K0S03"] or {name = "lib_materials:stone_brick_stairs", param2 = 3, prob = 254}
		local S4 = T["K0S20"] or {name = "lib_materials:stone_brick_stairs", param2 = 20, prob = 254}
		local S6 = T["K0S21"] or {name = "lib_materials:stone_brick_stairs", param2 = 21, prob = 254}
		local S7 = T["K0S22"] or {name = "lib_materials:stone_brick_stairs", param2 = 22, prob = 254}
		local S8 = T["K0S23"] or {name = "lib_materials:stone_brick_stairs", param2 = 23, prob = 254}
		local SN = T["K0S04"] or {name = "lib_materials:stone_brick_stairs", param2 = 4, prob = 254}
		local SE = T["K0S05"] or {name = "lib_materials:stone_brick_stairs", param2 = 5, prob = 254}
		local SW = T["K0S06"] or {name = "lib_materials:stone_brick_stairs", param2 = 6, prob = 254}
		local SS = T["K0S07"] or {name = "lib_materials:stone_brick_stairs", param2 = 7, prob = 254}
		
		local Q0 = T["W0L00"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 0, prob = 254}
		local Q1 = T["W0L01"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 1, prob = 254}
		local Q2 = T["W0L02"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 2, prob = 254}
		local Q3 = T["W0L03"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 3, prob = 254}
		local Q5 = T["W0L20"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 20, prob = 254}
		local Q6 = T["W0L21"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 21, prob = 254}
		local Q7 = T["W0L22"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 22, prob = 254}
		local Q8 = T["W0L23"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 23, prob = 254}
		local QN = T["W0L04"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 4, prob = 254}
		local QE = T["W0L08"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 8, prob = 254}
		local QW = T["W0L12"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 12, prob = 254}
		local QS = T["W0L16"] or {name = "lib_ecology:tree_default_wood_slab", param2 = 16, prob = 254}
		
		local O0 = T["S0o00"] or {name = "lib_materials:stone_stairs_outer", param2 = 0, prob = 254}
		local O1 = T["S0o01"] or {name = "lib_materials:stone_stairs_outer", param2 = 1, prob = 254}
		local O2 = T["S0o02"] or {name = "lib_materials:stone_stairs_outer", param2 = 2, prob = 254}
		local O3 = T["S0o03"] or {name = "lib_materials:stone_stairs_outer", param2 = 3, prob = 254}
		local O5 = T["S0i00"] or {name = "lib_materials:stone_stairs_inner", param2 = 0, prob = 254}
		local O6 = T["S0i01"] or {name = "lib_materials:stone_stairs_inner", param2 = 1, prob = 254}
		local O7 = T["S0i02"] or {name = "lib_materials:stone_stairs_inner", param2 = 2, prob = 254}
		local O8 = T["S0i03"] or {name = "lib_materials:stone_stairs_inner", param2 = 3, prob = 254}

		local JW = {name = "lib_ecology:tree_jungle_01_wood", param2 = 0, prob = 254}
		--local PW = {name = "lib_ecology:tree_pine_01_wood", param2 = 0, prob = 254}
		
		local DD = T["ddddd"] or {name = "lib_materials:dirt", param2 = 0, prob = 254}
		local DG = T["ggggg"] or {name = "lib_materials:dirt_with_grass", param2 = 0, prob = 254}
		local GR = DG
		local G1 = T["G0m00"] or {name = "lib_materials:glass", param2 = 0, prob = 254}

		local FF = T["swsws"] or {name = "lib_materials:dirt_with_soil_wet", param2 = 0, prob = 254}
		local CC = T["_Crn5_"] or {name = "lib_ecology:plant_corn_5", param2 = 0, prob = 254}
		
		
		local F0 = T["Fu0N0"] or {name = "lib_forge:furnace", param2 = 0, prob = 254}
		local F1 = T["Fu0E0"] or {name = "lib_forge:furnace", param2 = 1, prob = 254}
		local F2 = T["Fu0S0"] or {name = "lib_forge:furnace", param2 = 2, prob = 254}
		local F3 = T["Fu0W0"] or {name = "lib_forge:furnace", param2 = 3, prob = 254}

		local C0 = T["Cs0N0"] or {name = "lib_chests:chest", param2 = 0, prob = 254}
		local C1 = T["Cs0E0"] or {name = "lib_chests:chest", param2 = 1, prob = 254}
		local C2 = T["Cs0S0"] or {name = "lib_chests:chest", param2 = 2, prob = 254}
		local C3 = T["Cs0W0"] or {name = "lib_chests:chest", param2 = 3, prob = 254}

		local L0 = T["Ld0D0"] or {name = "lib_climbing:ladder_wood", param2 = 0, prob = 254}
		local L1 = T["Ld0D1"] or {name = "lib_climbing:ladder_wood", param2 = 1, prob = 254}
		local L2 = T["Ld0N0"] or {name = "lib_climbing:ladder_wood", param2 = 2, prob = 254}
		local L3 = T["Ld0E0"] or {name = "lib_climbing:ladder_wood", param2 = 3, prob = 254}
		local L4 = T["Ld0S0"] or {name = "lib_climbing:ladder_wood", param2 = 4, prob = 254}
		local L5 = T["Ld0W0"] or {name = "lib_climbing:ladder_wood", param2 = 5, prob = 254}

		local DR = T["Dr0E0"] or {name = "lib_ecology:tree_default_wood_door_centered_300_height_150_width_right", param2 = 1, prob = 254}
		local DL = T["Dl0E0"] or {name = "lib_ecology:tree_default_wood_door_centered_300_height_150_width", param2 = 1, prob = 254}
		local D0 = T["W0DN0"] or {name = "lib_ecology:tree_default_wood_door_centered_with_window", param2 = 0, prob = 254}
		local D1 = T["W0DE0"] or {name = "lib_ecology:tree_default_wood_door_centered_with_window", param2 = 1, prob = 254}
		local D2 = T["W0DS0"] or {name = "lib_ecology:tree_default_wood_door_centered_with_window", param2 = 2, prob = 254}
		local D3 = T["W0DW0"] or {name = "lib_ecology:tree_default_wood_door_centered_with_window", param2 = 3, prob = 254}
		local D5 = T["W0tN0"] or {name = "lib_ecology:tree_default_wood_trapdoor_with_window", param2 = 0, prob = 254}
		local D6 = T["W0tE0"] or {name = "lib_ecology:tree_default_wood_trapdoor_with_window", param2 = 1, prob = 254}
		local D7 = T["W0tS0"] or {name = "lib_ecology:tree_default_wood_trapdoor_with_window", param2 = 2, prob = 254}
		local D8 = T["W0tW0"] or {name = "lib_ecology:tree_default_wood_trapdoor_with_window", param2 = 3, prob = 254}

		local TC = T["TcN00"] or {name = "torch:torch_ceiling", param2 = 0, prob = 254}
		local TT = T["TrN00"] or {name = "torch:torch", param2 = 1, prob = 254}
		local T1 = T["TwF00"] or {name = "torch:torch_wall", param2 = 1, prob = 254}
		local T2 = T["TwN00"] or {name = "torch:torch_wall", param2 = 2, prob = 254}
		local T3 = T["TwE00"] or {name = "torch:torch_wall", param2 = 3, prob = 254}
		local T4 = T["TwS00"] or {name = "torch:torch_wall", param2 = 4, prob = 254}
		local T5 = T["TwW00"] or {name = "torch:torch_wall", param2 = 5, prob = 254}
		local T6 = {name = "decoblocks:lantern_wall", param2 = 2, prob = 254}
		--local T7 =  or {name = "decoblocks:lantern_wall", param2 = 3, prob = 254}
		--local T8 =  or {name = "decoblocks:lantern_wall", param2 = 4, prob = 254}
		--local T9 =  or {name = "decoblocks:lantern_wall", param2 = 5, prob = 254}
		--local T0 =  or {name = "decoblocks:lantern_ceiling", param2 = 0, prob = 254}

		local A0 = T["AnN00"] or {name = "lib_forge:anvil", param2 = 0, prob = 254}
		local A1 = T["AnE00"] or {name = "lib_forge:anvil", param2 = 1, prob = 254}
		local A2 = T["AnS00"] or {name = "lib_forge:anvil", param2 = 2, prob = 254}
		local A3 = T["AnW00"] or {name = "lib_forge:anvil", param2 = 3, prob = 254}
		--local AA =  or {name = "decoblocks:altar", param2 = 2, prob = 254}

		local B0 = T["Bb0N0"] or {name = "beds:bed_bottom", param2 = 0, prob = 254}
		local B1 = T["Bb0E0"] or {name = "beds:bed_bottom", param2 = 1, prob = 254}
		local B2 = T["Bb0S0"] or {name = "beds:bed_bottom", param2 = 2, prob = 254}
		local B3 = T["Bb0W0"] or {name = "beds:bed_bottom", param2 = 3, prob = 254}
		local B5 = T["Bt0N0"] or {name = "beds:bed_top", param2 = 0, prob = 254}
		local B6 = T["Bt0E0"] or {name = "beds:bed_top", param2 = 1, prob = 254}
		local B7 = T["Bt0S0"] or {name = "beds:bed_top", param2 = 2, prob = 254}
		local B8 = T["Bt0W0"] or {name = "beds:bed_top", param2 = 3, prob = 254}
		local BN = T["Bs0N0"] or {name = "lib_books:bookshelf", param2 = 0, prob = 254}
		local BE = T["Bs0e0"] or {name = "lib_books:bookshelf", param2 = 1, prob = 254}
		local BS = T["Bs0S0"] or {name = "lib_books:bookshelf", param2 = 2, prob = 254}
		local BW = T["Bs0W0"] or {name = "lib_books:bookshelf", param2 = 3, prob = 254}

		local RB = {name = "lib_tools:ropebox", param2 = 3, prob = 254}
		local RP = {name = "lib_tools:box_rope", param2 = 0, prob = 254}

		local R0 = T["Rf0N0"] or {name = "cottages:roof_wood", param2 = 0, prob = 254}
		local R1 = T["Rf0E0"] or {name = "cottages:roof_wood", param2 = 1, prob = 254}
		local R2 = T["Rf0S0"] or {name = "cottages:roof_wood", param2 = 2, prob = 254}
		local R3 = T["Rf0W0"] or {name = "cottages:roof_wood", param2 = 3, prob = 254}
		local R5 = T["Rc0N0"] or {name = "cottages:roof_connector_wood", param2 = 0, prob = 254}
		local R6 = T["Rc0E0"] or {name = "cottages:roof_connector_wood", param2 = 1, prob = 254}
		local R7 = T["Rc0S0"] or {name = "cottages:roof_connector_wood", param2 = 2, prob = 254}
		local R8 = T["Rc0W0"] or {name = "cottages:roof_connector_wood", param2 = 3, prob = 254}


		local WR = {name = "wool:wool_red", param2 = 0, prob = 254} or {name = "lib_textiles:fabric_wool_red", param2 = 0, prob = 254}
		local WB = {name = "wool:wool_black", param2 = 0, prob = 254} or {name = "lib_textiles:fabric_wool_black", param2 = 0, prob = 254}
		local WG = {name = "wool:wool_dark_green", param2 = 0, prob = 254} or {name = "lib_textiles:fabric_wool_dark_green", param2 = 0, prob = 254}
		local WL = {name = "wool:wool_white", param2 = 0, prob = 254} or {name = "lib_textiles:fabric_wool_white", param2 = 0, prob = 254}
		local WY = {name = "wool:wool_yellow", param2 = 0, prob = 254} or {name = "lib_textiles:fabric_wool_yellow", param2 = 0, prob = 254}

		local WF = T["SwF00"] or {name = "signs:wooden_sign", param2 = 1, prob = 254}
		local WN = T["SwN00"] or {name = "signs:wooden_sign", param2 = 2, prob = 254}
		local WE = T["SwE00"] or {name = "signs:wooden_sign", param2 = 3, prob = 254}
		local WS = T["SwS00"] or {name = "signs:wooden_sign", param2 = 4, prob = 254}
		local WW = T["SwW00"] or {name = "signs:wooden_sign", param2 = 5, prob = 254}


		local X0 = T["Xp0N0"] or {name = "xpanes:bar_flat", param2 = 0, prob = 254}
		local X1 = T["Xp0E0"] or {name = "xpanes:bar_flat", param2 = 1, prob = 254}
		local X2 = T["Xp0S0"] or {name = "xpanes:bar_flat", param2 = 2, prob = 254}
		local X3 = T["Xp0W0"] or {name = "xpanes:bar_flat", param2 = 3, prob = 254}
		local X5 = {name = "xpanes:framed_pane_flat", param2 = 0, prob = 254}
		local X6 = {name = "xpanes:framed_pane_flat", param2 = 1, prob = 254}
		local X7 = {name = "xpanes:framed_pane_flat", param2 = 2, prob = 254}
		local X8 = {name = "xpanes:framed_pane_flat", param2 = 3, prob = 254}

		--local Z1 = T[""] or {name = "lib_tools:cauldron_empty", param2 = 0, prob = 254}
		--local Z2 = T[""] or {name = "lib_ecology:tree_default_wood_table_basic_01", param2 = 0, prob = 254}
		local Z3 = T["MtSN0"] or {name = "lib_materials:metal_steel_block", param2 = 0, prob = 254}
		--local Z4 = T[""] or {name = "xpanes:bar_flat", param2 = 1, prob = 254}
		local Z5 = T["Wm0N0"] or {name = "mg_villages:mob_workplace_marker", param2 = 0, prob = 254}
		--local Z6 = T[""] or {name = "cottages:shelf", param2 = 1, prob = 254}
		--local Z7 = T[""] or {name = "cottages:shelf", param2 = 3, prob = 254}
		--local Z8 = T[""] or {name = "cottages:table", param2 = 2, prob = 254}

		--local I0 =  or {name = "air",param2 = 0,prob = 254}
		--local I1 =  or {name = "air",param2 = 1,prob = 254}
		--local I2 =  or {name = "air",param2 = 2,prob = 254}
		--local I3 =  or {name = "air",param2 = 3,prob = 254}
		--local I4 =  or {name = "",param2 = 0,prob = 254}
		--local I5 = T[""] or {name = "lib_tools:draft_table",param2 = 0,prob = 254}
		--local I6 = T[""] or {name = "decoblocks:vase",param2 = 0,prob = 254}
		--local I7 =  or {name = "air",param2 = 0,prob = 254}
		--local I8 =  or {name = "",param2 = 0,prob = 254}
		--local I9 =  or {name = "",param2 = 0,prob = 254}

		local II = {name = "lib_ecology:tree_default_wood_fence",param2 = 0,prob = 254}
		--local SB = {name = "lib_materials:stone_block", param2 = 3, prob = 254}
		--local WR = {name = "wool:wool_red", param2 = 3, prob = 254} or {name = "lib_textiles:fabric_wool_red", param2 = 3, prob = 254}




return 



