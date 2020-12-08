local enchanting3 = {}
screwdriver = screwdriver or {}

local tmp_crystal = {}
local tmp_item = {}
local max_objs = tonumber(minetest.setting_get("max_objects_per_block")) or 49
--local S = lib_tools.gettext
local S = lib_tools.intllib



-- Cost in Mese crystal(s) for enchanting.
local mese_cost = 1
local current_enchant = ""
local max_enchant = 65535

-- Force of the enchantments.
enchanting3.uses     = 1.2  -- Durability
enchanting3.times    = 0.1  -- Efficiency
enchanting3.damages  = 1    -- Sharpness
enchanting3.strength = 1.2  -- Armor strength (3d_armor only)
enchanting3.speed    = 0.2  -- Player speed (3d_armor only)
enchanting3.jump     = 0.2  -- Player jumping (3d_armor only)


-- the scroll for casting enchantments
minetest.register_tool("lib_tools:enchanting_wand", {
	description = S("Enchanting Scroll"),
	_doc_items_longdesc = S("A scroll to cast an enchantment on a tool or armor item."),
	_doc_items_usagehelp = S("Punch the Enchanting Stand to cast the scroll spell as an enchantment on the tool or armor item."),
	image           = "wand_mese.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			casting={maxlevel=3, uses=1, times={[1]=4.00}},
		},
	}
})

minetest.register_entity("lib_tools:slot_crystal", {
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.15, y = 0.15},
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
		
		self.object:set_properties({automatic_rotate = 1})
		
	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end

		return ""
	end,
})

minetest.register_entity("lib_tools:slot_item", {
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.50, y = 0.50},
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


	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end

		return ""
	end,
})

-- functions

local remove_tool = function(pos, node)
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y + anvil.setting.item_displacement, z = pos.z}, .5)
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "lib_tools:slot_item" then
				obj:remove()
			end
		end
	end
end

local remove_crystal = function(pos, node)
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y + anvil.setting.item_displacement, z = pos.z}, .5)
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "lib_tools:slot_crystal" then
				obj:remove()
			end
		end
	end

end


