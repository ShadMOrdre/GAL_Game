--[[
This file contains the stomping layer.
It is dedicated to transform a node to an other when walked on.
--]]

local function table_copy(table)
	local orig_type = type(table)
	local copy = {}
	if orig_type ~= 'table' then return table end
	for orig_key, orig_value in next, table, nil do
		copy[orig_key] = table_copy(orig_value)
	end
	return copy
end


--- Store all registered stomped nodes indexed by source node name
-- For every node name there can be a list of stomping descriptions, ordered
-- by priority in ascending order.
local stomps = {}

--- Get default stomp name to use with listeners.
local function get_stomp_name(source_node_name, stomp_node_name, mod_name)
	if not mod_name then
		mod_name = minetest.get_current_modname()
	end
	return mod_name .. ':' .. source_node_name .. '__to__' .. stomp_node_name
end

function gal.lib.poschange.get_footprint_node_name(source_node_name, mod_name)
	if not mod_name then
		-- current_modname is the caller mod, not always poschangelib
		mod_name = minetest.get_current_modname()
	end
	local node_mod_name = string.sub(source_node_name, 1, string.find(source_node_name, ':'))
	if node_mod_name == mod_name then
		return source_node_name .. '_with_footprint'
	else
		return mod_name .. ':' .. string.gsub(source_node_name, ':', '__') .. '_with_footprint'
	end
end

--- poschangelib walk callback
local function walk_listener(player, pos, node, desc, trigger_meta)
	gal.lib.poschange.chance_stomp(player, pos, node, desc, trigger_meta)
end

--- Random roll and do the stomp if it succeeds.
function gal.lib.poschange.chance_stomp(player, pos, node, node_desc, trigger_meta)
	local stomp_desc = stomps[node.name]
	if not stomp_desc then
		minetest.log('warning', 'No stomping data found for node ' .. node.name)
		return
	end
	for i, s_desc in ipairs(stomp_desc) do
		if (math.random() * s_desc.chance) < 1.0 then
			gal.lib.poschange.do_stomp(player, pos, node, node_desc, s_desc, trigger_meta)
			return
		end
	end
end

--- Actually do the stomp: replace the stomped node.
-- @param player The player the triggered the stomp.
-- @param pos Position of the stomped node.
-- @param node Node being stomped.
-- @param node_desc Description of the node being stomped.
-- @param stomp_desc Optional stomp description. If not provided it looks for it.
-- @param trigger_meta Optional trigger meta, passed by walk listeners.
function gal.lib.poschange.do_stomp(player, pos, node, node_desc, stomp_desc, trigger_meta)
	if not stomp_desc then
		stomp_desc = stomps[node.name]
		if stomp_desc then stomp_desc = stomp_desc[1] end
	end
	if not stomp_desc then
		minetest.log('warning', 'No stomping data found for node ' .. node.name)
		return
	end
	if not trigger_meta then trigger_meta = {} end
	if type(stomp_desc.dest_node_name) == 'function' then
		local dest_node = stomp_desc.dest_node_name(player, pos, node, trigger_meta)
		if not dest_node then return end
		if not dest_node.name then
			minetest.log('error', 'Stomping: function did not set node name for ' .. node.name)
			return
		end
		minetest.set_node(pos, dest_node)
	else
		local new_node = minetest.get_node(pos)
		new_node.name = stomp_desc.dest_node_name
		minetest.set_node(pos, new_node)
	end
end


--[[
-- Revert timer, used in node registration.
--]]

function gal.lib.poschange.change_node(pos, stomped_node_name, reverted_node_name)
	-- Check if the node is still the right one
	local node = minetest.get_node(pos)
	if (node.name ~= stomped_node_name) then return end
	-- Replace it while keeping param, param2 and other things
	node.name = reverted_node_name
	minetest.set_node(pos, node)
end

--[[
-- Node registration
--]]

--- Set the default values for a stomp_desc.
-- stomp_desc.dest_node_name must be set.
local function stomp_desc_defaults(source_node_name, stomp_desc)
	if not stomp_desc.chance then stomp_desc.chance = 1 end
	if not stomp_desc.source_node then
		stomp_desc.source_node = source_node_name
	end
	if not stomp_desc.priority then stomp_desc.priority = 100 end
	if stomp_desc.duration then
		stomp_desc.duration_min = stomp_desc.duration
		stomp_desc.duration_max = stomp_desc.duration
		stomp_desc.duration = nil
	end
	if not stomp_desc.priority then stomp_desc.priority = 100 end
	if not stomp_desc.name then
		stomp_desc.name = get_stomp_name(source_node_name, stomp_desc.dest_node_name)
	end
end

