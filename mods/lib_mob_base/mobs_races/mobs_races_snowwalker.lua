--[[
    Mobs Others - Adds the Snow Walkers mobs.
    Copyright (C) 2018  Hamlet

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]


--
-- General variables
--

local minetest_log_level = minetest.settings:get("debug_log_level")
local mod_load_message = "[Mod] Mobs Others [v0.1.3] loaded."


--
-- Functions
--

local function dps(self)
	local hit_points = nil
	local time_speed = nil
	local in_game_day_length = nil
	local five_in_game_minutes = nil
	local damage_per_second = nil

	hit_points = self.health
	time_speed = tonumber(minetest.settings:get("time_speed"))

	if (time_speed == nil) then
		time_speed = 72
	elseif (time_speed == 0) then
		time_speed = 1
	end

	in_game_day_length = 86400 / time_speed
	five_in_game_minutes = (in_game_day_length * 300) / 86400
	damage_per_second = hit_points / five_in_game_minutes

	return damage_per_second
end

local function random_appearence()

	local appearence = {}
	local chosen_skin = nil
	local chosen_armour = nil
	local chosen_weapon = nil

	local skins = {
		"mobs_others_snow_walker.png",
		"mobs_others_snow_walker_1.png",
		"mobs_others_snow_walker_2.png"
	}

	local weapons = {
		"mobs_others_crystal_sword.png",
		"mobs_others_crystal_axe.png"
	}

	local ARMOUR = "mobs_others_chestplate_crystal.png" ..
		"^" .. "mobs_others_leggings_crystal.png" ..
		"^" .. "mobs_others_boots_crystal.png"

	local ARMOUR_HELMET = "mobs_others_helmet_crystal.png" ..
		"^" .. "mobs_others_chestplate_crystal.png" ..
		"^" .. "mobs_others_leggings_crystal.png" ..
		"^" .. "mobs_others_boots_crystal.png"

	local ARMOUR_SHIELD = "mobs_others_chestplate_crystal.png" ..
		"^" .. "mobs_others_leggings_crystal.png" ..
		"^" .. "mobs_others_boots_crystal.png" ..
		"^" .. "mobs_others_shield_crystal.png"

	local ARMOUR_HELMET_SHIELD = "mobs_others_helmet_crystal.png" ..
		"^" .. "mobs_others_chestplate_crystal.png" ..
		"^" .. "mobs_others_leggings_crystal.png" ..
		"^" .. "mobs_others_boots_crystal.png" ..
		"^" .. "mobs_others_shield_crystal.png"

	local armours = {
		ARMOUR,
		ARMOUR_HELMET,
		ARMOUR_SHIELD,
		ARMOUR_HELMET_SHIELD
	}

	chosen_skin = skins[math.random(1, 3)]
	chosen_armour = armours[math.random(1, 4)]
	chosen_weapon = weapons[math.random(1, 2)]
	
	table.insert(appearence, 1, chosen_skin)
	table.insert(appearence, 2, chosen_armour)
	table.insert(appearence, 3, chosen_weapon)
	table.insert(appearence, 4, "mobs_others_transparent.png")

	return appearence
end


--
-- Obsidian Sword definition
--

minetest.register_tool("mobs_races:sword_obsidian", {
	description = "Obsidian Sword",
	inventory_image = "default_tool_steelsword.png^[colorize:black:171",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90,[2]=0.90,[3]=0.30},uses=40,maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	range = 3,
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "mobs_races:sword_obsidian",
	recipe = {
		{"default:obsidian"},
		{"default:obsidian"},
		{"group:stick"},
	}
})


--
-- Snow Walker entity
--

mobs:register_mob("mobs_races:snow_walker", {
	nametag = "",
	type = "monster",
	hp_min = 20,
	hp_max = 30,
	armor = 0,
	walk_velocity = 4,
	run_velocity = 5.2,
	walk_chance = 10,
	view_range = 14,
	damage = 8,
	knock_back = false,
	fear_height = 3,
	water_damage = 0,
	lava_damage = 999,
	light_damage = 0,
	suffocation = false,
	floats = 1,
	reach = 4,
	attack_animals = true,
	group_attack = true,
	attack_type = "dogfight",
	specific_attack = {"player", "mobs_humans:human"},
	blood_amount = 0,
	pathfinding = 0,
	immune_to = {
		{"mobs_races:sword_obsidian", 14},
	},
	makes_footstep_sound = false,
	sounds = {
		attack = "mobs_others_slash_attack",
		damage = "default_cool_lava",
	},
	visual = "mesh",
	visual_size = {x = 0.95, y = 1.15,},
	collisionbox = {-0.45, -1.2, -0.36, 0.45, 0.88, 0.36},
	textures = {},
	mesh = "mobs_others_character.b3d",
	animation = {
		stand_start = 0,
		stand_end = 80,
		stand_speed = 30,
		walk_start = 168,
		walk_end = 188,
		walk_speed = 30,
		run_start = 168,
		run_end = 188,
		run_speed = 35,
		punch_start = 189,
		punch_end = 199,
		punch_speed = 30,
	},
	replace_what = {"default:dirt", "default:dirt_with_grass"},
	replace_with = "default:dirt_with_snow",
	replace_rate = 10,
	replace_offset = -2,

	on_spawn = function(self, pos)
		self.light_damage = dps(self)
		self.textures = random_appearence()
		self.object:set_properties({
			light_damage = self.light_damage,
			textures = self.textures
		})
		return true
	end,

	on_die = function(self, pos)
		local position = {x = pos.x, y = (pos.y -1), z = pos.z}
		local node_name = minetest.get_node(position).name
		if (node_name == "air") then
			minetest.set_node(position,
				{name="default:river_water_flowing"})
		end
	end,
})


--
-- Snow Walkers spawning
--

mobs:spawn({name = "mobs_races:snow_walker",
	nodes = {
	"gal:dirt_with_snow",
	"gal:ice",
	"gal:snow",
	},
	neighbors = "air",
	max_light = 15,
	min_light = 0,
	interval = 60,
	chance = 3500,
	active_object_count = 2,
	min_height = 1,
	max_height = 31000,
	day_toggle = false
})


--
-- Aliases
--

mobs:alias_mob("mobs:snow_walker", "mobs_races:snow_walker")
minetest.register_alias("OSword", "mobs_races:sword_obsidian")


--
-- Minetest engine debug logging
--

if (minetest_log_level == nil) or (minetest_log_level == "action") or
	(minetest_log_level == "info") or (minetest_log_level == "verbose") then

	minetest.log("action", mod_load_message)
end
