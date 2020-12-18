
local S = mobs.intllib

-- Npc by TenPlus1

mobs.npc_drops = {
	"lib_handtools:tool_pick_steel", "mobs:meat", "lib_handtools:tool_sword_steel",
	"lib_handtools:tool_shovel_steel", "gal:food_bread", "gal:bucket_water"
}





minetest.register_entity("mobs_npc:dummy", {
	visual = "sprite",
	textures = {"xpanes_trans.png"},
	physical = false,
	collisionbox = {0, 0, 0, 0.1, 0.1, 0.1},
	})


mobs:register_mob("mobs_npc:town_npc", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	pathfinding = true,
	hp_min = 20,
	hp_max = 25,
	armor = 100,
	visual = "mesh",
	mesh = "3d_armor_character_sfc.b3d",
	drawtype = "front",

	child_texture = {
		{"mobs_npc_baby.png"}, -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	stepheight = 1.2,
	drops = {
		{name = "gal:tree_default_wood", chance = 1, min = 1, max = 3},
		{name = "gal:fruit_apple", chance = 2, min = 1, max = 2},
		{name = "lib_handtools:tool_axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	--follow = {"gal:food_bread", "mobs:meat", "gal:mineral_diamond", "villages:colony_deed"},
	follow = {"gal:food_bread", "mobs:meat", "gal:mineral_diamond"},
	view_range = 20,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},

	on_rightclick = function(self, clicker)

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()
		
		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end


		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "gal:metal_gold_lump" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:getpos()

			pos.y = pos.y + 0.5

			minetest.add_item(pos, {
				name = mobs.npc_drops[math.random(1, #mobs.npc_drops)]
			})

			minetest.chat_send_player(name, S("NPC dropped you an item for gold!"))

			return
		end


		-- capture npc with net or lasso
		mobs:capture_mob(self, clicker, 0, 5, 80, false, nil)

		-- protect npc with mobs:protector
		mobs:protect(self, clicker)

		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then
				self.order = "stand"

				minetest.chat_send_player(name, S("NPC stands still."))
			else
				self.order = "follow"

				minetest.chat_send_player(name, S("NPC will follow you."))
			end
		end

	end,
--[[
	on_activate = function(self, staticdata, dtime_s)

		local data = staticdata:split(',')
		local d_job = data[2]:split(';')

		if #d_job > 1 then
			mobs_npc.initialize(self, self.object:getpos(), true, data[1], data[2])
		else
			mobs_npc.initialize(self, self.object:getpos(), true, data[1], data[2])
		end

		return self.initialized

	end,
--]]
	do_custom = function(self, dtime)
		
		if self.initialized == nil then

			-- Initialize NPC if spawned using the spawn egg built in from
			-- mobs_redo. This functionality will be removed in the future in
			-- favor of a better manual spawning method with customization 
			minetest.log("[advanced_npc] WARNING: Initializing NPC from entity step. This message should only be appearing if an NPC is being spawned from inventory with egg!")

			mobs_npc.initialize(self, self.object:getpos(), true)

			return self.initialized

		else

			self.object:set_properties({textures={self.v_texture[1], self.v_texture[2], self.v_texture[3]}})
			self.object:set_properties({visual_size=self.visual_size})
			self.object:set_properties({collisionbox={self.v_colbox[1], self.v_colbox[2], self.v_colbox[3], self.v_colbox[4], self.v_colbox[5], self.v_colbox[6]}})
			self.object:set_properties({nametag=self.nametag})
			self.object:set_properties({infotext=self.infotext})


		end

		return ""

	end
})

mobs:spawn({
	name = "mobs_npc:town_npc",
	nodes = {"gal:stone_brick"},
	neighbors = {"gal:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true,
})

mobs:register_egg("mobs_npc:town_npc", S("Town Npc"), "default_brick.png", 1)




















