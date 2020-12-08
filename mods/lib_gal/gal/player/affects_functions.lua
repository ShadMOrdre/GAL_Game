function applyAffect(name,affectid)
	gal.player.whoison.updateStats(name)
	local player = minetest.get_player_by_name(name)
	local oStage = gal.player.affects._affectedPlayers[name][affectid].stage
	local stageChange = false
	minetest.log("action","Applying affect "..affectid.." stage " .. tostring(oStage) .. " on "..name)
	-- see if they need advanced into the next stage	
	if ( gal.player.affects._affectedPlayers[name][affectid].nextStage < gal.player.whoison.getTimeOnline(name) ) then
		local nextStageNum = gal.player.affects._affectedPlayers[name][affectid].stage + 1
		gal.player.affects._affectedPlayers[name][affectid].stage = nextStageNum
		gal.player.affects._affectedPlayers[name][affectid].ran = false
		minetest.log("action","Advancing "..affectid.." to the next stage for "..name)
		if ( #gal.player.affects._affects[affectid].stages < nextStageNum ) then
			minetest.log("action","Affect "..affectid.." has worn off of "..name)
			gal.player.affects.removeAffect(name,affectid)
			return
		end		
		gal.player.affects._affectedPlayers[name][affectid].nextStage = (gal.player.whoison.getTimeOnline(name) + gal.player.affects._affects[affectid].stages[nextStageNum].time)
		-- apply physics on stage changes
		stageChange = true
	end
	
	local iStage = gal.player.affects._affectedPlayers[name][affectid].stage
	local stage = gal.player.affects._affects[affectid].stages[iStage]
	local oPhysics = stage.physics

	if stageChange == true then
		if ( oPhysics ~= nil ) then		
			gal.player.physics.adjust_physics(player,oPhysics)
		end
	end	
	
	if ( stage.damage ~= nil ) then
		if ( gal.player.randomChance(stage.damage.chance) ) then			
			player:set_hp( player:get_hp() - stage.damage.amount )
		end
	end
	
	if ( stage.emote ~= nil ) then
		if ( gal.player.randomChance(stage.emote.chance) ) then			
			minetest.chat_send_all(name.." "..stage.emote.action)
		end
	end
	
	if ( stage.place ~= nil ) then
		if ( gal.player.randomChance(stage.place.chance) ) then
			minetest.place_node(player:getpos(),{name=stage.place.node, param1=0, param2=0})	
		end
	end
	
	if ( stage.custom ~= nil ) then
		if ( stage.custom.runonce == true and gal.player.affects._affectedPlayers[name][affectid].ran == true ) then			
			return
		end
		if ( gal.player.randomChance(stage.custom.chance) ) then
			gal.player.affects._affectedPlayers[name][affectid].ran = true			
			stage.custom.func(name,player,affectid)
		end
	end	
end