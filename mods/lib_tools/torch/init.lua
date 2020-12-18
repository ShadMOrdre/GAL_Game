



dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/wielded_light.lua")


torch = {}


local function node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "place_torch", gain = 0.25}		--default_dug_node
	table.place = table.place or
			{name = "place_torch", gain = 1.0}		--default_place_node_hard
	return table
end

local function node_sound_torch_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_wood_footstep", gain = 1.0}
	node_sound_defaults(table)
	return table
end

local function on_flood(pos, oldnode, newnode)
	minetest.add_item(pos, ItemStack("torch:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = minetest.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		minetest.sound_play(
			"default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.1}
		)
	end
	-- Remove the torch node
	return false
end

minetest.register_node("torch:torch", {
	description = "Torch",
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "torch:torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = node_sound_torch_defaults(),

	--on_construct = function(pos)
	--	minetest.get_node_timer(pos):start(300)
	--end,

	--on_timer = function(pos)
	--	minetest.set_node(pos, {name="lib_ecology:grass_swamp_5"})
	--end,

	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("torch:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("torch:torch")
		else
			fakestack:set_name("torch:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("torch:torch")

		return itemstack
	end,
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("torch:torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torch:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = node_sound_torch_defaults(),
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("torch:torch_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	tiles = {{
		    name = "default_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torch:torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = node_sound_torch_defaults(),
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("torch:torch_unlit", {
	description = "Torch (Unlit)",
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "stoneage_torch_unlit_on_floor.png",
	wield_image = "stoneage_torch_unlit_on_floor.png",
	--tiles = {{
	--	    name = "default_torch_on_floor_animated.png",
	--	    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	--}},
	tiles = {"stoneage_torch_unlit_on_floor.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "torch:torch_unlit",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = node_sound_torch_defaults(),
	floodable = true,
	on_flood = on_flood,

	--on_construct = function(pos)
	--	minetest.get_node_timer(pos):start(300)
	--end,

	--on_timer = function(pos)
	--	minetest.set_node(pos, {name="lib_ecology:grass_swamp_5"})
	--end,

	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("torch:torch_unlit_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("torch:torch_unlit")
		else
			fakestack:set_name("torch:torch_unlit_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("torch:torch_unlit")

		return itemstack
	end,

	-- lighting a placed torch when hit by a buring one
	after_dig_node = function(pos, node, oldmetadata, puncher)
		local wield = puncher:get_wielded_item():get_name()
		if wield == "torch:torch" then
			node.name = "torch:torch"
			minetest.env:set_node(pos, node)
			local inv = puncher:get_inventory()
			inv:remove_item("main", "torch:torch")
		end
	end,
	
	-- lighting the torch in hand when hitting a buring one
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local n = minetest.env:get_node(pointed_thing.under)
			if minetest.get_item_group(n.name, "igniter") ~= 0 or n.name == "torch:torch" or n.name == "lib_forge:furnace_active" then
				local torch_count = user:get_wielded_item():get_count()
				itemstack:replace("torch:torch_unlit "..torch_count.."")
				return itemstack
			else
				minetest.env:punch_node(pointed_thing.under)
			end
		else
			return
		end
	end,
	
})

minetest.register_node("torch:torch_unlit_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	--tiles = {{
	--	    name = "default_torch_on_floor_animated.png",
	--	    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	--}},
	tiles = {"stoneage_torch_unlit_on_wall.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torch:torch_unlit",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = node_sound_torch_defaults(),
	floodable = true,
	on_flood = on_flood,
})

minetest.register_node("torch:torch_unlit_ceiling", {
	drawtype = "mesh",
	mesh = "torch_ceiling.obj",
	--tiles = {{
	--	    name = "default_torch_on_floor_animated.png",
	--	    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	--}},
	tiles = {"stoneage_torch_unlit_on_ceiling.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torch:torch_unlit",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = node_sound_torch_defaults(),
	floodable = true,
	on_flood = on_flood,
})















--[[
minetest.register_node("torch:torch_unlit", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {"stoneage_torch_unlit_on_floor.png", "stoneage_torch_unlit_on_ceiling.png", "stoneage_torch_unlit_on_wall.png"},
	inventory_image = "stoneage_torch_unlit_on_floor.png",
	wield_image = "stoneage_torch_unlit_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},
	
	-- lighting a placed torch when hit by a buring one
	after_dig_node = function(pos, node, oldmetadata, puncher)
		local wield = puncher:get_wielded_item():get_name()
		if wield == "torch:torch" then
			node.name = "torch:torch"
			minetest.env:set_node(pos, node)
			local inv = puncher:get_inventory()
			inv:remove_item("main", "torch:torch")
		end
	end,
	
	-- lighting the torch in hand when hitting a buring one
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local n = minetest.env:get_node(pointed_thing.under)
			if minetest.get_item_group(n.name, "igniter") ~= 0 or n.name == "torch:torch" or n.name == "lib_forge:furnace_active" then
				local torch_count = user:get_wielded_item():get_count()
				itemstack:replace("torch:torch_unlit "..torch_count.."")
				return itemstack
			else
				minetest.env:punch_node(pointed_thing.under)
			end
		else
			return
		end
	end,
	
	sounds = node_sound_torch_defaults(),
})
--]]
minetest.register_lbm({
	name = "torch:3dtorch",
	nodenames = {"torch:torch", "torches:floor", "torches:wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "torch:torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "torch:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "torch:torch_wall",
				param2 = node.param2})
		end
	end
})

minetest.register_abm({
	nodenames = {"torch:torch"},
	interval = 9,
	chance = 1,
	action = function(pos, node)
		local meta = minetest.env:get_meta(pos)
		local decay = meta:get_int("decay")
		if not decay then
			meta:set_int("decay", 1)
			return
		end
		if decay >= math.random(36, 44) then
			node.name = "torch:torch_unlit"
			minetest.env:add_node(pos, node)
			meta:set_int("decay", 0)
			return
		end
		decay = decay + 1
		meta:set_int("decay", decay)
	end
})


minetest.register_alias("default:torch", "torch:torch")
minetest.register_alias("default:torch_wall", "torch:torch_wall")
minetest.register_alias("default:torch_ceiling", "torch:torch_ceiling")
















