

gal.player.magic = { }
local magicpath = gal.player.path_mod
gal.player.hud.register("magic", {
	hud_elem_type = "statbar",
	position = {x = 0, y = 1},
	offset = {x=280,y=-120},
	size = { HUD_SB_SIZE },
	text = "hud_magic_fg.png",
	number = 0,
	alignment = {x=-1,y=-1},
	background = "hud_magic_bg.png",
	autohide_bg = true,
	max = 20,
    })


dofile(magicpath.."/magic_api.lua")

function gal.player.magic.update_magic(player,name)
	if minetest.check_player_privs(name, {immortal=true}) then
		gal.player.data.set(name,"mana",20)
		gal.player.hud.change_item(player,"magic", {number = 20})
		return
	end
	local s = gal.player.skills.get_skill(name,SKILL_MAGIC)
	local baseAdj = 2
	local mana = gal.player.data.get_number(name,"mana")	
		if gal.player.api.get_animation(player) == "lay" then
			baseAdj = baseAdj + 3
		end
		
		if gal.player.api.get_animation(player) == "sit" then
			baseAdj = baseAdj + 1
		end
		
		local adj = baseAdj * ( s.level / 10 )
	
		mana = mana + adj
	
		if mana > 20 then
			mana = 20
		end
		if mana < 0 then
			mana = 0
		end	
	gal.player.data.set(name,"mana",mana)
	gal.player.hud.change_item(player,"magic", {number = mana})
end

-- load magic spells
dofile(magicpath.."/magic_thunder.lua")
dofile(magicpath.."/magic_magicmissle.lua")
dofile(magicpath.."/magic_heal.lua")

gal.player.register_pl_hook(gal.player.magic.update_magic,4)