local update_tool = function(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if not inv:is_empty("tool") then
		remove_tool(pos, node)
		pos.y = pos.y + 0.75
		tmp_item.nodename = node.name
		tmp_item.texture = inv:get_stack("tool", 1):get_name()
		local e = minetest.add_entity(pos,"lib_tools:slot_item")
		pos.y = pos.y - 0.75
	else
		remove_tool(pos, node)
	end
end

local update_crystal = function(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if not inv:is_empty("mese") then
		remove_crystal(pos, node)
		pos.y = pos.y + 0.35
		tmp_crystal.nodename = node.name
		tmp_crystal.texture = inv:get_stack("mese", 1):get_name()
		local e = minetest.add_entity(pos,"lib_tools:slot_crystal")
		pos.y = pos.y - 0.35
		local yaw = math.pi*2 - node.param2 * math.pi/2
		e:setyaw(yaw)
	else
		remove_crystal(pos, node)
	end
end


local function allowed_tools(tool)
	if not tool then
		return
	end
	for item in pairs(minetest.registered_tools) do
		if item:find("enchanted_"..tool) then return true end
	end
	return false
end

local function allowed_crystals(crystal)
	if not crystal then
		return
	end
	for item in pairs(minetest.registered_craftitems) do
		if item:find(crystal) then
			return true
		end
	end
	return false
	-- if crystal == "mese_crystal" then
		-- return true
	-- end
	-- return false
end

--RENAME TO enchanting_altar
lib_tools.register("altar_of_enchanting", {
	description = "Altar Of Enchanting",
	_doc_items_longdesc = S("An altar for enchanting armor and tools in conjunction with a mese crystal and magic scroll."),
	_doc_items_usagehelp = S("Right-click on this enchantment_table with a mese crystal to enable enchanting.  Right click with an armor piece or tool to place the item upon it. You can then enchant the item by punching it with a scroll. Repeated punches may be necessary, depending on the enchantment, to fully an item. To retrieve the item either punch or right-click the anvil with an empty hand."),
	drawtype = "nodebox",
	tiles = {"altar_01_top.png",  "altar_01_top.png",
		 "altar_02_side.png", "altar_02_side.png",
		 "altar_02_side.png", "altar_02_side.png"},
	use_texture_alpha = true,
	paramtype = "light",
	post_effect_color = { r=128, g=128, b=128, a=128 },
	light_source = 0,
	groups = {cracky=1, level=1},
	sounds = lib_tools.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	can_dig = enchanting3.dig,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.125, 0.25}, -- NodeBox1
			{-0.5, 0, -0.0625, 0.5, 0.125, 0.0625}, -- NodeBox2
			{-0.0625, 0, -0.5, 0.0625, 0.125, 0.5}, -- NodeBox3
			{-0.5, 0.125, -0.0625, -0.4375, 0.5, 0.0625}, -- NodeBox4
			{-0.0625, 0.125, 0.4375, 0.0625, 0.5, 0.5}, -- NodeBox5
			{0.4375, 0.125, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox6
			{-0.0625, 0, -0.5, 0.0625, 0.5, -0.4375}, -- NodeBox7
		}
	},
	
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("infotext", "Enchantment Table")

		inv:set_size("tool", 1)
		inv:set_size("mese", 1)
	end,

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
	end,

	on_metadata_inventory_put = function(pos, listname, _, stack)

		if listname == "tool" then
		
			local tool_stackname = stack:get_name()
			local tool_groups = {
				"axe, pick, shovel, bow, arrow",
				"chestplate, leggings, helmet",
				"sword", "boots"
			}

			for idx, tools in pairs(tool_groups) do
				if tools:find(tool_stackname:match(":(%w+)")) then
					update_tool(pos, stack)
					
				end
			end
		end
		
		if listname == "mese" then

			-- local crystal_stackname = stack:get_name()
			-- local crystal_groups = {
				-- "crystal, diamond, shard"
			-- }

			-- for idx, crystals in pairs(crystal_groups) do
				-- if crystals:find(crystal_stackname:match(":(%w+)")) then
					update_crystal(pos, stack)
				-- end
			-- end
		end
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)

		if listname == "tool" then

			update_tool(pos, stack)
			
		end
		
		if listname == "mese" then

			update_crystal(pos, stack)

		end
	end,


	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		-- local item = stack:get_name():match("[^:]+$")
		-- if listname == "mese" then
			-- return stack:get_count()
		-- elseif listname == "tool" and allowed(item) then
			-- return 1 
		-- end
		-- return 0

		local item = stack:get_name():match("[^:]+$")
		local meta = minetest.get_meta(pos)

--		if listname=="tool" or listname=="mese" then
			if listname=='tool' then
				if not allowed_tools(item) then
					minetest.chat_send_player( player:get_player_name(), S('This enchanting table is for picks, axes, shovels, and armor type tools only.'))
					return 0
				end

				if meta:get_inventory():room_for_item("tool", stack) then
					return 1
				end
				return 0
			end
			if listname=='mese' then
				if not allowed_crystals(item) then
					minetest.chat_send_player( player:get_player_name(), S('You can only enchant items with a Mese Crystal, Mese Crystal Fragment, Diamond, or Obsidian Shard.'))
					minetest.chat_send_player( player:get_player_name(), S('Mese Crystal => Durable; Mese Crystal Fragment => Fast; Diamond => Strong; Obsidian Shard => Sharp'))
					minetest.chat_send_player( player:get_player_name(), S('For Picks, Axes, Shovels: Durable or Fast;     For Swords: Sharp'))
					minetest.chat_send_player( player:get_player_name(), S('For Chestplates, Helmets, Leggings: Strong;    For Boots: Strong or Fast,'))
					return 0
				end

				if meta:get_inventory():room_for_item("mese", stack) then
					return 1
				end				
				return 0
			end
--		end
		return 0

	end,

	allow_metadata_inventory_move = function()
		return 0
	end,

	can_dig = function(pos,player)
		local meta  = minetest.get_meta(pos)
		local inv   = meta:get_inventory()
	
		if not inv:is_empty("tool") then
			return false
		end
		if not inv:is_empty("mese") then
			return false
		end
		
		return true
	end,
	
	on_rightclick = function(pos, node, clicker, itemstack)

		local itemstack_count = itemstack:get_count()
	
		if itemstack:get_count() == 0 then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv:is_empty("tool") then
				local tool_return_stack = inv:get_stack("tool", 1)
				inv:set_stack("tool", 1, nil)
				local wield_index = clicker:get_wield_index()
				clicker:get_inventory():set_stack("main", wield_index, tool_return_stack)
				update_tool(pos, node)
				itemstack_count = itemstack_count + 1
				return tool_return_stack
			end		
		else
			local this_def = minetest.registered_nodes[node.name]
			if this_def.allow_metadata_inventory_put(pos, "tool", 1, itemstack:peek_item(), clicker) > 0 then
				local s = itemstack:take_item(1)
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				inv:add_item("tool", s)
				update_tool(pos,node)
			end
		end


		if itemstack:get_count() == 0 then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv:is_empty("mese") then
				local crystal_return_stack = inv:get_stack("mese", 1)
				inv:set_stack("mese", 1, nil)
				local wield_index = clicker:get_wield_index()
				clicker:get_inventory():set_stack("main", wield_index, crystal_return_stack)
				update_crystal(pos, node)
				return crystal_return_stack
			end	
		else
			local this_def = minetest.registered_nodes[node.name]
			if this_def.allow_metadata_inventory_put(pos, "mese", 1, itemstack:peek_item(), clicker) > 0 then
				local s = itemstack:take_item(1)
				local meta = minetest.get_meta(pos)
				local inv = meta:get_inventory()
				inv:add_item("mese", s)
				update_crystal(pos,node)
			end
		end
		return itemstack
	end,

	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end

		local wielded = puncher:get_wielded_item()
		local meta = minetest.get_meta(pos)
		local inv  = meta:get_inventory()
		
		--local tool = inv:get_stack("tool", 1)
		local input = inv:get_stack('tool',1)
		local mese = inv:get_stack("mese", 1)
		local orig_wear = input:get_wear()
		local tool_name = input:get_name()


		-- 65535 is max damage
		local enchant_state = 40-math.floor(max_enchant/1638)
	

		
		if wielded:get_count() == 0 then
			if not inv:is_empty("tool") then
				local return_stack = inv:get_stack("tool", 1)
				inv:set_stack("tool", 1, nil)
				local wield_index = puncher:get_wield_index()
				puncher:get_inventory():set_stack("main", wield_index, return_stack)
				update_tool(pos, node)
			end		
		end
		
		-- only punching with the hammer is supposed to work
		if wielded:get_name() ~= 'lib_tools:enchanting_wand' then
			return
		end
		
		-- only tools can be repaired
		if( not( input ) 
		or input:is_empty()
				or input:get_name() == "technic:water_can" 
				or input:get_name() == "technic:lava_can" ) then
			return
		end
	
		local hud2 = nil
		local hud3 = nil
		if( enchant_state>0 ) then
			hud2 = puncher:hud_add({
				hud_elem_type = "statbar",
				text = "default_cloud.png^[colorize:#ff0000:256",
				number = 40,
				direction = 0, -- left to right
				position = {x=0.5, y=0.65},
				alignment = {x = 0, y = 0},
				offset = {x = -320, y = 0},
				size = {x=32, y=32},
			})
			hud3 = puncher:hud_add({
				hud_elem_type = "statbar",
				text = "default_cloud.png^[colorize:#00ff00:256",
				number = enchant_state,
				direction = 0, -- left to right
				position = {x=0.5, y=0.65},
				alignment = {x = 0, y = 0},
				offset = {x = -320, y = 0},
				size = {x=32, y=32},
			})
		end

		minetest.after(2, function()
			if( puncher ) then
				puncher:hud_remove(hud2)
				puncher:hud_remove(hud3)
			end
		end)
	
		-- tell the player when the job is done
		if(   max_enchant <= 0 ) then
			local tool_desc
			if minetest.registered_items[tool_name] and minetest.registered_items[tool_name].description then
				tool_desc = minetest.registered_items[tool_name].description
			else
				tool_desc = tool_name
			end

			if not inv:is_empty("mese") then
				if mese:get_name():find("crystal") then
					if mese:get_name():find("fragment") then
						current_enchant = "fast"
					else
						current_enchant = "durable"
					end
				end

				if mese:get_name():find("diamond") then
					current_enchant = "strong"					
				end

				if mese:get_name():find("obsidian") then
					current_enchant = "sharp"						
				end
			end


			local mod, name = input:get_name():match("(.*):(.*)")
			local enchanted_tool = (mod or "")..":enchanted_"..(name or "").."_"..current_enchant

			--if mese_cost <= mese:get_count() and minetest.registered_tools[enchanted_tool] then
			minetest.sound_play("xdecor_enchanting", {to_player=puncher:get_player_name(), gain=0.8})
			--input:replace(enchanted_tool)
			input:take_item(1)
			input:add_item(enchanted_tool)
			input:add_wear(orig_wear)
			mese:take_item(mese_cost)
			inv:set_stack("mese", 1, mese)
			inv:set_stack("tool", 1, nil)
			remove_crystal(pos, node)
			update_tool(pos, node)
			current_enchant = ""
			max_enchant = 65535
			--end
			if (wielded:set_wear( 65535 )) then
				puncher:set_wielded_item( input )
			end
			
			minetest.chat_send_player( puncher:get_player_name(), S('Your @1 has been enchanted.', tool_desc))
		else
			pos.y = pos.y + 0.75
			minetest.sound_play({name="xdecor_enchanting"}, {pos=pos, gain=0.8})
			max_enchant = max_enchant - (65535/8)
			minetest.add_particlespawner({
				amount = 10,
				time = 0.1,
				minpos = pos,
				maxpos = pos,
				minvel = {x=2, y=3, z=2},
				maxvel = {x=-2, y=1, z=-2},
				minacc = {x=0, y= -10, z=0},
				maxacc = {x=0, y= -10, z=0},
				minexptime = 0.5,
				maxexptime = 1,
				minsize = 1,
				maxsize = 1,
				collisiondetection = true,
				vertical = false,
				texture = "xdecor_glyph"..math.random(1,18)..".png",
			})
			-- do the actual repair
			--input:add_wear( -5000 ) -- equals to what technic toolshop does in 5 seconds
			--inv:set_stack("input", 1, input)

			-- damage the hammer slightly
			wielded:add_wear( 65535/8 )
			--puncher:set_wielded_item( wielded )
			
			
		end
	
	end,
})


