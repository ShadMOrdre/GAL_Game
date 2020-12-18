gal.player.xp = {}
gal.player.xp.lvl = 20
gal.player.xp.player_xp = {}
gal.player.xp.player_levels = {}
gal.player.xp.xp_hud = {}
gal.player.xp.level_hud = {}

gal.player.xp.xp_file = minetest.get_worldpath() .. "/xp"
gal.player.xp.lvl_file = minetest.get_worldpath() .. "/levels"

gal.player.xp.custom_level_system = false

gal.player.hud.register("xp", {
	hud_elem_type = "statbar",
	position = { x = 1, y = 1 },
	text = "xp_xp.png",
	background = nil,
	number = 20,
	max = 20,
	size = { HUD_SB_SIZE },
	offset = { x = -250, y = -30 },
})
gal.player.hud.register("level", {
	hud_elem_type = "text",
	position = { x = 1, y = 1 },
	text = "1",
	background = "xp_xp.png",
	number = 0xFFFFFF,
--	max = 20,
	alignment = {x=0.5,y=1},
--	size = { x=24, y=24 },
	offset = { x = -250, y = -60 },
})


function gal.player.xp.set_level_hud_text(player, str)
	--player:hud_change(gal.player.xp.level_hud[player:get_player_name()], "text", str)
	gal.player.hud.change_item(player, "level", {text = str})
end

function gal.player.xp.get_xp(lvl, x)
	return (gal.player.xp.lvl * lvl) / x
end

function gal.player.xp.add_xp(player, num)
	if gal.player.xp.player_xp[player:get_player_name()] then
		gal.player.xp.player_xp[player:get_player_name()] = gal.player.xp.player_xp[player:get_player_name()] + num
	else
		gal.player.xp.player_xp[player:get_player_name()] = num
		if not gal.player.xp.player_levels[player:get_player_name()] then
			gal.player.xp.player_levels[player:get_player_name()] = 1
		end
	end

	if num > 0 then
		gal.player.cmsg.push_message_player(player, "[xp] +"..tostring(num))
	end

	if gal.player.xp.player_levels[player:get_player_name()] then
		if gal.player.xp.player_xp[player:get_player_name()] > gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()] then
			gal.player.xp.player_xp[player:get_player_name()] = gal.player.xp.player_xp[player:get_player_name()] - gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]
			gal.player.xp.add_lvl(player)
		end
	else
		gal.player.xp.player_levels[player:get_player_name()] = 1
	end
	print("[info] xp for player ".. player:get_player_name() .. " " .. gal.player.xp.player_xp[player:get_player_name()].."/"..gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()].." = " .. (gal.player.xp.player_xp[player:get_player_name()])/(gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]))

	minetest.log("[MOD] xp:  " .. player:get_player_name() .. " " .. gal.player.xp.player_xp[player:get_player_name()].."/"..gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()].." = " .. (gal.player.xp.player_xp[player:get_player_name()])/(gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]))

	--player:hud_change(gal.player.xp.xp_hud[player:get_player_name()], "number", 20*((gal.player.xp.player_xp[player:get_player_name()])/(gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()])))
	--hud.change_item(gal.player.xp.xp_hud[player:get_player_name()], "xp", {number = 20*( (gal.player.xp.player_xp[player:get_player_name()]) / (gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]) ) })
	gal.player.hud.change_item(player, "xp", {number = 20*( (gal.player.xp.player_xp[player:get_player_name()]) / (gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]) ) })

	gal.player.xp.save_xp()
	gal.player.xp.save_levels()
end

function gal.player.xp.add_lvl(player)
	if gal.player.xp.player_levels[player:get_player_name()] then
		gal.player.xp.player_levels[player:get_player_name()] = gal.player.xp.player_levels[player:get_player_name()] + 1
	else
		gal.player.xp.player_levels[player:get_player_name()] = 1
	end
	gal.player.xp.save_levels()
	if not(gal.player.xp.custom_level_system) then
		--player:hud_change(gal.player.xp.level_hud[player:get_player_name()], "text", gal.player.xp.player_levels[player:get_player_name()])
		--hud.change_item(gal.player.xp.level_hud[player:get_player_name()], "level", {text = gal.player.xp.player_levels[player:get_player_name()]})
		gal.player.hud.change_item(player, "level", {text = gal.player.xp.player_levels[player:get_player_name()]})
	end
	gal.player.cmsg.push_message_player(player, "Level up! You are now Level " .. tostring(gal.player.xp.player_levels[player:get_player_name()]))
end

minetest.register_on_joinplayer(function(player)
	if not player then
		return
	end
	if not gal.player.xp.player_xp[player:get_player_name()] and not gal.player.xp.player_levels[player:get_player_name()] then
		gal.player.xp.player_xp[player:get_player_name()] = 0
		gal.player.xp.player_levels[player:get_player_name()] = 1
	end

	gal.player.hud.change_item(player, "xp", {number = 20*( (gal.player.xp.player_xp[player:get_player_name()]) / (gal.player.xp.lvl*gal.player.xp.player_levels[player:get_player_name()]) ) })
	gal.player.hud.change_item(player, "level", {text = gal.player.xp.player_levels[player:get_player_name()]})


end)

