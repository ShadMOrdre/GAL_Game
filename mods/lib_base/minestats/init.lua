-- minestats mod for Minetest
-- Copyright © 2017 Alex Yst <mailto:copyright@y.st>

-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- This software is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <https://www.gnu.org./licenses/>.

-----------------------------------------------------------------------
------------------------- Internal Variables: -------------------------
-----------------------------------------------------------------------

-- Anything in this table is a mineral. Anything else is, well, not.
-- 
-- Third-party mod developers need not worry about the structure of
-- this table because the table's not made public. However, if you're
-- editing this file's code, the structure is:
-- 
--      registered_minerals[node_name][drop_name] == true
-- 
-- A single mineral node might be able to drop multiple minerals (not
-- in a single instance), so this table structure allows us to account
-- for that fact.
local registered_minerals = {}

-- We need a way to store our data, so let's try this:
local storage = minetest.get_mod_storage()

-- This table is used internally to keep track of the alphabetical
-- order of all registered minerals.
local sorted_minerals = {}

-----------------------------------------------------------------------
------------------------- Internal functions: -------------------------
-----------------------------------------------------------------------

-- Need to know if something's a mineral? Look no further!
local function is_mineral(node_name, drop_name)
	if registered_minerals[node_name]
	and registered_minerals[node_name][drop_name] then
		return true
	else
		return false
	end
end

-- Need to know how many of a given mineral a given player has mined?
-- This here's your function.
local function get_mineral_stat(player_name, node, drop)
	local stat = storage:get_int(player_name..";"..node..";"..drop)
-- The storage API uses 32-bit integers, and they wrap. I don't think
-- anyone will ever mine enough minerals for it to matter, but if the
-- number is less than zero, we can be sure it's supposed to be at
-- least 2147483648 higher. Once we wrap back to zero though, we don't
-- have a way to know.
	if stat < 0 then
		stat = stat + 2147483648
	end
	return stat
end

-- This method returns the number of stacks of the mineral a player has
-- mined. It can be used to add some sort of progression to the game
-- from other mods.
local function get_stacks_mined(player_name, node, drop)
	local stat = get_mineral_stat(player_name, node, drop)
	local stack_size
	if minetest.registered_items[drop] then
		stack_size = minetest.registered_items[drop].stack_max
	else
		stack_size = minetest.registered_items.unknown.stack_max
	end
	return math.floor(stat/stack_size)
end

-- We'll overwrite these functions later in the script (see "External
-- API"), so we need to create local copies of the old versions to call
-- from our new versions.
local builtin_get_node_drops = minetest.get_node_drops
local builtin_handle_node_drops = minetest.handle_node_drops

