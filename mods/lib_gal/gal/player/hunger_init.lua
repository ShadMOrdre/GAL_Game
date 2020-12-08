
gal.player.hunger = {}
gal.player.hunger.players = {}
gal.player.hunger.food = {}

HUNGER_TICK = 600 -- time in seconds after that 1 hunger point is taken
HUNGER_HEALTH_TICK = 4 -- time in seconds after player gets healed/damaged
HUNGER_MOVE_TICK = 0.5 -- time in seconds after the movement is checked

HUNGER_EXHAUST_DIG = 3 -- exhaustion increased this value after digged node
HUNGER_EXHAUST_PLACE = 1 -- exhaustion increased this value after placed
HUNGER_EXHAUST_MOVE = 1.5 -- exhaustion increased this value if player movement detected
HUNGER_EXHAUST_LVL = 160 -- at what exhaustion player saturation gets lowered

HUNGER_HEAL = 1 -- number of HP player gets healed after HUNGER_HEALTH_TICK
HUNGER_HEAL_LVL = 15 -- lower level of saturation needed to get healed
HUNGER_STARVE = 1 -- number of HP player gets damaged by hunger after HUNGER_HEALTH_TICK
HUNGER_STARVE_LVL = 3 -- level of staturation that causes starving

HUNGER_MAX = 30 -- maximum level of saturation

SPRINT_SPEED = 0.8 -- how much faster player can run if satiated
SPRINT_JUMP = 0.1 -- how much higher player can jump if satiated
SPRINT_DRAIN = 0.35 -- how fast to drain satation while sprinting (0-1)

local modpath = gal.player.path_mod
dofile(modpath .. "/hunger_functions.lua")
--dofile(modpath .. "/hunger_food.lua")

-- legacy functions
gal.player.hud.item_eat = gal.player.hunger.item_eat
gal.player.hud.set_hunger = gal.player.hunger.save
gal.player.hud.get_hunger = gal.player.hunger.load
gal.player.hud.save_hunger = gal.player.hunger.save
gal.player.hud.load_hunger = gal.player.hunger.load

-- Callbacks
if minetest.setting_getbool("enable_damage") then

	minetest.register_on_joinplayer(function(player)
		local inv = player:get_inventory()
		inv:set_size("hunger", 1)

		local name = player:get_player_name()
		gal.player.hunger.players[name] = {}
		gal.player.hunger.players[name].lvl = gal.player.hunger.read(player)
		gal.player.hunger.players[name].exhaus = 0
		local lvl = gal.player.hunger.players[name].lvl
		if lvl > 20 then
			lvl = 20
		end
		minetest.after(0.8, function()
			--gal.player.hud.swap_statbar(player, "hunger", "air")
			gal.player.hud.change_item(player, "hunger", {number = lvl, max = 20})
		end)
	end)

	minetest.register_on_leaveplayer(function(player)
		local name = player:get_player_name()
		gal.player.hunger.players[name] = nil
	end)

	-- for exhaustion
	minetest.register_on_placenode(gal.player.hunger.handle_node_actions)
	minetest.register_on_dignode(gal.player.hunger.handle_node_actions)
	minetest.register_on_respawnplayer(function(player)
		gal.player.hunger.update_hunger(player, 20)
	end)
end
