

lib_economy = {}

local S = gal.intllib

minetest.register_craftitem("lib_economy:copper_coin", {
	description = S("Copper Coin"),
	inventory_image = "maptools_copper_coin.png",
	wield_scale = {x = 0.5, y = 0.5, z = 0.25},
	stack_max = 10000,
	groups = {lib_economy = 1, lib_economy_value = 3},
})

minetest.register_craftitem("lib_economy:silver_coin", {
	description = S("Silver Coin"),
	inventory_image = "maptools_silver_coin.png",
	wield_scale = {x = 0.5, y = 0.5, z = 0.25},
	stack_max = 10000,
	groups = {lib_economy = 1, lib_economy_value = 2},
})

minetest.register_craftitem("lib_economy:gold_coin", {
	description = S("Gold Coin"),
	inventory_image = "maptools_gold_coin.png",
	wield_scale = {x = 0.5, y = 0.5, z = 0.25},
	stack_max = 10000,
	groups = {lib_economy = 1, lib_economy_value = 1},
})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_economy:copper_coin 20",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "gal:metal_copper_ingot", ''},
		}
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_economy:silver_coin 20",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "gal:metal_silver_ingot", ''},
		}
	})

	-- crafting recipe
	minetest.register_craft({
		output = "lib_economy:gold_coin 20",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "gal:metal_gold_ingot", ''},
		}
	})

	minetest.register_craft({
		output = "lib_economy:silver_coin",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "lib_economy:copper_coin 10", ''},
		}
	})

	minetest.register_craft({
		output = "lib_economy:copper_coin 10",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "lib_economy:silver_coin", ''},
		}
	})

	minetest.register_craft({
		output = "lib_economy:gold_coin",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "lib_economy:silver_coin 10", ''},
		}
	})

	minetest.register_craft({
		output = "lib_economy:silver_coin 10",
		recipe = {
			{ '', '', '' },
			{ '', '', ''},
			{ '', "lib_economy:gold_coin", ''},
		}
	})

