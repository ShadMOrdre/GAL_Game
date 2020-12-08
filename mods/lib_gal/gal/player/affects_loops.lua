local function runAffects(player,name,dtime)	
	if ( gal.player.affects._affectedPlayers[name] ) ~= nil then	
		for affectid,a in pairs(gal.player.affects._affectedPlayers[name]) do
			applyAffect(name,affectid)
		end
	end
end
gal.player.register_pl_hook(runAffects,15)

local function doSave()
	gal.player.affects.saveAffects()
	minetest.after(gal.player.affects.affectTime, doSave)
end
minetest.after(gal.player.affects.affectTime, doSave)
