gal.player.whoison = {}
gal.player.whoison.lastrun = os.time()
gal.player.whoison.lastseen = {}

local filename = minetest.get_worldpath().."/online-players"
local seenfile = minetest.get_worldpath().."/last-seen"

function gal.player.whoison.createFile(loopit)
	local file = io.open(filename, "w")
	file:write(os.time().."\n")
	file:write(minetest.get_server_status().."\n")
	for _,player in pairs(minetest.get_connected_players()) do
		
		local name = player:get_player_name()
		gal.player.whoison.updateStats(name)
		local ppos = minetest.pos_to_string(player:getpos())
		local datastring = name.."|"..ppos.."\n"
		file:write( datastring )
	end
	file:close()
	minetest.log("action","Updated online player file")
	if ( loopit == true ) then
		minetest.after(60,gal.player.whoison.createFile,true)
	end
	gal.player.whoison.lastrun = os.time()
end

function gal.player.whoison.saveLastSeen()
	local f = io.open(seenfile,"w")
	f:write(minetest.serialize(gal.player.whoison.lastseen))
	f:close()	
end

function gal.player.whoison.loadLastSeen()
	local f = io.open(seenfile,"r")
	if ( f ~= nil ) then
		local ls = f:read("*all")
		f:close()
		if ( ls ~= nil and ls ~= "" ) then
			gal.player.whoison.lastseen = minetest.deserialize(ls)
		end
	end
end

function gal.player.whoison.getLastOnline(name)
	gal.player.whoison.updateFormat(name)
	return gal.player.whoison.lastseen[name]['lastonline']
end

function gal.player.whoison.getTimeOnline(name)
	gal.player.whoison.updateFormat(name)
	return gal.player.whoison.lastseen[name]['timeonline']
end

function gal.player.whoison.updateStats(name)	
	gal.player.whoison.updateFormat(name)
	gal.player.whoison.lastseen[name]['timeonline'] = gal.player.whoison.lastseen[name]['timeonline'] + ( os.time() - gal.player.whoison.lastrun )
	gal.player.whoison.lastseen[name]['lastonline'] = os.time()
end

function gal.player.whoison.updateFormat(name)
	if ( type(gal.player.whoison.lastseen[name]) ~= "table" ) then
		-- update old data to new format
		minetest.log("action",name.." lastseen is not a table... fixing...")
		local lo = gal.player.whoison.lastseen[name]
		gal.player.whoison.lastseen[name] = {timeonline=0,lastonline=lo}
	end
end

minetest.register_on_joinplayer(function (player) 
	gal.player.whoison.createFile(false)
	gal.player.whoison.saveLastSeen()
end)

minetest.register_on_leaveplayer(function (player)
	gal.player.whoison.createFile(false)
	gal.player.whoison.saveLastSeen()
end)

minetest.register_chatcommand("seen",{
	param = "<name>",
	description = "Tells the last time a player was online",
	func = function (name, param)
		if ( param ~= nil ) then
			local t = gal.player.whoison.getLastOnline(param)
			if ( t ~= nil ) then
				local diff = (os.time() - t)
				minetest.chat_send_player(name,param.." was last online "..breakdowntime(diff).." ago")
			else
				minetest.chat_send_player(name,"Sorry, I have no record of "..param)
			end
		else
			minetest.chat_send_player(name,"Usage is /seen <name>")
		end
	end
}
)

minetest.register_chatcommand("timeonline",{
	param = "<name>",
	description = "Shows the cumulative time a player has been online",
	func = function (name, param)
		if ( param ~= nil ) then
			local t = gal.player.whoison.getTimeOnline(param)
			if ( t ~= nil ) then
				minetest.chat_send_player(name,param.." has been online for "..breakdowntime(t))
			else
				minetest.chat_send_player(name,"Sorry, I have no record of "..param)
			end
		else
			minetest.chat_send_player(name,"Usage is /timeonline <name>")
		end
	end
}
)


function breakdowntime(t)
	local eng = {"Seconds","Minutes","Hours","Days","Weeks","Months","Years"}
	local inc = {60,60,24,7,4,12,1}	
	for k,v in pairs(inc) do
		if ( t > v ) then
			t = math.floor( (t / v) )
		else
			return tostring(t).." "..eng[k]
		end	
	end
end

minetest.after(10,gal.player.whoison.createFile,true)

gal.player.whoison.loadLastSeen()