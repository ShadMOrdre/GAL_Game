
mobs:register_mob("mobs_animals_2:wolf", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"mobs_wolf.png"},
	},
	visual = "mesh",
	mesh = "mobs_wolf.x",
	makes_footstep_sound = true,
	view_range = 7,
	walk_velocity = 2,
	run_velocity = 3,
	damage = 2,
	attacks_monsters = true,
	armor = 200,
	attack_type = "dogfight",
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	animation = {
		speed_normal = 15,		speed_run = 15,
		stand_start = 10,		stand_end = 20,
		walk_start = 75,		walk_end = 100,
		run_start = 100,		run_end = 130,
		punch_start = 135,		punch_end = 155,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat_raw" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.food = (self.food or 0) + 1
			if self.food >= 8 and self.tamed ~= true then
				self.food = 0
				self.tamed = true
				self.type = "npc"
				self.state = "stand"
				self.follow = "mobs:meat_raw"
				self.following = nil
				self.base_texture = {"mobs_medved.png"}
				self.object:set_properties({
					textures = self.base_texture,
				})
			else
				local hp = self.object:get_hp()
				self.follow = "mobs:meat_raw"
				if hp + 4 > self.hp_max then return end
				self.object:set_hp(hp+4)
			end
		end
	end,
})
