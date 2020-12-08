
local function register_vertical_bar(name, description, barTexture, craft, overlap)

	if overlap == "false" then
		 minetest.register_node("medieval:" ..name.. "_vertical_bar", {
			 description = description .. " Vertical bar",
			 tiles = { barTexture .. "^medieval_bars.png"},
			 is_ground_content = true,
			 paramtype2 = "facedir",
			 groups = {cracky=3},
			 sounds = default.node_sound_stone_defaults(),
		 })

		 minetest.register_craft({
			 output = "medieval:" ..name.. "_vertical_bar 4",
			 recipe = {
				{'default:stick', craft , 'default:stick'},
				{'default:stick', craft , 'default:stick'},
				{'default:stick', craft , 'default:stick'},
			}
		 })
	end
end

local function register_cross_bar(name, description, barTexture, craft, overlap)

	if overlap == "false" then

	 minetest.register_node("medieval:" ..name.. "_cross_bar", {
		 description = description .. " Cross bar",
		 tiles = { barTexture .. "^medieval_bar_left.png^medieval_bar_right.png"},
		 is_ground_content = true,
		 paramtype2 = "facedir",
		 groups = {cracky=3},
		 sounds = default.node_sound_stone_defaults(),
	 })

	 minetest.register_craft({
		 output = "medieval:" ..name.. "_cross_bar 5",
		 recipe = {
			{'default:stick', craft, 'default:stick'},
			{craft, 'default:stick', craft},
			{'default:stick', craft, 'default:stick'},
		}
	 })
	end
end

local function register_slope_bar(name, description, barTexture, craft, overlap)

	if overlap == "false" then
		 minetest.register_node("medieval:" ..name.. "_slope_bar", {
			 description = description .. " Slope bar",
			 tiles = { barTexture .. "^medieval_bar_left.png"},
			 is_ground_content = true,
				paramtype2 = "facedir",
				groups = {cracky=3},
				sounds = default.node_sound_stone_defaults(),
		 })

		 minetest.register_craft({
			 output = "medieval:" ..name.. "_slope_bar 6",
			 recipe = {
					{craft, craft, 'default:stick'},
					{craft, 'default:stick', craft},
					{'default:stick', craft, craft},
				}
		 })
	end
end

local function register_arrow_bar(name, description, barTexture, craft, overlap)

	if overlap == "false" then
		 minetest.register_node("medieval:" ..name.. "_arrow_bar", {
			 description = description .. "Arrow bar",
			 tiles = { barTexture .."^medieval_arrow_left.png" , barTexture .."^medieval_arrow_right.png" ,
				barTexture .."^medieval_arrow_right.png" , barTexture .."^medieval_arrow_left.png" ,
				barTexture .."^medieval_arrow_up.png" , barTexture .."^medieval_arrow_down.png"},
			 is_ground_content = true,
				paramtype2 = "facedir",
				groups = {cracky=3},
				sounds = default.node_sound_stone_defaults(),
		 })

		 minetest.register_craft({
			 output = "medieval:" ..name.. "_arrow_bar 5",
			recipe = {
				 {craft, 'default:stick', craft},
				 {'default:stick', craft , 'default:stick'},
				 {'default:stick', craft, 'default:stick'},
			 }
		 })
	end
end

-- ============== --
-- plaster blocks --
-- ============== --

local function register_plaster(name, description, plasterTexture, craft, overlap)

	if description ~= "Cobble" then
		minetest.register_node("medieval:" ..name.. "_with_plaster", {
			description = description .. " With Plaster",
			tiles = { plasterTexture .. "^medieval_plaster_D.png", plasterTexture .. "^medieval_plaster_B.png", plasterTexture .. "^medieval_plaster_C.png", plasterTexture .. "^medieval_plaster_A.png", plasterTexture .. "", "medieval_plaster.png"},
			is_ground_content = true,
			drop = craft,
			paramtype2 = "facedir",
			groups = {cracky=3},groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
			sounds = default.node_sound_stone_defaults(),
		})

		minetest.register_craft({
			output = "medieval:" ..name.. "_with_plaster 2",
			recipe = {
				{craft ,"darkage:chalk_powder"},
				{craft ,"darkage:chalk_powder"},
			}
		})
	end
end

