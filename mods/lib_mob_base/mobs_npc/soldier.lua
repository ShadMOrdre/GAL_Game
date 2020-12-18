
-- Soldier

mobs:register_mob("mobs_npc:soldier_1", {
	-- animal, monster, npc
	type = "npc",
	passive = true,
	damage = 7,
	attack_type = "dogfight",
	attacks_monsters = true,
	owner = "",
	order = "stand",
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "guard.x",
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	drawtype = "front",
	textures = {
		{"eliteknight.png", "npcf_skin_armor.png", "default_tool_steelsword.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 1.2,
	run_velocity = 3.5,
	jump = true,
	floats = {x=0,y=0,z=0},
	stepheight = 1.1,
	-- drops wood and chance of apples when dead
	drops = {
		{name = "gal:tree_default_wood",
		chance = 1, min = 1, max = 3},
		{name = "gal:fruit_apple",
		chance = 2, min = 1, max = 2},
		{name = "lib_handtools:tool_sword_steel",
		chance = 3, min = 1, max = 1},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,

	view_range = 25,
	-- model animation
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	-- right clicking with cooked meat will give npc more health
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" or item:get_name() == "gal:food_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)
		
			
		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = clicker:get_player_name()
			else
				local formspec = "size[8,4]"
				formspec = formspec .. "textlist[2.85,0;2.1,0.5;dialog;What can I do for you?]"
				formspec = formspec .. "button_exit[1,1;2,2;gfollow;follow]"
				formspec = formspec .. "button_exit[5,1;2,2;gstand;stand]"
				formspec = formspec .. "button_exit[0,2;4,4;gfandp;follow and protect]"
				formspec = formspec .. "button_exit[4,2;4,4;gsandp;stand and protect]"
				formspec = formspec .. "button_exit[1,2;2,2;ggohome; go home]"
				formspec = formspec .. "button_exit[5,2;2,2;gsethome; sethome]"
				minetest.show_formspec(clicker:get_player_name(), "order", formspec)
				minetest.register_on_player_receive_fields(function(clicker, formname, fields)
					if fields.gfollow then
						self.order = "follow"
						self.attacks_monsters = false
					end
					if fields.gstand then
						self.order = "stand"
						self.attacks_monsters = false
					end
					if fields.gfandp then
						self.order = "follow"
						self.attacks_monsters = true
					end
					if fields.gsandp then
						self.order = "stand"
						self.attacks_monsters = true
					end
					if fields.gsethome then
						self.floats = self.object:getpos()
					end
					if fields.ggohome then
						if self.floats then
							self.order = "stand"
							self.object:setpos(self.floats)
						end
					end
				end)
						
			end
		end
	end,
})

mobs:register_egg("mobs_npc:soldier_1", "Soldier_1", "technic_wrought_iron_block.png", 1)


mobs:register_mob("mobs_npc:soldier_2", {
	-- animal, monster, npc
	type = "npc",
	passive = true,
	damage = 7,
	attack_type = "dogfight",
	attacks_monsters = true,
	owner = "",
	order = "stand",
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "npcf_guard.x",
	drawtype = "front",
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	textures = {
		{"templar.png", "npcf_skin_armor.png", "castle_battleaxe.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 1.2,
	run_velocity = 3.5,
	jump = true,
	floats = {x=0,y=0,z=0},
	stepheight = 1.1,
	-- drops wood and chance of apples when dead
	drops = {
		{name = "gal:tree_default_wood",
		chance = 1, min = 1, max = 3},
		{name = "gal:fruit_apple",
		chance = 2, min = 1, max = 2},
		{name = "lib_handtools:tool_sword_steel",
		chance = 3, min = 1, max = 1},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,

	view_range = 30,
	-- model animation
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	-- right clicking with cooked meat will give npc more health
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" or item:get_name() == "gal:food_bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)
		
			
		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
		
			local player_name = clicker:get_player_name()
			
			if self.owner == "" then
				self.owner = player_name
			end

			if player_name == self.owner then
--
				local blacklist = minetest.formspec_escape(self.metadata.blacklist)
				local whitelist = minetest.formspec_escape(self.metadata.whitelist)
				local formspec = "size[8,7.5]"
					.."field[0.5,1.0;3.5,0.5;wielditem;Weapon;"..self.metadata.wielditem.."]"
					.."checkbox[4.0,0.5;show_armor;Show 3D Armor;"..self.metadata.show_armor.."]"
					.."field[0.5,2.5;7.5.0,0.5;blacklist;Blacklist (Mob Entities);"..blacklist.."]"
					.."field[0.5,4.0;7.5.0,0.5;whitelist;Whitelist (Player Names);"..whitelist.."]"
					.."checkbox[0.5,4.5;follow_owner;Follow;"..self.metadata.follow_owner.."]"
					.."checkbox[0.5,4.5;follow_owner;Protect;"..self.attacks_monsters.."]"
					.."button[0.0,6.0;2.0,0.5;origin;Set Origin]"
					.."button_exit[7.0,6.0;1.0,0.5;;Ok]"
					.."checkbox[4.0,4.5;attack_players;Attack Players;"
						..self.metadata.attack_players.."]"
				mobs_npc:show_formspec(player_name, self.npc_name, formspec)
--

--[[
			local formspec = "size[8,4]"
			formspec = formspec .. "textlist[2.85,0;2.1,0.5;dialog;What can I do for you?]"
			formspec = formspec .. "button_exit[1,1;2,2;gfollow;follow]"
			formspec = formspec .. "button_exit[5,1;2,2;gstand;stand]"
			formspec = formspec .. "button_exit[0,2;4,4;gfandp;follow and protect]"
			formspec = formspec .. "button_exit[4,2;4,4;gsandp;stand and protect]"
			formspec = formspec .. "button_exit[1,2;2,2;ggohome; go home]"
			formspec = formspec .. "button_exit[5,2;2,2;gsethome; sethome]"
--]]

				local formspec = "size[8,7.5]"
				formspec = formspec .. "textlist[2.85,0;2.1,0.5;dialog;What can I do for you?]"
				formspec = formspec .. "button[1.0,2.0;2.0,0.5;gsethome;Set Home]"
				formspec = formspec .. "button_exit[4.0,2.0;2.0,0.5;ggohome; Go Home]"
				formspec = formspec .. "checkbox[1.0,4.5;gfollow;Follow;'false']"
				formspec = formspec .. "checkbox[3.5,4.5;gprotect;Protect;'true']"
				formspec = formspec .. "checkbox[6.0,4.5;gattack;Attack Players;'false']"
				formspec = formspec .. "button_exit[7.0,6.0;1.0,0.5;;Ok]"
			
				minetest.show_formspec(player_name, "order", formspec)
				minetest.register_on_player_receive_fields(function(clicker, formname, fields)
					if fields.gfollow then
						self.order = "follow"
					else
						self.order = "stand"
					end
					if fields.gprotect then
						self.attacks_monsters = true
					else
						self.attacks_monsters = false
					end
					if fields.gattack then
						self.order = "stand"
						self.attacks_monsters = true
					end
					if fields.gsethome then
						self.floats = self.object:getpos()
					end
					if fields.ggohome then
						if self.floats then
							self.order = "stand"
							self.object:setpos(self.floats)
						else
							print (S(""..self.name.."'s owner has not set a home."))
						end
					end
				end)
			end
		end
	end,
})

mobs:register_egg("mobs_npc:soldier_2", "Soldier_2", "technic_carbon_steel_block.png", 1)


