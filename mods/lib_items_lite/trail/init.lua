-- Parameters

local FOO = true -- Enable footprints.
local FUNCYC = 0.2 -- Function cycle in seconds.
local TRACHA = 0.1 -- Chance walked dirt/grass is worn and compacted to trail:trail.
local ICECHA = 0.05 -- Chance walked snowblock is compacted to ice.

local EROSION = true -- Enable footprint and trail:trail erosion.
local EROINT = 8 -- Erosion interval.
local EROCHA = 16 -- Erosion 1/x chance.

-- Player positions

local player_pos = {}
local player_pos_previous = {}

minetest.register_on_joinplayer(function(player)
	player_pos_previous[player:get_player_name()] = {x = 0, y = 0, z = 0}
end)

minetest.register_on_leaveplayer(function(player)
	player_pos_previous[player:get_player_name()] = nil
end)

-- Nodes

minetest.register_node("trail:trail", {
	tiles = {"trail_trailtop.png", "default_dirt.png",
		"default_dirt.png^trail_trailside.png"},
	groups = {crumbly = 2},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults(),
})

minetest.register_node("trail:dirt", {
	description = "Dirt With Footprint",
	tiles = {"default_dirt.png^default_footprint.png", "default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults(),
})

minetest.register_node("trail:dirt_with_grass", {
	description = "Dirt with Grass and Footprint",
	tiles = {
		"default_grass.png^default_footprint.png",
		"default_dirt.png",
		"default_dirt.png^default_grass_side.png",
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("trail:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass and Footprint",
	tiles = {
		"default_dry_grass.png^default_footprint.png",
		"default_dirt.png",
		"default_dirt.png^default_dry_grass_side.png",
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("trail:dirt_with_snow", {
	description = "Dirt with Snow and Footprint",
	tiles = {
		"default_snow.png^default_footprint.png",
		"default_dirt.png",
		"default_dirt.png^default_snow_side.png",
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "gal:dirt",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("trail:sand", {
	description = "Sand With Footprint",
	tiles = {"default_sand.png^default_footprint.png", "default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "gal:sand",
	sounds = gal.node_sound_sand_defaults(),
})

minetest.register_node("trail:desert_sand", {
	description = "Desert Sand With Footprint",
	tiles = {"default_desert_sand.png^default_footprint.png", "default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "gal:desert_sand",
	sounds = gal.node_sound_sand_defaults(),
})

minetest.register_node("trail:silver_sand", {
	description = "Silver Sand With Footprint",
	tiles = {"default_silver_sand.png^default_footprint.png", "default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	drop = "gal:silver_sand",
	sounds = gal.node_sound_sand_defaults(),
})

minetest.register_node("trail:snow", {
	description = "Snow With Footprint",
	tiles = {"default_snow.png^default_footprint.png", "default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
	drop = "gal:snow",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("trail:snowblock", {
	description = "Snow Block With Footprint",
	tiles = {"default_snow.png^default_footprint.png", "default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1},
	drop = "gal:snowblock",
	sounds = gal.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("trail:wheat", {
	description = "Flattened Wheat",
	tiles = {"trail_flat_wheat.png"},
	inventory_image = "trail_flat_wheat.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	buildable_to = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -3 / 8, 0.5}
		},
	},
	groups = {snappy = 3, flammable = 2, attached_node = 1},
	drop = "",
	sounds = gal.node_sound_leaves_defaults(),
})

-- Globalstep function

local timer = 0

if FOO then
	minetest.register_globalstep(function(dtime)
		timer = timer + dtime
		if timer > FUNCYC then
			timer = 0
			for _, player in ipairs(minetest.get_connected_players()) do
				local pos = player:getpos()
				player_pos[player:get_player_name()] = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.2),
					z = math.floor(pos.z + 0.5)
				}

				local p_ground = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.4),
					z = math.floor(pos.z + 0.5)
				}
				local n_ground = minetest.get_node(p_ground).name
				local p_groundpl = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y - 0.5),
					z = math.floor(pos.z + 0.5)
				}
				local p_snow = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 1.2),
					z = math.floor(pos.z + 0.5)
				}
				local n_snow = minetest.get_node(p_snow).name
				local p_snowpl = {
					x = math.floor(pos.x + 0.5),
					y = math.floor(pos.y + 0.5),
					z = math.floor(pos.z + 0.5)
				}
					
				--if player_pos_previous[player:get_player_name()] == nil then
					--break
				--end

				if player_pos[player:get_player_name()].x ~=
						player_pos_previous[player:get_player_name()].x or
						player_pos[player:get_player_name()].y <
						player_pos_previous[player:get_player_name()].y or
						player_pos[player:get_player_name()].z ~=
						player_pos_previous[player:get_player_name()].z then

					if n_ground == "gal:dirt" then
						minetest.set_node(p_groundpl, {name = "trail:dirt"})				
					elseif n_ground == "gal:dirt_with_grass" then
						minetest.set_node(p_groundpl, {name = "trail:dirt_with_grass"})
					elseif n_ground == "gal:dirt_with_dry_grass" then
						minetest.set_node(p_groundpl, {name = "trail:dirt_with_dry_grass"})
					elseif n_ground == "gal:dirt_with_snow" then
						minetest.set_node(p_groundpl, {name = "trail:dirt_with_snow"})
					elseif n_ground == "trail:dirt" or
							n_ground == "trail:dirt_with_grass" or
							n_ground == "trail:dirt_with_dry_grass" then
						if math.random() <= TRACHA then
							minetest.set_node(p_groundpl, {name = "trail:trail"})
						end

					elseif n_ground == "gal:sand" then
						minetest.set_node(p_groundpl, {name = "trail:sand"})
					elseif n_ground == "gal:desert_sand" then
						minetest.set_node(p_groundpl, {name = "trail:desert_sand"})
					elseif n_ground == "gal:silver_sand" then
						minetest.set_node(p_groundpl, {name = "trail:silver_sand"})

					elseif n_snow == "gal:snow" then
						minetest.set_node(p_snowpl, {name = "trail:snow"})
					elseif n_ground == "gal:snowblock" then
						minetest.set_node(p_groundpl, {name = "trail:snowblock"})
					elseif n_ground == "trail:snowblock" then
						if math.random() <= ICECHA then
							minetest.set_node(p_groundpl, {name = "gal:ice"})
						end

					elseif n_snow == "farming:wheat_5" or
							n_snow == "farming:wheat_6" or
							n_snow == "farming:wheat_7" or
							n_snow == "farming:wheat_8" then
						minetest.set_node(p_snowpl, {name = "trail:wheat",
							param2 = math.random(0, 1)})
					end
				end

				player_pos_previous[player:get_player_name()] = {
					x = player_pos[player:get_player_name()].x,
					y = player_pos[player:get_player_name()].y,
					z = player_pos[player:get_player_name()].z
				}
			end
		end
	end)
end

-- ABM

if EROSION then
	minetest.register_abm({
		nodenames = {
			"trail:dirt",
			"trail:dirt_with_grass",
			"trail:dirt_with_dry_grass",
			"trail:dirt_with_snow",
			"trail:sand",
			"trail:desert_sand",
			"trail:silver_sand",
			"trail:snow",
			"trail:snowblock",
			"trail:trail"
		},
		interval = EROINT,
		chance = EROCHA,
		action = function(pos, node, _, _)
			local nodename = node.name

			if nodename == "trail:dirt" then
				minetest.set_node(pos, {name = "gal:dirt"})
			elseif nodename == "trail:dirt_with_grass" then
				minetest.set_node(pos, {name = "gal:dirt_with_grass"})
			elseif nodename == "trail:dirt_with_dry_grass" then
				minetest.set_node(pos, {name = "gal:dirt_with_dry_grass"})
			elseif nodename == "trail:dirt_with_snow" then
				minetest.set_node(pos, {name = "gal:dirt_with_snoe"})
			elseif nodename == "trail:sand" then
				minetest.set_node(pos, {name = "gal:sand"})
			elseif nodename == "trail:desert_sand" then
				minetest.set_node(pos, {name = "gal:desert_sand"})
			elseif nodename == "trail:silver_sand" then
				minetest.set_node(pos, {name = "gal:silver_sand"})
			elseif nodename == "trail:snow" then
				minetest.set_node(pos, {name = "gal:snow"})
			elseif nodename == "trail:snowblock" then
				minetest.set_node(pos, {name = "gal:snowblock"})
			elseif nodename == "trail:trail" then
				minetest.set_node(pos, {name = "gal:dirt"})
			end
		end
	})
end
