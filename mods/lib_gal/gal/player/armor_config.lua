local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local worldpath = minetest.get_worldpath()
local last_punch_time = {}
local pending_players = {}
local timer = 0

-- support for i18n
--armor_i18n = { }
--armor_i18n.gettext, armor_i18n.ngettext = dofile(modpath.."/intllib.lua")

-- local functions
local S = armor_i18n.gettext
local F = minetest.formspec_escape

--dofile(modpath.."/api.lua")

-- Legacy Config Support

local input = io.open(modpath.."/armor.conf", "r")
if input then
	dofile(modpath.."/armor.conf")
	input:close()
	input = nil
end
input = io.open(worldpath.."/armor.conf", "r")
if input then
	dofile(worldpath.."/armor.conf")
	input:close()
	input = nil
end
for name, _ in pairs(gal.player.armor.config) do
	local global = "ARMOR_"..name:upper()
	if minetest.global_exists(global) then
		gal.player.armor.config[name] = _G[global]
	end
end
if minetest.global_exists("ARMOR_MATERIALS") then
	gal.player.armor.materials = table.copy(ARMOR_MATERIALS)
end
if minetest.global_exists("ARMOR_FIRE_NODES") then
	gal.player.armor.fire_nodes = table.copy(ARMOR_FIRE_NODES)
end

-- Load Configuration

for name, config in pairs(gal.player.armor.config) do
	local setting = minetest.settings:get("armor_"..name)
	if type(config) == "number" then
		setting = tonumber(setting)
	elseif type(config) == "boolean" then
		setting = minetest.settings:get_bool("armor_"..name)
	end
	if setting ~= nil then
		gal.player.armor.config[name] = setting
	end
end
for material, _ in pairs(gal.player.armor.materials) do
	local key = "material_"..material
	if gal.player.armor.config[key] == false then
		gal.player.armor.materials[material] = nil
	end
end

-- Mod Compatibility

--if minetest.get_modpath("technic") then
	gal.player.armor.formspec = gal.player.armor.formspec..
		"label[5,2.5;"..F(S("Radiation"))..":  armor_group_radiation]"
	gal.player.armor:register_armor_group("radiation")
--end
local skin_mods = {"skins", "u_skins", "simple_skins", "wardrobe", "appearance"}
for _, mod in pairs(skin_mods) do
	local path = minetest.get_modpath(mod)
	if path then
		if mod == "appearance" then
			gal.player.armor:add_preview(appearance_get_skin_preview)
		else
			local dir_list = minetest.get_dir_list(path.."/textures")
			for _, fn in pairs(dir_list) do
				if fn:find("_preview.png$") then
					gal.player.armor:add_preview(fn)
				end
			end
		end
		gal.player.armor.skin_mod = mod
	end
end

------------------------------
--** The following section modified by ShadMOrdre
--------------------------

--if not minetest.get_modpath("moreores") then
--	gal.player.armor.materials.mithril = nil
--end
--if not minetest.get_modpath("ethereal") then
--	gal.player.armor.materials.crystal = nil
--end


if minetest.get_modpath("default") then
	gal.player.armor.materials.wood = "group:wood"
	gal.player.armor.materials.cactus = "default:cactus"
	gal.player.armor.materials.steel = "default:steel_ingot"
	gal.player.armor.materials.bronze = "default:bronze_ingot"
	gal.player.armor.materials.diamond = "default:diamond"
	gal.player.armor.materials.gold = "default:gold_ingot"
end

if minetest.get_modpath("moreores") then
	gal.player.armor.materials.mithril = "moreores:mithril_ingot"
end

if minetest.get_modpath("ethereal") then
	gal.player.armor.materials.crystal = "ethereal:crystal_ingot"
end