local function register_plaster_corner (name, description, plasterTexture, craft)

	minetest.register_node("medieval:" ..name.. "_corner_plaster", {
		description = description .. " With Plaster",
		tiles = { plasterTexture .. "^medieval_plaster_D.png^medieval_plaster_C.png", plasterTexture .. "^medieval_plaster_B.png^medieval_plaster_C.png", plasterTexture .. "^medieval_plaster_C.png", "medieval_plaster.png", plasterTexture .. "^medieval_plaster_A.png", "medieval_plaster.png"},
		is_ground_content = true,
		drop = craft,
  	paramtype2 = "facedir",
		groups = {cracky=3},groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "medieval:" ..name.. "_corner_plaster 2",
		recipe = {
			{craft ,"darkage:chalk_powder"},
			{craft ,"darkage:chalk_powder"},
			{"darkage:chalk_powder" ,"darkage:chalk_powder"},
		}
	})

end




textures = {
 -- RGB Prime Colours --
	{name="aspenWood", tiles="default_aspen_wood.png", description="Aspen Wood", craft="default:aspen_wood", overlap="false"},
	{name="jungleWood", tiles="default_junglewood.png", description="Jungle Wood", craft="default:junglewood", overlap="false"},
	{name="pineWood", tiles="default_pine_wood.png", description="Pine Wood", craft="default:pine_wood", overlap="false"},
	{name="acaciaWood", tiles="default_acacia_wood.png", description="Acacia Wood", craft="default:acacia_wood", overlap="false"},
	{name="wood", tiles="default_wood.png", description="Wood", craft="default:wood", overlap="true"},

	--[[{name="stone", tiles="default_stone.png", description="Stone"},
	{name="desertStone", tiles="default_desert_stone.png", description="Desert Stone"},
	{name="sandStone", tiles="default_sandstone.png", description="Sand Stone"},]]--

	{name="cobble", tiles="default_cobble.png", description="Cobble", craft="default:cobble", overlap="true"},
	{name="mossyCobble", tiles="default_mossycobble.png", description="Mossy Cobble", craft="default:mossycobble", overlap="false"},
	{name="desertCobble", tiles="default_desert_cobble.png", description="Desert Cobble", craft="default:desert_cobble", overlap="false"},


	{name="brick", tiles="default_brick.png", description="Brick", craft="default:brick", overlap="false"},
	{name="desertBrick", tiles="default_desert_stone_brick.png", description="Desert Brick", craft="default:desert_stonebrick", overlap="false"},
	{name="sandBrick", tiles="default_sandstone_brick.png", description="Sandstone Brick", craft="default:sandstonebrick", overlap="false"},
	{name="stoneBrick", tiles="default_stone_brick.png", description="Stone Brick,", craft="default:stone_brick" },

	{name="DSBrick", tiles="darkage_stone_brick.png", description="Darkage Stone Brick,", craft="darkage:stone_brick", overlap="false"},
	{name="orsBrick", tiles="darkage_ors_brick.png", description="Old Red Sandstone Brick", craft="darkage:ors_brick", overlap="false"},
	{name="slateCobble", tiles="darkage_slate_brick.png", description="Slate Brick", craft="darkage:slate_brick", overlap="false"},
	{name="gneissCobble", tiles="darkage_gneiss_brick.png", description="Gneiss Brick", craft="darkage:gneiss_brick", overlap="false"},
	{name="basaltCobble", tiles="darkage_basalt_brick.png", description="Basalt Brick", craft="darkage:basalt_brick", overlap="false"},

	{name="tuffBricks", tiles="darkage_tuff_bricks.png", description="Tuff Bricks", craft="darkage:tuff_bricks", overlap="false"},
	{name="rhyoliticTuffBricks", tiles="darkage_rhyolitic_tuff_bricks.png", description="Rhyolitic Tuff Bricks", craft="darkage:rhyolitic_tuff_bricks", overlap="false"},
	{name="oldTuffBricks", tiles="darkage_old_tuff_bricks.png", description="Old Tuff Bricks", craft="darkage:old_tuff_bricks", overlap="false"}


}

for i,texture in ipairs(textures) do

	register_vertical_bar(texture.name, texture.description, texture.tiles, texture.craft, texture.overlap)
	register_cross_bar(texture.name, texture.description, texture.tiles, texture.craft, texture.overlap)
	register_slope_bar(texture.name, texture.description, texture.tiles, texture.craft, texture.overlap)
	register_arrow_bar(texture.name, texture.description, texture.tiles, texture.craft, texture.overlap)

end


for i,texture in ipairs(textures) do
	register_plaster(texture.name, texture.description, texture.tiles, texture.craft)
	register_plaster_corner(texture.name, texture.description, texture.tiles, texture.craft)
	-- register whatever here
end

-- misk --

minetest.register_node("medieval:plaster_rose_bar", {
	description = "Plaster Rose Bar ",
	tiles = {"medieval_plaster.png^medieval_rose_bar.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
