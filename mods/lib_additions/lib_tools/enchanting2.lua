local enchanting2 = {}
screwdriver = screwdriver or {}

local tmp_crystal = {}
local tmp_item = {}
local tmp_book = {}
local max_objs = tonumber(minetest.setting_get("max_objects_per_block")) or 49

-- Cost in Mese crystal(s) for enchanting.
local mese_cost = 1

-- Force of the enchantments.
enchanting2.uses     = 1.2  -- Durability
enchanting2.times    = 0.1  -- Efficiency
enchanting2.damages  = 1    -- Sharpness
enchanting2.strength = 1.2  -- Armor strength (3d_armor only)
enchanting2.speed    = 0.2  -- Player speed (3d_armor only)
enchanting2.jump     = 0.2  -- Player jumping (3d_armor only)

minetest.register_entity("lib_tools:slot_crystal", {
	hp_max = 1,
	drawtype = "nodebox",
	visual_size={x = 0.33, y = 0.33},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.495, 0.5}, -- z_axis
		}
	},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)

		if (mobs and mobs.entity and mobs.entity == false)
		or not self then
			self.object:remove()
			return
		end

		if tmp_crystal.nodename ~= nil
		and tmp_crystal.texture ~= nil then

			self.nodename = tmp_crystal.nodename
			tmp_crystal.nodename = nil
			self.texture = tmp_crystal.texture
			tmp_crystal.texture = nil
			self.nodebox = tmp_crystal.nodebox
			tmp_crystal.nodebox = nil
		else
			if staticdata ~= nil
			and staticdata ~= "" then

				local data = staticdata:split(';')

				if data and data[1] and data[2] then

					self.nodename = data[1]
					self.texture = data[2]
					self.nodebox = data[3]
				end
			end
		end

		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end
		
		if self.nodebox ~= nil then
			self.object:set_properties({nodebox = {self.nodebox}})
		end

		if self.nodename == "lib_tools:enchantment_table2" then
			self.object:set_properties({automatic_rotate = 1})
		end

	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil
		and self.nodebox ~= nil then
			return self.nodename .. ';' .. self.texture .. ';' .. self.nodebox
		end

		return ""
	end,
})

minetest.register_entity("lib_tools:slot_item", {
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.33, y = 0.33},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)

		if (mobs and mobs.entity and mobs.entity == false)
		or not self then
			self.object:remove()
			return
		end

		if tmp_item.nodename ~= nil
		and tmp_item.texture ~= nil then

			self.nodename = tmp_item.nodename
			tmp_item.nodename = nil
			self.texture = tmp_item.texture
			tmp_item.texture = nil
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

		if self.nodename == "lib_tools:enchantment_table2" then
			self.object:set_properties({automatic_rotate = 1})
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

	if node.name == "lib_tools:enchantment_table2" then

		pos.y = pos.y + 1
		objs = minetest.get_objects_inside_radius(pos, 0.5)
		pos.y = pos.y - 1
	end

	if objs then

		for _, obj in pairs(objs) do

			if obj and obj:get_luaentity()
			and (obj:get_luaentity().name == "lib_tools:slot_crystal" or obj:get_luaentity().name == "lib_tools:slot_item" or obj:get_luaentity().name == "lib_tools:book_open2") then
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

		if node.name == "lib_tools:enchantment_table2" then
			pos.y = pos.y + 12 / 16 + 0.33
		end

		tmp_crystal.nodename = node.name
		tmp_crystal.texture = ItemStack(meta:get_string("item")):get_name()
		tmp_item.nodename = node.name
		tmp_item.texture = ItemStack(meta:get_string("item")):get_name()
		tmp_book.nodename = node.name
		tmp_book.texture = ItemStack(meta:get_string("item")):get_name()

		local e_crystal = minetest.add_entity(pos,"lib_tools:slot_crystal")
		local e_item = minetest.add_entity(pos,"lib_tools:slot_item")
		local e_book = minetest.add_entity(pos,"lib_tools:book_open2")

		local yaw_crystal = math.pi * 2 - node.param2 * math.pi / 2
		e_crystal:setyaw(yaw_crystal)

		local yaw_item = (math.pi * 2 - node.param2 * math.pi / 2) + (math.pi/2)
		e_item:setyaw(yaw_item)

		local yaw_book = (math.pi * 2 - node.param2 * math.pi / 2) + (math.pi/2)
		e_book:setyaw(yaw_book)

	end
