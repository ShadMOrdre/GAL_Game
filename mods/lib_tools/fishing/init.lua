


fishing = {}
fishing.name = "fishing"
fishing.ver_max = 0
fishing.ver_min = 0
fishing.ver_rev = 1
fishing.path_mod = minetest.get_modpath(minetest.get_current_modname())
fishing.path_world = minetest.get_worldpath()


-- Intllib
local S
local NS
S, NS = dofile(fishing.path_mod.."/intllib.lua")

fishing.intllib = S or minetest.get_translator(fishing.name)

minetest.log(S("[MOD] fishing:  Loading..."))



-- Raw Fish (Thanks to Altairas for her Fish image on DeviantArt)
minetest.register_craftitem("fishing:fish_raw", {
	description = S("Raw Fish"),
	inventory_image = "fish_raw.png",
	wield_image = "fish_raw.png",
	on_use = minetest.item_eat(2),
})

-- Cooked Fish
minetest.register_craftitem("fishing:fish_cooked", {
	description = S("Cooked Fish"),
	inventory_image = "fish_cooked.png",
	wield_image = "fish_cooked.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	output = "fishing:fish_cooked",
	recipe = "fishing:fish_raw",
	cooktime = 2,
})

-- Sashimi (Thanks to Natalia Grosner for letting me use the sashimi image)
minetest.register_craftitem("fishing:sashimi", {
	description = S("Sashimi"),
	inventory_image = "sashimi.png",
	wield_image = "sashimi.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "fishing:sashimi 2",
	recipe = {
		{'group:plant_seaweed','fishing:fish_raw','group:plant_seaweed'},
	}
})

-- Worm
minetest.register_craftitem("fishing:worm", {
	description = S("Worm"),
	inventory_image = "worm.png",
	wield_image = "worm.png",
})

-- Fishing Rod
minetest.register_craftitem("fishing:fishing_rod", {
	description = S("Fishing Rod"),
	inventory_image = "fishing_rod.png",
	wield_image = "fishing_rod.png",
})

minetest.register_craft({
	output = "fishing:fishing_rod",
	recipe = {
			{"","","group:stick"},
			{"", "group:stick", "group:string"},
			{"group:stick", "", "group:string"},
		}
})

-- Sift through 2 Dirt Blocks to find Worm
minetest.register_craft({
	output = "fishing:worm",
	recipe = {
		{"group:dirt","group:dirt"},
	}
})

-- default fishing fish
local fish = {
	{"fishing:fish_raw"},
}

-- Fishing Rod (Baited)
minetest.register_craftitem("fishing:fishing_rod_baited", {
	description = S("Baited Fishing Rod"),
	inventory_image = "fishing_rod_baited.png",
	wield_image = "fishing_rod_wield.png",
	stack_max = 1,
	liquids_pointable = true,

	on_use = function (itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end
		
		local node = minetest.get_node(pointed_thing.under).name

		if (string.find(node, "liquid_water") and (string.find(node, "_source") or string.find(node, "_flowing"))) and (math.random(1, 100) < 5) then

			local type = fish[math.random(1, #fish)][1]
			local inv = user:get_inventory()

			if inv:room_for_item("main", {name = type}) then

				inv:add_item("main", {name = type})

				return ItemStack("fishing:fishing_rod")
			else
				minetest.chat_send_player(user:get_player_name(),
					S("Inventory full, Fish Got Away!"))
			end
		end
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "fishing:fishing_rod_baited",
	recipe = {"fishing:fishing_rod", "fishing:worm"},
})





minetest.log(S("[MOD] fishing:  Successfully loaded."))




