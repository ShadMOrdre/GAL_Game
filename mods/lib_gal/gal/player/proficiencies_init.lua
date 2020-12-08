gal.player.proficiencies = {}
gal.player.proficiencies.all_skills = {}
gal.player.proficiencies.selected = {}
gal.player.proficiencies.lvls = {}
gal.player.proficiencies.skills_file = minetest.get_worldpath() .. "/proficiencies"
local S = gal.intllib


gal.player.hud.register("proficiencies", {
	hud_elem_type = "statbar",
	position = { x = 1, y = 1 },
	text = "skills_abilities_energy.png",
	background = nil,
	number = 20,
	max = 20,
	size = { HUD_SB_SIZE },
	offset = { x = -250, y = -90 },
})


minetest.register_on_newplayer(function(player)

	local playername = player:get_player_name()
	
	gal.player.proficiencies.lvls[playername] = {}
	for s,a in pairs(gal.player.proficiencies.all_skills) do
		if s == "miner" then
			gal.player.proficiencies.lvls[player:get_player_name()][s] = 2
		else
			gal.player.proficiencies.lvls[player:get_player_name()][s] = 1
		end
	end
	gal.player.proficiencies.save_skills()
end)

function gal.player.proficiencies.get_dmg(lvl)
	return lvl+2
end

function gal.player.proficiencies.get_text(name)
	local str = ""
	for s,l in pairs(gal.player.proficiencies.lvls[name]) do
		str = str .. s .. " : " .. l .. "  "
	end
	return str
end

function gal.player.proficiencies.level_up(name, text)
	if not(gal.player.proficiencies.lvls[name][text]) then
		return false
	end

	local count = 0
	for s,l in pairs(gal.player.proficiencies.lvls[name]) do
		count = count + (l-1)
	end
	if gal.player.xp.player_levels[name] > count then
		gal.player.proficiencies.lvls[name][text] = gal.player.proficiencies.lvls[name][text] + 1
		gal.player.proficiencies.save_skills()
		gal.player.cmsg.push_message_player(minetest.get_player_by_name(name), "[proficiencies] " .. gal.player.proficiencies.get_text(name))
		return true
	else
		return false
	end
end

function gal.player.proficiencies.register_weapon(name, fromLevel, levels, def)
	if not def.damage then
		if def.damage_m and def.damage_d then
			def.damage = math.floor(gal.player.proficiencies.get_dmg(fromLevel)*def.damage_m-def.damage_d)
		end
	end

	for i = fromLevel, levels, 1 do
		minetest.register_tool("gal:"..name .. "_lvl_" .. tostring(i), {
			description = def.description.."\n Level: ".. tostring(i).. "\n Damage: " .. tostring(def.damage+ i-fromLevel) .." \n Skill: " .. def.skill,
			inventory_image = def.inventory_image,
			wield_scale = def.wield_scale,
			tool_capabilities = {
				max_drop_level=3,
				damage_groups = {fleshy=def.damage+ i-fromLevel},
			},
			skill = def.skill,
    			on_use = function(itemstack, user, pointed_thing)
				if user == nil then return end
				if pointed_thing.type == "object" then
					if gal.player.proficiencies.lvls[user:get_player_name()] and gal.player.proficiencies.lvls[user:get_player_name()][def.skill] > i-1 then
						pointed_thing.ref:punch(user, 10,minetest.registered_tools[itemstack:get_name()].tool_capabilities)
						itemstack:add_wear(300)
						print("[info]" .. user:get_player_name() .. " is fighting!")
					else
						gal.player.cmsg.push_message_player(user, "[info] You have to be " .. def.skill .. " level "..tostring(i).. " to use this weapon!")
					end
					return itemstack
				end
			end
		})

		minetest.register_craft({
			output = "gal:"..name .. "_lvl_" .. tostring(i),
			recipe = {"proficiencies:"..name .. "_lvl_" .. tostring(i), "proficiencies:"..name .. "_lvl_" ..tostring(i)},
			type = "toolrepair",
		})

		if i < levels then
			minetest.register_craft({
				output = "gal:"..name .. "_lvl_" .. tostring(i+1),
				recipe = {
					{"proficiencies:"..name .. "_lvl_" .. tostring(i), "potions:upgrading"},
				}
			})
		end
	end

	if def.recipe then
		minetest.register_craft({
			output = "gal:"..name .. "_lvl_" .. tostring(fromLevel),
			recipe = def.recipe,
		})
	end
end

