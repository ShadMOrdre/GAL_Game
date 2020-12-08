




-- honey
minetest.register_craftitem(":mobs:honey", {
	description = S("Honey"),
	inventory_image = "mobs_honey_inv.png",
	on_use = minetest.item_eat(6),
})

-- beehive (when placed spawns bee)
minetest.register_node(":mobs:beehive", {
	description = S("Beehive"),
	drawtype = "plantlike",
	tiles = {"mobs_beehive.png"},
	inventory_image = "mobs_beehive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {oddly_breakable_by_hand = 3, flammable = 1},
	--sounds = default.node_sound_defaults(),
	sounds = mobs_animal.node_sound_defaults(),

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("formspec", "size[8,6]"
			..default.gui_bg..default.gui_bg_img..default.gui_slots
			.. "image[3,0.8;0.8,0.8;mobs_bee_inv.png]"
			.. "list[current_name;beehive;4,0.5;1,1;]"
			.. "list[current_player;main;0,2.35;8,4;]"
			.. "listring[]")

		meta:get_inventory():set_size("beehive", 1)
	end,

	after_place_node = function(pos, placer, itemstack)

		if placer:is_player() then

			minetest.set_node(pos, {name = "mobs:beehive", param2 = 1})

			if math.random(1, 4) == 1 then
				minetest.add_entity(pos, "mobs_animal:bee")
			end
		end
	end,

	on_punch = function(pos, node, puncher)

		-- yep, bee's don't like having their home punched by players
		puncher:set_hp(puncher:get_hp() - 4)
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		if listname == "beehive" then
			return 0
		end

		return stack:get_count()
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)

		-- only dig beehive if no honey inside
		return meta:get_inventory():is_empty("beehive")
	end,

})

minetest.register_craft({
	output = "mobs:beehive",
	recipe = {
		{"mobs:bee","mobs:bee","mobs:bee"},
	}
})

-- honey block
minetest.register_node(":mobs:honey_block", {
	description = S("Honey Block"),
	tiles = {"mobs_honey_block.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "mobs:honey_block",
	recipe = {
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
	}
})

minetest.register_craft({
	output = "mobs:honey 9",
	recipe = {
		{"mobs:honey_block"},
	}
})















-- egg entity

mobs:register_arrow("mobs_animal:egg_entity", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_chicken_egg.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)

		if math.random(1, 10) > 1 then
			return
		end

		pos.y = pos.y + 1

		local nod = minetest.get_node_or_nil(pos)

		if not nod
		or not minetest.registered_nodes[nod.name]
		or minetest.registered_nodes[nod.name].walkable == true then
			return
		end

		local mob = minetest.add_entity(pos, "mobs_animal:chicken")
		local ent2 = mob:get_luaentity()

		mob:set_properties({
			textures = ent2.child_texture[1],
			visual_size = {
				x = ent2.base_size.x / 2,
				y = ent2.base_size.y / 2
			},
			collisionbox = {
				ent2.base_colbox[1] / 2,
				ent2.base_colbox[2] / 2,
				ent2.base_colbox[3] / 2,
				ent2.base_colbox[4] / 2,
				ent2.base_colbox[5] / 2,
				ent2.base_colbox[6] / 2
			},
		})

		ent2.child = true
		ent2.tamed = true
		ent2.owner = self.playername
	end
})


-- egg throwing item

local egg_GRAVITY = 9
local egg_VELOCITY = 19

