

local S = lib_handtools.intllib



-- TEPORARY:  TO BE MOVED TO APPROPRIATE LOCATION
minetest.register_craftitem("lib_handtools:mineral_silex", {
	description = "Mineral - Silex",
	inventory_image = "lib_materials_tool_rock_silex.png",
})
	

-----------------
-- TOOLS
-----------------

	
--ROCKS and STONE

	minetest.register_tool("lib_handtools:tool_rock", {
		--description = S("Tool - Rock"),
		original_description = S("Tool - Rock"),
		description = toolranks.create_description("Tool - Rock", 0, 1),
	
		_doc_items_longdesc = S("Rock tools are used to hit things. Can be used to craft more refined rock tools."),
		_doc_items_usagehelp = S("Use rocks to hit things. Can be used to craft more refined rock tools."),
		inventory_image = "lib_materials_tool_rock.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				chippy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_rock_biface", {
		--description = S("Tool - Biface Rock"),
		original_description = S("Tool - Biface Rock"),
		description = toolranks.create_description("Tool - Biface Rock", 0, 1),
	
		_doc_items_longdesc = S("Tool - Biface Rock."),
		_doc_items_usagehelp = S("Tool - Biface Rock. Used to carve sticks, and to craft stone tools."),
		inventory_image = "lib_materials_tool_rock_biface.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_rock_chipper", {
		--description = S("Tool - Stone Chipper"),
		original_description = S("Tool - Stone Chipper"),
		description = toolranks.create_description("Tool - Stone Chipper", 0, 1),
	
		_doc_items_longdesc = S("Stone Chipper."),
		_doc_items_usagehelp = S("Stone Chipper."),
		inventory_image = "lib_materials_tool_rock_chipper.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_rock_flint", {
		--description = S("Tool - Flint"),
		original_description = S("Tool - Flint"),
		description = toolranks.create_description("Tool -  Flint", 0, 1),
	
		_doc_items_longdesc = S("Tool - Flint."),
		_doc_items_usagehelp = S("Tool - Flint."),
		inventory_image = "lib_materials_tool_rock_flint.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_rock_silex", {
		--description = S("Tool - Silex"),
		original_description = S("Tool - Silex"),
		description = toolranks.create_description("Tool - Silex", 0, 1),
	
		inventory_image = "lib_materials_tool_rock_silex.png",
		tool_capabilities = {
			max_drop_level=0,
			groupcaps={
				choppy={times={[1]=3.20, [2]=1.20, [3]=0.60}, uses=20, maxlevel=1},
				fleshy={times={[2]=1.00, [3]=0.60}, uses=30, maxlevel=1},
				crumbly={times={[1]=1.70, [2]=0.70, [3]=0.50}, uses=10, maxlevel=1},
				oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0, maxlevel=3},
			},
			damage_groups = {fleshy=2}
		},
	
		after_use = toolranks.new_afteruse,
	
	})
	
--
--STICKS AND RODS
--

	minetest.register_tool("lib_handtools:tool_stick", {
		--description = S("Tool - Stick"),
		original_description = S("Tool - Stick"),
		description = toolranks.create_description("Stick", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_stick.png",
		wield_image = "lib_materials_tool_stick.png^[transformFX",
		groups = {flammable = 2, stick = 2, wood = 3, tool = 3, wood_stick = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_rod_wood", {
		--description = S("Wooden Rod"),
		original_description = S("Tool - Wooden Rod"),
		description = toolranks.create_description("Wooden Rod", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_rod_wood.png",
		wield_image = "lib_materials_tool_rod_wood.png^[transformFX",
		groups = {flammable = 2, rod = 1, wood = 1, tool = 1, wood_rod = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_rod_iron", {
		--description = S("Iron Rod"),
		original_description = S("Tool - Iron Rod"),
		description = toolranks.create_description("Iron Rod", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_rod_iron.png",
		wield_image = "lib_materials_tool_rod_iron.png^[transformFX",
		groups = {rod = 1, iron = 1, tool = 1, iron_rod = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_rod_short_steel", {
		--description = S("Short Steel Rod"),
		original_description = S("Tool - Short Steel Rod"),
		description = toolranks.create_description("Short Steel Rod", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_rod_short_steel.png",
		wield_image = "lib_materials_tool_rod_short_steel.png^[transformFX",
		groups = {rod = 1, short_steel = 1, tool = 1, short_steel_rod = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_rod_steel", {
		--description = S("Steel Rod"),
		original_description = S("Tool - Steel Rod"),
		description = toolranks.create_description("Steel Rod", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_rod_steel.png",
		wield_image = "lib_materials_tool_rod_steel.png^[transformFX",
		groups = {rod = 1, steel = 1, tool = 1, steel_rod = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_rod_steel_carbon", {
		--description = S("Carbon Steel Rod"),
		original_description = S("Tool - Carbon Steel Rod"),
		description = toolranks.create_description("Carbon Steel Rod", 0, 1),
	
		_doc_items_longdesc = S("Stick for making things."),
		_doc_items_usagehelp = S("Use this stick to make other items."),
		inventory_image = "lib_materials_tool_rod_steel_carbon.png",
		wield_image = "lib_materials_tool_rod_steel_carbon.png^[transformFX",
		groups = {rod = 1, steel_carbon = 1, tool = 1, steel_carbon_rod = 1},
		sound = {breaks = "default_tool_breaks"},
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
--
-- KNIVES
--
	
	minetest.register_tool("lib_handtools:tool_knife_flint", {
		--description = S("Flint Knife"),
		original_description = S("Flint Knife"),
		description = toolranks.create_description("Flint Knife", 0, 1),
	
		inventory_image = "lib_materials_tool_knife_flint.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_knife_ebony", {
		--description = S("Ebony Knife"),
		original_description = S("Ebony Knife"),
		description = toolranks.create_description("Ebony Knife", 0, 1),
	
		inventory_image = "lib_materials_tool_knife_ebony.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_knife_obsidian", {
		--description = S("Obsidian Knife"),
		original_description = S("Obsidian Knife"),
		description = toolranks.create_description("Obsidian Knife", 0, 1),
	
		inventory_image = "lib_materials_tool_knife_obsidian_dagger.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_knife_silver", {
		--description = S("Silver Knife"),
		original_description = S("Silver Knife"),
		description = toolranks.create_description("Silver Knife", 0, 1),
	
		inventory_image = "lib_materials_tool_knife_silver_dagger.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_knife_steel", {
		--description = S("Steel Knife"),
		original_description = S("Steel Knife"),
		description = toolranks.create_description("Steel Knife", 0, 1),
	
		inventory_image = "lib_materials_tool_knife_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

--
-- IGNITERS
--

	minetest.register_tool("lib_handtools:tool_fire_sticks", {
		description = "Fire Sticks",
		inventory_image = "lib_materials_tool_fire_sticks.png",
		sound = {breaks = "default_tool_breaks"},
	
		on_use = function(itemstack, user, pointed_thing)
			local sound_pos = pointed_thing.above or user:get_pos()
			minetest.sound_play(
				"fire_sticks",
				{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
			)
			local player_name = user:get_player_name()
			if pointed_thing.type == "node" then
				local node_under = minetest.get_node(pointed_thing.under).name
				local nodedef = minetest.registered_nodes[node_under]
				if not nodedef then
					return
				end
				if minetest.is_protected(pointed_thing.under, player_name) then
					minetest.chat_send_player(player_name, "This area is protected")
					return
				end
		--		if nodedef.on_ignite then
		--			nodedef.on_ignite(pointed_thing.under, user)
		--		elseif minetest.get_item_group(node_under, "flammable") >= 1
		--				and minetest.get_node(pointed_thing.above).name == "air" then
		--			minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
		--		end
				if node_under == "lib_handtools:campfire_unlit" then
					if minetest.get_node(pointed_thing.above).name == "air" then
						--minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
						--minetest.env:add_node(pointed_thing.under, {name="stoneage:bonfire"})
						--lib_handtools:bonfire
						minetest.set_node(pointed_thing.under, {name = "lib_handtools:campfire"})
					end
				end
			end
			if not (creative and creative.is_enabled_for
					and creative.is_enabled_for(player_name)) then
				-- Wear tool
				local wdef = itemstack:get_definition()
				itemstack:add_wear(2000)
				-- Tool break sound
				if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
					minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
				end
			end
			return itemstack
		end
	})


	minetest.register_tool("lib_handtools:tool_rock_silex_stone_striker", {
		description = "Tool - Stone Fire Striker",
		inventory_image = "lib_materials_tool_rock_silex_stone_striker.png",
		stack_max = 1,
		groupcaps={
			ignity={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		on_use = function(itemstack, user, pointed_thing)
			local sound_pos = pointed_thing.above or user:get_pos()
			minetest.sound_play(
				"fire_flint_and_steel",
				{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
			)
			local player_name = user:get_player_name()
			if pointed_thing.type == "node" then
				local node_under = minetest.get_node(pointed_thing.under).name
				local nodedef = minetest.registered_nodes[node_under]
				if not nodedef then
					return
				end
				if minetest.is_protected(pointed_thing.under, player_name) then
					minetest.chat_send_player(player_name, "This area is protected")
					return
				end
				if node_under == "lib_handtools:bonfire_unlit" then
					if minetest.get_node(pointed_thing.above).name == "air" then
						minetest.set_node(pointed_thing.under, {name = "lib_handtools:bonfire"})
					end
				end
			end
			if not (creative and creative.is_enabled_for
					and creative.is_enabled_for(player_name)) then
				-- Wear tool
				local wdef = itemstack:get_definition()
				itemstack:add_wear(2000)
				-- Tool break sound
				if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
					minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
				end
			end
			return itemstack
		end
	})
	
	local tinder = {
		"gal:item_cotton",
		"gal:item_paper",
		"gal:mineral_coal_lump",
	}
	
	function lib_handtools.strike_fire(user, pointed_thing)
				if pointed_thing.type == "node" then
					local n_pointed_above = minetest.env:get_node(pointed_thing.above)
					local n_pointed_under = minetest.env:get_node(pointed_thing.under)
	
					for _,tinder in ipairs(tinder) do
						if user:get_inventory():get_stack("main", user:get_wield_index()+1):get_name() == tinder then
							user:get_inventory():remove_item("main", tinder)
							if n_pointed_under.name == "torch:torch_unlit" then
								n_pointed_under.name = "torch:torch"
								minetest.env:add_node(pointed_thing.under, n_pointed_under)
							elseif n_pointed_under.name == "lib_handtools:bonfire_unlit" then
								minetest.env:add_node(pointed_thing.under, {name="lib_handtools:bonfire"})
							elseif n_pointed_above.name == "air" then
								minetest.env:add_node(pointed_thing.above, {name="gal:fire_basic_flame"})
							end
						end
					end				
				else
					return
				end
	end
	
	minetest.register_tool("lib_handtools:tool_rock_silex_steel_striker", {
		description = "Tool - Steel Fire Striker",
		inventory_image = "lib_materials_tool_rock_silex_steel_striker.png",
		stack_max = 1,
		groupcaps={
		-- about equal to a stone pick (it's not intended as a tool)
			ignity={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			--diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			--prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			--pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			--snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
		},
		on_use = function(itemstack, user, pointed_thing)
				lib_handtools.strike_fire(user, pointed_thing)
				itemstack:add_wear(65535/64)
				return itemstack
			end
	})
	

-----------
-- FARMING: HOES AND DIG STICKS
-----------

	--if (minetest.get_modpath("farming")) ~= nil then turns nodes with group soil=1 into soil
	local function hoe_on_use(itemstack, user, pointed_thing, uses)
	
		local pt = pointed_thing
	
		-- check if pointing at a node
		if not pt or pt.type ~= "node" then
			return
		end
	
		local under = minetest.get_node(pt.under)
		local upos = pointed_thing.under
	
		if minetest.is_protected(upos, user:get_player_name()) then
			minetest.record_protection_violation(upos, user:get_player_name())
			return
		end
	
		local p = {x = pt.under.x, y = pt.under.y + 1, z = pt.under.z}
		local above = minetest.get_node(p)
	
		-- return if any of the nodes is not registered
		if not minetest.registered_nodes[under.name]
		or not minetest.registered_nodes[above.name] then
			return
		end
	
		-- check if the node above the pointed thing is air
		if above.name ~= "air" then
			return
		end
	
		-- check if pointing at dirt
		if minetest.get_item_group(under.name, "soil") ~= 1 then
			return
		end
	
		-- turn the node into soil, wear out item and play sound
		--Added by ShadMOrdre to accommodate lib_handtools
		if not string.find(under.name, "_with_soil") then
			--if not farming or not farming.mod or farming.mod ~= "redo" then
			--	minetest.set_node(pt.under, {name = "farming:soil"})
			--else
				local str_idx = string.find(under.name, "_with")
				if str_idx then
					minetest.set_node(pt.under, {name = string.sub(under.name, 1, str_idx) .. "with_soil"})
				else
					minetest.set_node(pt.under, {name = under.name .. "_with_soil"})
				end
			--end
		end
	
		minetest.sound_play("default_dig_crumbly", {pos = pt.under, gain = 0.5})
	
		local wear = 65535 / (uses -1)
	
		--if farming.is_creative(user:get_player_name()) then
		if minetest.setting_getbool("creative_mode") then
			wear = 1
		end
	
		itemstack = toolranks.new_afteruse(itemstack, user, under, {wear = wear})
	
		return itemstack
	end

	minetest.register_tool("lib_handtools:tool_digging_stick", {
		--description = "Digging Stick",
		original_description = S("Digging Stick"),
		description = toolranks.create_description("Digging Stick", 0, 1),
	
		inventory_image = "lib_materials_tool_digstick_wood.png",
		wield_image = "lib_materials_tool_digstick_wood.png^[transformFX",
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use(itemstack, user, pointed_thing, 30)
		end,
	})

	minetest.register_tool("lib_handtools:tool_hoe_stone", {
		--description = "Stone Hoe",
		original_description = S("Stone Hoe"),
		description = toolranks.create_description("Stone Hoe", 0, 1),
	
		inventory_image = "lib_materials_tool_hoe_stone_paleo.png",
		wield_image = "lib_materials_tool_hoe_stone_paleo.png^[transformFX",
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use(itemstack, user, pointed_thing, 30)
		end,
	})

	minetest.register_tool("lib_handtools:tool_hoe_bronze", {
		--description = "Bronze Hoe",
		original_description = S("Bronze Hoe"),
		description = toolranks.create_description("Bronze Hoe", 0, 1),
	
		inventory_image = "lib_materials_tool_hoe_bronze.png",
		wield_image = "lib_materials_tool_hoe_bronze.png^[transformFX",
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use(itemstack, user, pointed_thing, 30)
		end,
	})

	minetest.register_tool("lib_handtools:tool_hoe_iron", {
		--description = "Iron Hoe",
		original_description = S("Iron Hoe"),
		description = toolranks.create_description("Iron Hoe", 0, 1),
	
		inventory_image = "lib_materials_tool_hoe_iron.png",
		wield_image = "lib_materials_tool_hoe_iron.png^[transformFX",
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use(itemstack, user, pointed_thing, 30)
		end,
	})

	minetest.register_tool("lib_handtools:tool_hoe_steel", {
		--description = "Steel Hoe",
		original_description = S("Steel Hoe"),
		description = toolranks.create_description("Steel Hoe", 0, 1),
	
		inventory_image = "lib_materials_tool_hoe_steel.png",
		wield_image = "lib_materials_tool_hoe_steel.png^[transformFX",
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use(itemstack, user, pointed_thing, 30)
		end,
	})

--
-- PICKS
--

	minetest.register_tool("lib_handtools:tool_pick_bone", {
		--description = S("Bone Antler Pickaxe"),
		original_description = S("Bone Antler Pickaxe"),
		description = toolranks.create_description("Bone Antler Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_bone.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				cracky={times={[3]=1.60}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		groups = {flammable = 2},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_pick_wood", {
		--description = S("Wooden Pickaxe"),
		original_description = S("Wooden Pickaxe"),
		description = toolranks.create_description("Wooden Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_wood_paleo.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				cracky={times={[3]=1.60}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		groups = {flammable = 2},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_pick_stone", {
		--description = S("Stone Pickaxe"),
		original_description = S("Stone Pickaxe"),
		description = toolranks.create_description("Stone Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_stone_paleo.png",
		tool_capabilities = {
			full_punch_interval = 1.3,
			max_drop_level=0,
			groupcaps={
				cracky={times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_pick_bronze", {
		--description = S("Bronze Pickaxe"),
		original_description = S("Bronze Pickaxe"),
		description = toolranks.create_description("Bronze Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_bronze.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.50, [2]=1.80, [3]=0.90}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_pick_iron", {
		--description = S("Iron Pickaxe"),
		original_description = S("Iron Pickaxe"),
		description = toolranks.create_description("Iron Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_iron.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level = 1,
			groupcaps = {
				cracky={times={[1]=4.25, [2]=1.70, [3]=0.85}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy = 3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_pick_steel", {
		--description = "Steel Pickaxe",
		original_description = "Steel Pickaxe",
		description = toolranks.create_description("Steel Pickaxe", 0, 1),
	
		inventory_image = "lib_materials_tool_pick_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_pick_steel_stainless_iron_handled", {
		--description = S("Iron Handled Stainless Steel Pickaxe"),
		original_description = S("Iron Handled Stainless Steel Pickaxe"),
		description = toolranks.create_description("Iron Handled Stainless Steel Pickaxe", 0, 1),
	
		inventory_image = "(lib_materials_tool_rod_iron.png^[mask:lib_materials_mask_tool_handle_pickaxe.png)^(lib_materials_metal_steel_stainless2_block.png^[mask:lib_materials_mask_tool_head_pickaxe.png)",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_pick_steel_carbon_iron_handled", {
		--description = S("Iron Handled Carbon Steel Pickaxe"),
		original_description = S("Iron Handled Carbon Steel Pickaxe"),
		description = toolranks.create_description("Iron Handled Carbon Steel Pickaxe", 0, 1),
	
		inventory_image = "(lib_materials_tool_rod_iron.png^[mask:lib_materials_mask_tool_handle_pickaxe.png)^(lib_materials_metal_steel_carbon_block.png^[mask:lib_materials_mask_tool_head_pickaxe.png)",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

--
-- SHOVELS
--

	minetest.register_tool("lib_handtools:tool_shovel_bone", {
		--description = S("Bone Antler Shovel"),
		original_description = S("Bone Antler Shovel"),
		description = toolranks.create_description("Bone Antler Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_bone.png",
		wield_image = "lib_materials_tool_shovel_bone.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				crumbly={times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		groups = {flammable = 2},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_shovel_wood", {
		--description = S("Wooden Shovel"),
		original_description = S("Wooden Shovel"),
		description = toolranks.create_description("Wooden Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_wood_paleo.png",
		wield_image = "lib_materials_tool_shovel_wood_paleo.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				crumbly={times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		groups = {flammable = 2},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_shovel_stone", {
		--description = S("Stone Shovel"),
		original_description = S("Stone Shovel"),
		description = toolranks.create_description("Stone Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_stone_paleo.png",
		wield_image = "lib_materials_tool_shovel_stone_paleo.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.4,
			max_drop_level=0,
			groupcaps={
				crumbly={times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_shovel_bronze", {
		--description = S("Bronze Shovel"),
		original_description = S("Bronze Shovel"),
		description = toolranks.create_description("Bronze Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_bronze.png",
		wield_image = "lib_materials_tool_shovel_bronze.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level=1,
			groupcaps={
				crumbly={times={[1]=1.65, [2]=1.05, [3]=0.45}, uses=25, maxlevel=2},
			},
			damage_groups = {fleshy=3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_shovel_iron", {
		--description = S("Iron Shovel"),
		original_description = S("Iron Shovel"),
		description = toolranks.create_description("Iron Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_iron.png",
		wield_image = "lib_materials_tool_shovel_iron.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.3,
			max_drop_level = 1,
			groupcaps = {
				crumbly={times={[1]=1.70, [2]=1.0, [3]=0.45}, uses=25, maxlevel=1},
			},
			damage_groups = {fleshy = 2},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_shovel_steel", {
		--description = S("Steel Shovel"),
		original_description = S("Steel Shovel"),
		description = toolranks.create_description("Steel Shovel", 0, 1),
	
		inventory_image = "lib_materials_tool_shovel_steel.png",
		wield_image = "lib_materials_tool_shovel_steel.png^[transformR90",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level=1,
			groupcaps={
				crumbly={times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
			},
			damage_groups = {fleshy=3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

--
-- AXES
--

	minetest.register_tool("lib_handtools:tool_axe_wood", {
		--description = S("Wooden Axe"),
		original_description = S("Wooden Axe"),
		description = toolranks.create_description("Wooden Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_wood_paleo.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=0,
			groupcaps={
				choppy={times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
		groups = {flammable = 2},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_axe_stone", {
		--description = S("Stone Axe"),
		original_description = S("Stone Axe"),
		description = toolranks.create_description("Stone Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_stone_paleo.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_axe_flint", {
		--description = S("Flint Axe"),
		original_description = S("Flint Axe"),
		description = toolranks.create_description("Flint Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_flint.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				choppy={times={[1]=2.75, [2]=1.70, [3]=1.15}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_axe_bronze", {
		--description = S("Bronze Axe"),
		original_description = S("Bronze Axe"),
		description = toolranks.create_description("Bronze Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_bronze.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.75, [2]=1.70, [3]=1.15}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_axe_iron", {
		--description = S("Iron Axe"),
		original_description = S("Iron Axe"),
		description = toolranks.create_description("Iron Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_iron.png",
		tool_capabilities = {
			full_punch_interval = 1.1,
			max_drop_level = 1,
			groupcaps = {
				choppy={times={[1]=2.70, [2]=1.70, [3]=1.15}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy = 3},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_axe_steel", {
		--description = S("Steel Axe"),
		original_description = S("Steel Axe"),
		description = toolranks.create_description("Steel Axe", 0, 1),
	
		inventory_image = "lib_materials_tool_axe_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

-----------------------------
-- WEAPONS
-----------------------------

--
--CLUBS and CUDGELS
--

	minetest.register_tool("lib_handtools:tool_club_stone", {
		--description = S("Stone Club"),
		original_description = S("Stone Club"),
		description = toolranks.create_description("Stone Club", 0, 1),
	
		_doc_items_longdesc = S("Stone club for clubbing things."),
		_doc_items_usagehelp = S("Use this club to club."),
		inventory_image = "lib_materials_tool_club_stone.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	})
	
	minetest.register_tool("lib_handtools:tool_club_wood", {
		--description = S("Wood Club"),
		original_description = S("Wood Club"),
		description = toolranks.create_description("Wood Club", 0, 1),
	
		_doc_items_longdesc = S("Wood club for clubbing things."),
		_doc_items_usagehelp = S("Use this club to club."),
		inventory_image = "lib_materials_tool_club_wood.png",
		
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
			-- about equal to a stone pick (it's not intended as a tool)
				diggy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				prying={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				pokey={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
				snappy={times={[2]=2.00, [3]=1.20}, uses=30, maxlevel=1},
			},
			damage_groups = {fleshy=6},
		},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_cudgel", {
		description = S("Cudgel"),
		inventory_image = "lib_materials_tool_cudgel.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=0,
			groupcaps={
				choppy={times={[3]=0.80}, uses=10, maxlevel=1},
				fleshy={times={[2]=1.50, [3]=0.80}, uses=10, maxlevel=1},
				snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		},
	})

--
-- SPEARS AND JAVELINS
--

	minetest.register_tool("lib_handtools:tool_spear_wood_arcaic", {
		description = "Wooden Spear",
		inventory_image = "lib_materials_tool_spear_wood_paleo.png",
		wield_image = "lib_materials_tool_spear_wood_paleo.png^[transformFX",
		tool_capabilities = {
			full_punch_interval = 1,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
			},
			damage_groups = {fleshy=2},
		}
	})

	minetest.register_tool("lib_handtools:tool_spear_stone_arcaic", {
		description = "Stone Spear",
		inventory_image = "lib_materials_tool_spear_stone_paleo.png",
		wield_image = "lib_materials_tool_spear_stone_paleo.png^[transformFX",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		}
	})

	minetest.register_tool("lib_handtools:tool_spear_stone", {
		--description = S("Stone Tipped Spear"),
		original_description = S("Stone Tipped Spear"),
		description = toolranks.create_description("Stone Tipped Spear", 0, 1),
	
		inventory_image = "lib_materials_tool_spear_stone.png",
		wield_image = "lib_materials_tool_spear_stone.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_spear_bronze", {
		--description = S("Bronze Tipped Spear"),
		original_description = S("Bronze Tipped Spear"),
		description = toolranks.create_description("Bronze Tipped Spear", 0, 1),
	
		inventory_image = "lib_materials_tool_spear_bronze.png",
		wield_image = "lib_materials_tool_spear_bronze.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_spear_copper", {
		--description = S("Copper Tipped Spear"),
		original_description = S("Copper Tipped Spear"),
		description = toolranks.create_description("Copper Tipped Spear", 0, 1),
	
		inventory_image = "lib_materials_tool_spear_copper.png",
		wield_image = "lib_materials_tool_spear_copper.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_spear_obsidian", {
		--description = S("Obsidian Tipped Spear"),
		original_description = S("Obsidian Tipped Spear"),
		description = toolranks.create_description("Obsidian Tipped Spear", 0, 1),
	
		inventory_image = "lib_materials_tool_spear_obsidian.png",
		wield_image = "lib_materials_tool_spear_obsidian.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_spear_steel", {
		--description = S("Steel Tipped Spear"),
		original_description = S("Steel Tipped Spear"),
		description = toolranks.create_description("Steel Tipped Spear", 0, 1),
	
		inventory_image = "lib_materials_tool_spear_steel.png",
		wield_image = "lib_materials_tool_spear_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

--
-- BATTLEAXES AND WARHAMMERS
--

	minetest.register_tool("lib_handtools:tool_battleaxe_large", {
		description = S("Large Battleaxe"),
		original_description = S("Large Battleaxe"),
		description = toolranks.create_description("Large Battleaxe", 0, 1),
		
		inventory_image = "lib_materials_tool_battleaxe_large.png",
		tool_capabilities = {
			full_punch_interval = 2.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=20, maxlevel=3},
				snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
		
	})
	
	minetest.register_tool("lib_handtools:tool_battleaxe", {
		description = S("Battleaxe"),
		original_description = S("Battleaxe"),
		description = toolranks.create_description("Battleaxe", 0, 1),
		
		inventory_image = "lib_materials_tool_battleaxe.png",
		tool_capabilities = {
			full_punch_interval = 2.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=20, maxlevel=3},
				snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
		
	})
	
	minetest.register_tool("lib_handtools:tool_battleaxe_stone", {
		description = S("Stone Battleaxe"),
		original_description = S("Stone Battleaxe"),
		description = toolranks.create_description("Stone Battleaxe", 0, 1),
		
		inventory_image = "lib_materials_tool_battleaxe_stone.png",
		tool_capabilities = {
			full_punch_interval = 2.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=20, maxlevel=3},
				snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
		
	})
	
	minetest.register_tool("lib_handtools:tool_warhammer_stone", {
		description = S("Stone Warhammer"),
		original_description = S("Large Battleaxe"),
		description = toolranks.create_description("Large Battleaxe", 0, 1),
		
		inventory_image = "lib_materials_tool_warhammer_stone.png",
		tool_capabilities = {
			full_punch_interval = 2.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=20, maxlevel=3},
				snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=20, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
		
	})






--
-- BOWS AND CROSSBOWS
--


--
-- SWORDS
--

--	minetest.register_tool("lib_handtools:tool_sword_wood", {
--		--description = S("Wooden Sword"),
--		original_description = S("Wooden Sword"),
--		description = toolranks.create_description("Wooden Sword", 0, 1),
--	
--		inventory_image = "lib_materials_tool_sword_wood.png",
--		tool_capabilities = {
--			full_punch_interval = 1,
--			max_drop_level=0,
--			groupcaps={
--				snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
--			},
--			damage_groups = {fleshy=2},
--		},
--		groups = {flammable = 2},
--		sound = {breaks = "default_tool_breaks"},
--	
--		after_use = toolranks.new_afteruse,
--	
--	})
	
--	minetest.register_tool("lib_handtools:tool_sword_stone", {
--		--description = "Stone Sword",
--		original_description = S("Stone Sword"),
--		description = toolranks.create_description("Stone Sword", 0, 1),
--	
--		inventory_image = "lib_materials_tool_sword_stone.png",
--		tool_capabilities = {
--			full_punch_interval = 1.2,
--			max_drop_level=0,
--			groupcaps={
--				snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
--			},
--			damage_groups = {fleshy=4},
--		},
--		sound = {breaks = "default_tool_breaks"},
--	
--		after_use = toolranks.new_afteruse,
--	
--	})
	
	minetest.register_tool("lib_handtools:tool_sword_bronze", {
		--description = S("Bronze Sword"),
		original_description = S("Bronze Sword"),
		description = toolranks.create_description("Bronze Sword", 0, 1),
	
		inventory_image = "lib_materials_tool_sword_bronze.png",
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=25, maxlevel=2},
			},
			damage_groups = {fleshy=6},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_sword_iron", {
		--description = S("Iron Sword"),
		original_description = S("Iron Sword"),
		description = toolranks.create_description("Iron Sword", 0, 1),
	
		inventory_image = "lib_materials_tool_sword_iron.png",
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level = 1,
			groupcaps = {
				snappy={times={[1]=2.0, [2]=1.30, [3]=0.38}, uses=25, maxlevel=1},
			},
			damage_groups = {fleshy = 5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})
	
	minetest.register_tool("lib_handtools:tool_sword_steel", {
		--description = S("Steel Sword"),
		original_description = S("Steel Sword"),
		description = toolranks.create_description("Steel Sword", 0, 1),
	
		inventory_image = "lib_materials_tool_sword_steel.png",
		tool_capabilities = {
			full_punch_interval = 0.8,
			max_drop_level=1,
			groupcaps={
				snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
			},
			damage_groups = {fleshy=6},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_sword_carbon_steel", {
		--description = S("Carbon Steel Sword"),
		original_description = S("Carbon Steel Sword"),
		description = toolranks.create_description("Carbon Steel Sword", 0, 1),
	
		inventory_image = "(lib_materials_mineral_diamond_block.png^[mask:lib_materials_mask_tool_sword_handle.png)^(lib_materials_metal_steel_carbon_block.png^[mask:lib_materials_mask_tool_sword_blade.png)",
		tiles = {{
			    name = "lib_materials_fluid_lava_source_animated.png^[mask:lib_materials_mask_tool_sword_blade.png)",
			    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
		}},
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_sword_lava", {
		--description = S("Lava Sword"),
		original_description = S("Lava Sword"),
		description = toolranks.create_description("Lava Sword", 0, 1),
	
		inventory_image = "(lib_materials_mineral_diamond_block.png^[mask:lib_materials_mask_tool_sword_handle.png)^(lib_materials_fluid_lava_source_animated.png^[mask:lib_materials_mask_tool_sword_blade.png)",
		tiles = {{
			    name = "lib_materials_fluid_lava_source_animated.png^[mask:lib_materials_mask_tool_sword_blade.png)",
			    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
		}},
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				cracky={times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
			},
			damage_groups = {fleshy=4},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})



-----------------------
-- MISCELANEOUS TOOLS
-----------------------

--
--KEYS
--

	minetest.register_tool("lib_handtools:tool_key", {
		description = "Key",
		inventory_image = "lib_materials_tool_key.png",
		--groups = {key = 1, not_in_creative_inventory = 1},
		groups = {key = 1},
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			local under = pointed_thing.under
			local node = minetest.get_node(under)
			local def = minetest.registered_nodes[node.name]
			if def and def.on_rightclick and
					not (placer and placer:is_player() and
					placer:get_player_control().sneak) then
				return def.on_rightclick(under, node, placer, itemstack,
					pointed_thing) or itemstack
			end
			if pointed_thing.type ~= "node" then
				return itemstack
			end
	
			local pos = pointed_thing.under
			node = minetest.get_node(pos)
	
			if not node or node.name == "ignore" then
				return itemstack
			end
	
			local ndef = minetest.registered_nodes[node.name]
			if not ndef then
				return itemstack
			end
	
			local on_key_use = ndef.on_key_use
			if on_key_use then
				on_key_use(pos, placer)
			end
	
			return nil
		end
	})

	gal.key_node = "lib_handtools:tool_key"


	minetest.register_tool("lib_handtools:tool_chisel_steel", {
		--description = S("Steel Chisel"),
		original_description = S("Steel Chisel"),
		description = toolranks.create_description("Steel Chisel", 0, 1),
	
		inventory_image = "lib_materials_tool_chisel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_lockpick_steel", {
		--description = S("Steel Lockpick"),
		original_description = S("Steel Lockpick"),
		description = toolranks.create_description("Steel Lockpick", 0, 1),
	
		inventory_image = "lib_materials_tool_lockpick.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_pitchfork_steel", {
		--description = S("Steel Pitchfork"),
		original_description = S("Steel Pitchfork"),
		description = toolranks.create_description("Steel Pitchfork", 0, 1),
	
		inventory_image = "lib_materials_tool_pitchfork.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_saw_steel", {
		--description = S("Steel Saw"),
		original_description = S("Steel Saw"),
		description = toolranks.create_description("Steel Saw", 0, 1),
	
		inventory_image = "lib_materials_tool_saw_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_shears_steel", {
		--description = S("Steel Shears"),
		original_description = S("Steel Shears"),
		description = toolranks.create_description("Steel Shears", 0, 1),
	
		inventory_image = "lib_materials_tool_shears_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_hammer_stone", {
		--description = S("Stone Hammer"),
		original_description = S("Stone Hammer"),
		description = toolranks.create_description("Stone Hammer", 0, 1),
	
		inventory_image = "lib_materials_tool_hammer_stone.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})

	minetest.register_tool("lib_handtools:tool_hammer_steel", {
		--description = S("Steel Hammer"),
		original_description = S("Steel Hammer"),
		description = toolranks.create_description("Steel Hammer", 0, 1),
	
		inventory_image = "lib_materials_tool_hammer_steel.png",
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level=0,
			groupcaps={
				snappy={times={[1]=2.75, [2]=1.3, [3]=0.38}, uses=15, maxlevel=2},
			},
			damage_groups = {fleshy=5},
		},
		sound = {breaks = "default_tool_breaks"},
	
		after_use = toolranks.new_afteruse,
	
	})




