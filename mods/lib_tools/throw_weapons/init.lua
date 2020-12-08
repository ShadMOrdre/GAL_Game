-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

rcthrow.register_throw("throw_weapons:steel_hatchet", {
	description = S("Steel Hatchet"),
	inventory_image = "throw_weapons_hatchet_inv.png",
	wield_image = "throw_weapons_hatchet.png",
	strength = 10,
	throw_damage = 10,
	throw_uses = 30,
	throw_sounds = {
		max_hear_distance = 10,
		gain = 0.6,
	},
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:wood", "default:steel_ingot"},
		{"group:wood", "", ""},
	},
	primary_use = {
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
				choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=15, maxlevel=2},
			},
		damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {axe = 1}
	},
})

rcthrow.register_throw("throw_weapons:steel_dague", {
	description = S("Steel Dague"),
	inventory_image = "throw_weapons_dague_inv.png",
	wield_image = "throw_weapons_dague.png",
	strength = 9,
	throw_damage = 4,
	throw_uses = 20,
	throw_sounds = {
		max_hear_distance = 10,
		gain = 0.6,
	},
	recipe = {
		{"", "", ""},
		{"", "default:steel_ingot", ""},
		{"group:wood", "", ""},
	},
	primary_use = {
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=10, maxlevel=2},
			},
			damage_groups = {fleshy=2},
		},
		groups = {dague = 1},
		sound = {breaks = "default_tool_breaks"},
	},
})

rcthrow.register_throw("throw_weapons:steel_spear", {
	description = S("Steel Spear"),
	inventory_image = "throw_weapons_spear.png",
	wield_image = "throw_weapons_spear.png",
	strength = 12,
	throw_damage = 12,
	throw_uses = 60,
	throw_sounds = {
		max_hear_distance = 10,
		gain = 0.6,
	},
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "group:wood", ""},
		{"group:wood", "", ""},
	},
	primary_use = {
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
			},
			damage_groups = {fleshy=7},
		},
		groups = {spear=1},
		sound = {breaks = "default_tool_breaks"},
	},
})

rcthrow.register_throw("throw_weapons:steel_trident", {
	description = S("Steel Trident"),
	inventory_image = "throw_weapons_trident.png",
	wield_image = "throw_weapons_trident.png",
	strength = 11,
	throw_damage = 10,
	throw_uses = 50,
	throw_sounds = {
		max_hear_distance = 10,
		gain = 0.6,
	},
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:wood", ""},
		{"group:wood", "", ""},
	},
	primary_use = {
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=25, maxlevel=2},
			},
			damage_groups = {fleshy=7},
		},
		groups = {spear = 1},
		sound = {breaks = "default_tool_breaks"},
	},
})
