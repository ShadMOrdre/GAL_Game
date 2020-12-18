STAT_DUG = 1
STAT_PLACED = 2
STAT_DIED = 3
STAT_TRAVEL = 4
STAT_PK = 5
STAT_KILLS = 6

local player_data = {}
local player_dir = minetest.get_worldpath() .. "/"

gal.player.data = {}

function gal.player.data.serialize_to_file(filename,t)
	local f = io.open(filename, "w")
	if f ~= nil then
		f:write(minetest.serialize(t))
		f:close()
	else
		minetest.log("error","Unable to open for writing "..tostring(filename))
	end
end

function gal.player.data.deserialize_from_file(filename)
	local f = io.open(filename, "r")
		if f==nil then 
			--minetest.log("error","File "..filename.." not found, returning empty table")
			return {}
		end
			local t = f:read("*all")
			f:close()
		if t=="" or t==nil then 
			--minetest.log("error","File "..filename.." is blank, returning empty table")
			return {}
		end
		return minetest.deserialize(t)
end

gal.player.data.is_online = function(name)
	if player_data[name] ~= nil then
		return true
	else	
		return false
	end
end

gal.player.data.load_player = function(name)	
	if player_data[name] == nil then	-- prevent loading the player twice... specifically when a new player joins 
		player_data[name] = gal.player.data.deserialize_from_file(player_dir..name..".data")
	end	
end

gal.player.data.unload_player = function(name)
	gal.player.data.save_player(name)
	player_data[name] = nil
end

gal.player.data.save_player = function(name)
	if player_data[name] ~= nil then
		gal.player.data.serialize_to_file(player_dir..name..".data",player_data[name])
	end
end

gal.player.data.save_all = function(again)
	--minetest.log("action","Saving player data...")
	for name,_ in pairs(player_data) do
		if player_data[name] ~= nil then
			gal.player.data.save_player(name)
		end
	end
	--if again == true then
	--	minetest.after(1200,gal.player.data.save_all,true)
	--end
end

gal.player.data.get = function(name,param)
	if gal.player.data.validate(name,param) then
		return player_data[name][param]
	else
		return nil
	end
end

gal.player.data.get_number = function(name,param)
	return tonumber(gal.player.data.get(name,param)) or 0
end

gal.player.data.set = function(name, param, value)
	if gal.player.data.validate(name,param) then
		player_data[name][param] = value
	else
		minetest.log("error","Unable to set "..tostring(param).." to "..tostring(value)) 
	end
end

gal.player.data.unset = function(name, param)
	gal.player.data.set(name,param,nil)
end

gal.player.data.increment = function (name, param, amount)
	local val = gal.player.data.get_number(name,param)  + amount
	gal.player.data.set(name,param,val)
end

gal.player.data.validate = function (name,param)
	if name ~= nil and param ~= nil then
		if player_data[name] ~= nil then
			return true
		else
			return false
		end
	else
		return false
	end
end

gal.player.data.dump = function()
	--default.tprint(player_data,4)
end

minetest.after(600,gal.player.data.save_all,true)



local function on_join(player)	
	gal.player.data.load_player(player:get_player_name())
	local name = player:get_player_name()
--	if minetest.setting_getbool("enable_damage") then
--		hunger_join_player(player)
--	end
	-- for backward compatibility if player was created before max hp was added
	if gal.player.data.get_number(name,"max_hp") == 0 then
		local l = gal.player.data.get(name,"level")
		local hp = 6 + (( math.floor(l.level / 2) ) * 2)
		if hp > 20 then
			hp = 20
		end
		gal.player.data.set(name,"max_hp",hp)
	end
end
minetest.register_on_joinplayer(on_join)

local function on_leave(player)
	local name = player:get_player_name()
	gal.player.data.unload_player(name)
end
minetest.register_on_leaveplayer(on_leave)

local function on_new(player)
--	local hud_id = player:hud_add({
--		hud_elem_type = "image",
--		position = {x = 0.5, y = 0.5},
--		scale = {
--			x = -100,
--			y = -100
--		},
--		text = "adventuretest_spawning_hud.png"
--	})

	local name = player:get_player_name()
	gal.player.data.load_player(name)
	-- set some defaults
	gal.player.data.set(name,"energy",20)
	gal.player.data.set(name,"stamina",0)
	gal.player.data.set(name,"mana",20)
	gal.player.data.set(name,"hunger_lvl",20)
	gal.player.data.set(name,"hunger_exhaus",0)
	gal.player.data.set(name,"speed",1)
	gal.player.data.set(name,"jump",1)
	gal.player.data.set(name,"gravity",1)
	gal.player.data.set(name,"level", {level=1,exp=0})
	gal.player.data.set(name,"max_health",6)
