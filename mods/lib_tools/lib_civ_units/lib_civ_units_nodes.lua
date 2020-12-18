

local S = lib_civ_units.intllib


--[[
mesh_fort_ang_w.obj
"fort_ang_w"
"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#65605f):2,0=(px.png\\^[colorize\\:#916540)"
fixed = { { -0.34375, -0.5, -0.34375, 0.25, -0.15625, 0.25, }, },

mesh_fort_gondor.obj
"fort_gondor"
"[combine:5x1:0,0=(px.png\\^[colorize\\:#65605f):1,0=(px.png\\^[colorize\\:#916540):2,0=(px.png\\^[colorize\\:#b27474):3,0=(px.png\\^[colorize\\:#806337):4,0=(px.png\\^[colorize\\:#820303)"
fixed = { { -0.21875, -0.5, -0.21875, 0.21875, 0.40625, 0.28125, }, },

mesh_fort_orc_w.obj
"fort_orc_w",
"[combine:1x1:0,0=(px.png\\^[colorize\\:#bf975e)"
fixed = { { -0.21875, -0.5, -0.21875, 0.15625, -0.15625, 0.09375, }, },

mesh_fort_rohan.obj
"fort_rohan"
"[combine:5x1:0,0=(px.png\\^[colorize\\:#806337):1,0=(px.png\\^[colorize\\:#443616):2,0=(px.png\\^[colorize\\:#5b8534):3,0=(px.png\\^[colorize\\:#916540):4,0=(px.png\\^[colorize\\:#5f4027)"
fixed = { { -0.1875, -0.5, -0.375, 0.28125, 0.1875, 0.28125, }, { -0.375, -0.5, -0.375, -0.1875, -0.25, 0.28125, }, },

mesh_wesh_fortress.obj
"WESH_Fortress",
"plain-16.png"
fixed = { { -0.375, -0.5, -0.4375, 0.34375, 0.125, 0.34375, }, },

mesh_wesh_tower_01.obj
"WESH_Tower_01",
"plain-16.png"
fixed = { { -0.09375, -0.5, -0.1875, 0.1875, -0.03125, 0.0625, }, },

mesh_wesh_lava_beacon.obj
"WESH_Lava_Beacon",
"plain-16.png"
fixed = { { -0.09375, -0.5, -0.25, 0.1875, 0.21875, 0.03125, }, },




mesh_bldg_mine_lvl6.obj
"bldg_mine_lvl6"
"[combine:6x1:0,0=(px.png\\^[colorize\\:#8f7b5a):1,0=(px.png\\^[colorize\\:#372b1f):2,0=(px.png\\^[colorize\\:#65605f):3,0=(px.png\\^[colorize\\:#674e29):4,0=(px.png\\^[colorize\\:#7b5a22):5,0=(px.png\\^[colorize\\:#201d18)"
fixed = { { -0.21875, -0.5, -0.21875, 0.15625, 0.5, 0.09375, }, },

mesh_church_sanmigueldelilo.obj
"church_sanmigueldelilo"
"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#65605f):2,0=(px.png\\^[colorize\\:#615e5d)"
fixed = { { -0.15625, -0.5, -0.34375, 0.25, -0.03125, 0.25, }, },

mesh_ship_pirate.obj
"ship_pirate"
"[combine:8x1:0,0=(px.png\\^[colorize\\:#dcdcdc):1,0=(px.png\\^[colorize\\:#745c39):2,0=(px.png\\^[colorize\\:#674e29):3,0=(px.png\\^[colorize\\:#b27474):4,0=(px.png\\^[colorize\\:#820303):5,0=(px.png\\^[colorize\\:#806337):6,0=(px.png\\^[colorize\\:#836757):7,0=(px.png\\^[colorize\\:#cfcde2)"
fixed = { { -0.0625, -0.46875, -0.25, 0.46875, 0.4375, 0.09375, }, { -0.4375, -0.46875, -0.25, -0.0625, 0.0625, 0.09375, }, },

--]]

