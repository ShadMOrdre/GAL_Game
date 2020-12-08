

local S = lib_handtools.intllib



minetest.register_tool("lib_handtools:stick", {
	description = S("Stick"),
	_doc_items_longdesc = S("A multiuse tool, used for digging, prying, poking, and other things."),
	_doc_items_usagehelp = S("Use this stick to dig up small rocks, carve into a spear or handle for tools, use for building."),
	image           = "lib_handtools_stick.png",
	inventory_image = "lib_handtools_stick.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:biface", {
	description = S("Biface"),
	_doc_items_longdesc = S("Biface."),
	_doc_items_usagehelp = S("Biface."),
	image           = "lib_handtools_biface.png",
	inventory_image = "lib_handtools_biface.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:flint", {
	description = S("Flint"),
	_doc_items_longdesc = S("Flint."),
	_doc_items_usagehelp = S("Flint."),
	image           = "lib_handtools_flint.png",
	inventory_image = "lib_handtools_flint.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:small_rocks", {
	description = S("Small Rocks"),
	_doc_items_longdesc = S("Small Rocks."),
	_doc_items_usagehelp = S("Small Rocks."),
	image           = "lib_handtools_small_rocks.png",
	inventory_image = "lib_handtools_small_rocks.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:stone_chipper", {
	description = S("Stone Chipper"),
	_doc_items_longdesc = S("Stone Chipper."),
	_doc_items_usagehelp = S("Stone Chipper."),
	image           = "lib_handtools_stone_chipper.png",
	inventory_image = "lib_handtools_stone_chipper.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:stone_club", {
	description = S("Stone Club"),
	_doc_items_longdesc = S("Stone club for clubbing things."),
	_doc_items_usagehelp = S("Use this club to club."),
	image           = "lib_handtools_stoneclub.png",
	inventory_image = "lib_handtools_stoneclub.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("lib_handtools:wooden_club", {
	description = S("Wooden Club"),
	_doc_items_longdesc = S("Wooden club for clubbing things."),
	_doc_items_usagehelp = S("Use this club to club."),
	image           = "lib_handtools_woodclub.png",
	inventory_image = "lib_handtools_woodclub.png",
	
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	}
})

