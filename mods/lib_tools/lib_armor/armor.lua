-- support for i18n
local S = armor_i18n.gettext

local function play_sound_effect(player, name)
	if not disable_sounds and player then
		local pos = player:get_pos()
		if pos then
			minetest.sound_play(name, {
				pos = pos,
				max_hear_distance = 10,
				gain = 0.5,
			})
		end
	end
end

gal.player.armor:register_armor("lib_armor:helmet_admin", {
	description = S("Admin Helmet"),
	inventory_image = "3d_armor_inv_helmet_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_head=1, armor_heal=100, armor_use=0, armor_water=1,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

gal.player.armor:register_armor("lib_armor:chestplate_admin", {
	description = S("Admin Chestplate"),
	inventory_image = "3d_armor_inv_chestplate_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_torso=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

gal.player.armor:register_armor("lib_armor:leggings_admin", {
	description = S("Admin Leggings"),
	inventory_image = "3d_armor_inv_leggings_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_legs=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

gal.player.armor:register_armor("lib_armor:boots_admin", {
	description = S("Admin Boots"),
	inventory_image = "3d_armor_inv_boots_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_feet=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

gal.player.armor:register_armor("lib_armor:shield_admin", {
	description = S("Admin Shield"),
	inventory_image = "shields_inv_shield_admin.png",
	groups = {armor_shield=1000, armor_heal=100, armor_use=0, not_in_creative_inventory=1},
})

minetest.register_alias("adminboots", "lib_armor:boots_admin")
minetest.register_alias("adminhelmet", "lib_armor:helmet_admin")
minetest.register_alias("adminchestplate", "lib_armor:chestplate_admin")
minetest.register_alias("adminleggings", "lib_armor:leggings_admin")
minetest.register_alias("adminshield", "shields:shield_admin")






local stats = {
	cotton = { name=S("Cotton"), material="lib_textiles:cloth_cotton_white", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	wool = { name=S("Wool"), material="lib_textiles:cloth_wool_white", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	bone = { name=S("Bone"), material="lib_materials:lead_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather = { name=S("Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather_black = { name=S("Black Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather_brown = { name=S("Brown Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather_grey = { name=S("Grey Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather_dark_grey = { name=S("Dark Grey Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	leather_dark_green = { name=S("Dark Green Leather"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	studded = { name=S("Lead"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	ninja = { name=S("Ninja"), material="mobs:leather", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	copper = { name=S("Copper"), material="lib_materials:metal_copper_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	chainmail = { name=S("Chainmail"), material="lib_materials:lead_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	iron = { name=S("Iron"), material="lib_materials:metal_iron_pig_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	obsidian = { name=S("Obsidian"), material="lib_materials:metal_lead_ingot", armor=1.6, heal=18, use=300, radiation=80*1.1 },
	carbonfiber = { name=S("Carbon Fiber"), material="lib_materials:metal_lead_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	titanium = { name=S("Titanium"), material="lib_materials:metal_steel_black_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	lead = { name=S("Lead"), material="lib_materials:metal_lead_ingot", armor=1.6, heal=0, use=500, radiation=80*1.1 },
	brass = { name=S("Brass"), material="lib_materials:metal_brass_ingot", armor=1.8, heal=0, use=650, radiation=43 },
	wrought = { name=S("Wrought Iron"), material="lib_materials:metal_iron_wrought_ingot", armor=2.2, heal=4, use=400, radiation=40 },
	cast = { name=S("Cast Iron"), material="lib_materials:metal_iron_cast_ingot", armor=2.5, heal=8, use=200, radiation=40 },
	carbon = { name=S("Carbon Steel"), material="lib_materials:metal_steel_carbon_ingot", armor=2.7, heal=10, use=100, radiation=40 },
	stainless = { name=S("Stainless Steel"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	admin2 = { name=S("Admin2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	gold2 = { name=S("Gold2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	mithril2 = { name=S("Mithril2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	diamond2 = { name=S("Diamond2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	bronze2 = { name=S("Bronze2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	steel2 = { name=S("Steel2"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	bronze3 = { name=S("Bronze3"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	steel3 = { name=S("Steel3"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	royal_diamond = { name=S("Royal Diamond"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	royal_gold = { name=S("Royal Gold"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
	royal_steel = { name=S("Royal Steel"), material="lib_materials:metal_steel_stainless_ingot", armor=2.7, heal=10, use=75, radiation=40 },
}

local parts = {
	helmet = { place="head", name=S("Helmet"), level=5, radlevel = 0.10, craft={{1,1,1},{1,0,1}} },
	chestplate = { place="torso", name=S("Chestplate"), level=8, radlevel = 0.35, craft={{1,0,1},{1,1,1},{1,1,1}} },
	leggings = { place="legs", name=S("Leggings"), level=7, radlevel = 0.15, craft={{1,1,1},{1,0,1},{1,0,1}} },
	boots = { place="feet", name=S("Boots"), level=4, radlevel = 0.10, craft={{1,0,1},{1,0,1}} },
	shield = { place="shield", name=S("Shield"), level=5, radlevel=0.00, craft={{1,1,1},{1,1,1},{0,1,0}} },
}

-- Makes a craft recipe based on a template
-- template is a recipe-like table but indices are used instead of actual item names:
-- 0 means nothing, everything else is treated as an index in the materials table
local function make_recipe(template, materials)
	local recipe = {}
	for j, trow in ipairs(template) do
		local rrow = {}
		for i, tcell in ipairs(trow) do
			if tcell == 0 then
				rrow[i] = ""
			else
				rrow[i] = materials[tcell]
			end
		end
		recipe[j] = rrow
	end
	return recipe
end

for key, tmp_armor in pairs(stats) do
	for partkey, part in pairs(parts) do
		local partname = "lib_armor:"..partkey.."_"..key
		--minetest.register_tool(partname, {
		--	-- Translators: @1 stands for material and @2 for part of the armor, so that you could use a conjunction if in your language part name comes first then material (e.g. in french 'Silver Boots' is translated in 'Bottes en argent' by using '@2 en @1' as translated string)
		--	description = S("@1 @2", armor.name, part.name),
		--	inventory_image = "lib_armor_inv_"..partkey.."_"..key..".png",
		--	groups = {["armor_"..part.place]=math.floor(part.level*armor.armor), armor_heal=armor.heal, armor_use=armor.use, armor_radiation=math.floor(part.radlevel*armor.radiation)},
		--	wear = 0,
		--})
		gal.player.armor:register_armor(partname, {
			-- Translators: @1 stands for material and @2 for part of the armor, so that you could use a conjunction if in your language part name comes first then material (e.g. in french 'Silver Boots' is translated in 'Bottes en argent' by using '@2 en @1' as translated string)
			description = S("@1 @2", tmp_armor.name, part.name),
			inventory_image = "lib_armor_inv_"..partkey.."_"..key..".png",
			groups = {["armor_"..part.place]=math.floor(part.level*tmp_armor.armor), armor_heal=tmp_armor.heal, armor_use=tmp_armor.use, armor_radiation=math.floor(part.radlevel*tmp_armor.radiation)},
			wear = 0,
		})
		minetest.register_craft({
			output = partname,
			recipe = make_recipe(part.craft, {tmp_armor.material}),
		})
	end
end







if gal.player.armor.materials.wood then
	gal.player.armor:register_armor("lib_armor:helmet_wood", {
		description = S("Wood Helmet"),
		inventory_image = "3d_armor_inv_helmet_wood.png",
		groups = {armor_head=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_wood", {
		description = S("Wood Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_wood.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:leggings_wood", {
		description = S("Wood Leggings"),
		inventory_image = "3d_armor_inv_leggings_wood.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:boots_wood", {
		description = S("Wood Boots"),
		inventory_image = "3d_armor_inv_boots_wood.png",
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
		groups = {armor_feet=1, armor_heal=0, armor_use=2000, flammable=1},
	})
	gal.player.armor:register_armor("lib_armor:shield_wood", {
		description = S("Wooden Shield"),
		inventory_image = "shields_inv_shield_wood.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=2000, flammable=1},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_wood_footstep")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_wood_footstep")
		end,
	})
	gal.player.armor:register_armor("lib_armor:shield_enhanced_wood", {
		description = S("Enhanced Wood Shield"),
		inventory_image = "shields_inv_shield_enhanced_wood.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=2000},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=2},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_dig_metal")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_dug_metal")
		end,
	})
end

if gal.player.armor.materials.cactus then
	gal.player.armor:register_armor("lib_armor:helmet_cactus", {
		description = S("Cactus Helmet"),
		inventory_image = "3d_armor_inv_helmet_cactus.png",
		groups = {armor_head=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_cactus", {
		description = S("Cactus Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_cactus.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:leggings_cactus", {
		description = S("Cactus Leggings"),
		inventory_image = "3d_armor_inv_leggings_cactus.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:boots_cactus", {
		description = S("Cactus Boots"),
		inventory_image = "3d_armor_inv_boots_cactus.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
	})
	gal.player.armor:register_armor("lib_armor:shield_cactus", {
		description = S("Cactus Shield"),
		inventory_image = "shields_inv_shield_cactus.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=1},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_wood_footstep")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_wood_footstep")
		end,
	})
	gal.player.armor:register_armor("lib_armor:shield_enhanced_cactus", {
		description = S("Enhanced Cactus Shield"),
		inventory_image = "shields_inv_shield_enhanced_cactus.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=1000},
		armor_groups = {fleshy=8},
		damage_groups = {cracky=3, snappy=3, choppy=2, crumbly=2, level=2},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_dig_metal")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_dug_metal")
		end,
	})
end

if gal.player.armor.materials.steel then
	gal.player.armor:register_armor("lib_armor:helmet_steel", {
		--description = S("Steel Helmet"),
		original_description = S("Steel Helmet"),
		description = toolranks.create_description("Steel Helmet", 0, 1),
		inventory_image = "3d_armor_inv_helmet_steel.png",
		groups = {armor_head=1, armor_heal=0, armor_use=800,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:chestplate_steel", {
		--description = S("Steel Chestplate"),
		original_description = S("Steel Chestplate"),
		description = toolranks.create_description("Steel Chestplate", 0, 1),
		inventory_image = "3d_armor_inv_chestplate_steel.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=800,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:leggings_steel", {
		--description = S("Steel Leggings"),
		original_description = S("Steel Leggings"),
		description = toolranks.create_description("Steel Leggings", 0, 1),
		inventory_image = "3d_armor_inv_leggings_steel.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=800,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:boots_steel", {
		--description = S("Steel Boots"),
		original_description = S("Steel Boots"),
		description = toolranks.create_description("Steel Boots", 0, 1),
		inventory_image = "3d_armor_inv_boots_steel.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=800,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:shield_steel", {
		description = S("Steel Shield"),
		inventory_image = "shields_inv_shield_steel.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=800,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_dig_metal")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_dug_metal")
		end,
	})
end

if gal.player.armor.materials.bronze then
	gal.player.armor:register_armor("lib_armor:helmet_bronze", {
		--description = S("Bronze Helmet"),
		original_description = S("Bronze Helmet"),
		description = toolranks.create_description("Bronze Helmet", 0, 1),
		inventory_image = "3d_armor_inv_helmet_bronze.png",
		groups = {armor_head=1, armor_heal=6, armor_use=400,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:chestplate_bronze", {
		--description = S("Bronze Chestplate"),
		original_description = S("Bronze Chestplate"),
		description = toolranks.create_description("Bronze Chestplate", 0, 1),
		inventory_image = "3d_armor_inv_chestplate_bronze.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=400,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:leggings_bronze", {
		--description = S("Bronze Leggings"),
		original_description = S("Bronze Leggings"),
		description = toolranks.create_description("Bronze Leggings", 0, 1),
		inventory_image = "3d_armor_inv_leggings_bronze.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=400,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:boots_bronze", {
		--description = S("Bronze Boots"),
		original_description = S("Bronze Boots"),
		description = toolranks.create_description("Bronze Boots", 0, 1),
		inventory_image = "3d_armor_inv_boots_bronze.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=400,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=3, snappy=2, choppy=2, crumbly=1, level=2},
		after_use = toolranks.new_afteruse,
	})
	gal.player.armor:register_armor("lib_armor:shield_bronze", {
		description = S("Bronze Shield"),
		inventory_image = "shields_inv_shield_bronze.png",
		groups = {armor_shield=1, armor_heal=6, armor_use=400,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_dig_metal")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_dug_metal")
		end,
	})
end

if gal.player.armor.materials.diamond then
	gal.player.armor:register_armor("lib_armor:helmet_diamond", {
		description = S("Diamond Helmet"),
		inventory_image = "3d_armor_inv_helmet_diamond.png",
		groups = {armor_head=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_diamond", {
		description = S("Diamond Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_diamond.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:leggings_diamond", {
		description = S("Diamond Leggings"),
		inventory_image = "3d_armor_inv_leggings_diamond.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:boots_diamond", {
		description = S("Diamond Boots"),
		inventory_image = "3d_armor_inv_boots_diamond.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:shield_diamond", {
		description = S("Diamond Shield"),
		inventory_image = "shields_inv_shield_diamond.png",
		groups = {armor_shield=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_glass_footstep")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_break_glass")
		end,
	})
end

if gal.player.armor.materials.gold then
	gal.player.armor:register_armor("lib_armor:helmet_gold", {
		description = S("Gold Helmet"),
		inventory_image = "3d_armor_inv_helmet_gold.png",
		groups = {armor_head=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_gold", {
		description = S("Gold Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_gold.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=300,
			physics_speed=-0.05, physics_gravity=0.05},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	gal.player.armor:register_armor("lib_armor:leggings_gold", {
		description = S("Gold Leggings"),
		inventory_image = "3d_armor_inv_leggings_gold.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=300,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	gal.player.armor:register_armor("lib_armor:boots_gold", {
		description = S("Gold Boots"),
		inventory_image = "3d_armor_inv_boots_gold.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	gal.player.armor:register_armor("lib_armor:shield_gold", {
		description = S("Gold Shield"),
		inventory_image = "shields_inv_shield_gold.png",
		groups = {armor_shield=1, armor_heal=6, armor_use=300,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_dig_metal")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_dug_metal")
		end,
	})
end

if gal.player.armor.materials.mithril then
	gal.player.armor:register_armor("lib_armor:helmet_mithril", {
		description = S("Mithril Helmet"),
		inventory_image = "3d_armor_inv_helmet_mithril.png",
		groups = {armor_head=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_mithril", {
		description = S("Mithril Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_mithril.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:leggings_mithril", {
		description = S("Mithril Leggings"),
		inventory_image = "3d_armor_inv_leggings_mithril.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:boots_mithril", {
		description = S("Mithril Boots"),
		inventory_image = "3d_armor_inv_boots_mithril.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:shield_mithril", {
		description = S("Mithril Shield"),
		inventory_image = "shields_inv_shield_mithril.png",
		groups = {armor_shield=1, armor_heal=12, armor_use=100},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_glass_footstep")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_break_glass")
		end,
	})
end

if gal.player.armor.materials.crystal then
	gal.player.armor:register_armor("lib_armor:helmet_crystal", {
		description = S("Crystal Helmet"),
		inventory_image = "3d_armor_inv_helmet_crystal.png",
		groups = {armor_head=1, armor_heal=12, armor_use=100, armor_fire=1},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:chestplate_crystal", {
		description = S("Crystal Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_crystal.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=100, armor_fire=1},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:leggings_crystal", {
		description = S("Crystal Leggings"),
		inventory_image = "3d_armor_inv_leggings_crystal.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=100, armor_fire=1},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:boots_crystal", {
		description = S("Crystal Boots"),
		inventory_image = "3d_armor_inv_boots_crystal.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=100, physics_speed=1,
				physics_jump=0.5, armor_fire=1},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	gal.player.armor:register_armor("lib_armor:shield_crystal", {
		description = S("Crystal Shield"),
		inventory_image = "shields_inv_shield_crystal.png",
		groups = {armor_shield=1, armor_heal=12, armor_use=100, armor_fire=1},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
		reciprocate_damage = true,
		on_damage = function(player, index, stack)
			play_sound_effect(player, "default_glass_footstep")
		end,
		on_destroy = function(player, index, stack)
			play_sound_effect(player, "default_break_glass")
		end,
	})
end

for k, v in pairs(gal.player.armor.materials) do
	minetest.register_craft({
		output = "lib_armor:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "lib_armor:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "lib_armor:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "lib_armor:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "shields:shield_"..k,
		recipe = {
			{v, v, v},
			{v, v, v},
			{"", v, ""},
		},
	})
end

minetest.register_craft({
	output = "lib_armor:shield_enhanced_wood",
	recipe = {
		{"default:steel_ingot"},
		{"shields:shield_wood"},
		{"default:steel_ingot"},
	},
})
minetest.register_craft({
	output = "lib_armor:shield_enhanced_cactus",
	recipe = {
		{"default:steel_ingot"},
		{"shields:shield_cactus"},
		{"default:steel_ingot"},
	},
})

