function gal.player.proficiencies.register_tool(name, fromLevel, levels, def)
	for i = fromLevel, levels, 1 do
		local damage_string = ""
		if def.get_damage then
			damage_string = "\n Damage: " .. tostring(def.get_damage(i))
		end
		minetest.register_craftitem("gal:" .. name .. "_lvl_" .. tostring(i), {
			description = def.description .. "\n Level: "..tostring(i) .. damage_string .. "\n Skill: " .. def.skill .. "\n Range: " .. tostring(def.range or 4),
			inventory_image = def.inventory_image,
			wield_image = def.wield_image or def.inventory_image,
			skill = def.skill,
			range = def.range or 4,
			wield_scale = def.wield_scale,
			on_use = function(itemstack, user, pointed_thing)
				if user == nil then return end
				if gal.player.proficiencies.lvls[user:get_player_name()] and gal.player.proficiencies.lvls[user:get_player_name()][def.skill] > i-1 then
					def.on_use(itemstack, user, pointed_thing, i)
				else
					gal.player.cmsg.push_message_player(user, "[info] You have to be " .. def.skill .. " level "..tostring(i).. " to use this tool!")
				end
				return nil
			end
		})

		if i < levels then
			minetest.register_craft({
				output = "gal:"..name .. "_lvl_" .. tostring(i+1),
				recipe = {
					{"proficiencies:"..name .. "_lvl_" .. tostring(i), "potions:upgrading"},
				}
			})
		end
	end

	if def.recipe then
		minetest.register_craft({
			output = "gal:"..name .. "_lvl_" .. tostring(fromLevel),
			recipe = def.recipe,
		})
	end
end

-- load save

function gal.player.proficiencies.load_skills()
	local input = io.open(gal.player.proficiencies.skills_file, "r")
	if input then
		local str = input:read()
		if minetest.deserialize(str) then
			gal.player.proficiencies.lvls = minetest.deserialize(str)
		end
		io.close(input)
	end
end

function gal.player.proficiencies.save_skills()
	if gal.player.proficiencies.lvls then
		local output = io.open(gal.player.proficiencies.skills_file, "w")
		local str = minetest.serialize(gal.player.proficiencies.lvls)
		output:write(str)
		io.close(output)
	end
end

--[[
default.player_inventory.register_tab({
	name = "Proficiencies",
	type = "function",
	get_formspec = function(name)
		local count = 0
		for s,l in pairs(gal.player.proficiencies.lvls[name]) do
			count = count + (l-1)
		end

		local formspec = "size[8,7.5;]" ..
			default.gui_colors ..
			default.gui_bg ..
			"label[0,0;Proficiencies:]" ..
			"label[7,0;" .. tostring(gal.player.xp.player_levels[name] - count) .. "]"


		local i = 0
		for skill_name, skill_level in pairs(gal.player.proficiencies.lvls[name]) do
			formspec = formspec .. "button[0,"..tostring(i+0.5)..";2,1;" .. skill_name .. ";" .. skill_name .. " : " .. tostring(skill_level) .. "]"

			if gal.player.proficiencies.all_skills[skill_name] then
				formspec = formspec .. "label[2.5,"..tostring(i+0.75)..";" .. gal.player.proficiencies.all_skills[skill_name].description .. "]"
			end
			i = i +1
		end

		return formspec
	end,
	on_event = function(player, fields)
		local name = player:get_player_name()
		for n,v in pairs(fields) do
			if v then
				gal.player.proficiencies.level_up(name, n)
			end
		end
	end
})
--]]
--[[
gal.sfinv.register_page("Proficiencies", {
	title = "Proficiencies",
	get = function(self, player, context)
		local count = 0

		local playername = player:get_player_name()
	
		--for s,l in pairs(gal.player.proficiencies.lvls[player]) do
		for s,l in pairs(gal.player.proficiencies.lvls[playername]) do
			count = count + (l-1)
		end

		local formspec = "size[8,7.5;]" ..
			gal.gui.gui_colors ..
			gal.gui.gui_bg ..
			"label[0,0;Proficiencies:]" ..
			"label[7,0;" .. tostring(gal.player.xp.player_levels[player] - count) .. "]"


		local i = 0
		for skill_name, skill_level in pairs(gal.player.proficiencies.lvls[player]) do
			formspec = formspec .. "button[0,"..tostring(i+0.5)..";2,1;" .. skill_name .. ";" .. skill_name .. " : " .. tostring(skill_level) .. "]"

			if gal.player.proficiencies.all_skills[skill_name] then
				formspec = formspec .. "label[2.5,"..tostring(i+0.75)..";" .. gal.player.proficiencies.all_skills[skill_name].description .. "]"
			end
			i = i +1
		end

		--return formspec
		return gal.sfinv.make_formspec(player, context, formspec, false)
	end,
})
--]]
gal.player.proficiencies.get_formspec = function(player)
	local count = 0
	for s,l in pairs(gal.player.proficiencies.lvls[player]) do
		count = count + (l-1)
	end

	local formspec = "size[8,7.5;]" ..
		--gui.gui_colors ..
		gal.gui.gui_bg ..
		"label[0,0;Proficiencies:]" ..
		"label[7,0;" .. tostring(gal.player.xp.player_levels[player] - count) .. "]"


	local i = 0
	for skill_name, skill_level in pairs(gal.player.proficiencies.lvls[player]) do
		formspec = formspec .. "button[0,"..tostring(i+0.5)..";2,1;" .. skill_name .. ";" .. skill_name .. " : " .. tostring(skill_level) .. "]"

		if gal.player.proficiencies.all_skills[skill_name] then
			formspec = formspec .. "label[2.5,"..tostring(i+0.75)..";" .. gal.player.proficiencies.all_skills[skill_name].description .. "]"
		end
		i = i +1
	end

	return formspec
