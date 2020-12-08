--[[
Mana
This mod adds mana to players, a special attribute

License: WTFPL
]]

--[===[
	Initialization
]===]

local S
if (minetest.get_modpath("intllib")) then
	S = intllib.Getter()
else
	S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

gal.player.mana = {}
gal.player.mana.playerlist = {}
local first_run = false

gal.player.mana.settings = {}
gal.player.mana.settings.default_max = 200
gal.player.mana.settings.default_regen = 1
gal.player.mana.settings.regen_timer = 1


--[[
gal.player.hud.register("mana", {
	hud_elem_type = "statbar",
	position = { x = 0, y = 1 },
	text = "hud_mana_icon_fg.png",
	background = "hud_mana_icon_bg.png",
	number = 2.1,
	max = 20,
	size = { x=24, y=24 },
	offset = { x = 10, y = -150 },
})
--]]
gal.player.hud.register("mana", {
	hud_elem_type = "statbar",
	position = { x = 0, y = 1 },
	text = "hud_mana_icon_fg.png",
	background = "hud_mana_icon_bg.png",				--nil,
	number = 0,
	max = 20,
	size = { HUD_SB_SIZE },
	offset = { x = 10, y = -120 },
})


do
	local default_max = tonumber(minetest.setting_get("mana_default_max"))
	if default_max ~= nil then
		gal.player.mana.settings.default_max = default_max
	end

	local default_regen = tonumber(minetest.setting_get("mana_default_regen"))
	if default_regen ~= nil then
		gal.player.mana.settings.default_regen = default_regen
	end

	local regen_timer = tonumber(minetest.setting_get("mana_regen_timer"))
	if regen_timer ~= nil then
		gal.player.mana.settings.regen_timer = regen_timer
	end
end


--[===[
	API functions
]===]

function gal.player.mana.set(playername, value) 
	if value < 0 then
		minetest.log("info", "[mana] Warning: gal.player.mana.set was called with negative value!")
		value = 0
	end
	value = gal.player.mana.round(value)
	if value > gal.player.mana.playerlist[playername].maxmana then
		value = gal.player.mana.playerlist[playername].maxmana
	end
	if gal.player.mana.playerlist[playername].mana ~= value then
		gal.player.mana.playerlist[playername].mana = value
		--gal.player.mana.hud_update(playername)
	end
end

function gal.player.mana.setmax(playername, value)
	if value < 0 then
		value = 0
		minetest.log("info", "[mana] Warning: gal.player.mana.setmax was called with negative value!")
	end
	value = gal.player.mana.round(value)
	if gal.player.mana.playerlist[playername].maxmana ~= value then
		gal.player.mana.playerlist[playername].maxmana = value
		if(gal.player.mana.playerlist[playername].mana > value) then
			gal.player.mana.playerlist[playername].mana = value
		end
		--gal.player.mana.hud_update(playername)
	end
end

function gal.player.mana.setregen(playername, value)
	gal.player.mana.playerlist[playername].regen = value
end

function gal.player.mana.get(playername)
	return gal.player.mana.playerlist[playername].mana
end

function gal.player.mana.getmax(playername)
	return gal.player.mana.playerlist[playername].maxmana
end

function gal.player.mana.getregen(playername)
	return gal.player.mana.playerlist[playername].regen
end

function gal.player.mana.add_up_to(playername, value)
	local t = gal.player.mana.playerlist[playername]
	value = gal.player.mana.round(value)
	if(t ~= nil and value >= 0) then
		local excess
		if((t.mana + value) > t.maxmana) then
			excess = (t.mana + value) - t.maxmana
			t.mana = t.maxmana
		else
			excess = 0
			t.mana = t.mana + value
		end
		--gal.player.mana.hud_update(playername)
		return true, excess
	else
		return false
	end
end

function gal.player.mana.add(playername, value)
	local t = gal.player.mana.playerlist[playername]
	value = gal.player.mana.round(value)
	if(t ~= nil and ((t.mana + value) <= t.maxmana) and value >= 0) then
		t.mana = t.mana + value 
		--gal.player.mana.hud_update(playername)
		return true
	else
		return false
	end
end

function gal.player.mana.subtract(playername, value)
	local t = gal.player.mana.playerlist[playername]
	value = gal.player.mana.round(value)
	if(t ~= nil and t.mana >= value and value >= 0) then
		t.mana = t.mana -value 
		--gal.player.mana.hud_update(playername)
		return true
	else
		return false
	end
end

function gal.player.mana.subtract_up_to(playername, value)
	local t = gal.player.mana.playerlist[playername]
	value = gal.player.mana.round(value)
	if(t ~= nil and value >= 0) then
		local missing
		if((t.mana - value) < 0) then
			missing = math.abs(t.mana - value)
			t.mana = 0
		else
			missing = 0
			t.mana = t.mana - value
		end
		--gal.player.mana.hud_update(playername)
		return true, missing
	else
		return false
	end
end





--[===[
	File handling, loading data, saving data, setting up stuff for players.
]===]


-- Load the playerlist from a previous session, if available.
do
	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "r")
	if file then
		minetest.log("action", "[mana] mana.mt opened.")
		local string = file:read()
		io.close(file)
		if(string ~= nil) then
			local savetable = minetest.deserialize(string)
			gal.player.mana.playerlist = savetable.playerlist
			minetest.debug("[mana] mana.mt successfully read.")
		end
	end
end

function gal.player.mana.save_to_file()
	local savetable = {}
	savetable.playerlist = gal.player.mana.playerlist

	local savestring = minetest.serialize(savetable)

	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "w")
	if file then
		file:write(savestring)
		io.close(file)
		minetest.log("action", "[mana] Wrote mana data into "..filepath..".")
	else
		minetest.log("error", "[mana] Failed to write mana data into "..filepath..".")
	end
