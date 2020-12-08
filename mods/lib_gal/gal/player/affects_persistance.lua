function gal.player.affects.saveAffects()
	minetest.log("action","Saving player affects")
	local f = io.open(gal.player.affects.file,"w")
	f:write(minetest.serialize(gal.player.affects._affectedPlayers))
	f:close()	
end

function gal.player.affects.loadAffects()
	minetest.log("action","Loading player affects")
	local f = io.open(gal.player.affects.file,"r")
	if ( f ~= nil ) then
		local af = f:read("*all")
		f:close()
		if ( af ~= nil and af ~= "" ) then
			gal.player.affects._affectedPlayers = minetest.deserialize(af)
		end
	end
end
 