minetest.register_entity("lib_civ_units:u_fort_angmar", {
	name = "Angmar Fort",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_fort_ang_w.obj",
	textures = {"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#65605f):2,0=(px.png\\^[colorize\\:#916540)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_fort_gondor", {
	name = "Gondor Fort",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_fort_gondor.obj",
	textures = {"[combine:5x1:0,0=(px.png\\^[colorize\\:#65605f):1,0=(px.png\\^[colorize\\:#916540):2,0=(px.png\\^[colorize\\:#b27474):3,0=(px.png\\^[colorize\\:#806337):4,0=(px.png\\^[colorize\\:#820303)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_fort_orc", {
	name = "Orc Fort",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_fort_orc_w.obj",
	textures = {"[combine:1x1:0,0=(px.png\\^[colorize\\:#bf975e)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_fort_rohan", {
	name = "Rohan Fort",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 10, y = 10, z = 10},
	visual = "mesh",
	mesh = "mesh_fort_rohan.obj",
	textures = {"[combine:5x1:0,0=(px.png\\^[colorize\\:#806337):1,0=(px.png\\^[colorize\\:#443616):2,0=(px.png\\^[colorize\\:#5b8534):3,0=(px.png\\^[colorize\\:#916540):4,0=(px.png\\^[colorize\\:#5f4027)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_fortress", {
	name = "Fortress",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_wesh_fortress.obj",
	textures = {"plain-16.png"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_tower", {
	name = "Tower",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_wesh_tower_01.obj",
	textures = {"plain-16.png"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_lava_beacon", {
	name = "Lava_Beacon",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_wesh_lava_beacon.obj",
	textures = {"plain-16.png"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})


minetest.register_entity("lib_civ_units:u_church_sanmigueldelilo", {
	name = "San Miguel de Lilo",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_church_sanmigueldelilo_03.obj",
	textures = {"[combine:4x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#585452):2,0=(px.png\\^[colorize\\:#65605f):3,0=(px.png\\^[colorize\\:#615e5d)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_bldg_mine_lvl6", {
	name = "Mine (Level 6)",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 25, y = 25, z = 25},
	visual = "mesh",
	mesh = "mesh_bldg_mine_lvl6.obj",
	textures = {"[combine:6x1:0,0=(px.png\\^[colorize\\:#8f7b5a):1,0=(px.png\\^[colorize\\:#372b1f):2,0=(px.png\\^[colorize\\:#65605f):3,0=(px.png\\^[colorize\\:#674e29):4,0=(px.png\\^[colorize\\:#7b5a22):5,0=(px.png\\^[colorize\\:#201d18)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})


minetest.register_entity("lib_civ_units:u_ship_pirate_2", {
	name = "Pirate Ship2",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 15, y = 15, z = 15},
	visual = "mesh",
	mesh = "mesh_ship_pirate_02.obj",
	textures = {"[combine:16x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#dcdcdc):2,0=(px.png\\^[colorize\\:#826548):3,0=(px.png\\^[colorize\\:#745c39):4,0=(px.png\\^[colorize\\:#674e29):5,0=(px.png\\^[colorize\\:#7b5a22):6,0=(px.png\\^[colorize\\:#786243):7,0=(px.png\\^[colorize\\:#b27474):8,0=(px.png\\^[colorize\\:#8c6c41):9,0=(px.png\\^[colorize\\:#806337):10,0=(px.png\\^[colorize\\:#820303):11,0=(px.png\\^[colorize\\:#64605e):12,0=(px.png\\^[colorize\\:#dbe4e4):13,0=(px.png\\^[colorize\\:#ced0cc):14,0=(px.png\\^[colorize\\:#cfcde2):15,0=(px.png\\^[colorize\\:#c2c2e3)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})
minetest.register_entity("lib_civ_units:u_ship_pirate", {
	name = "Pirate Ship",
	hp_min = 10,
	hp_max = 10,
	visual_size = {x = 15, y = 15, z = 15},
	visual = "mesh",
	mesh = "mesh_ship_pirate_03.obj",
	textures = {"[combine:16x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#dcdcdc):2,0=(px.png\\^[colorize\\:#826548):3,0=(px.png\\^[colorize\\:#745c39):4,0=(px.png\\^[colorize\\:#674e29):5,0=(px.png\\^[colorize\\:#7b5a22):6,0=(px.png\\^[colorize\\:#786243):7,0=(px.png\\^[colorize\\:#b27474):8,0=(px.png\\^[colorize\\:#8c6c41):9,0=(px.png\\^[colorize\\:#806337):10,0=(px.png\\^[colorize\\:#820303):11,0=(px.png\\^[colorize\\:#64605e):12,0=(px.png\\^[colorize\\:#dbe4e4):13,0=(px.png\\^[colorize\\:#ced0cc):14,0=(px.png\\^[colorize\\:#cfcde2):15,0=(px.png\\^[colorize\\:#c2c2e3)"},
	--collisionbox = {-defbox, -def.size, -defbox, defbox, def.size, defbox},
	physical = true
})

minetest.register_entity("lib_civ_units:u_catapult", {
	visual = "mesh",
	mesh = "catapult.b3d",
	visual_size = {x = 0.2, y = 0.2, z = 0.2},
	textures = {"catapult2.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	damage = 2,
	physical = true,
	collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
})









minetest.register_node("lib_civ_units:fort_angmar", {
	description = "Angmar Fort",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_fort_ang_w.obj",
	tiles = {"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#65605f):2,0=(px.png\\^[colorize\\:#916540)"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:fort_gondor", {
	description = "Gondor Fort",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_fort_gondor.obj",
	tiles = {"[combine:5x1:0,0=(px.png\\^[colorize\\:#65605f):1,0=(px.png\\^[colorize\\:#916540):2,0=(px.png\\^[colorize\\:#b27474):3,0=(px.png\\^[colorize\\:#806337):4,0=(px.png\\^[colorize\\:#820303)"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:fort_orc", {
	description = "Orc Fort",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_fort_orc_w.obj",
	tiles = {"[combine:1x1:0,0=(px.png\\^[colorize\\:#bf975e)"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:fort_rohan", {
	description = "Rohan Fort",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_fort_rohan.obj",
	tiles = {"[combine:5x1:0,0=(px.png\\^[colorize\\:#806337):1,0=(px.png\\^[colorize\\:#443616):2,0=(px.png\\^[colorize\\:#5b8534):3,0=(px.png\\^[colorize\\:#916540):4,0=(px.png\\^[colorize\\:#5f4027)"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:fortress", {
	description = "Fortress",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_fortress.obj",
	tiles = {"plain-16.png"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})



minetest.register_node("lib_civ_units:tower", {
	description = "Tower",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_tower_01.obj",
	tiles = {"plain-16.png"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:lava_beacon", {
	description = "Lava_Beacon",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_lava_beacon.obj",
	tiles = {"plain-16.png"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})



minetest.register_node("lib_civ_units:town_hall", {
	description = "Town Hall",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_town_hall.obj",
	tiles = {"plain-16.png"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})

minetest.register_node("lib_civ_units:town_3story", {
	description = "Town Hall (3 Story)",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_town_3story.obj",
	tiles = {"[combine:12x1:0,0=(px.png\\^[colorize\\:#dab586):1,0=(px.png\\^[colorize\\:#806337):2,0=(px.png\\^[colorize\\:#e2bd91):3,0=(px.png\\^[colorize\\:#af9f8c):4,0=(px.png\\^[colorize\\:#7b5a22):5,0=(px.png\\^[colorize\\:#9b875b):6,0=(px.png\\^[colorize\\:#5c442e):7,0=(px.png\\^[colorize\\:#a58e7c):8,0=(px.png\\^[colorize\\:#94663d):9,0=(px.png\\^[colorize\\:#7e5633):10,0=(px.png\\^[colorize\\:#786243):11,0=(px.png\\^[colorize\\:#6b593b)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.21875, -0.5, -0.21875, 0.1875, 0.03125, 0.1875, }, },
	},
})
minetest.register_node("lib_civ_units:town_roundhouse", {
	description = "Town Hall (Roundhouse)",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_town_roundhouse.obj",
	tiles = {"[combine:12x1:0,0=(px.png\\^[colorize\\:#42701f):1,0=(px.png\\^[colorize\\:#af9f8c):2,0=(px.png\\^[colorize\\:#6b593b):3,0=(px.png\\^[colorize\\:#656361):4,0=(px.png\\^[colorize\\:#ccb37a):5,0=(px.png\\^[colorize\\:#a58e7c):6,0=(px.png\\^[colorize\\:#5c442e):7,0=(px.png\\^[colorize\\:#9b875b):8,0=(px.png\\^[colorize\\:#7e5633):9,0=(px.png\\^[colorize\\:#e2bd91):10,0=(px.png\\^[colorize\\:#342d22):11,0=(px.png\\^[colorize\\:#94663d)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.34375, -0.5, -0.375, 0.1875, -0.15625, 0.15625, }, },
	},
})

minetest.register_node("lib_civ_units:desert_town", {
	description = "Desert Town",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_bldg_desert_town.obj",
	tiles = {"[combine:7x1:0,0=(px.png\\^[colorize\\:#bf975e):1,0=(px.png\\^[colorize\\:#b27474):2,0=(px.png\\^[colorize\\:#820303):3,0=(px.png\\^[colorize\\:#8c6c41):4,0=(px.png\\^[colorize\\:#786243):5,0=(px.png\\^[colorize\\:#806337):6,0=(px.png\\^[colorize\\:#7b5a22)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.46875, -0.5, -0.46875, 0.40625, -0.375, 0.4375, }, },
	},
})

minetest.register_node("lib_civ_units:shops_01", {
	description = "Shops 01",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_bldg_shops_01.obj",
	tiles = {"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#c2c2e3):2,0=(px.png\\^[colorize\\:#806337)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.34375, -0.5, -0.375, 0.34375, -0.34375, 0.375, }, },
	},
})
minetest.register_node("lib_civ_units:hut_01", {
	description = "Hut 01",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_hut_01.obj",
	tiles = {"plain-16.png"},
	collision_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, },
	},
})
minetest.register_node("lib_civ_units:church_sanmigueldelilo", {
	description = "San Miguel de Lilo",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_church_sanmigueldelilo_03.obj",
	tiles = {"[combine:4x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#585452):2,0=(px.png\\^[colorize\\:#65605f):3,0=(px.png\\^[colorize\\:#615e5d)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.1875, -0.5, -0.34375, 0.28125, 0, 0.25, }, },
	},
})
minetest.register_node("lib_civ_units:church_sanmiguel_ruins", {
	description = "San Miguel de Lilo (Ruins)",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_church_sanmigueldelilo_ruins.obj",
	tiles = {"[combine:3x1:0,0=(px.png\\^[colorize\\:#585452):1,0=(px.png\\^[colorize\\:#65605f):2,0=(px.png\\^[colorize\\:#615e5d)"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})
minetest.register_node("lib_civ_units:church_01", {
	description = "Church 01",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_church_01.obj",
	tiles = {"plain-16.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})
minetest.register_node("lib_civ_units:forge_01", {
	description = "Forge 01",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_forge_01.obj",
	tiles = {"plain-16.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})
minetest.register_node("lib_civ_units:bldg_mine_lvl6", {
	description = "Mine (Level 6)",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_bldg_mine_lvl6.obj",
	tiles = {"[combine:6x1:0,0=(px.png\\^[colorize\\:#8f7b5a):1,0=(px.png\\^[colorize\\:#372b1f):2,0=(px.png\\^[colorize\\:#65605f):3,0=(px.png\\^[colorize\\:#674e29):4,0=(px.png\\^[colorize\\:#7b5a22):5,0=(px.png\\^[colorize\\:#201d18)"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})
minetest.register_node("lib_civ_units:mill_01", {
	description = "Mill 01",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_bldg_mill.obj",
	tiles = {"[combine:9x1:0,0=(px.png\\^[colorize\\:#806337):1,0=(px.png\\^[colorize\\:#786243):2,0=(px.png\\^[colorize\\:#585452):3,0=(px.png\\^[colorize\\:#a48358):4,0=(px.png\\^[colorize\\:#545935):5,0=(px.png\\^[colorize\\:#8c6c41):6,0=(px.png\\^[colorize\\:#615e5d):7,0=(px.png\\^[colorize\\:#674e29):8,0=(px.png\\^[colorize\\:#dcdcdc)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.21875, -0.5, -0.21875, 0.21875, 0, 0.25, }, },
	},
})





minetest.register_node("lib_civ_units:tree_jungle_palm", {
	description = "Jungle Palm Tree",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_tree_jungle_palm.obj",
	tiles = {"wool-16.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})
minetest.register_node("lib_civ_units:trees_jungle_palm", {
	description = "Jungle Palm Trees",
	--visual_size = {x = 2, y = 2, z = 2},
	visual_scale = 3,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_wesh_tree_jungle_trees.obj",
	tiles = {"wool-16.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
})







minetest.register_node("lib_civ_units:ship_pirate2", {
	description = "Pirate2 Ship",
	visual_scale = 1.5,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_ship_pirate_02.obj",
	tiles = {"[combine:16x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#dcdcdc):2,0=(px.png\\^[colorize\\:#826548):3,0=(px.png\\^[colorize\\:#745c39):4,0=(px.png\\^[colorize\\:#674e29):5,0=(px.png\\^[colorize\\:#7b5a22):6,0=(px.png\\^[colorize\\:#786243):7,0=(px.png\\^[colorize\\:#b27474):8,0=(px.png\\^[colorize\\:#8c6c41):9,0=(px.png\\^[colorize\\:#806337):10,0=(px.png\\^[colorize\\:#820303):11,0=(px.png\\^[colorize\\:#64605e):12,0=(px.png\\^[colorize\\:#dbe4e4):13,0=(px.png\\^[colorize\\:#ced0cc):14,0=(px.png\\^[colorize\\:#cfcde2):15,0=(px.png\\^[colorize\\:#c2c2e3)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.1875, 0, -0.1875, 0.3125, 0.5, 0.15625, }, { -0.5, -0.5, -0.5, 0.5, 0, 0.46875, }, },
	},
})
minetest.register_node("lib_civ_units:ship_pirate", {
	description = "Pirate Ship",
	visual_scale = 1.5,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "mesh_ship_pirate_03.obj",
	tiles = {"[combine:16x1:0,0=(px.png\\^[colorize\\:#36250b):1,0=(px.png\\^[colorize\\:#dcdcdc):2,0=(px.png\\^[colorize\\:#826548):3,0=(px.png\\^[colorize\\:#745c39):4,0=(px.png\\^[colorize\\:#674e29):5,0=(px.png\\^[colorize\\:#7b5a22):6,0=(px.png\\^[colorize\\:#786243):7,0=(px.png\\^[colorize\\:#b27474):8,0=(px.png\\^[colorize\\:#8c6c41):9,0=(px.png\\^[colorize\\:#806337):10,0=(px.png\\^[colorize\\:#820303):11,0=(px.png\\^[colorize\\:#64605e):12,0=(px.png\\^[colorize\\:#dbe4e4):13,0=(px.png\\^[colorize\\:#ced0cc):14,0=(px.png\\^[colorize\\:#cfcde2):15,0=(px.png\\^[colorize\\:#c2c2e3)"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.1875, 0, -0.1875, 0.3125, 0.5, 0.15625, }, { -0.5, -0.5, -0.5, 0.5, 0, 0.46875, }, },
	},
})
minetest.register_node("lib_civ_units:catapult", {
	description = "Catapult",
	visual_scale = 0.025,
	drawtype = "mesh",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	mesh = "catapult.b3d",
	tiles = {"catapult2.png"},
	collision_box = {
		type = "fixed",
		fixed = { { -0.2, -0.5, -0.2, 0.2, 0, 0.2, }, },
	},
})
