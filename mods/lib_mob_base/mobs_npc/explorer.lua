

function face_pos(self,pos)
	local s = self.object:getpos()
	local vec = {x=pos.x-s.x, y=pos.y-s.y, z=pos.z-s.z}
	local yaw = math.atan(vec.z/vec.x)+math.pi/2
	if self.drawtype == "side" then
		yaw = yaw+(math.pi/2)
	end
	if pos.x > s.x then
		yaw = yaw+math.pi
	end
	self.object:setyaw(yaw)
	--print("Yaw "..tostring(yaw))
	return yaw
end

mobs:register_mob("mobs_npc:explorer",{
	type = "npc",
	hp_min = 30,
	hp_max = 75,
	exp_min = 0,
	exp_max = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	textures = {
		"mobs_explorer.png",	
		"3d_armor_trans.png",
		"mapsettings.png^mobs_explorer_map_overlay.png",
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1.25,
	run_velocity = 4.5,
	damage = 6,
	drops = { },
	armor = 150,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = function (self, clicker)
		--mobs:face_pos(self,clicker:getpos())
		face_pos(self,clicker:getpos())
		--quests.treasure.tell_story(self.object:getpos())
		minetest.chat_send_all("Explorer: I once came across a stairway to the depths of hell.  Ooohh, the horrors I witnessed as I clawed my way out.  They still haunt my waking hours, but... aaahhhh, I don't remember where...")
	end,
	walk_chance = 1,
	attack_type = "dogfight",
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
	jump = false,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters=false,
	peaceful = true,
	group_attack = false,
	step=2,
	blood_amount = 35,
	blood_offset = 0.25,
	rewards = {
		{chance=90, item="gal:fruit_apple"},
		{chance=60, item="experience:6_exp"},
		{chance=50, item="potions:magic_replenish1"},
	},
})

mobs:register_egg("mobs_npc:explorer", "NPC - Explorer", "mobs_spawner.png", 1)

