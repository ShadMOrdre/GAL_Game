gal.player.affects = {}

gal.player.affects.affectTime = 60			--15	-- how often, in seconds, should runAffects be called

gal.player.affects.path = gal.player.path_mod
gal.player.affects.file = gal.path_world.."/affects.txt"

gal.player.affects._affects = {}
gal.player.affects._affectedPlayers = {}
gal.player.affects._removeOnDieAffects = {}

dofile(gal.player.path_mod.."/affects_functions.lua")
dofile(gal.player.path_mod.."/affects_api.lua")
dofile(gal.player.path_mod.."/affects_loops.lua")
dofile(gal.player.path_mod.."/affects_chatcommands.lua")
dofile(gal.player.path_mod.."/affects_persistance.lua")

gal.player.affects.loadAffects()

minetest.register_privilege("affects", "Player can use the affects chat commands.")

minetest.register_on_shutdown(function()
	gal.player.affects.saveAffects()
end
)

-- TODO on join player apply physics from affects they are affected by