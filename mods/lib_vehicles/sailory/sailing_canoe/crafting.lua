--if default then
	minetest.register_craft(
		{
			output = "sailing_canoe:sail",
			recipe =
			{
				{""             , "default:paper", "group:stick"},
				{"default:paper", "default:paper", "group:stick"},
				{""             , ""             , "group:stick"},
			},
		})
	minetest.register_craft(
		{
			output = "sailing_canoe:canoe",
			recipe =
			{
				{"group:tree", "group:stick"       , "group:tree"},
				{"group:tree", "sailing_canoe:sail", "group:tree"},
				{"group:tree", "group:stick"       , "group:tree"},
			},
		})
--end
