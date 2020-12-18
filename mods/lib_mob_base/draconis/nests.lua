-- Draconis Nodes

-- Fire Wyvern Nest

minetest.register_node("draconis:fire_wyvern_nest", {
        description = "Fire Wyvern Nest",
	tiles = {"draconis_fire_wyvern_nest.png"},
	drawtype = "mesh",
        mesh = "draconis_nest.obj",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.25, -0.375},
			{0.375, -0.5, -0.5, 0.5, -0.25, 0.5},
			{-0.5, -0.5, 0.375, 0.5, -0.25, 0.5},
			{-0.5, -0.5, -0.5, -0.375, -0.25, 0.5},
		}
	},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {snappy = 2},
	--sounds = default.node_sound_leaves_defaults(),
	sounds = mobs_animal.node_sound_leaves_defaults(),
	drop = "draconis:fire_wyvern_egg",
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
-- Make Wyvern spawn above the nest
	local spawn_above = {
            	x = pos.x,
            	y = pos.y + 3.5,
            	z = pos.z,
        }    
		minetest.add_entity(spawn_above, "draconis:fire_wyvern")
	end,
})

-- Ice Wyvern Nest

minetest.register_node("draconis:ice_wyvern_nest", {
        description = "Ice Wyvern Nest",
	tiles = {"draconis_ice_wyvern_nest.png"},
	drawtype = "mesh",
        mesh = "draconis_nest.obj",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.25, -0.375},
			{0.375, -0.5, -0.5, 0.5, -0.25, 0.5},
			{-0.5, -0.5, 0.375, 0.5, -0.25, 0.5},
			{-0.5, -0.5, -0.5, -0.375, -0.25, 0.5},
		}
	},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {snappy = 2},
	--sounds = default.node_sound_leaves_defaults(),
	sounds = mobs_animal.node_sound_leaves_defaults(),
	drop = "draconis:ice_wyvern_egg",
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
-- Make Wyvern spawn above the nest
	local spawn_above = {
            	x = pos.x,
            	y = pos.y + 3.5,
            	z = pos.z,
        }    
		minetest.add_entity(spawn_above, "draconis:ice_wyvern")
	end,
})