end

local drop_item = function(pos, node, metadata)

	local meta = metadata or minetest.get_meta(pos)
if not meta then return end
	local item = meta:get_string("item")

	meta:set_string("item", "")

	if item ~= "" then

		if node.name == "lib_tools:enchantment_table2" then

			pos.y = pos.y + 1
			minetest.add_item(pos, item)
			pos.y = pos.y - 1
		end

		remove_item(pos, node)

	end

end



function enchanting2.formspec(pos, num)
	local meta = minetest.get_meta(pos)
	
	-- local formspec = [[ size[9,9;]
			-- bgcolor[#080808BB;true]
			-- background[0,0;9,9;ench_ui.png]
			-- list[context;tool;0.9,2.9;1,1;]
			-- list[context;mese;2,2.9;1,1;]
			-- list[current_player;main;0.5,4.5;8,4;]
			-- image[2,2.9;1,1;mese_layout.png]
			-- tooltip[sharp;Your weapon inflicts more damages]
			-- tooltip[durable;Your tool last longer]
			-- tooltip[fast;Your tool digs faster]
			-- tooltip[strong;Your armor is more resistant]
			-- tooltip[speed;Your speed is increased] ]]
			-- ..default.gui_slots..default.get_hotbar_bg(0.5,4.5)

	-- local enchant_buttons = {
		-- [[ image_button[3.9,0.85;4,0.92;bg_btn.png;fast;Efficiency]
		-- image_button[3.9,1.77;4,1.12;bg_btn.png;durable;Durability] ]],
		-- "image_button[3.9,0.85;4,0.92;bg_btn.png;strong;Strength]",
		-- "image_button[3.9,2.9;4,0.92;bg_btn.png;sharp;Sharpness]",
		-- [[ image_button[3.9,0.85;4,0.92;bg_btn.png;strong;Strength]
		-- image_button[3.9,1.77;4,1.12;bg_btn.png;speed;Speed] ]]
	-- }
	
	--formspec = formspec..(enchant_buttons[num] or "")
	--meta:set_string("formspec", formspec)
end

function enchanting2.on_put(pos, listname, _, stack)
	if listname == "tool" then
		local stackname = stack:get_name()
		local tool_groups = {
			"axe, pick, shovel",
			"chestplate, leggings, helmet",
			"sword", "boots"
		}

		for idx, tools in pairs(tool_groups) do
			if tools:find(stackname:match(":(%w+)")) then
				enchanting2.formspec(pos, idx)
				--minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "lib_tools:slot_crystal")
				update_item(pos, stack)
				
			end
		end
	end
end

function enchanting2.fields(pos, _, fields, sender)
	if fields.quit then return end
	local inv = minetest.get_meta(pos):get_inventory()
	local tool = inv:get_stack("tool", 1)
	local mese = inv:get_stack("mese", 1)
	local orig_wear = tool:get_wear()
	local mod, name = tool:get_name():match("(.*):(.*)")
	local enchanted_tool = (mod or "")..":enchanted_"..(name or "").."_"..next(fields)

	if mese:get_count() >= mese_cost and minetest.registered_tools[enchanted_tool] then
		minetest.sound_play("xdecor_enchanting", {to_player=sender:get_player_name(), gain=0.8})
		tool:replace(enchanted_tool)
		tool:add_wear(orig_wear)
		mese:take_item(mese_cost)
		inv:set_stack("mese", 1, mese)
		inv:set_stack("tool", 1, tool)
	end
