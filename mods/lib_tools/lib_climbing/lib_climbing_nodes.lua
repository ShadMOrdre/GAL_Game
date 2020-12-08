

local S = lib_climbing.intllib





gal.lib.node.register_to_game("ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = gal.node_sound_wood_defaults(),
})

gal.lib.node.register_to_game("ladder_steel", {
	description = "Steel Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_steel.png"},
	inventory_image = "default_ladder_steel.png",
	wield_image = "default_ladder_steel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {cracky = 2},
	sounds = gal.node_sound_metal_defaults(),
})


-- stone Ladder
gal.lib.node.register_to_game("stone_ladder", {
	description = S("Stone Ladder"),
	drawtype = "signlike",
	tiles = {"stone_ladder.png"},
	inventory_image = "stone_ladder.png",
	wield_image = "stone_ladder.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	legacy_wallmounted = true,
	sounds = gal.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "lib_climbing:stone_ladder 4",
	recipe = {
		{"group:stone", "", "group:stone"},
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "", "group:stone"},
	}
})





---------------------------------------------------------------------------------------
-- a rope that is of use to the mines
---------------------------------------------------------------------------------------
-- the rope can only be digged if there is no further rope above it;
-- Note: This rope also counts as a rail node; thus, carts can move through it
gal.lib.node.register_to_game("rope_mining", {
        description = "Rope for Mining",
        tiles = {"cottages_rope.png"},
	groups = {snappy=3,choppy=3,oddly_breakable_by_hand=3,rail=1,connect_to_raillike=1},--connect_to_raillike=minetest.raillike_group("rail")},
        walkable = false,
        climbable = true,
        paramtype = "light",
        sunlight_propagates = true,
        drawtype = "plantlike",
	is_ground_content = false,
	can_dig = function(pos, player)
			local below = minetest.get_node( {x=pos.x, y=pos.y-1, z=pos.z});
			if( below and below.name and below.name == "lib_climbing:rope_mining" ) then
				if( player ) then
					minetest.chat_send_player( player:get_player_name(),
						'The entire rope would be too heavy. Start digging at its lowest end!');
				end
				return false;
			end
			return true;
		end
})

minetest.register_craft({
	output = "lib_climbing:rope_mining",
	recipe = {
		{"farming:cotton","farming:cotton","farming:cotton"}
        }
})


-- Note: This rope also counts as a rail node; thus, carts can move through it
gal.lib.node.register_to_game("ladder_with_rope_and_rail", {
	description = "Ladder with rail support",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png^carts_rail_straight.png^cottages_rope.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,rail=1,connect_to_raillike=1}, --connect_to_raillike=minetest.raillike_group("rail")},
	legacy_wallmounted = true,
        --sounds = cottages.sounds.wood,
	sounds = gal.node_sound_wood_defaults(),
})



minetest.register_craft({
	output = "lib_climbing:ladder_with_rope_and_rail 3",
	recipe = {
		{"default:ladder","cottages:rope", "default:rail"}
        }
})



gal.lib.node.register_to_game("chain", {
	description = "Chain",
	drawtype = "signlike",
	tiles = {"darkage_chain.png"},
	inventory_image = "darkage_chain.png",
	wield_image = "darkage_chain.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = false,
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {snappy=1, cracky=2, oddly_breakable_by_hand=2, not_cuttable=1},
	legacy_wallmounted = true
})

minetest.register_craft({
	output = "lib_climbing:chain 2",
	recipe = {
		{"darkage:iron_stick"},
		{"darkage:iron_stick"},
		{"darkage:iron_stick"},
	}
})












-- Code by Mirko K. (modified by Temperest, Wulfsdad and kilbith) (License: GPL).
minetest.register_on_punchnode(function(pos, oldnode, digger)
	if oldnode.name == "lib_climbing:rope" then
		local num = 0
		local below = {x=pos.x, y=pos.y, z=pos.z}
		local digger_inv = digger:get_inventory()
	
		while minetest.get_node(below).name == rope_name do
			minetest.remove_node(below)
			below.y = below.y - 1
			num = num + 1
		end
		if num == 0 then return end
		digger_inv:add_item("main", rope_name.." "..num)
		return true
	end
end)

gal.lib.node.register_to_game("rope", {
	description = "Rope",
	drawtype = "plantlike",
	walkable = false,
	climbable = true,
	groups = {dig_immediate=3, flammable=3},
	tiles = {"xdecor_rope.png"},
	inventory_image = "xdecor_rope_inv.png",
	wield_image = "xdecor_rope_inv.png",
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
	},
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			local under = pointed_thing.under
			local above = pointed_thing.above
			local pos = above
			local oldnode = minetest.get_node(pos)
			local stackname = itemstack:get_name()
			if minetest.is_protected(pos, placer:get_player_name()) then return end
	
			while oldnode.name == "air" and not itemstack:is_empty() do
				local newnode = {name = stackname, param1 = 0}
				minetest.set_node(pos, newnode)
				itemstack:take_item()
				pos.y = pos.y - 1
				oldnode = minetest.get_node(pos)
			end
		end
		return itemstack
	end,
})







minetest.register_node("lib_climbing:rope_with_rail_support", {
	description = "Rope - Raillike",
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
	output = "lib_climbing:rope_with_rail_support 3",
 recipe = {
		{"farming:cotton", "" , ""},
		{"", "farming:cotton" ,"" },
		{"", "default:stick", "farming:cotton"},
	}
})

minetest.register_craft({
	output = "lib_climbing:rope_with_rail_support 3",
 recipe = {
		{"farming:cotton", "" , ""},
		{"", "farming:cotton" ,"" },
		{"", "", "farming:cotton"},
	}
})



































