-- Poison

minetest.register_craftitem("magic:potion_poison",{
	description = "Super Poison!",
	inventory_image = "potions_poison.png",
	wield_image = "potions_poison.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(-17),
})

minetest.register_craftitem("magic:potion_ruby",{
	description = "Super Antidote",
	inventory_image = "potions_red.png",
	wield_image = "potions_red.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(18),
})

minetest.register_craftitem("magic:potion_diamond",{
	description = "Flying Potion",
	inventory_image = "potions_gold.png",
	wield_image = "potions_gold.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(-1),
})

minetest.register_craftitem("magic:potion_saphire",{
	description = "Water Breathing Potion",
	inventory_image = "potions_blue.png",
	wield_image = "potions_blue.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("magic:potion_emerald",{
	description = "Invisibility Potion",
	inventory_image = "potions_green.png",
	wield_image = "potions_green.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(0),
})

minetest.register_craftitem("magic:potion_topaz",{
	description = "Healing Potion",
	inventory_image = "potions_indigo.png",
	wield_image = "potions_indigo.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(24),
})

minetest.register_craftitem("magic:potion_amethyst",{
	description = "Speed Potion",
	inventory_image = "potions_purple.png",
	wield_image = "potions_purple.png",
	groups = {not_in_creative_inventory = 1},
	on_use = minetest.item_eat(-1),
})