if minetest.get_modpath("gal") then
	gal.player.armor.formspec = gal.player.armor.formspec..
		"label[5,2.5;"..F(S("Radiation"))..":  armor_group_radiation]"
	gal.player.armor:register_armor_group("radiation")
	gal.player.armor.materials.steel = "gal:metal_steel_ingot"
	gal.player.armor.materials.bronze = "gal:metal_bronze_ingot"
	gal.player.armor.materials.diamond = "gal:mineral_diamond_block"
	gal.player.armor.materials.gold = "gal:metal_gold_ingot"
	--gal.player.armor.materials.mithril = "gal:metal_mithril_ingot"
	gal.player.armor.materials.crystal = "gal:emerald_crystal_block"
	--gal.player.armor.materials.cotton = "gal:metal_gold_ingot"
	--gal.player.armor.materials.wool = "gal:metal_bronze_ingot"
	gal.player.armor.materials.bone = "gal:bone"
	gal.player.armor.materials.leather = "gal:metal_bronze_ingot"
	gal.player.armor.materials.leather_black = "gal:metal_bronze_ingot"
	gal.player.armor.materials.leather_brown = "gal:metal_bronze_ingot"
	gal.player.armor.materials.leather_grey = "gal:metal_bronze_ingot"
	gal.player.armor.materials.leather_dark_green = "gal:metal_bronze_ingot"
	gal.player.armor.materials.leather_dark_grey = "gal:metal_bronze_ingot"
	gal.player.armor.materials.studded = "gal:metal_bronze_ingot"
	gal.player.armor.materials.ninja = "gal:metal_bronze_ingot"
	gal.player.armor.materials.copper = "gal:metal_copper_ingot"
	gal.player.armor.materials.chainmail = "gal:metal_bronze_ingot"
	gal.player.armor.materials.iron = "gal:metal_iron_pig_ingot"
	gal.player.armor.materials.obsidian = "gal:mineral_obsidian_shard"
	gal.player.armor.materials.carbonfiber = "gal:metal_bronze_ingot"
	gal.player.armor.materials.titanium = "gal:metal_steel_carbon_ingot"
	gal.player.armor.materials.lead = "gal:metal_lead_ingot"
	gal.player.armor.materials.brass = "gal:metal_brass_ingot"
	gal.player.armor.materials.wrought = "gal:metal_iron_wrought_ingot"
	gal.player.armor.materials.cast = "gal:metal_iron_cast_ingot"
	gal.player.armor.materials.carbon = "gal:metal_bronze_ingot"
	gal.player.armor.materials.stainless = "gal:metal_bronze_ingot"
	gal.player.armor.materials.admin2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.gold2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.mithril2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.diamond2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.bronze2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.steel2 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.bronze3 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.steel3 = "gal:metal_bronze_ingot"
	gal.player.armor.materials.royal_diamond = "gal:metal_bronze_ingot"
	gal.player.armor.materials.royal_gold = "gal:metal_bronze_ingot"
	gal.player.armor.materials.royal_steel = "gal:metal_bronze_ingot"
	gal.player.armor.materials.cotton = "gal:plant_cotton"
	gal.player.armor.materials.wood = "group:wood"
end

if minetest.get_modpath("mobs_redo") then
	gal.player.armor.materials.wool = "mobs_redo:wool"
	gal.player.armor.materials.leather = "mobs_redo:leather"
	gal.player.armor.materials.crystal = "mobs_redo:bone"
end

if minetest.get_modpath("lib_textiles") then
	gal.player.armor.materials.cotton = "lib_textiles:cotton"
	gal.player.armor.materials.wool = "lib_textiles:wool"
	gal.player.armor.materials.leather = "lib_textiles:leather"
end


--dofile(modpath.."/armor.lua")

-- Armor Initialization

gal.player.armor.formspec = gal.player.armor.formspec..
	"label[5,1;"..F(S("Level"))..": armor_level]"..
	"label[5,1.5;"..F(S("Heal"))..":  armor_attr_heal]"
if gal.player.armor.config.fire_protect then
	gal.player.armor.formspec = gal.player.armor.formspec.."label[5,2;"..F(S("Fire"))..":  armor_attr_fire]"
end
gal.player.armor:register_on_destroy(function(player, index, stack)
	local name = player:get_player_name()
	local def = stack:get_definition()
	if name and def and def.description then
		minetest.chat_send_player(name, S("Your @1 got destroyed!", def.description))
	end
end)

local function validate_armor_inventory(player)
	-- Workaround for detached inventory swap exploit
	local _, inv = gal.player.armor:get_valid_player(player, "[validate_armor_inventory]")
	if not inv then
		return
	end
	local armor_prev = {}
	local armor_list_string = player:get_attribute("3d_armor_inventory")
	if armor_list_string then
		local armor_list = gal.player.armor:deserialize_inventory_list(armor_list_string)
		for i, stack in ipairs(armor_list) do
			if stack:get_count() > 0 then
				armor_prev[stack:get_name()] = i
			end
		end
	end
	local elements = {}
	local player_inv = player:get_inventory()
	for i = 1, 9 do
		local stack = inv:get_stack("armor", i)
		if stack:get_count() > 0 then
			local item = stack:get_name()
			local element = gal.player.armor:get_element(item)
			if element and not elements[element] then
				if armor_prev[item] then
					armor_prev[item] = nil
				else
					-- Item was not in previous inventory
					gal.player.armor:run_callbacks("on_equip", player, i, stack)
				end
				elements[element] = true;
			else
				inv:remove_item("armor", stack)
				-- The following code returns invalid items to the player's main
				-- inventory but could open up the possibity for a hacked client
				-- to receive items back they never really had. I am not certain
				-- so remove the is_singleplayer check at your own risk :]
				if minetest.is_singleplayer() and player_inv and
						player_inv:room_for_item("main", stack) then
					player_inv:add_item("main", stack)
				end
			end
		end
	end
	for item, i in pairs(armor_prev) do
		local stack = ItemStack(item)
		-- Previous item is not in current inventory
		gal.player.armor:run_callbacks("on_unequip", player, i, stack)
	end