end


minetest.register_on_respawnplayer(function(player)
	local playername = player:get_player_name()
	--gal.player.mana.set(playername, 0)
	--gal.player.mana.hud_update(playername)
	gal.player.hud.change_item(player, "mana", {number = gal.player.mana.get(playername)/10})
end)


minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	if not minetest.get_modpath("hudbars") ~= nil then
		--gal.player.mana.hud_remove(playername)
	end
	gal.player.mana.save_to_file()
end)

minetest.register_on_shutdown(function()
	minetest.log("action", "[mana] Server shuts down. Rescuing data into gal.player.mana.mt")
	gal.player.mana.save_to_file()
end)
local mana_hud = nil
minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()
	
	--if gal.player.mana.playerlist[playername] == nil then
	--	gal.player.mana.playerlist[playername] = {}
	--	gal.player.mana.playerlist[playername].mana = 0
	--	gal.player.mana.playerlist[playername].maxmana = gal.player.mana.settings.default_max
	--	gal.player.mana.playerlist[playername].regen = gal.player.mana.settings.default_regen
	--	gal.player.mana.playerlist[playername].remainder = 0
	--	gal.player.mana.setmax(playername, 200)
	--end

	gal.player.hud.change_item(player, "mana", {number = gal.player.mana.get(playername)/10})

--[[
--	player:hud_add({
--			hud_elem_type = "statbar",
--			position = {x=0.992,y=0.02},
--			size = {x=247, y=34},
--			text = "hud_mana_bg.png",
--			number = 2.1,
--			alignment = {x=0,y=1},
--			offset = {x=-300, y=-10},
--			}
--		)

	    gal.player.hud.register("mana", {
	        hud_elem_type = "statbar",
	        position = { x = 0, y = 1 },
	        text = "hud_mana_icon_fg.png",
--	        background = "hud_mana_icon_bg.png",
	        number = 2.1,
--	        max = 20,
	        size = { x=24, y=24 },
	        offset = { x = 10, y = -150 },
	    })

--	mana_hud = player:hud_add({
--			hud_elem_type = "statbar",
--			position = {x=0.994,y=0.02},
--			size = {x=24, y=34},
--			text = "hud_gal.player.mana.png",
--			number = gal.player.mana.get(playername)/10,
--			alignment = {x=0,y=1},
--			offset = {x=-300, y=-10},
--			}
--		)
	    gal.player.hud.register("mana_hud", {
	        hud_elem_type = "statbar",
	        position = { x = 0, y = 1 },
	        text = "hud_mana_icon_fg.png",
--	        background = "hud_mana_icon_bg.png",
	        number = gal.player.mana.get(playername)/10,
--	        max = 20,
	        size = { x=24, y=24 },
	        offset = { x = 10, y = -120 },
	    })
--]]

end)

minetest.register_on_newplayer(function(player)
	local playername = player:get_player_name()
	
	if gal.player.mana.playerlist[playername] == nil then
		gal.player.mana.playerlist[playername] = {}
		gal.player.mana.playerlist[playername].mana = 0
		gal.player.mana.playerlist[playername].maxmana = gal.player.mana.settings.default_max
		gal.player.mana.playerlist[playername].regen = gal.player.mana.settings.default_regen
		gal.player.mana.playerlist[playername].remainder = 0
		gal.player.mana.setmax(playername, 200)
	end

	gal.player.hud.change_item(player, "mana", {number = gal.player.mana.get(playername)/10})

	first_run = true

end)



--[===[
	Mana regeneration
]===]

gal.player.mana.regen_timer = 0

--gal.player.mana.globalstep = function (dtime)
minetest.register_globalstep(function(dtime)

--[[
	--for _,player in ipairs(minetest.get_connected_players()) do

	for playerName,playerInfo in pairs(gal.player.mana.playerlist) do
		local player = minetest.get_player_by_name(playerName)

		--local playername = player:get_player_name()
		local num
		if player ~= nil then
			num = gal.player.mana.get(playername)/10
		--else
		--	num = gal.player.mana.setmax(playername, 200)/10
		end
		----gal.player.mana.setmax(playername, 200)
		--local num = gal.player.mana.get(player)/10
		--player:hud_change(mana_hud, "mana_hud", num)
		gal.player.hud.change_item(player, "mana", {number = num})
	end
--]]
	gal.player.mana.regen_timer = gal.player.mana.regen_timer + dtime
	if gal.player.mana.regen_timer >= gal.player.mana.settings.regen_timer then
		local factor = math.floor(gal.player.mana.regen_timer / gal.player.mana.settings.regen_timer)
		local players = minetest.get_connected_players()
		for i=1, #players do
			local name = players[i]:get_player_name()
			if gal.player.mana.playerlist[name] ~= nil then
				if players[i]:get_hp() > 0 then
					local plus = gal.player.mana.playerlist[name].regen * factor
					-- Compability check for version <= 1.0.2 which did not have the remainder field
					if gal.player.mana.playerlist[name].remainder ~= nil then
						plus = plus + gal.player.mana.playerlist[name].remainder
					end
					local plus_now = math.floor(plus)
					local floor = plus - plus_now
					if plus_now > 0 then
						gal.player.mana.add_up_to(name, plus_now)
					else
						gal.player.mana.subtract_up_to(name, math.abs(plus_now))
					end
					gal.player.mana.playerlist[name].remainder = floor
				end
			end
		end
		gal.player.mana.regen_timer = gal.player.mana.regen_timer % gal.player.mana.settings.regen_timer
	end
end)
--[===[
	Helper functions
]===]
gal.player.mana.round = function(x)
	return math.ceil(math.floor(x+0.5))
end
