
local S = mobs.intllib



mobs:register_mob("prehistoric_life:triceratops", {
	type = "herbivorous_dinosaur",
	passive = false,
	hp_min = 94,
	hp_max = 112,
	armor = 100,
	collisionbox = {-1, -1, -1, 1.8, 1.7, 1},
	visual = "mesh",
	mesh = "prehistoric_life_triceratops.b3d",
	textures = {
		{"prehistoric_life_triceratops.png"},
	},
	child_texture = {
		{"prehistoric_life_triceratops_child.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dirtmonster",
	},
	view_range = 26,
	walk_velocity = 1,
	run_velocity = 3,
	runaway = false,
	drops = {
		{name = "prehistoric_life:triceratops_raw", chance = 1, min = 2, max = 2},
		{name = "prehistoric_life:triceratops_tooth", chance = 3, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 6,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		stand_start = 50,
		stand_end = 100,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
	},

	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item()
		if tool:get_name() == "farming:wheat" then
			clicker:get_inventory():remove_item("main", "farming:wheat")
			minetest.add_entity(self.object:getpos(), "prehistoric_life:triceratops_tamed")
			self.object:remove()
		end
	end,

	do_custom = function(self, dtime)

		self.egg_timer = (self.egg_timer or 0) + dtime
		if self.egg_timer < 10 then
			return
		end
		self.egg_timer = 0

		if self.child
		or math.random(1, 200) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, "prehistoric_life:triceratops_egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_egg("prehistoric_life:triceratops", S("Triceratops"), "prehistoric_life_overlay_triceratops.png", 1)

-- egg entity

mobs:register_arrow("prehistoric_life:triceratops_egg_entity", {
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

		pos.y = pos.y + 1

		local nod = minetest.get_node_or_nil(pos)

		if not nod
		or not minetest.registered_nodes[nod.name]
		or minetest.registered_nodes[nod.name].walkable == true then
			return
		end

		local mob = minetest.add_entity(pos, "prehistoric_life:triceratops")
		local ent2 = mob:get_luaentity()

		mob:set_properties({
			textures = ent2.child_texture[1],
			visual_size = {
				x = ent2.base_size.x / 6,
				y = ent2.base_size.y / 6
			},
			collisionbox = {
				ent2.base_colbox[1] / 6,
				ent2.base_colbox[2] / 6,
				ent2.base_colbox[3] / 6,
				ent2.base_colbox[4] / 6,
				ent2.base_colbox[5] / 6,
				ent2.base_colbox[6] / 6
			},
		})

		ent2.child = true
		ent2.tamed = true
		ent2.owner = self.playername
	end
})




local egg_GRAVITY = 9
local egg_VELOCITY = 19


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
	}, "prehistoric_life:triceratops_egg_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = egg_VELOCITY 
	ent.switch = 1 

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

	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

	item:take_item()

	return item
end


-- egg
minetest.register_node("prehistoric_life:triceratops_egg", {
	description = S("Triceratops Egg"),
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
			minetest.set_node(pos, {name = "prehistoric_life:triceratops_egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})

-- tooth
minetest.register_craftitem("prehistoric_life:triceratops_tooth", {
	description = ("Triceratops Tooth"),
	inventory_image = "prehistoric_life_triceratops_tooth.png",
})

-- raw meat
minetest.register_craftitem("prehistoric_life:raw_triceratops_meat", {
	description = ("Raw Triceratops Meat"),
	inventory_image = "prehistoric_life_raw_triceratops_meat.png",
	on_use = minetest.item_eat(-3),
})

-- cooked meat
minetest.register_craftitem("prehistoric_life:cooked_triceratops_meat", {
	description = ("Cooked Triceratops Meat"),
	inventory_image = "prehistoric_life_cooked_triceratops_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "prehistoric_life:raw_triceratops_meat",
	recipe = "prehistoric_life:cooked_triceratops_meat",
	cooktime = 5,
})