--- Register a footprinted version of a node
function gal.lib.poschange.register_footprints(node_name, stomp_desc)
	if type(node_name) == 'table' then
		-- Register all nodes from the table
		local names = {}
		for i, name in pairs(node_name) do
			table.insert(names, gal.lib.poschange.register_footprints(name, stomp_desc))
		end
		return names
	end
	-- Single node registration
	local desc = minetest.registered_nodes[node_name]
	if not desc then
		minetest.log('error', 'Trying to register footprints for unknow node ' .. node_name)
		return
	end
	local stomped_node_name = gal.lib.poschange.get_footprint_node_name(node_name)
	-- Use a copy of stomp desc to keep it unchanged outside the function
	local local_stomp_desc = table_copy(stomp_desc)
	local_stomp_desc.dest_node_name = stomped_node_name
	stomp_desc_defaults(node_name, local_stomp_desc)
	local stomped_node_desc = table_copy(desc)
	stomped_node_desc.description = desc.description .. ' With Footprint'
	-- Add footprint on top of the node texture
	local footprint_texture = 'poschangelib_footprint.png'
	if local_stomp_desc.footprint_texture then
		footprint_texture = local_stomp_desc.footprint_texture
	end
	if type(desc.tiles[1]) == 'table' then
		-- Replace top texture
		stomped_node_desc.tiles[1].name = desc.tiles[1].name .. '^' .. footprint_texture
	else
		-- Put footprints on top and keep the original texture for the rest
		stomped_node_desc.tiles[1] = desc.tiles[1] .. '^' .. footprint_texture
		stomped_node_desc.tiles[2] = desc.tiles[1]
	end
	-- Revert timer
	if local_stomp_desc.duration_min then
		if not desc.on_timer then
			stomped_node_desc.on_timer = function(pos, elapsed)
				gal.lib.poschange.change_node(pos, stomped_node_name, node_name)
			end
		end
		if desc.on_construct then
			stomped_node_desc.on_construct = function(pos)
				desc.on_construct(pos)
				minetest.get_node_timer(pos):start(math.random(local_stomp_desc.duration_min, local_stomp_desc.duration_max))
			end
		else
			stomped_node_desc.on_construct = function(pos) minetest.get_node_timer(pos):start(math.random(local_stomp_desc.duration_min, local_stomp_desc.duration_max)) end
		end
	end
	-- Drop the original node when dug
	if not desc.drop then
		stomped_node_desc.drop = node_name
	end
	-- Register
	minetest.register_node(stomped_node_name, stomped_node_desc)
	gal.lib.poschange.register_stomp(node_name, stomped_node_name, local_stomp_desc)
	-- Stomp to itself to reset the timer on restomp
	gal.lib.poschange.register_stomp(stomped_node_name, stomped_node_name, local_stomp_desc)
	return stomped_node_name
end

--- Register a stomped node that has a chance to be transformed from the source.
-- @param source_node_name The name of the node before it is stomped
-- @param stomp chance Inverted chance that the source node is stomped on walking.
-- One of X.
-- @param stomp_node_name The name of the node after it is stomped
function gal.lib.poschange.register_stomp(source_node_name, stomp_node_name, stomp_desc)
	if type(stomp_node_name) == 'function' and not stomp_desc.name then
		minetest.log('error', 'No stomp name given with a function for ' .. source_node_name)
		return
	end
	if type(source_node_name) == 'table' then
		for i, node_name in ipairs(source_node_name) do
			gal.lib.poschange.register_stomp(node_name, stomp_node_name, stomp_desc)
		end
		return
	end
	if not stomps[source_node_name] then
		stomps[source_node_name] = {}
	end
	local local_stomp_desc = table_copy(stomp_desc)
	local_stomp_desc.dest_node_name = stomp_node_name
	stomp_desc_defaults(source_node_name, local_stomp_desc)
	-- Insert in stomps
	local inserted = false
	local i = 1
	-- insert while keeping ascending priority order
	while i <= #stomps[source_node_name] and not inserted do
		if stomps[source_node_name][i].priority > local_stomp_desc.priority then
			table.insert(stomps[source_node_name], i, local_stomp_desc)
			inserted = true
		end
		i = i + 1
	end
	-- not inserted: there is no other stomp for this node, insert it.
	if not inserted then table.insert(stomps[source_node_name], local_stomp_desc) end
	gal.lib.poschange.add_player_walk_listener(local_stomp_desc.name, walk_listener, {source_node_name})
end

minetest.register_chatcommand('stomp', {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then return false, 'Player not found' end
		if not minetest.check_player_privs(player, {server=true}) then return false, 'Stomp requires server privileges' end
		local pos = player:getpos()
		local node_pos = {['x'] = pos.x, ['y'] = pos.y - 1, ['z'] = pos.z}
		local node = minetest.get_node(node_pos)
		local node_desc = minetest.registered_nodes[node.name]
		if not node_desc then return end -- unknown node
		if not stomps[node.name] or #stomps[node.name] == 0 then
			return false, 'No stomping data found for ' .. node.name
		elseif #stomps[node.name] > 1 then
			local num = tonumber(param)
			if num and num > 0 and num <= #stomps[node.name] then
				gal.lib.poschange.do_stomp(player, node_pos, node, node_desc, stomps[node.name][num])
				return true
			end
			local local_stomps = stomps[node.name]
			minetest.chat_send_player(name, 'Multiple stomping data found for ' .. node.name)
			minetest.chat_send_player(name, 'Use /stomp X to choose which one to trigger.')
			for i, v in ipairs(local_stomps) do
				minetest.chat_send_player(name, '  ' .. i .. ') ' .. local_stomps[i].name)
			end
			return false
		else
			gal.lib.poschange.do_stomp(player, node_pos, node, node_desc, stomps[node.name][1])
			return true			
		end
	end,
})