end

function enchanting2.dig(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	return inv:is_empty("tool") and inv:is_empty("mese")
end

local function allowed(tool)
	for item in pairs(minetest.registered_tools) do
		if item:find("enchanted_"..tool) then return true end
	end
	return false
end

function enchanting2.put(_, listname, _, stack)
	local item = stack:get_name():match("[^:]+$")
	if listname == "mese" and item == "mese_crystal" then
		return stack:get_count()
	elseif listname == "tool" and allowed(item) then
		return 1 
	end
	return 0
end

function enchanting2.on_take(pos, listname)
	if listname == "tool" then
		enchanting2.formspec(pos, nil)
		update_item(pos, "lib_tools:book_open2")
	end
end

function enchanting2.construct(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", "Enchantment Table")
	--enchanting2.formspec(pos, nil)
	enchanting2.formspec(pos, 0)

	local inv = meta:get_inventory()
	inv:set_size("tool", 1)
	inv:set_size("mese", 1)

	--minetest.add_entity({x=pos.x, y=pos.y+1.0, z=pos.z}, "lib_tools:book_open2")
	update_item(pos, "lib_tools:book_open2")
	local timer = minetest.get_node_timer(pos)
	timer:start(5.0)
end

function enchanting2.destruct(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				(obj:get_luaentity().name == "lib_tools:slot_crystal" or obj:get_luaentity().name == "lib_tools:slot_item" or obj:get_luaentity().name == "lib_tools:book_open2") then
			--obj:remove() break
			update_item(pos, obj)
		end
	end
end

function enchanting2.timer(pos)
	local node = minetest.get_node(pos)
	local num = #minetest.get_objects_inside_radius(pos, 0.9)

	if num == 0 then
		--minetest.add_entity({x=pos.x, y=pos.y+1.0, z=pos.z}, "lib_tools:book_open2")
		update_item(pos, "lib_tools:book_open2")

	end

	local minp = {x=pos.x-2, y=pos.y, z=pos.z-2}
	local maxp = {x=pos.x+2, y=pos.y+1, z=pos.z+2}
	local bookshelves = minetest.find_nodes_in_area(minp, maxp, "default:bookshelf")
	if #bookshelves == 0 then return true end

	local bookshelf_pos = bookshelves[math.random(1, #bookshelves)]
	local x = pos.x - bookshelf_pos.x
	local y = bookshelf_pos.y - pos.y
	local z = pos.z - bookshelf_pos.z

	if tostring(x..z):find(2) then
		minetest.add_particle({
			pos = bookshelf_pos,
			velocity = {x=x, y=2-y, z=z},
			acceleration = {x=0, y=-2.2, z=0},
			expirationtime = 1,
			size = 2,
			texture = "xdecor_glyph"..math.random(1,18)..".png"
		})
	end
	return true
end

lib_tools.register("enchantment_table2", {
	description = "Enchantment Table",
	tiles = {"xdecor_enchantment_top.png^mese_layout.png",  "xdecor_enchantment_bottom.png",
		 "xdecor_enchantment_side.png", "xdecor_enchantment_side.png",
		 "xdecor_enchantment_side.png", "xdecor_enchantment_side.png"},
	groups = {cracky=1, level=1},
	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	can_dig = enchanting2.dig,
	on_timer = enchanting2.timer,
	on_construct = enchanting2.construct,
	on_destruct = enchanting2.destruct,
	on_rightclick = function(pos, node, clicker, itemstack)

		if not itemstack
		or minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)
		if not meta then
			return
		end
		if meta:get_string("item") ~= "" then

			drop_item(pos, node, meta)
		else
			local s = itemstack:take_item()

			meta:set_string("item", s:to_string())

			update_item(pos, node)

			return itemstack
		end
	end,
	on_receive_fields = enchanting2.fields,
	on_metadata_inventory_put = enchanting2.on_put,
	on_metadata_inventory_take = enchanting2.on_take,
	allow_metadata_inventory_put = enchanting2.put,
	allow_metadata_inventory_move = function()
		return 0
	end,

})

minetest.register_entity("lib_tools:book_open2", {
	visual = "wielditem",
	visual_size = {x=0.5, y=0.5},
	collisionbox = {0},
	physical = false,
	textures = {"xdecor_book_open.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}

		if minetest.get_node(pos_under).name ~= "lib_tools:enchantment_table2" then
			self.object:remove()
		end

		if tmp_book.nodename ~= nil
		and tmp_book.texture ~= nil then

			self.nodename = tmp_book.nodename
			tmp_book.nodename = nil
			self.texture = tmp_book.texture
			tmp_book.texture = nil
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

		if self.nodename == "lib_tools:enchantment_table2" then
			self.object:set_properties({automatic_rotate = 1})
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


local function cap(S) return S:gsub("^%l", string.upper) end

function enchanting2:register_tools(mod, def)
	for tool in pairs(def.tools) do
	for material in def.materials:gmatch("[%w_]+") do
	for enchant in def.tools[tool].enchants:gmatch("[%w_]+") do
		local original_tool = minetest.registered_tools[mod..":"..tool.."_"..material]
		if not original_tool then return end

		if original_tool.tool_capabilities then
			local original_damage_groups = original_tool.tool_capabilities.damage_groups
			local original_groupcaps = original_tool.tool_capabilities.groupcaps
			local groupcaps = table.copy(original_groupcaps)
			local fleshy = original_damage_groups.fleshy
			local full_punch_interval = original_tool.tool_capabilities.full_punch_interval
			local max_drop_level = original_tool.tool_capabilities.max_drop_level
			local group = next(original_groupcaps)

			if enchant == "durable" then
				groupcaps[group].uses = math.ceil(original_groupcaps[group].uses * enchanting2.uses)
			elseif enchant == "fast" then
				for i, time in pairs(original_groupcaps[group].times) do
					groupcaps[group].times[i] = time - enchanting2.times
				end
			elseif enchant == "sharp" then
				fleshy = fleshy + enchanting2.damages
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image.."^[colorize:violet:50",
				wield_image = original_tool.wield_image,
				groups = {not_in_creative_inventory=1},
				tool_capabilities = {
					groupcaps = groupcaps, damage_groups = {fleshy = fleshy},
					full_punch_interval = full_punch_interval, max_drop_level = max_drop_level
				}
			})
		end

		if mod == "3d_armor" then
			local original_armor_groups = original_tool.groups
			local armorcaps = {}
			armorcaps.not_in_creative_inventory = 1

			for armor_group, value in pairs(original_armor_groups) do
				if enchant == "strong" then
					armorcaps[armor_group] = math.ceil(value * enchanting2.strength)
				elseif enchant == "speed" then
					armorcaps[armor_group] = value
					armorcaps.physics_speed = enchanting2.speed
					armorcaps.physics_jump = enchanting2.jump
				end
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image,
				texture = "3d_armor_"..tool.."_"..material,
				wield_image = original_tool.wield_image,
				groups = armorcaps,
				wear = 0
			})
		end
	end
	end
	end
end

enchanting2:register_tools("default", {
	materials = "steel, bronze, mese, diamond",
	tools = {
		axe    = {enchants = "durable, fast"},
		pick   = {enchants = "durable, fast"}, 
		shovel = {enchants = "durable, fast"},
		sword  = {enchants = "sharp"}
	}
})

enchanting2:register_tools("3d_armor", {
	materials = "steel, bronze, gold, diamond",
	tools = {
		boots      = {enchants = "strong, speed"},
		chestplate = {enchants = "strong"},
		helmet     = {enchants = "strong"},
		leggings   = {enchants = "strong"}
	}
})