--[[
	gal.player.data.set(name,"species",1)
	gal.player.data.set(name,"class",1)
	gal.player.data.set(name,"health",1)
	gal.player.data.set(name,"hit_points",1)
	gal.player.data.set(name,"constitution",1)
	gal.player.data.set(name,"dexterity",1)
	gal.player.data.set(name,"aptitude",1)
	gal.player.data.set(name,"intelligence",1)
	gal.player.data.set(name,"charmisma",1)
	gal.player.data.set(name,"charm",1)
	gal.player.data.set(name,"experience",1)
	gal.player.data.set(name,"skill_dawnage",1)
	gal.player.data.set(name,"skill_stoneage",1)
	gal.player.data.set(name,"skill_bronzeage",1)
	gal.player.data.set(name,"skill_ironage",1)
	gal.player.data.set(name,"skill_industrialage",1)
	gal.player.data.set(name,"skill_industrialage",1)
	gal.player.data.set(name,"skill_spaceage",1)
	gal.player.data.set(name,"proficiency_pick",1)
	gal.player.data.set(name,"proficiency_shovel",1)
	gal.player.data.set(name,"proficiency_axe",1)
	gal.player.data.set(name,"proficiency_hoe",1)
	gal.player.data.set(name,"proficiency_bow",1)
	gal.player.data.set(name,"proficiency_longbow",1)
	gal.player.data.set(name,"proficiency_crossbow",1)
	gal.player.data.set(name,"proficiency_longsword",1)
	gal.player.data.set(name,"proficiency_shortsword",1)
	gal.player.data.set(name,"proficiency_daggar",1)
	gal.player.data.set(name,"proficiency_largebattleaxe",1)
	gal.player.data.set(name,"proficiency_battleaxe",1)
	gal.player.data.set(name,"proficiency_throwingaxe",1)
	gal.player.data.set(name,"proficiency_warhammer",1)
	gal.player.data.set(name,"proficiency_halberd",1)
	gal.player.data.set(name,"proficiency_mace",1)
	gal.player.data.set(name,"proficiency_pike",1)
	gal.player.data.set(name,"proficiency_sling",1)
	gal.player.data.set(name,"proficiency_slingshot",1)
	gal.player.data.set(name,"proficiency_spear",1)
	gal.player.data.set(name,"proficiency_javelin",1)
	gal.player.data.set(name,"proficiency_club",1)
	gal.player.data.set(name,"proficiency_knife",1)
	gal.player.data.set(name,"proficiency_chisel",1)
	gal.player.data.set(name,"proficiency_scissors",1)
	gal.player.data.set(name,"proficiency_lockpick",1)
	gal.player.data.set(name,"proficiency_hammer",1)
	gal.player.data.set(name,"proficiency_saw",1)
	gal.player.data.set(name,"proficiency_scythe",1)
	gal.player.data.set(name,"proficiency_repair",1)
	gal.player.data.set(name,"proficiency_construct",1)
	gal.player.data.set(name,"proficiency_recycle",1)
	gal.player.data.set(name,"proficiency_farm",1)
	gal.player.data.set(name,"proficiency_forge",1)
	gal.player.data.set(name,"proficiency_research",1)
	gal.player.data.set(name,"proficiency_explore",1)
	gal.player.data.set(name,"proficiency_mine",1)
	gal.player.data.set(name,"proficiency_brew",1)
	gal.player.data.set(name,"proficiency_cast",1)
	gal.player.data.set(name,"proficiency_summon",1)
--]]
	player:set_hp(6)
	gal.player.skills.set_default_skills(name)
	gal.player.data.save_player(name)
	gal.player.data.set(name,"spawning_hud",hud_id)
	gal.player.data.set(name,"timeofday",minetest.get_timeofday())
	gal.player.data.set(name,"currentday",0)
	--minetest.after(3,adventuretest.check_spawn,player)
end
minetest.register_on_newplayer(on_new)


local function on_shutdown()
	gal.player.data.save_all()
end
minetest.register_on_shutdown(on_shutdown)