-- This function builds the formspec for the stats page in the players'
-- inventory menu.
local function get_formspec(player_name, page)
	if page == nil or page < 0 then
		page = 0
	else
		page = math.floor(page)
	end
	local current_mineral = page * 8 + 1
	local formspec = ""
	local line = 0
	while line < 8 and sorted_minerals[current_mineral] do
		local points = get_mineral_stat(player_name, sorted_minerals[current_mineral].node, sorted_minerals[current_mineral].drop)
		local drop_name = minetest.registered_items[sorted_minerals[current_mineral].drop].description
		formspec = formspec..[[
item_image[0,]]..line..[[;1,1;]]..sorted_minerals[current_mineral].node..[[]
item_image[1,]]..line..[[;1,1;]]..sorted_minerals[current_mineral].drop..[[]
label[2,]]..line..[[.25;]]..drop_name..[[s mined:]
label[6,]]..line..[[.25;]]..points..[[]
]]
		line = line + 1
		current_mineral = current_mineral + 1
	end
	local show_page = false
	if page ~= 0 then
		formspec = formspec..[[
button[0,8;2,1;minestats:page:]]..(page-1)..[[;Previous]
]]
		show_page = true
	end
	if math.floor((#sorted_minerals -1) / 8) > page then
		formspec = formspec..[[
button[6,8;2,1;minestats:page:]]..(page+1)..[[;Next]
]]
		show_page = true
	end
	if show_page then
		formspec = formspec..[[
label[2,8.25;Page ]]..page..[[]
]]
	end
	return formspec
end

-----------------------------------------------------------------------
---------------------------- External API: ----------------------------
-----------------------------------------------------------------------

-- To grant mineral points to the player, we need to know which player
-- dug the node, what node was dug, and what item was dropped. The
-- Minetest API doesn't give us all that information at once. Instead,
-- it tells us what node was dug when we need to find the drops, then
-- tells us the drops and tells us what player they're for. In order to
-- get all the information we need, we need to sneak the dug node's
-- name into the drop table.
function minetest.get_node_drops(node_name, tool_name)
	local drops = builtin_get_node_drops(node_name, tool_name)
	drops["minestats:dug_node"] = node_name
	return drops
end

function minetest.handle_node_drops(pos, drops, digger)
-- If we have information on what node was dug, let's use it.
-- Otherwise, this function must have been called not by a dig, but by
-- some other mod.
	if drops["minestats:dug_node"] and #drops == 1 then
		name = digger:get_player_name()
		if registered_minerals[drops["minestats:dug_node"]]
		and registered_minerals[drops["minestats:dug_node"]][drops[1]] then
			local key = name..";"..drops["minestats:dug_node"]..";"..drops[1]
			storage:set_int(key, storage:get_int(key)+1)
		end
	end
	drops["minestats:dug_node"] = nil
-- Whether called by a dig or by another mod, we should call the
-- default implementation to finish up.
	builtin_handle_node_drops(pos, drops, digger)
end

--if minetest.get_modpath("sfinv") then
-- Let's add the stats page to the inventory menu:
	gal.sfinv.register_page("minestats:stats", {
		title = "Stats",
		get = function(self, player, context)
			return gal.sfinv.make_formspec(player, context, get_formspec(player:get_player_name(), 0), false)
		end,
		is_in_nav = function()
			return #sorted_minerals > 0
		end,
	})
-- While we're at it, let's add multi-page support:
	minetest.register_on_player_receive_fields(function(player, formname, fields)
		for field, value in next, fields do
			if field:sub(1, 15) == "minestats:page:" then
				player:set_inventory_formspec(gal.sfinv.make_formspec(player, gal.sfinv.get_or_create_context(player), get_formspec(player:get_player_name(), tonumber(field:sub(16))), false))
				return true
			end
		end
	end)
--end

-- Minetest includes a way to store mod-specific, key/value pairs. It
-- It also includes a way to store player-specific, key/value pairs.
-- However, neither is adequate for something as dynamic as this mod.
-- For starters, neither option includes a way to *remove* key/value
-- pairs that are no longer wanted. Once the data is added, you're
-- stuck with it forever. The mod-specific data storage (but *not* the
-- player-specific storage) has an option to set the entire database to
-- a given table. That means we could hack in a way to remove a single
-- key/value pair by reading the data to a table, removing the unwanted
-- key, and setting the database to the new table. I fear though that
-- this could lead to a race condition if another value is being
-- modified at the same time. More-importantly though, 
minetest.mkdir(minetest.get_worldpath().."/players.conf.d/minestats")

minetest.after(0, function()
-- After all mods have loaded, we need to go through the node table to
-- figure out which minerals have been defined in the game.
	for node_name, def in next, minetest.registered_nodes do
-- No drop property means the node drops itself. It's not a mineral.
		if def.drop then
-- The drop property can be a string ...
			if type(def.drop) == "string" then
-- If the dropped item isn't registered, the node isn't a mineral node;
-- it's just buggy. (It's also worth noting that this could be an item
-- string representing a stack containing more than one item. In that
-- case, the node's not buggy and the item string is valid, but the
-- the item string won't be found in the registered item table. That's
-- fine, as nodes that drop multiple items are also not considered to
-- be minerals by this mod.)
				if minetest.registered_items[def.drop]
-- If the dropped item isn't a craft item, the node isn't a mineral
-- node.
				and minetest.registered_items[def.drop].type == "craft"
-- If the dropped item has a custom on_place method defined, it's not a
-- mineral. It's probably a door or something of that nature; something
-- that is stupidly defined as a craft item, but is more like a node in
-- that it can be placed as a node in the world.
				and minetest.registered_items[def.drop].on_place == minetest.craftitemdef_default.on_place then
					registered_minerals[node_name] = {
						[def.drop] = true,
					}
				end
-- ... or the drop property can be a table.
			else
-- If the node can drop multiple sets of items, it's not a mineral
-- node.
				if def.drop.max_items == 1
				or ((def.drop.items) and (#def.drop.items == 1)) then
					local may_be_mineral = {}
					local is_not_mineral = {}
					for _, drop in next, def.drop.items do
-- If the drop group contains only a single item, that item might be a
-- mineral.
						if #drop.items == 1 then
							may_be_mineral[drop.items[1]] = true
-- If the drop group contains multiple items, all items in that group
-- are not minerals.
						else
							for _, item in next, drop.items do
								is_not_mineral[item] = true
							end
						end
					end
					for item, _ in next, may_be_mineral do
-- If the item's not a mineral, it's not a mineral.
						if not is_not_mineral[item]
-- If the dropped item isn't registered, the node isn't a mineral node;
-- it's just buggy. (It's also worth noting that this could be an item
-- string representing a stack containing more than one item. In that
-- case, the node's not buggy and the item string is valid, but the
-- the item string won't be found in the registered item table. That's
-- fine, as nodes that drop multiple items are also not considered to
-- be minerals by this mod.)
						and minetest.registered_items[item]
-- If the dropped item isn't a craft item, the node isn't a mineral
-- node.
						and minetest.registered_items[item].type == "craft"
-- If the dropped item has a custom on_place method defined, it's not a
-- mineral. It's probably a door or something of that nature; something
-- that is stupidly defined as a craft item, but is more like a node in
-- that it can be placed as a node in the world.
						and minetest.registered_items[item].on_place == minetest.craftitemdef_default.on_place then
							if registered_mineral then
								registered_minerals[node_name][item] = true
							else
								registered_minerals[node_name] = {
									[item] = true,
								}
							end
						end
					end
				end
			end
		end
	end
	for node_name, drop_names in next, registered_minerals do
		for drop_name, _ in next, drop_names do
			sorted_minerals[#sorted_minerals+1] = {
				node = node_name,
				drop = drop_name,
			}
		end
	end
	table.sort(sorted_minerals, function(mineral_0, mineral_1)
		if mineral_0.node == mineral_1.node then
			return mineral_0.drop < mineral_1.drop
		else
			return mineral_0.node < mineral_1.node
		end
	end)
end)

-- Make the API visible to other mods:
__minestats__ = {
	get_mineral_stat = get_mineral_stat,
	get_stacks_mined = get_stacks_mined,
	is_mineral = is_mineral,
}

-----------------------------------------------------------------------
-------------------------- Deprecated Stuff: --------------------------
-----------------------------------------------------------------------

-- When Minetest starts, data will be transferred from the old database
-- format to the new one. I'm not sure how to actually delete the old
-- database when we're done, but we at least empty it to avoid
-- transferring the data a second time.
-- 
-- Deprecated on 2017-06-06; DO NOT REMOVE FOR AT LEAST TWO YEARS.
for _, player in next, minetest.get_dir_list(minetest.get_worldpath().."/players.conf.d/minestats", false) do
	local file_name = minetest.get_worldpath().."/players.conf.d/minestats/"..player
	local file = Settings(file_name)
	local table = file:to_table()
	for key, value in next, table do
		storage:set_int(player..";"..key, value)
	end
	io.open(file_name, "w"):close()
end