end

gal.player.proficiencies.register_on_update = (function(player)
	if gal.sfinv.enabled then
		gal.sfinv.set_player_inventory_formspec(player)
	end
	--if minetest.get_modpath("sfinv_buttons") ~= nil then
		gal.sfinv.buttons.register_button("proficiencies", {
			image = "inventory_plus_backpack.png",
			title = S("Proficiencies and Skills"),
			tooltip = S("Proficiencies and Skills"),
			--action = minetest.show_formspec(name, "quests:questlog", quests.create_formspec(name))
			action = gal.player.proficiencies.get_formspec(player)
		})
	--end
end)
--


-- cmd

minetest.register_chatcommand("skills", {
	params = "<player>",
	description = "Show Skills formspec",
	privs = {},
	func = function(name, param)
		if minetest.get_player_by_name(param) then
			minetest.show_formspec(param, "proficiencies:skills", gal.player.proficiencies.get_formspec(param))
			return true
		else
			return false,"Player " .. param .. "doesnt exist."
		end
	end
})



minetest.register_chatcommand("skill", {
	params = "<skill>",
	description = "Level up <skill>",
	privs = {},
	func = function(name, text)
		if text == "show" then
			gal.player.cmsg.push_message_player(minetest.get_player_by_name(name), "[skills] " .. gal.player.proficiencies.get_text(name))
			return true,"Done"
		end
		if not(gal.player.proficiencies.lvls[name]) then
			return false, "[ERROR] Please contact an admin."
		end
		if gal.player.proficiencies.lvls[name][text] then
			local count = 0
			for s,l in pairs(gal.player.proficiencies.lvls[name]) do
				count = count + (l-1)
			end
			print(count)
			print(gal.player.xp.player_levels[name])
			if gal.player.xp.player_levels[name] > count then
				gal.player.proficiencies.lvls[name][text] = gal.player.proficiencies.lvls[name][text] + 1
				gal.player.proficiencies.save_skills()
				gal.player.cmsg.push_message_player(minetest.get_player_by_name(name), "[skills] " .. gal.player.proficiencies.get_text(name))
				return true, "You leveled up " ..text
			else
				return true, "You cant level up "..text .. " at the moment."
			end
		else
			return true, "You cant level up "..text
		end
	end,
})

minetest.register_chatcommand("reset_skills", {
	params = "<player>",
	description = "Resets <player>'s skills",
	privs = {server=true},
	func = function(name, param)
		if minetest.get_player_by_name(param) then
			gal.player.proficiencies.lvls[param] = {}
			for s,a in pairs(gal.player.proficiencies.all_skills) do
				gal.player.proficiencies.lvls[param][s] = 1
			end
			gal.player.proficiencies.save_skills()
		else
			return false,"Player " .. param .. "doesnt exist."
		end
	end,
})

gal.player.proficiencies.register_skill = function(name, def)
	gal.player.proficiencies.all_skills[name] = def or {description = ""}
end


gal.player.proficiencies.register_skill("farmer", {
	description = "You will get more xp for farming."
})

gal.player.proficiencies.register_skill("warrior", {
	description = "You will be able to use better weapons."
})

gal.player.proficiencies.register_skill("miner", {
	description = "You will get more xp for mining."
})

gal.player.proficiencies.register_skill("hunter", {
	description = "You will be able to use better weapons."
})

gal.player.proficiencies.register_skill("builder", {
	description = "-"
})

gal.player.proficiencies.load_skills()

gal.player.proficiencies.register_weapon("spear",1, 12, {
	description = "Spear",
	inventory_image = "skills_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage_m = 1.0,
	damage_d = -1,
	skill = "warrior",
	recipe = {
		{"", "default:flint", ""},
		{"", "default:string_strong", ""},
		{"", "default:stick", ""},
	}
})

gal.player.proficiencies.register_weapon("chemical_spear",5, 17, {
	description = "Chemical Spear",
	inventory_image = "skills_chemical_spear.png",
	wield_scale = {x = 2, y=2, z = 1},
	damage_m = 1.1,
	damage_d = -2,
	skill = "warrior"
})

