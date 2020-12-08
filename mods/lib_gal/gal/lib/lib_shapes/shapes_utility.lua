

-----------------
-- DOORS HELPERS
-----------------

	function gal.lib.shapes.get(pos)
		local node_name = minetest.get_node(pos).name
		if gal.lib.shapes.registered_doors[node_name] then
			-- A normal upright door
			return {
				pos = pos,
				open = function(self, player)
					if self:state() then
						return false
					end
					return gal.lib.shapes.door_toggle(self.pos, nil, player)
				end,
				close = function(self, player)
					if not self:state() then
						return false
					end
					return gal.lib.shapes.door_toggle(self.pos, nil, player)
				end,
				toggle = function(self, player)
					return gal.lib.shapes.door_toggle(self.pos, nil, player)
				end,
				state = function(self)
					return minetest.get_node(self.pos).name:sub(-5) == "_open"
				end
			}
		else
			return nil
		end
	end
	function gal.lib.shapes.door_toggle(pos, node, clicker)
		node = node or minetest.get_node(pos)
		if clicker and not minetest.check_player_privs(clicker, "protection_bypass") then
			-- is player wielding the right key?
			local item = clicker:get_wielded_item()
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("doors_owner")
			if item:get_name() == "default:key" or item:get_name() == "lib_handtools:tool_key" then
				local key_meta = minetest.parse_json(item:get_metadata())
				local secret = meta:get_string("key_lock_secret")
				if secret ~= key_meta.secret then
					return false
				end
	
			elseif owner ~= "" then
				if clicker:get_player_name() ~= owner then
					return false
				end
			end
		end
	
		local def = minetest.registered_nodes[node.name]
	
		if string.sub(node.name, -5) == "_open" then
			minetest.sound_play(def.sound_close,
				{pos = pos, gain = 0.3, max_hear_distance = 10})
			minetest.swap_node(pos, {name = string.sub(node.name, 1,
				string.len(node.name) - 5), param1 = node.param1, param2 = node.param2})
		else
			minetest.sound_play(def.sound_open,
				{pos = pos, gain = 0.3, max_hear_distance = 10})
			minetest.swap_node(pos, {name = node.name .. "_open",
				param1 = node.param1, param2 = node.param2})
		end
	end
	local function can_dig_door(pos, digger)
		local digger_name = digger and digger:get_player_name()
		if digger_name and minetest.get_player_privs(digger_name).protection_bypass then
			return true
		end
		return minetest.get_meta(pos):get_string("doors_owner") == digger_name
	end
	local function on_place_node(place_to, newnode,
		placer, oldnode, itemstack, pointed_thing)
		-- Run script hook
		for _, callback in ipairs(minetest.registered_on_placenodes) do
			-- Deepcopy pos, node and pointed_thing because callback can modify them
			local place_to_copy = {x = place_to.x, y = place_to.y, z = place_to.z}
			local newnode_copy =
				{name = newnode.name, param1 = newnode.param1, param2 = newnode.param2}
			local oldnode_copy =
				{name = oldnode.name, param1 = oldnode.param1, param2 = oldnode.param2}
			local pointed_thing_copy = {
				type  = pointed_thing.type,
				above = vector.new(pointed_thing.above),
				under = vector.new(pointed_thing.under),
				ref   = pointed_thing.ref,
			}
			callback(place_to_copy, newnode_copy, placer,
				oldnode_copy, itemstack, pointed_thing_copy)
		end
	end

	
-----------------
-- LIGHTS HELPERS
-----------------

	function gal.lib.shapes.light_toggle(pos, node, clicker)
		node = node or minetest.get_node(pos)
	
		if string.sub(node.name, -4) == "_off" then
			minetest.swap_node(pos, {name = node.name .. "_on", param1 = node.param1, param2 = node.param2})
		else
			minetest.swap_node(pos, {name = node.name .. "_off",
				param1 = node.param1, param2 = node.param2})
		end
	end

