-- Default nodes for Itemshelf mod
-- By Zorman2000


--x = Left,Right;     y = Down/Up;     z = Front/Back;     (axis = neg/pos)

local default_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.4375}, -- NodeBox2
		{-0.4375, -0.5, -0.5, 0.4375, -0.4375, 0.4375}, -- NodeBox3
		{0.4375, -0.5, -0.5, 0.5, 0.5, 0.4375}, -- NodeBox4
		{-0.4375, 0.4375, -0.5, 0.4375, 0.5, 0.4375}, -- NodeBox5
		{-0.4375, -0.0625, -0.5, 0.4375, 0.0625, 0.4375}, -- NodeBox6
	}
}

--[[
		{-0.5, -0.4375, 0.5, 0.5, 0.4375, 0.5}, -- back
		{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- bottom
		{-0.4375, -0.0625, -0.5, 0.4375, 0.0625, 0.4375}, -- middle
		{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- top
		{-0.5, -0.4375, -0.5, -0.4375, 0.4375, 0.4375}, -- left
		{0.4375, -0.4375, -0.5, 0.5, 0.4375, 0.4375}, -- right
--]]

local default_half_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.4375, 0.5, 0.5, -0.0625, 0.5}, -- back
		{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- bottom
		{-0.5, -0.0625, -0.5, 0.5, 0.0, 0.5}, -- top
		{-0.5, -0.4375, -0.5, -0.4375, -0.0625, 0.4375}, -- left
		{0.4375, -0.4375, -0.5, 0.5, -0.0625, 0.4375}, -- right
	}
}

local default_open_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- bottom
	}
}

lib_tools.register_shelf("half_shelf", {
	description = "Half Height Shelf (2)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_half_shelf,
	capacity = 2,
	shown_items = 4
})

lib_tools.register_shelf("open_shelf", {
	description = "Open Shelf (2)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_open_shelf,
	capacity = 2,
	shown_items = 4
})

lib_tools.register_shelf("small_shelf", {
	description = "Shelf (4)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_shelf,
	capacity = 4,
	shown_items = 4
})

lib_tools.register_shelf("large_shelf", {
	description = "Shelf (6)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_shelf,
	capacity = 6,
	shown_items = 6
})