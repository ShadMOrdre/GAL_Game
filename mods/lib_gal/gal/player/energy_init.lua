gal.player.energy = {}

dofile(gal.player.path_mod.."/energy.lua")

gal.player.hud.register("energy", {
	hud_elem_type = "statbar",
	position = {x = 0, y = 1},
	offset = {x=10,y=-60},
	size = HUD_SB_SIZE,
	text = "hud_energy_fg.png",
	number = 20,
	alignment = {x=-1,y=-1},
	background = "hud_energy_bg.png",
	--autohide_bg = true,
	max = 20,
})

local energy_tick = 5
gal.player.register_pl_hook(gal.player.energy.update_energy,energy_tick)