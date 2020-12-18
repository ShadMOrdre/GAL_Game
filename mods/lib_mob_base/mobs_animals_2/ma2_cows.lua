
local S = mobs.intllib

mobs:register_mob("mobs_animals_2:cow", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	pathfinding = 1,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.35, -0.01, -0.35, 0.35, 1.1, 0.35},
	visual = "mesh",
	mesh = "mobs_cow.b3d",
	visual_size = {x=2.0, y=2.0},
	textures = {
		{"mobs_cow_tyrol_grey_01.png"},
		{"mobs_cow_tyrol_grey_02.png"},
		{"mobs_cow_simmental_01.png"},
		{"mobs_cow_simmental_02.png"},
		{"mobs_cow_red_belted_galloway_01.png"},
		{"mobs_cow_red_belted_galloway_02.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random ="mobs_cow_ran",
		attack ="mobs_cow_att",
		death ="mobs_cow_dth",
		damage ="mobs_cow_dam",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = false,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		stand_speed = 24,
		stand1_start = 35,
		stand1_end = 75,
		stand1_speed = 24,
		walk_start = 85,
		walk_end = 114,
		walk_speed = 24,
		run_start = 120,
		run_end = 140,
		run_speed = 24,
		punch_start = 145,
        punch_end= 165,
        punch_speed = 34 ,
		die_start = 191,  
        die_end = 210,
        die_speed = 26, 
        die_loop = false,
		
	},
	follow = {"gal:item_wheat", "gal:grass_1"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"gal:dirt_with_grass", "gal:dirt", -1}
	},
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then

			-- if fed 7x wheat or grass then cow can be milked again
			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- milk cow with empty bucket
		if tool:get_name() == "gal:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				minetest.chat_send_player(name,
					S("Cow already milked!"))
				return
			end

			local inv = clicker:get_inventory()

			tool:take_item()
			clicker:set_wielded_item(tool)

			if inv:room_for_item("main", {name = "mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end
	end,
	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		-- if cow replaces 8x grass then it can be milked again
		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end,
	
})

--[[
mobs:spawn({
	name = "mobs_animals_2:cow",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})
--]]

--mobs:register_egg("mobs_animals_2:cow", S("Cow"), "mobs_cow_inv.png", 0)


-- commented out to prevent conflict S01 --mobs:alias_mob("mobs:cow", "mobs_animal:cow") -- compatibility


