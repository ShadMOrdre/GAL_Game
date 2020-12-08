
gal.player.cmsg = {}
gal.player.cmsg.hudids = {}
gal.player.cmsg.messages = {}
gal.player.cmsg.settings = {}
gal.player.cmsg.next_msgids = {}

gal.player.cmsg.settings.max_messages = 7
--local setting = minetest.setting_get("central_message_max")
--if type(tonumber(setting)) == "number" then
--	gal.player.cmsg.settings.max_messages = tonumber(setting)
--elseif setting == "inf" then
--	gal.player.cmsg.settings.max_messages = nil
--end

gal.player.cmsg.settings.color = 0xFFFFFF
setting = minetest.setting_get("central_message_color")
if type(tonumber(setting)) == "number" then
	gal.player.cmsg.settings.color = tonumber(setting)
end

local function update_display(player, pname)
	local messages = {}
	local start, stop
	stop = #gal.player.cmsg.messages[pname]
	if gal.player.cmsg.settings.max_messages ~= nil then
		local max = math.min(gal.player.cmsg.settings.max_messages, #gal.player.cmsg.messages[pname])
		if #gal.player.cmsg.messages[pname] > gal.player.cmsg.settings.max_messages then
			start = stop - max
		else
			start = 1
		end
	else
		start = 1
	end
	for i=start, stop do
		table.insert(messages, gal.player.cmsg.messages[pname][i].text)
	end
	local concat = table.concat(messages, "\n")
	player:hud_change(gal.player.cmsg.hudids[pname], "text", concat)
end

gal.player.cmsg.push_message_player = function(player, text)
	local function push(tbl)
		-- Horrible Workaround code starts here
		if not (gal.player.cmsg.last_push < gal.player.cmsg.steps) then
			minetest.after(0, push, tbl)
			return
		end

		local player = tbl.player
		local text = tbl.text
		-- Horrible Workaround code ends here

		local pname = player:get_player_name()
		if gal.player.cmsg.hudids[pname] == nil then
			gal.player.cmsg.hudids[pname] = player:hud_add({
				hud_elem_type = "text",
				text = text,
				number = gal.player.cmsg.settings.color,
				position = {x=0.5, y=0.5},
				offset = {x=-0,y=-256},
				direction = 3,
				alignment = {x=0,y=1},
				scale = {x=800,y=20*gal.player.cmsg.settings.max_messages},
			})
			gal.player.cmsg.messages[pname] = {}
			gal.player.cmsg.next_msgids[pname] = 0
			table.insert(gal.player.cmsg.messages[pname], {text=text, msgid=gal.player.cmsg.next_msgids[pname]})
		else
			gal.player.cmsg.next_msgids[pname] = gal.player.cmsg.next_msgids[pname] + 1
			table.insert(gal.player.cmsg.messages[pname], {text=text, msgid=gal.player.cmsg.next_msgids[pname]})
			update_display(player, pname)
		end

		minetest.after(5, function(param)
			local pname = param.player:get_player_name()
			if pname ~= "" then
				for i=1, #gal.player.cmsg.messages[pname] do
					if param.msgid == gal.player.cmsg.messages[pname][i].msgid then
						table.remove(gal.player.cmsg.messages[pname], i)
						break
					end
				end
				update_display(player, pname)
			end
		end,{player=player, msgid=gal.player.cmsg.next_msgids[pname]})
	
		-- Update timer for Horrible Workaround
		gal.player.cmsg.last_push = gal.player.cmsg.steps
	end

	if gal.player.cmsg.last_push < gal.player.cmsg.steps then
		push({player=player, text=text})
	else
		minetest.after(0, push, {player=player, text=text})
	end
end

gal.player.cmsg.push_message_all = function(text)
	local players = minetest.get_connected_players()
	for i=1,#players do
		gal.player.cmsg.push_message_player(players[i], text)
	end
end

minetest.register_on_leaveplayer(function(player)
	gal.player.cmsg.hudids[player:get_player_name()] = nil
end)

-- Horrible Workaround code starts here
gal.player.cmsg.steps = 0
gal.player.cmsg.last_push = -1
minetest.register_globalstep(function(dtime)
	gal.player.cmsg.steps = gal.player.cmsg.steps + 1
end)
-- Horrible Workaround code ends here