-----------------
-- FURNITURE HELPERS
-----------------

-----------------
-- SITTABLE
-----------------

	local function top_face(pointed_thing)
		if not pointed_thing then return end
		return pointed_thing.above.y > pointed_thing.under.y
	end
	
	function gal.lib.shapes.sit(pos, node, clicker, pointed_thing)
		if not top_face(pointed_thing) then return end
		local player_name = clicker:get_player_name()
		local objs = minetest.get_objects_inside_radius(pos, 0.1)
		local vel = clicker:get_player_velocity()
		local ctrl = clicker:get_player_control()
	
		for _, obj in pairs(objs) do
			if obj:is_player() and obj:get_player_name() ~= player_name then
				return
			end
		end
	
		if gal.player.api.player_attached[player_name] then
			pos.y = pos.y - 0.5
			clicker:setpos(pos)
			clicker:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
			clicker:set_physics_override(1, 1, 1)
			gal.player.api.player_attached[player_name] = false
			gal.player.api.set_animation(clicker, "stand", 30)
	
		elseif not gal.player.api.player_attached[player_name] and node.param2 <= 3 and not
				ctrl.sneak and vel.x == 0 and vel.y == 0 and vel.z == 0 then
	
			clicker:set_eye_offset({x=0, y=-7, z=2}, {x=0, y=0, z=0})
			clicker:set_physics_override(0, 0, 0)
			clicker:setpos(pos)
			gal.player.api.player_attached[player_name] = true
			gal.player.api.set_animation(clicker, "sit", 30)
	
			if     node.param2 == 0 then clicker:set_look_yaw(3.15)
			elseif node.param2 == 1 then clicker:set_look_yaw(7.9)
			elseif node.param2 == 2 then clicker:set_look_yaw(6.28)
			elseif node.param2 == 3 then clicker:set_look_yaw(4.75) end
		end
	end
	
	function gal.lib.shapes.sit_dig(pos, player)
		local pname = player:get_player_name()
		local objs = minetest.get_objects_inside_radius(pos, 0.1)
	
		for _, p in pairs(objs) do
			if not player or not player:is_player() or p:get_player_name() or
					gal.player.api.player_attached[pname] then
				return false
			end
		end
		return true
	end

	
-----------------
-- LAYABLE / SLEEP / SPAWN
-----------------

	beds = {}
	beds.player = {}
	beds.bed_position = {}
	beds.pos = {}
	beds.spawn = {}
	
	beds.formspec = "size[8,11;true]" ..
		"no_prepend[]" ..
		"bgcolor[#080808BB;true]" ..
		"button_exit[2,10;4,0.75;leave;Leave Bed]"
	
	-- Load files
	dofile(gal.lib.shapes.path_mod .. "/beds_api.lua")
	dofile(gal.lib.shapes.path_mod .. "/beds_spawns.lua")









--[[
-----------------
-- MISCELLANEOUS HELPERS
-----------------

	function gal.lib.shapes.get_node_group(name, group)
	    if not minetest.registered_nodes[name] or not minetest.registered_nodes[name].groups[group] then
	        return 0
	    end
	    return minetest.registered_nodes[name]
	end
	
	
	function gal.lib.shapes.get_nodedef_field(nodename, fieldname)
		if not minetest.registered_items[nodename] then
			if not minetest.registered_items[nodename][fieldname] then
				return nil
			end
		end
		return minetest.registered_nodes[nodename][fieldname]
	end
	
	function gal.lib.shapes.get_item_groups(name, groups)
		if not minetest.registered_items[name] or not
				minetest.registered_items[name].groups[group] then
			return 0
		end
		return minetest.registered_items[name].groups[group]
	end
	
	
	--
	--function minetest.get_item_group(name, group)
	--	if not minetest.registered_items[name] or not
	--			minetest.registered_items[name].groups[group] then
	--		return 0
	--	end
	--	return minetest.registered_items[name].groups[group]
	--end
	--
--]]
