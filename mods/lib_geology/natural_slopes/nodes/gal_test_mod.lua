--[[
Add natural slopes to Minetest Game
--]]

-- Dirt slopes

natural_slopes.register_slope("gal:dirt", {
	groups = {crumbly = 3},
	tiles = {"game_dirt.png"},
	description = "Dirt slope",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},
	})},
	10
)
natural_slopes.register_slope("gal:dry_dirt", {
	groups = {crumbly = 3},
	tiles = {"game_dry_dirt.png"},
	description = "Dry Dirt slope",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},
	})},
	10
)
natural_slopes.register_slope("gal:dirt_with_grass", {
	description = "Dirt with Grass slope",
	groups = {crumbly = 3, soil = 1},
	tiles = {top = "game_grass.png",
		bottom = "game_dirt.png",
		front = "game_grass.png",
		side = {name = "game_dirt.png^game_grass_side.png",
			tileable_vertical = false}},
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	drop = "gal:dirt",
	},
	25
)
natural_slopes.register_slope("gal:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass slope",
	tiles = {top = "game_dry_grass.png",
		bottom = "game_dirt.png",
		front = "game_dry_grass.png",
		side = {name = "game_dirt.png^game_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'gal:dirt',
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "gal:dirt",
	},
	20
)
natural_slopes.register_slope("gal:dry_dirt_with_dry_grass", {
	description = "Dry Dirt with Dry Grass slope",
	tiles = {top = "game_dry_grass.png",
		bottom = "game_dry_dirt.png",
		front = "game_dry_grass.png",
		side = {name = "game_dry_dirt.png^game_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'gal:dirt',
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "gal:dry_dirt",
	},
	20
)
natural_slopes.register_slope("gal:dirt_with_snow", {
	description = "Dirt with Snow slope",
	tiles = {top = "game_snow.png",
		bottom = "game_dirt.png",
		front = "game_snow.png",
		side = {name = "game_dirt.png^game_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, snowy = 1},
	drop = 'gal:dirt',
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
	drop = "gal:dirt",
	},
	25
)
natural_slopes.register_slope("gal:dirt_with_coniferous_litter", {
	description = "Dirt with Coniferous Litter slope",
	tiles = {top = "game_coniferous_litter.png",
		bottom = "game_dirt.png",
		front = "game_coniferous_litter.png",
		side = {name = "game_dirt.png^game_coniferous_litter_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "gal:dirt",
	},
	15
)
natural_slopes.register_slope("gal:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter slope",
	tiles = {top = "game_rainforest_litter.png",
		bottom = "game_dirt.png",
		front = "game_rainforest_litter.png",
		side = {name = "game_dirt.png^game_rainforest_litter_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	drop = "gal:dirt",
	},
	15
)

-- Sand slopes

natural_slopes.register_slope("gal:sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"game_sand.png"},
	description = "Sand slope",
	sounds = gal.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("gal:desert_sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"game_desert_sand.png"},
	description = "Desert sand slope",
	sounds = gal.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("gal:silver_sand", {
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	tiles = {"game_silver_sand.png"},
	description = "Silver sand slope",
	sounds = gal.node_sound_sand_defaults()},
	5
)
natural_slopes.register_slope("gal:gravel", {
	groups = {crumbly = 2, falling_node = 1},
	tiles = {"game_gravel.png"},
	description = "Gravel slope",
	sounds = gal.node_sound_sand_defaults()},
	7
)