local function cap(S) return S:gsub("^%l", string.upper) end

function enchanting3:register_tools(mod, def)
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
			local enchanted_texture = original_tool.inventory_image.."^[colorize:violet:65"

			if enchant == "durable" then
				groupcaps[group].uses = math.ceil(original_groupcaps[group].uses * enchanting3.uses)
			elseif enchant == "fast" then
				for i, time in pairs(original_groupcaps[group].times) do
					groupcaps[group].times[i] = time - enchanting3.times
				end
			elseif enchant == "sharp" then
				fleshy = fleshy + enchanting3.damages
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
					armorcaps[armor_group] = math.ceil(value * enchanting3.strength)
				elseif enchant == "speed" then
					armorcaps[armor_group] = value
					armorcaps.physics_speed = enchanting3.speed
					armorcaps.physics_jump = enchanting3.jump
				end
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image.."^[colorize:violet:50",
				texture = "3d_armor_"..tool.."_"..material,
				wield_image = original_tool.wield_image,
				groups = armorcaps,
				wear = 0
			})
		end

		if mod == "armor_additions" then
			local original_armor_groups = original_tool.groups
			local armorcaps = {}
			armorcaps.not_in_creative_inventory = 1

			for armor_group, value in pairs(original_armor_groups) do
				if enchant == "strong" then
					armorcaps[armor_group] = math.ceil(value * enchanting3.strength)
				elseif enchant == "speed" then
					armorcaps[armor_group] = value
					armorcaps.physics_speed = enchanting3.speed
					armorcaps.physics_jump = enchanting3.jump
				end
			end

			minetest.register_tool(":"..mod..":enchanted_"..tool.."_"..material.."_"..enchant, {
				description = "Enchanted "..cap(material).." "..cap(tool).." ("..cap(enchant)..")",
				inventory_image = original_tool.inventory_image.."^[colorize:violet:50",
				texture = "armor_additions_"..tool.."_"..material,
				wield_image = original_tool.wield_image,
				groups = armorcaps,
				wear = 0
			})
		end
	end
	end
	end
