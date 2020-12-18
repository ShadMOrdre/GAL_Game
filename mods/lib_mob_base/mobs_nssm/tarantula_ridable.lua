
-- rideable horse
mobs:register_mob("mobs_nssm:tarantula_tamed", {
	type = "animal",
	visual = "mesh",
	visual_size = {x=10, y=10},
	mesh = "tarantula_propower.x",
	collisionbox = {-0.5, 0.00, -0.5, 0.5, 1, 0.5},
	animation = {
		speed_normal = 20,
		speed_run = 25,
		stand_start = 1,
		stand_end = 60,
		walk_start = 100,
		walk_end = 140,
		run_start = 140,
		run_end = 160,
		punch_start = 180,
		punch_end = 200,
	},
	textures = {{"tarantula.png"}},
	fear_height = 3,
	runaway = false,
	fly = false,
	walk_chance = 60,
	view_range = 14,
	follow = {"mobs:meat_raw", "mobs:meat"},
	sounds = {
		random = "tarry",
	},
	walk_velocity = 1.5,
	run_velocity = 3.3,
	rotate = 270,
	passive = true,
	hp_min = 70,
	hp_max = 70,
	armor = 60,
	water_damage = 1,
	lava_damage = 3,
	fall_damage = 5,
	light_damage = 0,
	reach = 4,
	attack_type = "dogfight",
	makes_footstep_sound = true,
	drops = {
		{name = "mobs_nssm:web", chance = 1, min = 1, max = 2},
	},

	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 6, z = -2}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 1, y = 1}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			self.object:set_properties({rotate = {x = 0, y = 270, z = 0}})
			self.object:set_properties({player_rotation = {x = 0, y = 180, z = 0}})
			--self.object:set_properties({driver_scale = {x = 0.1, y = 0.1}})

			--self.rotate = {x = 0, y = 270, z = 0}
			--self.player_rotation = {x = 0, y = 180, z = 0}
			self.driver:set_properties({visual_size = {x=0.1, y=0.1}})

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker.getpos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})
