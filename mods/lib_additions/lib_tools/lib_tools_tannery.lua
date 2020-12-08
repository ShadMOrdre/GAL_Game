
screwdriver = screwdriver or {}

local tmp = {}
local max_objs = tonumber(minetest.setting_get("max_objects_per_block")) or 49

local S = lib_tools.intllib

-- item entity

minetest.register_entity("lib_tools:tanning_entity",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.375, y = 0.375},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)

		if (mobs and mobs.entity and mobs.entity == false)
		or not self then
			self.object:remove()
			return
		end

		if tmp.nodename ~= nil
		and tmp.texture ~= nil then

			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil
			and staticdata ~= "" then

				local data = staticdata:split(';')

				if data and data[1] and data[2] then

					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end

		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end

	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end

		return ""
	end,
})

local facedir = {}

facedir[0] = {x = 0, y = 0, z = 1}
facedir[1] = {x = 1, y = 0, z = 0}
facedir[2] = {x = 0, y = 0, z = -1}
facedir[3] = {x = -1, y = 0, z = 0}

-- functions

local remove_item = function(pos, node)

	local objs = nil

	if node.name == "lib_tools:tanning_rack" then

		pos.y = pos.y + 0.0625
		objs = minetest.get_objects_inside_radius(pos, 0.5)
		pos.y = pos.y - 0.0625
	end

	if objs then

		for _, obj in pairs(objs) do

			if obj and obj:get_luaentity()
			and obj:get_luaentity().name == "lib_tools:tanning_entity" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)

	remove_item(pos, node)

	local meta = minetest.get_meta(pos)
if not meta then return end
	if meta:get_string("item") ~= "" then


		pos.y = pos.y + 0.0625

		tmp.nodename = node.name
		tmp.texture = ItemStack(meta:get_string("item")):get_name()

		local e = minetest.add_entity(pos,"lib_tools:tanning_entity")

	end
end

local drop_item = function(pos, node, metadata)

	local meta = metadata or minetest.get_meta(pos)
if not meta then return end
	local item = meta:get_string("item")

	meta:set_string("item", "")

	if item ~= "" then

		if node.name == "lib_tools:tanning_rack" then

			pos.y = pos.y + 0.0625
			minetest.add_item(pos, item)
			pos.y = pos.y - 0.0625
		end

		remove_item(pos, node)

	end

end

-- nodes


minetest.register_node("lib_tools:tanning_rack",{
	description = S("Tanning Rack"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, -0.375, -0.4375, 0.25}, -- bottom left foot
			{-0.4375, -0.4375, -0.0625, -0.375, 0.5, 0.0625}, -- left pillar
			{0.375, -0.5, -0.25, 0.5, -0.4375, 0.25}, -- bottom right foot
			{0.375, -0.4375, -0.0625, 0.4375, 0.5, 0.0625}, -- right pillar
			{-0.4375, -0.375, -0.0625, 0.4375, -0.3125, 0.0625}, -- bottom cross
			{-0.4375, 0.4375, -0.0625, 0.4375, 0.5, 0.0625}, -- top cross
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, -0.4375, 0.25},
			{-0.4375, -0.4375, -0.0625, 0.4375, 0.5, 0.0625},
		}
	},
	tiles = {"default_tree.png"},
	paramtype = "light",
	groups = {cracky = 3},
	sounds = lib_tools.node_sound_defaults(),
	on_rotate = screwdriver.disallow,

	after_place_node = function(pos, placer, itemstack)

		local meta = minetest.get_meta(pos)

		meta:set_string("infotext","Tanning Rack (right-click to add/remove item)")
	end,

	on_rightclick = function(pos, node, clicker, itemstack)

		if not itemstack
		or minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)
if not meta then return end
		if meta:get_string("item") ~= "" then

			drop_item(pos, node, meta)
		else

			local wielded = clicker:get_wielded_item()
			-- only punching with the hammer is supposed to work
			if not (string.find(wielded:get_name(), "animal_skin") or (string.find(wielded:get_name(), "mobs") and string.find(wielded:get_name(), "leather"))) then
				return
			end
			
			
			local s = itemstack:take_item()

			meta:set_string("item", s:to_string())

			update_item(pos, node)

			return itemstack
		end
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos))
	end,

	on_punch = function(pos, node, puncher)
		update_item(pos, node)
	end,

	on_blast = function(pos, intensity)

		drop_item(pos, minetest.get_node(pos))

		minetest.add_item(pos, {name = "lib_tools:tanning_rack"})

		minetest.remove_node(pos)
	end,
})


-- automatically restore entities lost from frames/pedestals
-- due to /clearobjects or similar
--[[
minetest.register_abm({
	nodenames = {"lib_tools:tanning_rack"},
	interval = 15,
	chance = 1,
	catch_up = false,

	action = function(pos, node, active_object_count, active_object_count_wider)

		if active_object_count >= max_objs then
			return
		end

		local num

		if node.name == "lib_tools:display_frame" or node.name == "lib_tools:display_case" then
			num = #minetest.get_objects_inside_radius(pos, 0.5)

		elseif node.name == "lib_tools:display_stand" then

			pos.y = pos.y + 1
			num = #minetest.get_objects_inside_radius(pos, 0.5)
			pos.y = pos.y - 1
		end

		if num > 0 then
			return
		end

		update_item(pos, node)
	end
})
--]]
-- crafts

minetest.register_craft({
	output = 'lib_tools:tanning_rack',
	recipe = {
		{'default:stick', '', 'default:stick'},
		{'default:stick', 'default:stick', 'default:stick'},
		{'default:stick', '', 'default:stick'},
	}
})


-- stop mesecon pistons from pushing itemframe and pedestals
if minetest.get_modpath("mesecons_mvps") then
	mesecon.register_mvps_stopper("lib_tools:display_frame")
	mesecon.register_mvps_stopper("lib_tools:display_stand")
end