end

enchanting3:register_tools("default", {
	materials = "steel, bronze, mese, diamond",
	tools = {
		axe    = {enchants = "durable, fast"},
		pick   = {enchants = "durable, fast"}, 
		shovel = {enchants = "durable, fast"},
		sword  = {enchants = "sharp"}
	}
})

			-- enchanting3:register_tools("bows", {
				-- materials = "steel, bronze, mese, diamond, obsidian",
				-- tools = {
					-- bow    = {enchants = "durable, fast"}
				-- }
			-- })

			-- enchanting3:register_tools("bows", {
				-- materials = "steel, gold, mese, diamond",
				-- tools = {
					-- arrow  = {enchants = "sharp"}
				-- }
			-- })


enchanting3:register_tools("3d_armor", {
	materials = "steel, bronze, gold, diamond",
	tools = {
		boots      = {enchants = "strong, speed"},
		chestplate = {enchants = "strong"},
		helmet     = {enchants = "strong"},
		leggings   = {enchants = "strong"}
	}
})

enchanting3:register_tools("armor_additions", {
	materials = "carbon, carbonfiber, cast, stainless, wrought, obsidian, chainmail, studded",
	tools = {
		boots      = {enchants = "strong, speed"},
		chestplate = {enchants = "strong"},
		helmet     = {enchants = "strong"},
		leggings   = {enchants = "strong"}
	}
})