end

local function init_player_armor(player)
	local name = player:get_player_name()
	local pos = player:get_pos()
	if not name or not pos then
		return false
	end
	local armor_inv = minetest.create_detached_inventory(name.."_armor", {
		on_put = function(inv, listname, index, stack, player)
			validate_armor_inventory(player)
			gal.player.armor:save_armor_inventory(player)
			gal.player.armor:set_player_armor(player)
		end,
		on_take = function(inv, listname, index, stack, player)
			validate_armor_inventory(player)
			gal.player.armor:save_armor_inventory(player)
			gal.player.armor:set_player_armor(player)
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			validate_armor_inventory(player)
			gal.player.armor:save_armor_inventory(player)
			gal.player.armor:set_player_armor(player)
		end,
		allow_put = function(inv, listname, index, put_stack, player)
			local element = gal.player.armor:get_element(put_stack:get_name())
			if not element then
				return 0
			end
			for i = 1, 9 do
				local stack = inv:get_stack("armor", i)
				local def = stack:get_definition() or {}
				if def.groups and def.groups["armor_"..element]
						and i ~= index then
					return 0
				end
			end
			return 1
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return count
		end,
	}, name)
	armor_inv:set_size("armor", 9)
	if not gal.player.armor:load_armor_inventory(player) and gal.player.armor.migrate_old_inventory then
		local player_inv = player:get_inventory()
		player_inv:set_size("armor", 9)
		for i=1, 9 do
			local stack = player_inv:get_stack("armor", i)
			armor_inv:set_stack("armor", i, stack)
		end
		gal.player.armor:save_armor_inventory(player)
		player_inv:set_size("armor", 0)
	end
	for i=1, 9 do
		local stack = armor_inv:get_stack("armor", i)
		if stack:get_count() > 0 then
			gal.player.armor:run_callbacks("on_equip", player, i, stack)
		end
	end
	gal.player.armor.def[name] = {
		init_time = minetest.get_gametime(),
		level = 0,
		state = 0,
		count = 0,
		groups = {},
	}
	for _, phys in pairs(gal.player.armor.physics) do
		gal.player.armor.def[name][phys] = 1
	end
	for _, attr in pairs(gal.player.armor.attributes) do
		gal.player.armor.def[name][attr] = 0
	end
	for group, _ in pairs(gal.player.armor.registered_groups) do
		gal.player.armor.def[name].groups[group] = 0
	end
	local skin = gal.player.armor:get_player_skin(name)
	gal.player.armor.textures[name] = {
		skin = skin,
		armor = "3d_armor_trans.png",
		wielditem = "3d_armor_trans.png",
		preview = gal.player.armor.default_skin.."_preview.png",
	}
	local texture_path = minetest.get_modpath("player_textures")
	if texture_path then
		local dir_list = minetest.get_dir_list(texture_path.."/textures")
		for _, fn in pairs(dir_list) do
			if fn == "player_"..name..".png" then
				gal.player.armor.textures[name].skin = fn
				break
			end
		end
	end
	gal.player.armor:set_player_armor(player)
	return true
end

-- Armor Player Model

