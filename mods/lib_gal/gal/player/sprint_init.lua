--[[
Sprint mod for Minetest by GunshipPenguin

To the extent possible under law, the author(s)
have dedicated all copyright and related and neighboring rights 
to this software to the public domain worldwide. This software is
distributed without any warranty. 
]]

sprint = {}

--Configuration variables, these are all explained in README.md
SPRINT_METHOD = 1
SPRINT_SPEED = 1.9
SPRINT_JUMP = 1.4
SPRINT_STAMINA = 5
SPRINT_TIMEOUT = 0.05 --Only used if SPRINT_METHOD = 0

--if minetest.get_modpath("hudbars") then
--	SPRINT_HUD = "hudbars"
--end
--if minetest.get_modpath("hud") then
	SPRINT_HUD = "hud"
--end

--if SPRINT_HUD == "hudbars" then
--	hb.register_hudbar("sprint", 0xFFFFFF, "Stamina",
--		{ bar = "sprint_stamina_bar.png", icon = "sprint_stamina_icon.png" },
--		SPRINT_STAMINA, SPRINT_STAMINA,
--		false, "%s: %.1f/%.1f")
--	SPRINT_HUDBARS_USED = true
--elseif SPRINT_HUD == "hud" then
    -- default positions follow [hud] defaults
    local position = { x = 0, y = 1 }
    local offset   = {x = 280, y = -90} -- between ARMOR and AIR		 x=15, y=-133
    gal.player.hud.register("sprint", {
        hud_elem_type = "statbar",
        position = position,
        text = "sprint_stamina_icon.png",
        background = "sprint_stamina_bgicon.png",
        number = 20,
        max = 20,
        size = HUD_SB_SIZE, -- by default { x=24, y=24 },
        offset = offset,
    })
	SPRINT_HUDBARS_USED = true
--else
--	SPRINT_HUDBARS_USED = false
--end

if SPRINT_METHOD == 0 then
	dofile(gal.player.path_mod .. "/sprint_wsprint.lua")
elseif SPRINT_METHOD == 1 then
	dofile(gal.player.path_mod .. "/sprint_esprint.lua")
else
	minetest.log("error", "Sprint Mod - SPRINT_METHOD is not set properly, using e to sprint")
	dofile(gal.player.path_mod .. "/sprint_esprint.lua")
end
