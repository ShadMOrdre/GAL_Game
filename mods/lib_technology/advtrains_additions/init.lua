local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("newlocomotive", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	--update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
	--		self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	--end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine", "advtrains_newlocomotive_inv.png")
advtrains.register_wagon("wagon_default", {
	mesh="advtrains_passenger_wagon.b3d",
	textures = {"advtrains_wagon.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name="1",
			attach_offset={x=-4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="2",
			attach_offset={x=4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=3.1,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, "Passenger Wagon", "advtrains_wagon_inv.png")
advtrains.register_wagon("wagon_box", {
	mesh="advtrains_wagon.b3d",
	textures = {"advtrains_wagon_box.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=1.8,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
	has_inventory = true,
	get_inventory_formspec = function(self)
		return "size[8,11]"..
			"list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;8,6;]"..
			"list[current_player;main;0,7;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*6,
	},
}, "Box Wagon", "advtrains_wagon_box_inv.png")

minetest.register_craft({
	output = 'advtrains:newlocomotive',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:black', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:wagon_default',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:dark_green', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:wagon_box',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'default:chest', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})



advtrains.register_wagon("steam_engine_black", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_black.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Black", "advtrains_newlocomotive_black_inv.png")
advtrains.register_wagon("steam_engine_ltblue", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_ltblue.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Lt Blue", "advtrains_newlocomotive_ltblue_inv.png")
advtrains.register_wagon("steam_engine_blue", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_blue.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Blue", "advtrains_newlocomotive_blue_inv.png")
advtrains.register_wagon("steam_engine_green", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_green.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Green", "advtrains_newlocomotive_green_inv.png")
advtrains.register_wagon("steam_engine_red", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_red.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "SmokePuff_02b_HD.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Red", "advtrains_newlocomotive_red_inv.png")
advtrains.register_wagon("steam_engine_pink", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_pink.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "SmokePuff_02b_HD.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Pink", "advtrains_newlocomotive_pink_inv.png")
advtrains.register_wagon("steam_engine_purple", {
	mesh="advtrains_engine_steam.b3d",
	textures = {"advtrains_newlocomotive_purple.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=1.85,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
--[[
	update_animation=function(self, velocity)
		--if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=60}, 100)--math.floor(velocity))
			--self.old_anim_velocity=advtrains.abs_ceil(velocity)
		--end
	end,
]]
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2, z=1.2},
			maxpos = {x=0, y=2, z=1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "SmokePuff_02b_HD.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
}, "Steam Engine Purple", "advtrains_newlocomotive_purple_inv.png")


advtrains.register_wagon("steam_engine_green_detailed", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_engine_steam_green_detailed.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_steam_whistle",
}, "Green Steam Engine Detailed", "advtrains_engine_steam_detailed_inv.png")
advtrains.register_wagon("steam_engine_ltblue_detailed", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_engine_steam_ltblue_detailed.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_steam_whistle",
}, "Lt Blue Steam Engine Detailed", "advtrains_engine_steam_detailed_inv.png")
advtrains.register_wagon("steam_engine_ltblue2_detailed", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_engine_steam_ltblue_v2_detailed.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_steam_whistle",
}, "Lt Blue 2 Steam Engine Detailed", "advtrains_engine_steam_detailed_inv.png")
advtrains.register_wagon("steam_engine_red_detailed", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_engine_steam_red_detailed.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_steam_whistle",
}, "Red Steam Engine Detailed", "advtrains_engine_steam_detailed_inv.png")
advtrains.register_wagon("steam_engine_gold_detailed", {
	mesh="advtrains_detailed_steam_engine.b3d",
	textures = {"advtrains_engine_steam_gold_detailed.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=4,
	seats = {
		{
			name="Driver Stand (left)",
			attach_offset={x=-5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
		{
			name="Driver Stand (right)",
			attach_offset={x=5, y=10, z=-10},
			view_offset={x=0, y=6, z=0},
			driving_ctrl_access=true,
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=2.05,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.3, z=1.45},
			maxpos = {x=0, y=2.3, z=1.4},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 5,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_steam_whistle",
}, "Gold Steam Engine Detailed", "advtrains_engine_steam_detailed_inv.png")


advtrains.register_wagon("steam_car_box", {
	mesh="advtrains_wagon.b3d",
	textures = {"advtrains_steam_car_box.png"},
	drives_on={default=true},
	max_speed=4,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=1.8,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
	has_inventory = true,
	get_inventory_formspec = function(self)
		return "size[8,11]"..
			"list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;8,6;]"..
			"list[current_player;main;0,7;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*6,
	},
}, "Steam Box Car", "advtrains_wagon_box_inv.png")
advtrains.register_wagon("steam_car_coach", {
	mesh="advtrains_wagon.b3d",
	textures = {"advtrains_steam_car_coach.png"},
	drives_on={default=true},
	max_speed=4,
--[[	seats = {
		{
			name="Default Seat",
			attach_offset={x=0, y=10, z=0},
			view_offset={x=0, y=6, z=0},
		},
	},
]]
	seats = {
		{
			name="1",
			attach_offset={x=-4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="2",
			attach_offset={x=4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
	},
	visual_size = {x=1, y=1},
	--wagon_span=1.8,
	wagon_span=3.1,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, "Steam Passenger Coach", "advtrains_wagon_inv.png")
advtrains.register_wagon("steam_car_log", {
	mesh="advtrains_wagon_wood.b3d",
	textures = {"advtrains_steam_car_wood_green.png"},
	drives_on={default=true},
	max_speed=4,
	seats = {},
	--visual_size = {x=1, y=1},
	visual_size = {x=0.85, y=0.85},
	wagon_span=1.8,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
	has_inventory = true,
	get_inventory_formspec = function(self)
		return "size[8,11]"..
			"list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;8,6;]"..
			"list[current_player;main;0,7;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*6,
	},
}, "Steam Log Car", "advtrains_wagon_wood_green_inv.png")
advtrains.register_wagon("steam_car_tank", {
	mesh="advtrains_wagon_tank.b3d",
	textures = {"advtrains_steam_car_tank_yellow.png"},
	drives_on={default=true},
	max_speed=4,
	seats = {},
	--visual_size = {x=1, y=1},
	visual_size = {x=0.85, y=0.85},
	wagon_span=1.8,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
	has_inventory = true,
	get_inventory_formspec = function(self)
		return "size[8,11]"..
			"list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;8,6;]"..
			"list[current_player;main;0,7;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*6,
	},
}, "Steam Tank Car", "advtrains_wagon_tank_yellow_inv.png")

advtrains.register_wagon("steam_car_pullman", {
	mesh="advtrains_pullman_wagon.b3d",
	drives_on={default=true},
	max_speed=4,
	textures = {"advtrains_steam_pullman_car.png"},
	seats = {
		{
			name="1",
			attach_offset={x=-4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="2",
			attach_offset={x=4, y=8, z=8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
		},
	},
	visual_size = {x=1, y=1},
	wagon_span=3.1,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, "Steam Pullman Coach", "advtrains_wagon_inv.png")



minetest.register_craft({
	output = 'advtrains:steam_engine_black',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:black', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_ltblue',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:cyan', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_blue',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:blue', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_green',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:green', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_red',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:red', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_pink',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:pink', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_engine_purple',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'dye:violet', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})


minetest.register_craft({
	output = 'advtrains:steam_car_box',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'default:chest_locked', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_car_coach',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'default:book', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_car_log',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'group:tree', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})
minetest.register_craft({
	output = 'advtrains:steam_car_tank',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'group:liquid', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})

minetest.register_craft({
	output = 'advtrains:steam_car_pullman',
	recipe = {
		{'default:steelblock', 'default:book', 'default:steelblock'},
		{'default:steelblock', 'default:book', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	},
})




