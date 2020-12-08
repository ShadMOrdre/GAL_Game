-------------------------------------------------------------
--DRYSTACK
-- construction from loose stones, boulders etc


---------------------------------
--DRYSTACK WALLS
-- walls made from stacked stones
-- made from loose found stones

minetest.register_node("earthbuild:drystack", {
	description = "Drystack Wall",
	tiles = {"earthbuild_drystack.png"},
	groups = {cracky = 3, stone = 2, oddly_breakable_by_hand = 1},
	sounds = gal.node_sound_stone_defaults(),
})

--find good stones in the gravel
minetest.register_craft({
	output = 'earthbuild:drystack',
	recipe = {
		{'default:gravel', '', 'default:gravel'},
	}
})

--stack flints
minetest.register_craft({
	output = 'earthbuild:drystack',
	recipe = {
		{'default:flint', 'default:flint', 'default:flint'},
		{'default:flint', 'default:flint', 'default:flint'},
		{'default:flint', 'default:flint', 'default:flint'},
	}
})


--recycle field wall
minetest.register_craft({
	output = 'earthbuild:drystack',
	recipe = {
		{'earthbuild:drystack_wall'},
	}
})


--gal.lib.shapes.register_basic_set("earthbuild:drystack")

--[[
-- Stairs and slab for drystack
stairs.register_stair_and_slab("drystack", "earthbuild:drystack",
		{cracky = 3, stone = 2, oddly_breakable_by_hand = 1},
		{"earthbuild_drystack.png"},
		"Drystack Stair",
		"Drystack Slab",
		gal.node_sound_stone_defaults())

--Wall for drystack
walls.register("earthbuild:drystack_wall", "Drystack Field Wall", "earthbuild_drystack.png",
		"earthbuild:drystack", gal.node_sound_stone_defaults())
--]]