gal.player.proficiencies.register_tool("shield", 5, 5, {
	description = "Shield",
	inventory_image = "skills_shield.png",
	wield_scale = {x = 2, y=2, z = 1},
	skill = "warrior",
	on_use = function(itemstack, user, pointed_thing, level)
		user:set_armor_groups({friendly = 30})
		user:set_physics_override({
			speed = 0.3,
		})
		gal.player.cmsg.push_message_player(user, "[armor] + shield")

		minetest.after(3.0, function(player)
			if not player or not player:is_player() then
				return
			end
			gal.player.armor.update_armor(player:get_player_name(), player)
			player:set_physics_override({
				speed = 1,
			})
			gal.player.cmsg.push_message_player(player, "[armor] - shield")
		end, user)
	end
})

gal.player.proficiencies.register_weapon("sword", 10, 20, {
	description = "Sword",
	inventory_image = "skills_sword.png",
	wield_scale = {x = 1.5, y=1.5, z = 1},
	damage_m = 1.0,
	damage_d = -1,
	skill = "warrior",
	recipe = {
		{"", "default:blade", ""},
		{"", "default:string_strong", ""},
		{"", "furnace:iron_rod", ""},
	}
})

gal.player.proficiencies.register_weapon("sword_copper", 17, 30, {
	description = "Copper Sword",
	inventory_image = "skills_sword_copper.png",
	wield_scale = {x = 1.5, y=1.5, z = 1},
	damage_m = 1.0,
	damage_d = -1,
	skill = "warrior",
	recipe = {
		{"", "default:blade", ""},
		{"", "default:string_strong", ""},
		{"", "furnace:copper_rod", ""},
	}
})

gal.player.proficiencies.register_tool("bow", 1, 30, {
	description = "Wooden Bow",
	inventory_image = "skills_bow.png",
	wield_image = "skills_bow_wield.png",
	wield_scale = {x = 2.5, y=2.5, z = 1},
	skill = "hunter",
	range = 20,
	on_use = function(itemstack, user, pointed_thing, level)
		local p = user:getpos()
		p.y = p.y + 1.5
		local dir = user:get_look_dir()
		minetest.add_particle({
			pos = p,
			velocity = vector.multiply(dir, 50),
			acceleration = {x=0, y=0, z=0},
			expirationtime = 7,
			size = 1,
			collisiondetection = false,
			vertical = false,
			texture = "default_wood.png"
		})
		if pointed_thing.type == "object" then
			local pt = pointed_thing.ref
			if not pt or not pt:getpos() or not user then
				return
			end
			pt:punch(user, 1.0, {
				full_punch_interval=1.0,
				damage_groups={fleshy=gal.player.proficiencies.get_dmg(level)-1},
			})
		end
	end,

	get_damage = function(level)
		return gal.player.proficiencies.get_dmg(level)-1
	end,

	recipe = {
		{"", "default:string_strong", "default:stick"},
		{"default:string_strong", "", "default:stick"},
		{"", "default:string_strong", "default:stick"},
	}
})


-- minetest.override_item("default:stone_with_coal", {
-- 	on_dig = function(pos, node, player)
-- 		if gal.player.proficiencies.lvls[player:get_player_name()] then
-- 			gal.player.xp.add_xp(player, (gal.player.proficiencies.lvls[player:get_player_name()]["miner"]-1))
-- 		end
-- 		minetest.node_dig(pos, node, player)
-- 	end,
-- })
--
-- minetest.override_item("default:stone_with_diamond", {
-- 	on_dig = function(pos, node, player)
-- 		if gal.player.proficiencies.lvls[player:get_player_name()] and gal.player.proficiencies.lvls[player:get_player_name()]["miner"] > 5 then
-- 			gal.player.xp.add_xp(player,gal.player.xp.get_xp(gal.player.xp.player_levels[player:get_player_name()], 14))
-- 		end
-- 		minetest.node_dig(pos, node, player)
-- 	end,
-- })
--
-- minetest.override_item("default:stone", {
-- 	on_dig = function(pos, node, player)
-- 		if gal.player.proficiencies.lvls[player:get_player_name()] and gal.player.proficiencies.lvls[player:get_player_name()]["miner"] then
-- 			if gal.player.proficiencies.lvls[player:get_player_name()]["miner"] > 1 then
-- 				if math.random(0, 20) == 1 then
-- 					gal.player.xp.add_xp(player,10)
-- 				end
-- 			end
-- 		end
-- 		minetest.node_dig(pos, node, player)
-- 	end,
--
--
-- })


dofile(gal.player.path_mod.."/proficiencies_abilities.lua")



