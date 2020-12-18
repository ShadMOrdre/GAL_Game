-- -- WIP miner by NewbProgrammer101 or roboto

 local miner_def = {
	 dialogues = {},
	 textures = {"miner.png"},
	 initial_inventory = {
		 {name="lib_handtools:tool_pick_steel", chance=1},
		 {name="lib_handtools:tool_shovel_bronze", chance=1}
	 },
	 schedule_entries = {
		 [7] = {
			 [1] = {
				 task = npc.commands.cmd.WALK_TO_POS,
				 args = {
					 end_pos = npc.locations.data.OTHER.HOME_OUTSIDE,
					 walkable = {}
				 }
			 },
			 [2] = {
				 check = true,
				 range = 3,
				 random_execution_times = true,
				 min_count = 20,
				 max_count = 99,
				 nodes = {"gal:dirt", "gal:dirt_with_grass", "gal:sand", "gal:sand_desert", "gal:sand_silver", "gal:stone_gravel", "gal:clay", "gal:snow", "gal:snowblock"},
				 actions = {
					 ["gal:dirt"] = {
						 [1] = {
							 action = npc.commands.cmd.WALK_STEP
						 },
						 [2] = {
							 action = npc.commands.cmd.DIG
						 }
					 }
				 }
			 },

			 none_actions = {
				 [1] = {
					 action = npc.commands.cmd.WALK_STEP,
					 args = {
						-- dir = "random"
					 }
				 }
			 }
		 }
	 }
 }

-- -- Occupation registration
 npc.occupations.register_occupation("default_miner", miner_def)