-- shoot egg
local mobs_shoot_egg = function (item, player, pointed_thing)

	local playerpos = player:getpos()

	minetest.sound_play("default_place_node_hard", {
		pos = playerpos,
		gain = 1.0,
		max_hear_distance = 5,
	})

	local obj = minetest.add_entity({
		x = playerpos.x,
		y = playerpos.y +1.5,
		z = playerpos.z
	}, "mobs_animal:egg_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = egg_VELOCITY -- needed for api internal timing
	ent.switch = 1 -- needed so that egg doesn't despawn straight away

	obj:setvelocity({
		x = dir.x * egg_VELOCITY,
		y = dir.y * egg_VELOCITY,
		z = dir.z * egg_VELOCITY
	})

	obj:setacceleration({
		x = dir.x * -3,
		y = -egg_GRAVITY,
		z = dir.z * -3
	})

	-- pass player name to egg for chick ownership
	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

	item:take_item()

	return item
end


-- egg
minetest.register_node(":mobs:egg", {
	description = S("Chicken Egg"),
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy = 2, dig_immediate = 3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "mobs:egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})


-- fried egg
minetest.register_craftitem(":mobs:chicken_egg_fried", {
	description = S("Fried Egg"),
	inventory_image = "mobs_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:egg",
	output = "mobs:chicken_egg_fried",
})

-- raw chicken
minetest.register_craftitem(":mobs:chicken_raw", {
description = S("Raw Chicken"),
	inventory_image = "mobs_chicken_raw.png",
	on_use = minetest.item_eat(2),
})

-- cooked chicken
minetest.register_craftitem(":mobs:chicken_cooked", {
description = S("Cooked Chicken"),
	inventory_image = "mobs_chicken_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:chicken_raw",
	output = "mobs:chicken_cooked",
})

-- feather
minetest.register_craftitem(":mobs:chicken_feather", {
	description = S("Feather"),
	inventory_image = "mobs_chicken_feather.png",
})









-- bucket of milk
minetest.register_craftitem(":mobs:bucket_milk", {
	description = S("Bucket of Milk"),
	inventory_image = "mobs_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
})

-- cheese wedge
minetest.register_craftitem(":mobs:cheese", {
	description = S("Cheese"),
	inventory_image = "mobs_cheese.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:cheese",
	recipe = "mobs:bucket_milk",
	cooktime = 5,
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node(":mobs:cheeseblock", {
	description = S("Cheese Block"),
	tiles = {"mobs_cheeseblock.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "mobs:cheeseblock",
	recipe = {
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
	}
})

minetest.register_craft({
	output = "mobs:cheese 9",
	recipe = {
		{'mobs:cheeseblock'},
	}
})













local S = mobs.intllib

-- name tag
minetest.register_craftitem("mobs:nametag", {
	description = S("Nametag"),
	inventory_image = "mobs_nametag.png",
})

core.register_craft({
	type = "shapeless",
	output = "mobs:nametag",
	recipe = {"default:paper", "dye:black", "farming:string"},
})

-- leather
minetest.register_craftitem("mobs:leather", {
	description = S("Leather"),
	inventory_image = "mobs_leather.png",
})

-- raw meat
minetest.register_craftitem("mobs:meat_raw", {
	description = S("Raw Meat"),
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
})

-- cooked meat
minetest.register_craftitem("mobs:meat", {
	description = S("Meat"),
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

-- magic lasso
minetest.register_tool("mobs:magic_lasso", {
	description = S("Magic Lasso (right-click animal to put in inventory)"),
	inventory_image = "mobs_magic_lasso.png",
})

minetest.register_craft({
	output = "mobs:magic_lasso",
	recipe = {
		{"farming:string", "default:gold_lump", "farming:string"},
		{"default:gold_lump", "default:diamondblock", "default:gold_lump"},
		{"farming:string", "default:gold_lump", "farming:string"},
	}
})

-- net
minetest.register_tool("mobs:net", {
	description = S("Net (right-click animal to put in inventory)"),
	inventory_image = "mobs_net.png",
})

minetest.register_craft({
	output = "mobs:net",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:stick", "", "default:stick"},
		{"farming:string", "default:stick", "farming:string"},
	}
})

-- shears (right click to shear animal)
minetest.register_tool("mobs:shears", {
	description = S("Steel Shears (right-click to shear)"),
	inventory_image = "mobs_shears.png",
})

minetest.register_craft({
	output = 'mobs:shears',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'', 'group:stick', 'default:steel_ingot'},
	}
})

-- protection rune
minetest.register_craftitem("mobs:protector", {
	description = S("Mob Protection Rune"),
	inventory_image = "mobs_protector.png",
})

minetest.register_craft({
	output = "mobs:protector",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "default:goldblock", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

-- saddle
minetest.register_craftitem("mobs:saddle", {
	description = "Saddle",
	inventory_image = "mobs_saddle.png"
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"mobs:leather", "default:steel_ingot", "mobs:leather"},
		{"mobs:leather", "default:steel_ingot", "mobs:leather"},
	}
})











minetest.register_node("decoblocks:mammoth_wool", {
	description = "Mammoth Wool",
	tiles = {"decoblocks_mammoth_wool.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = lib_materials.node_sound_dirt_defaults(),
})

	minetest.register_node("lib_textiles:fabric_wool_" .. name, {
		description = S(desc .. " Wool Fabric"),
		tiles = {"lib_textiles_fabric_wool_" .. name .. ".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_textiles_fabric_wool = 1},
		--sounds = default.node_sound_defaults(),
	})