function gal.player.xp.load_xp()
	local input = io.open(gal.player.xp.xp_file, "r")
	if input then
		local str = input:read()
		if str then
			for k, v in str.gmatch(str,"(%w+)=(%w+)") do
    			gal.player.xp.player_xp[k] = tonumber(v)
			end
		end
		io.close(input)
	end
end

function gal.player.xp.save_xp()
	if gal.player.xp.player_xp then
		local output = io.open(gal.player.xp.xp_file, "w")
		local str = ""
		for k, v in pairs(gal.player.xp.player_xp) do
			str = str .. k .. "=" .. v .. ","
		end
		str = str:sub(1, #str - 1)
		output:write(str)
		io.close(output)
	end
end

function gal.player.xp.load_levels()
	local input = io.open(gal.player.xp.lvl_file, "r")
	if input then
		local str = input:read()
		if str then
			for k, v in str.gmatch(str,"(%w+)=(%w+)") do
    				gal.player.xp.player_levels[k] = tonumber(v)
			end
		end
		io.close(input)
	end
end

function gal.player.xp.save_levels()
	if gal.player.xp.player_xp then
		local output = io.open(gal.player.xp.lvl_file, "w")
		local str = ""
		for k, v in pairs(gal.player.xp.player_levels) do
			str = str .. k .. "=" .. v .. ","
		end
		str = str:sub(1, #str - 1)
		output:write(str)
		io.close(output)
	end
end

function gal.player.xp.explorer_xp()
	minetest.register_on_generated(function(minp, maxp, blockseed)
		local center={x=minp.x+math.abs(minp.x-maxp.x),y=minp.y+math.abs(minp.y-maxp.y),z=minp.z+math.abs(minp.z-maxp.z)}
		local nearest=nil
		for i,v in pairs(minetest.get_connected_players()) do
			local pos =v:getpos()
			local dist=vector.distance(center, pos)
			if nearest==nil then			
				nearest={name=v,dist=dist}
			elseif dist  < nearest.dist then  
				nearest.dist = dist
				nearest.name=v			
			end
		end
		if nearest ~= nil then
			gal.player.xp.add_xp(nearest.name, 0.1)
		end
	end) 
end

function gal.player.xp.crafter_xp()
	minetest.register_on_craft(function(itemstack, player)
--		local craft_xp = itemstack:get_definition().craft_xp
--		if craft_xp then
--			gal.player.xp.add_xp(player, craft_xp)
			gal.player.xp.add_xp(player, 1)
--		end
	end)
end

function gal.player.xp.miner_xp()
	minetest.register_on_dignode(function(pos, oldnode, digger)

--		local miner_xp = minetest.registered_nodes[oldnode.name].miner_xp
		local node_xp = 0
		if string.find(oldnode.name, "stone_") then
			node_xp = 2
		elseif string.find(oldnode.name, "ore_") then
			node_xp = 4
		elseif string.find(oldnode.name, "lava") then
			node_xp = -1
		else
			node_xp = 1
		end
		local player = digger:get_player_name()
		local player_lvls = gal.player.proficiencies.lvls[player]
--		if not miner_xp then
--		elseif miner_gal.player.xp.rm then
--			if player_lvls then
--				gal.player.xp.add_xp(digger, (player_lvls["miner"]-1))
--			end
--		elseif miner_gal.player.xp.lvls then
			if player_lvls and player_lvls["miner"] > 5 then
--				gal.player.xp.add_xp(digger,gal.player.xp.get_xp(gal.player.xp.player_levels[player], 14))
				gal.player.xp.add_xp(digger,gal.player.xp.get_xp(gal.player.xp.player_levels[player], node_xp))
			end
--		elseif miner_gal.player.xp.rnd then
--			if math.random(miner_gal.player.xp.rnd) == miner_gal.player.xp.rnd then
--				gal.player.xp.add_xp(digger, miner_gal.player.xp.xp)	
--			end
--		elseif miner_gal.player.xp.xp then 
--			gal.player.xp.add_xp(digger, miner_gal.player.xp.xp)
			gal.player.xp.add_xp(digger, node_xp)
--		end
	end)
end

function gal.player.xp.builder_xp()
	minetest.register_on_placenode(function(pos, newnode, placer)
--		local builder_xp = minetest.registered_nodes[newnode.name].builder_xp
--		if builder_xp then
--			gal.player.xp.add_xp(placer, builder_xp)
			gal.player.xp.add_xp(placer, 1)
--		end
	end)
end

gal.player.xp.miner_xp()
gal.player.xp.crafter_xp()
gal.player.xp.explorer_xp()
gal.player.xp.builder_xp()

gal.player.xp.load_xp()
gal.player.xp.load_levels()
