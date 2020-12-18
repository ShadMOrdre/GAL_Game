
-- Guard

mobs:register_mob("mobs_soldiers:archer", {
	-- animal, monster, npc
	type = "npc",
	passive = true,
	damage = 7,
	attack_type = "shoot",
	shoot_interval = 1,
	arrow = "mobs_soldiers:arrow",
	shoot_offset = 2,
	attacks_monsters = true,
	owner = "",
	order = "stand",
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	--mesh = "guard.x",
	mesh = "archer.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc.png", "npcf_skin_armor.png", "bows_bow_triple_steel.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 1,
	run_velocity = 3,
	floats = {x=0,y=0,z=0},
	jump = true,
	stepheight = 1.1,
	-- drops wood and chance of apples when dead
	drops = {
		{name = "gal:tree_default_wood",
		chance = 1, min = 1, max = 3},
		{name = "gal:fruit_apple",
		chance = 2, min = 1, max = 2},
		{name = "lib_handtools:tool_axe_stone",
		chance = 3, min = 1, max = 1},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,

	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	view_range = 30,
	-- model animation
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	-- rotate arrows
	do_custom = function(self)
		local s = self.object:getpos()
		local obj = nil
		for _,oir in ipairs(minetest.get_objects_inside_radius(s, self.view_range)) do
			obj = oir:get_luaentity()
			if obj then
				if obj.name == "mobs_soldiers:arrow" then
					obj.object:setyaw(self.object:getyaw()-1.57)
					break
				end
			end
		end
	end,
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
				formspec = formspec .. "button_exit[1,1;2,2;afollow;follow]"
				formspec = formspec .. "button_exit[5,1;2,2;astand;stand]"
				formspec = formspec .. "button_exit[0,2;4,4;afandp;follow and protect]"
				formspec = formspec .. "button_exit[4,2;4,4;asandp;stand and protect]"
				formspec = formspec .. "button_exit[1,2;2,2;agohome; go home]"
				formspec = formspec .. "button_exit[5,2;2,2;asethome; sethome]"
				minetest.show_formspec(clicker:get_player_name(), "order", formspec)
				minetest.register_on_player_receive_fields(function(clicker, formname, fields)
					if fields.afollow then
						self.order = "follow"
						self.attacks_monsters = false
					end
					if fields.astand then
						self.order = "stand"
						self.attacks_monsters = false
					end
					if fields.afandp then
						self.order = "follow"
						self.attacks_monsters = true
					end
					if fields.asandp then
						self.order = "stand"
						self.attacks_monsters = true
					end
					if fields.asethome then
						self.floats = self.object:getpos()
					end
					if fields.agohome then
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

mobs:register_egg("mobs_soldiers:archer", "Archer", "default_tree.png", 1)

--[[
mobs:register_mob("mobs_soldiers:archer2", {
	-- animal, monster, npc
	type = "npc",
	passive = true,
	damage = 7,
	attack_type = "shoot",
	shoot_interval = 1,
	arrow = "mobs_soldiers:arrow",
	shoot_offset = 2,
	attacks_monsters = true,
	owner = "",
	order = "follow",
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "skeleton.b3d",
	    rotate = -180,
	drawtype = "front",
	textures = {
		{"mobs_npc.png", "npcf_skin_armor.png", "pmobs_bow.png"},
	},
	visual_size = {x=3, y=3},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 4,
	run_velocity = 4,
	floats = {x=0,y=0,z=0},
	jump = true,
	stepheight = 1.1,
	-- drops wood and chance of apples when dead
	drops = {
		{name = "default:wood",
		chance = 1, min = 1, max = 3},
		{name = "default:apple",
		chance = 2, min = 1, max = 2},
		{name = "default:axe_stone",
		chance = 3, min = 1, max = 1},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,

	view_range = 15,
	-- model animation
	animation = {
		stand_start = 0,
		stand_end = 40,
        speed_stand = 5,
		walk_start = 40,
		walk_end = 60,
        speed_walk = 50,
        shoot_start = 70,
        shoot_end = 90,
        punch_start = 70,
        punch_end = 90,
        die_start = 120,
        die_end = 130,
        speed_die = 5,
        hurt_start = 100,
		hurt_end = 120,
	},
	-- rotate arrows
	do_custom = function(self)
		local s = self.object:getpos()
		local obj = nil
		for _,oir in ipairs(minetest.get_objects_inside_radius(s, self.view_range)) do
			obj = oir:get_luaentity()
			if obj then
				if obj.name == "mobs_soldiers:arrow" then
					obj.object:setyaw(self.object:getyaw()-1.57)
					break
				end
			end
		end
	end,
	-- right clicking with cooked meat will give npc more health
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:bread" then
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
				formspec = formspec .. "button_exit[1,1;2,2;afollow;follow]"
				formspec = formspec .. "button_exit[5,1;2,2;astand;stand]"
				formspec = formspec .. "button_exit[0,2;4,4;afandp;follow and protect]"
				formspec = formspec .. "button_exit[4,2;4,4;asandp;stand and protect]"
				formspec = formspec .. "button_exit[1,2;2,2;agohome; go home]"
				formspec = formspec .. "button_exit[5,2;2,2;asethome; sethome]"
				minetest.show_formspec(clicker:get_player_name(), "order", formspec)
				minetest.register_on_player_receive_fields(function(clicker, formname, fields)
					if fields.afollow then
						self.order = "follow"
						self.attacks_monsters = false
					end
					if fields.astand then
						self.order = "stand"
						self.attacks_monsters = false
					end
					if fields.afandp then
						self.order = "follow"
						self.attacks_monsters = true
					end
					if fields.asandp then
						self.order = "stand"
						self.attacks_monsters = true
					end
					if fields.asethome then
						self.floats = self.object:getpos()
					end
					if fields.agohome then
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

mobs:register_egg("mobs_soldiers:archer2", "Archer2", "default_tree.png", 1)
--]]



mobs:register_arrow("mobs_soldiers:arrow", {
	physical = false,
	timer=0,
	view_range = 15,
	visual = "wielditem",
	visual_size = {x=0.1, y=0.1},
	textures = {"mobs_soldiers:arrow_box"},
	lastpos={},
	collisionbox = {0,0,0,0,0,0},
	velocity = 6,
	drop = true,

	hit_player = function(self, player)
	end,
	
	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=3},
		}, 0)
	end,
	
	hit_node = function(self, pos, node)
	end,
})




