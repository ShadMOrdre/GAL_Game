function gal.player.affects.registerAffect( aDef )
	-- Here we validate some values and add it to the gal.player.affects._affects table
	minetest.log("action","Registering affect: "..aDef.name)
	
	if ( aDef.affectid == nil ) then
		return false
	end

	if ( #aDef.stages < 1 ) then
		return false
	end
	
	if aDef.removeOnDeath ~= nil then
		table.insert(gal.player.affects._removeOnDieAffects,aDef.affectid)
	end
	
	-- TODO add more checks here to ensure the affect definition won't crash the server	
	
	gal.player.affects._affects[aDef.affectid] = aDef
	
end

function gal.player.affects.removeAffect(name, affectid)
	if ( gal.player.affects._affectedPlayers[name] ~= nil ) then
		if ( affectid == nil ) then
			return false
		else
		  if gal.player.affects._affectedPlayers[name][affectid] ~= nil then
			   gal.player.affects._affectedPlayers[name][affectid] = nil;
			   if ( gal.player.affects._affects[affectid].onremove ~= nil ) then
				  local player = minetest.get_player_by_name(name)
				  --player:set_physics_override({ speed=1, jump=1,gravity=1,sneak=true })	-- reset their physics
				  gal.player.affects._affects[affectid].onremove(name,player,affectid)
			   end
			end
			return true
		end
	end
	return false
end

function gal.player.affects.affectPlayer(name, affectid)
	if ( gal.player.affects._affectedPlayers[name] == nil ) then
		gal.player.affects._affectedPlayers[name] = {}
	end
	
	if ( gal.player.affects._affectedPlayers[name][affectid] == nil ) then
		if ( gal.player.affects._affects[affectid] ~= nil ) then
			gal.player.whoison.updateStats(name)
			local ns = ( gal.player.whoison.getTimeOnline(name) + gal.player.affects._affects[affectid].stages[1].time )
			gal.player.affects._affectedPlayers[name][affectid] = { stage = 0, nextStage = 0, ran=false }
			applyAffect(name,affectid)
			return true
		else
			return false
		end
	end
end

function gal.player.affects.default_on_use(itemstack,player,pointed_thing)
	local affectid = itemstack:get_definition().affectid
	local name = player:get_player_name()
	if pointed_thing.type == "object" then
		if pointed_thing.ref:is_player() then
			-- affect the player they are pointing at
			name = pointed_thing.ref:get_player_name()
		end
	end
	
	if ( gal.player.affects.affectPlayer(name,affectid) ) then
		itemstack:take_item()
	end
	return itemstack
end

function gal.player.affects.player_died(player)
	local name = player:get_player_name()
	for _,a in pairs(gal.player.affects._removeOnDieAffects) do
		gal.player.affects.removeAffect(name,a)
	end
end
 