gal.player.api.register_model("3d_armor_character.b3d", {		--3d_armor_character.b3d	--multiskin_model.b3d
	animation_speed = 30,
	textures = {
		gal.player.armor.default_skin..".png",
		"3d_armor_trans.png",
		"3d_armor_trans.png",
		"3d_armor_trans.png",
	},
	animations = {
		stand = {x=0, y=79},
		lay = {x=162, y=166},
		walk = {x=168, y=187},
		mine = {x=189, y=198},
		walk_mine = {x=200, y=219},
		sit = {x=81, y=160},
	},
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = gal.player.armor:get_valid_player(player, "[on_player_receive_fields]")
	if not name then
		return
	end
	for field, _ in pairs(fields) do
		if string.find(field, "skins_set") then
			minetest.after(0, function(player)
				local skin = gal.player.armor:get_player_skin(name)
				gal.player.armor.textures[name].skin = skin
				gal.player.armor:set_player_armor(player)
			end, player)
		end
	end
end)

minetest.register_on_joinplayer(function(player)
	gal.player.api.set_model(player, "3d_armor_character.b3d")
	minetest.after(0, function(player)
		if init_player_armor(player) == false then
			pending_players[player] = 0
		end
	end, player)
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	if name then
		gal.player.armor.def[name] = nil
		gal.player.armor.textures[name] = nil
	end
	pending_players[player] = nil
end)

if gal.player.armor.config.drop == true or gal.player.armor.config.destroy == true then
	minetest.register_on_dieplayer(function(player)
		local name, armor_inv = gal.player.armor:get_valid_player(player, "[on_dieplayer]")
		if not name then
			return
		end
		local drop = {}
		for i=1, armor_inv:get_size("armor") do
			local stack = armor_inv:get_stack("armor", i)
			if stack:get_count() > 0 then
				table.insert(drop, stack)
				gal.player.armor:run_callbacks("on_unequip", player, i, stack)
				armor_inv:set_stack("armor", i, nil)
			end
		end
		gal.player.armor:save_armor_inventory(player)
		gal.player.armor:set_player_armor(player)
		local pos = player:get_pos()
		if pos and gal.player.armor.config.destroy == false then
			minetest.after(gal.player.armor.config.bones_delay, function()
				local meta = nil
				local maxp = vector.add(pos, 8)
				local minp = vector.subtract(pos, 8)
				local bones = minetest.find_nodes_in_area(minp, maxp, {"bones:bones"})
				for _, p in pairs(bones) do
					local m = minetest.get_meta(p)
					if m:get_string("owner") == name then
						meta = m
						break
					end
				end
				if meta then
					local inv = meta:get_inventory()
					for _,stack in ipairs(drop) do
						if inv:room_for_item("main", stack) then
							inv:add_item("main", stack)
						else
							gal.player.armor.drop_armor(pos, stack)
						end
					end
				else
					for _,stack in ipairs(drop) do
						gal.player.armor.drop_armor(pos, stack)
					end
				end
			end)
		end
	end)
end

if gal.player.armor.config.punch_damage == true then
	minetest.register_on_punchplayer(function(player, hitter,
			time_from_last_punch, tool_capabilities)
		local name = player:get_player_name()
		if name then
			gal.player.armor:punch(player, hitter, time_from_last_punch, tool_capabilities)
			last_punch_time[name] = minetest.get_gametime()
		end
	end)
end

minetest.register_on_player_hpchange(function(player, hp_change)
	if player and hp_change < 0 then
		local name = player:get_player_name()
		if name then
			local heal = gal.player.armor.def[name].heal
			if heal >= math.random(100) then
				hp_change = 0
			end
			-- check if armor damage was handled by fire or on_punchplayer
			local time = last_punch_time[name] or 0
			if time == 0 or time + 1 < minetest.get_gametime() then
				gal.player.armor:punch(player)
			end
		end
	end
	return hp_change
end, true)

minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer > gal.player.armor.config.init_delay then
		for player, count in pairs(pending_players) do
			local remove = init_player_armor(player) == true
			pending_players[player] = count + 1
			if remove == false and count > gal.player.armor.config.init_times then
				minetest.log("warning", S("3d_armor: Failed to initialize player"))
				remove = true
			end
			if remove == true then
				pending_players[player] = nil
			end
		end
		timer = 0
	end
end)

-- Fire Protection and water breating, added by TenPlus1

if gal.player.armor.config.fire_protect == true then
	-- override hot nodes so they do not hurt player anywhere but mod
	for _, row in pairs(gal.player.armor.fire_nodes) do
		if minetest.registered_nodes[row[1]] then
			minetest.override_item(row[1], {damage_per_second = 0})
		end
	end
else
	print (S("[3d_armor] Fire Nodes disabled"))
end

if gal.player.armor.config.water_protect == true or gal.player.armor.config.fire_protect == true then
	minetest.register_globalstep(function(dtime)
		gal.player.armor.timer = gal.player.armor.timer + dtime
		if gal.player.armor.timer < gal.player.armor.config.update_time then
			return
		end
		for _,player in pairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			local pos = player:get_pos()
			local hp = player:get_hp()
			if not name or not pos or not hp then
				return
			end
			-- water breathing
			if gal.player.armor.config.water_protect == true then
				if gal.player.armor.def[name].water > 0 and
						player:get_breath() < 10 then
					player:set_breath(10)
				end
			end
			-- fire protection
			if gal.player.armor.config.fire_protect == true then
				local fire_damage = true
				pos.y = pos.y + 1.4 -- head level
				local node_head = minetest.get_node(pos).name
				pos.y = pos.y - 1.2 -- feet level
				local node_feet = minetest.get_node(pos).name
				-- is player inside a hot node?
				for _, row in pairs(gal.player.armor.fire_nodes) do
					-- check fire protection, if not enough then get hurt
					if row[1] == node_head or row[1] == node_feet then
						if fire_damage == true then
							gal.player.armor:punch(player, "fire")
							last_punch_time[name] = minetest.get_gametime()
							fire_damage = false
						end
						if hp > 0 and gal.player.armor.def[name].fire < row[2] then
							hp = hp - row[3] * gal.player.armor.config.update_time
							player:set_hp(hp)
							break
						end
					end
				end
			end
		end
		gal.player.armor.timer = 0
	end)
end
