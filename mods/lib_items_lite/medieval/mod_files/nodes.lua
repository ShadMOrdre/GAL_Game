

	-- ===== --
	-- nodes --
	-- ===== --

minetest.register_alias("medieval_craft:glow_stone", "medieval:glowing_stone")



minetest.register_node("medieval:glowing_stone", {
	description = "Glowing Stone",
	tiles = {"medieval_glowing_stone.png"},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = gal.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "medieval:glowing_stone 3",
 recipe = {
		{"default:cobble", "" , "default:cobble"},
		{"", "default:meselamp" ,"" },
		{"default:cobble", "", "default:cobble"},
	}
})

minetest.register_alias("medieval_craft:glow_stone_lamp", "medieval:glowing_lamp")


minetest.register_node("medieval:glowing_lamp", {
	description = "Glowing Stone Lamp",
	tiles = {"medieval_glowing_lamp.png"},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = gal.node_sound_glass_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "medieval:glowing_lamp 2",
	recipe =  {"darkage:glass","medieval:glowing_stone"},
})

minetest.register_node("medieval:walkable_lamp", {
	description = "Glowing Walkable Lamp ",
	drawtype = "glasslike",
	tiles = {"medieval_glowing_lamp.png"},
	paramtype = "light",
	climbable = true,
	walkable = false,
	light_source = 14,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = gal.node_sound_glass_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "medieval:walkable_lamp 2",
	recipe =  {"darkage:glass","medieval:glowing_stone","default:ladder_wood"},
})

minetest.register_craft({
	type = "shapeless",
	output = "medieval:walkable_lamp 2",
	recipe =  {"medieval:glowing_lamp","default:ladder_wood"},
})


-- ==== --
-- rope --
-- ==== --

minetest.register_alias("medieval_craft:rope", "medieval:rope")

minetest.register_node("medieval:rope", {
	description = "Rope",
	drawtype = "raillike",
	tiles = {"medieval_rope.png", "medieval_rope_curved.png", "medieval_rope_junction.png", "medieval_rope_crossing.png"},
	inventory_image = "medieval_rope.png",
	wield_image = "medieval_rope.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {bendy=2,dig_immediate=2,attached_node=1},
})

minetest.register_craft({
	output = "medieval:rope 3",
 recipe = {
		{"farming:cotton", "" , ""},
		{"", "farming:cotton" ,"" },
		{"", "default:stick", "farming:cotton"},
	}
})

minetest.register_craft({
	output = "medieval:rope 3",
 recipe = {
		{"farming:cotton", "" , ""},
		{"", "farming:cotton" ,"" },
		{"", "", "farming:cotton"},
	}
})

	-- ===== --
	-- boxes --
	-- ===== --

local function register_box(name, description, boxTexture, nameCraft)


	minetest.register_node("medieval:box_" ..name, {
		description = description .. " Box",
		drawtype = "nodebox",
		tiles = { boxTexture .. '' ,'darkage_box.png', 'darkage_box.png',
		'darkage_box.png', 'darkage_box.png', 'darkage_box.png'
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = gal.node_sound_wood_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Box")
		end,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.5, 0.5, 0.5, 0.375}, -- side f
				{-0.5, -0.5, -0.5, 0.5, 0.4, 0.5}, -- bottom
				{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- side l
				{0.375, -0.5, -0.5, 0.5, 0.5, 0.5},  -- side r
				{-0.5, -0.5, -0.375, 0.5, 0.5, -0.5}, -- frount

			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
	})

end

textures = {
	-- RGB Prime Colours --
	{name="box", tiles="medieval_box_bottom.png", description="Box"},
	{name="potato", tiles="medieval_box_potato.png", description="Potato"},
	{name="carrot", tiles="medieval_box_carrot.png", description="Carrot"},
	{name="fish", tiles="medieval_box_fish.png", description="Fish"},
	{name="apple", tiles="medieval_box_apple.png", description="Apple"},
	{name="wheat", tiles="medieval_box_wheat.png", description="Wheat"},
	{name="mushroom", tiles="medieval_box_mushroom.png", description="Mushroom"}

}


for i,texture in ipairs(textures) do
	register_box(texture.name, texture.description, texture.tiles)

end
