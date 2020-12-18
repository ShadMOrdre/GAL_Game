-- Draconis ABMs


minetest.register_abm({
	nodenames = {"draconis:hot_obsidian"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32,
			4,
			{x=pos.x-0.1, y=pos.y-0.25, z=pos.z-0.1},
			{x=pos.x+0.1, y=pos.y+0.25, z=pos.z+0.1},
			{x=-0.2, y=-0.8, z=-0.2},
			{x=0, y=0.8, z=0},
			{x=0,y=0,z=0},
			{x=0,y=0,z=0},
			1.4,
			1.5,
			1,
			2,
			false,
			"draconis_dragon_fire.png"
		)
	end,
})

minetest.register_abm({
	nodenames = {"draconis:cold_ice"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32,
			4,
			{x=pos.x-0.1, y=pos.y-0.25, z=pos.z-0.1},
			{x=pos.x+0.1, y=pos.y+0.25, z=pos.z+0.1},
			{x=-0.2, y=-0.8, z=-0.2},
			{x=0, y=0.8, z=0},
			{x=0,y=0,z=0},
			{x=0,y=0,z=0},
			1.4,
			1.5,
			1,
			2,
			false,
			"draconis_frost_flame.png"
		)
	end,
})

