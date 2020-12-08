-- Item shelf for generic objects
-- Inventory overlay and blast code taken from vessels mod in MTG
-- All other code by Zorman2000

local function get_shelf_formspec(inv_size)
	return "size[8,8]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..

		--"list[context;main;"..(math.abs((inv_size / 2) - 8) / 2)..",0.25;"..(inv_size / 2)..",2;]"..
		"list[context;input;"..(math.abs((inv_size / 2) - 8) / 2)..",0.25;3,3;]"..
		"list[current_player;main;0,3.75;8,1;]"..
		"list[current_player;main;0,5;8,3;8]"..
		"listring[context;main]"..
		"listring[current_player;main]"
end

local temp_texture
local temp_size

local temp_slot

local function get_obj_dir(param2)
	return ((param2 + 1) % 4)
end

local function update_shelf(pos)
	-- Remove all objects
	local objs = minetest.get_objects_inside_radius(pos, 0.875)
	for _,obj in pairs(objs) do
		obj:remove()
	end
	
	-- if not slot then
		-- slot = temp_slot
	-- end

	local node = minetest.get_node(pos)
	local node_dir = minetest.facedir_to_dir(((node.param2 + 2) % 4))
	--local node_dir = minetest.facedir_to_dir(((node.param2) % 4))
	--local node_dir = minetest.facedir_to_dir(((node.param2 + 2)))
	local obj_dir = minetest.facedir_to_dir(get_obj_dir(node.param2))
	local max_shown_items = minetest.get_item_group(node.name, "itemshelf_shown_items")

	-- Calculate initial position for entities
	-- local start_pos = {
	-- 	x=pos.x - (0.25 * obj_dir.x) - (node_dir.x * 0.25),
	-- 	y=pos.y + 0.25,
	-- 	z=pos.z - (0.25 * obj_dir.z) - (node_dir.z * 0.25)
	-- }
	--x = Left,Right;     y = Down/Up;     z = Front/Back;     (axis = neg/pos)
	-- How the below works: Following is a top view of a node
	--
	--                              | +z (N) 0
	--                              |
	-- 			------------------
	-- 			|       |        |
	-- 			|       |        |
	--     -x (W) 3		|       | (0,0)  |      +x (E) 1
	--     -----------------|-------+--------|--------------
	-- 			|       |        |
	-- 			|       |        |
	-- 			|       |        |
	-- 			------------------
	-- 		                |
	-- 				| -z (S) 2

	-- From the picture above, your front could be at either -z, -z, x or z.
	-- To get the entity closer to the front, you need to add a certain amount
	-- (e.g. 0.25) to the x and z coordinates, and then multiply these by the
	-- the node direction (which is a vector pointing outwards of the node face).
	-- Therefore, start_pos is:
	--local displacement = 0.715
	--local displacement = 0.555	
	local displacement = 0.555
	if max_shown_items == 6 then
		displacement = 0.555
	end
	local start_pos = {
		x=pos.x - (obj_dir.x * displacement) + (node_dir.x * 0.25),
		--y=pos.y + 0.2375,
		y=pos.y + 0.5625,
		z=pos.z - (obj_dir.z * displacement) + (node_dir.z * 0.25)
	}
	-- local start_pos = {
		-- x=pos.x - (obj_dir.x) + (node_dir.x * 0.25),
		-- y=pos.y + 0.5625,
		-- z=pos.z - (obj_dir.z) + (node_dir.z * 0.25)
	-- }

	-- Calculate amount of objects in the inventory
	local inv = minetest.get_meta(pos):get_inventory()
	local list = inv:get_list("input")
	local obj_count = 0
	for key,itemstack in pairs(list) do
		if not itemstack:is_empty() then
			obj_count = obj_count + 1
		end
	end
	minetest.log("Found "..dump(obj_count).." items on shelf inventory")
	if obj_count > 0 then
		local shown_items = math.min(#list, max_shown_items)
		for i = 1, shown_items do
			--local i = temp_slot
			local overhead = i
			if i > (shown_items / 3) then
				overhead = i - (shown_items / 3)
			end
			-- if i == ((shown_items / 2) + 1) then
				-- --start_pos.y = start_pos.y - 0.5125
				-- start_pos.z = start_pos.z + 0.2775
			-- end
			-- --local addition = 0.475
			local addition = 0.2775
			-- if shown_items == 6 then
				-- addition = 0.2775
			-- end
			if i == 1 then
				start_pos.x = pos.x - 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z + 0.3125
			end
			if i == 2 then
				start_pos.x = pos.x
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z + 0.3125
			end
			if i == 3 then
				start_pos.x = pos.x + 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z + 0.3125
			end
			if i == 4 then
				-- start_pos.z = start_pos.z + 0.2775
				
				start_pos.x = pos.x - 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z
			end
			if i == 5 then
				start_pos.x = pos.x
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z
			end
			if i == 6 then
				start_pos.x = pos.x + 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z
			end
			if i == 7 then
				-- --start_pos.x = start_pos.x - (obj_dir.x * displacement) + (node_dir.x * 0.25)
				-- start_pos.x = start_pos.x - (obj_dir.x * displacement) - ((obj_dir.x * displacement) / 2)
				-- start_pos.z = start_pos.z + 0.2775
				
				start_pos.x = pos.x - 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z - 0.3125
			end
			if i == 8 then
				start_pos.x = pos.x
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z - 0.3125
			end
			if i == 9 then
				start_pos.x = pos.x + 0.3125
				start_pos.y = pos.y + 0.5625
				start_pos.z = pos.z - 0.3125
			end
			-- local obj_pos = {
				-- x=start_pos.x + (addition * overhead * obj_dir.x), --- (node_dir.z * overhead * 0.25),
				-- y=start_pos.y,
				-- z=start_pos.z + (addition * overhead * obj_dir.z) --- (node_dir.x * overhead * 0.25),
			-- }
			local obj_pos = {
				x=start_pos.x,
				y=start_pos.y,
				z=start_pos.z,
			}

			if not list[i]:is_empty() then
				minetest.log("Adding item entity at "..minetest.pos_to_string(obj_pos))
				temp_texture = list[i]:get_name()
				temp_size = 0.8/max_shown_items
				minetest.log("Size: "..dump(temp_size))
				local ent = minetest.add_entity(obj_pos, "lib_tools:draft_table_item")
				ent:set_properties({
					wield_item = temp_texture,
					visual_size = {x = 0.8/max_shown_items, y = 0.8/max_shown_items}
				})
			end
		end
	end

end

draft_table = {}

-- Definable properties:
--   - description
--   - textures (if drawtype is nodebox)
--   - nodebox (like default minetest.register_node def)
--   - mesh (like default minetest.register_node def)
--   - item capacity (how many items will fit into the shelf, use even numbers, max 16)
--   - shown_items (how many items to show, will always show first (shown_items/2) items of each row, max 6)
function lib_tools.register_shelf(name, def)
	local drawtype = "nodebox"
	if def.mesh then
		drawtype = "mesh"
	end
	minetest.register_node("lib_tools:"..name, {
		description = def.description,
		tiles = def.textures,
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = drawtype,
		node_box = def.nodebox,
		mesh = def.mesh,
		groups = {cracky = 2, itemshelves = 1, itemshelf_shown_items = def.shown_items or 4},
		
		on_construct = function(pos)
			-- Initialize inventory
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
	    	inv:set_size("input", def.capacity or 4)
	    	-- Initialize formspec
	    	--meta:set_string("formspec", get_shelf_formspec(def.capacity or 4))
		end,

		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
		end,

		on_metadata_inventory_put = update_shelf,
		on_metadata_inventory_take = update_shelf,
		
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if listname~="input" then
				return 0
			end
			-- 	if minetest.get_item_group(stack:get_name(), "music_disc") ~= 0 then
			-- 		return stack:get_count()
			-- 	end
			-- 	return 0
			if meta:get_inventory():room_for_item("input", stack) then
				return stack:get_count()
			end
			return 0
		end,

		allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			if listname~="input" then
				return 0
			end
			return stack:get_count()
		end,
		
		can_dig = function(pos,player)
			local meta  = minetest.get_meta(pos)
			local inv   = meta:get_inventory()
		
			if not inv:is_empty("input") then
				return false
			end
			return true
		end,

		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		
			local inv_index = 0
		
			local user_name=clicker:get_player_name()
			local normal,p = place_rotated.get_point(pointed_thing.above,pointed_thing.under,clicker)

			
			if p then
				minetest.chat_send_player(user_name,"Position within node:")
				minetest.chat_send_player(user_name,"X: "..p.x)
				minetest.chat_send_player(user_name,"Y: "..p.y)
				minetest.chat_send_player(user_name,"Z: "..p.z)
				
				if ((p.x >= -0.4375 and p.z >= 0.1875) and (p.x <= -0.1875 and p.z <= 0.4375)) then
				
					inv_index = 1
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= -0.125 and p.z >= 0.1875) and (p.x <= 0.125 and p.z <= 0.4375)) then
				
					inv_index = 2
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= 0.1875 and p.z >= 0.1875) and (p.x <= 0.4375 and p.z <= 0.4375)) then
				
					inv_index = 3
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= -0.4375 and p.z >= -0.125) and (p.x <= -0.1875 and p.z <= 0.125)) then
				
					inv_index = 4
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= -0.125 and p.z >= -0.125) and (p.x <= 0.125 and p.z <= 0.125)) then
				
					inv_index = 5
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= 0.1875 and p.z >= -0.125) and (p.x <= 0.4375 and p.z <= 0.125)) then
				
					inv_index = 6
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= -0.4375 and p.z >= -0.4375) and (p.x <= -0.1875 and p.z <= -0.1875)) then
				
					inv_index = 7
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= -0.125 and p.z >= -0.4375) and (p.x <= 0.125 and p.z <= -0.1875)) then
				
					inv_index = 8
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				elseif ((p.x >= 0.1875 and p.z >= -0.4375) and (p.x <= 0.4375 and p.z <= -0.1875)) then
				
					inv_index = 9
					minetest.chat_send_player(user_name,"inv_index: "..tostring(inv_index))
					
				end
			else
				minetest.chat_send_player(user_name,"Could not get point")
			end

			temp_slot = inv_index
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()

			if inv_index ~= 0 then
				if itemstack:get_count() == 0 then
					if not inv:is_empty("input") then
						local return_stack = inv:get_stack("input", inv_index)
						inv:set_stack("input", inv_index, nil)
						local wield_index = clicker:get_wield_index()
						clicker:get_inventory():set_stack("main", wield_index, return_stack)
						--remove_item(pos, node)
						update_shelf(pos)
						return return_stack
					end		
				end
				local this_def = minetest.registered_nodes[node.name]
				if this_def.allow_metadata_inventory_put(pos, "input", inv_index, itemstack:peek_item(), clicker) > 0 then
					local return_stack = inv:get_stack("input", inv_index)
					
					local p_ctrl = clicker:get_player_control()
					local s
					if p_ctrl.RMB and p_ctrl.sneak then
						s = itemstack:take_item(1)
					else
						s = itemstack:take_item()
					end
					--inv:add_item("input", s)
					inv:set_stack("input", inv_index, s)
					--update_item(pos,node)
					update_shelf(pos)
					return return_stack
				end
			else
				if not inv:is_empty("input") then
					local craft_recipe = {
						method = "normal",
						width = 3,
						items = {
							inv:get_stack("input", 1),
							inv:get_stack("input", 2),
							inv:get_stack("input", 3),
							inv:get_stack("input", 4),
							inv:get_stack("input", 5),
							inv:get_stack("input", 6),
							inv:get_stack("input", 7),
							inv:get_stack("input", 8),
							inv:get_stack("input", 9)
						}
					}

					local craft_out, dec_inp = minetest.get_craft_result(craft_recipe)
					
					if craft_out.item:get_name() ~= "" then
						minetest.chat_send_player(user_name, "craft_out.item:  " .. craft_out.item:get_name())
						local t_pos = {
							x = pos.x,
							y = pos.y + 0.5625,
							z = pos.z
						}
						inv:set_stack("input", 1, nil)
						inv:set_stack("input", 2, nil)
						inv:set_stack("input", 3, nil)
						inv:set_stack("input", 4, nil)
						inv:set_stack("input", 5, nil)
						inv:set_stack("input", 6, nil)
						inv:set_stack("input", 7, nil)
						inv:set_stack("input", 8, nil)
						inv:set_stack("input", 9, nil)
						update_shelf(pos)
						minetest.add_item(t_pos, craft_out.item:take_item())
						-- local co = craft_out.item:take_item()
						-- return co
						return
					else
						return itemstack
					end
				else
					return itemstack
				end
			end
		end,

		on_punch = function(pos, node, puncher)
			if( not( pos ) or not( node ) or not( puncher )) then
				return
			end

			local wielded = puncher:get_wielded_item()
			local meta = minetest.get_meta(pos)
			local inv  = meta:get_inventory()
			
			if wielded:get_count() == 0 then
				if not inv:is_empty("input") then
					local return_stack = inv:get_stack("input", 1)
					inv:set_stack("input", 1, nil)
					local wield_index = puncher:get_wield_index()
					puncher:get_inventory():set_stack("main", wield_index, return_stack)
					--remove_item(pos, node)
					update_shelf(pos)
				end		
			end
			
			-- -- only punching with the hammer is supposed to work
			-- if wielded:get_name() ~= 'lib_tools:anvil_hammer' then
				-- return
			-- end
			
			local input = inv:get_stack('input',1)
		
			-- -- only tools can be repaired
			-- if( not( input ) 
			-- or input:is_empty()
					-- or input:get_name() == "technic:water_can" 
					-- or input:get_name() == "technic:lava_can" ) then
				-- return
			-- end
		
			-- -- 65535 is max damage
			-- local damage_state = 40-math.floor(input:get_wear()/1638)
		
			-- local tool_name = input:get_name()

			-- local hud2 = nil
			-- local hud3 = nil
			-- if( input:get_wear()>0 ) then
				-- hud2 = puncher:hud_add({
					-- hud_elem_type = "statbar",
					-- text = "default_cloud.png^[colorize:#ff0000:256",
					-- number = 40,
					-- direction = 0, -- left to right
					-- position = {x=0.5, y=0.65},
					-- alignment = {x = 0, y = 0},
					-- offset = {x = -320, y = 0},
					-- size = {x=32, y=32},
				-- })
				-- hud3 = puncher:hud_add({
					-- hud_elem_type = "statbar",
					-- text = "default_cloud.png^[colorize:#00ff00:256",
					-- number = damage_state,
					-- direction = 0, -- left to right
					-- position = {x=0.5, y=0.65},
					-- alignment = {x = 0, y = 0},
					-- offset = {x = -320, y = 0},
					-- size = {x=32, y=32},
				-- })
			-- end
			-- minetest.after(2, function()
				-- if( puncher ) then
					-- puncher:hud_remove(hud2)
					-- puncher:hud_remove(hud3)
				-- end
			-- end)
		
			-- -- tell the player when the job is done
			-- if(   input:get_wear() == 0 ) then
				-- local tool_desc
				-- if minetest.registered_items[tool_name] and minetest.registered_items[tool_name].description then
					-- tool_desc = minetest.registered_items[tool_name].description
				-- else
					-- tool_desc = tool_name
				-- end
				-- minetest.chat_send_player( puncher:get_player_name(), S('Your @1 has been repaired successfully.', tool_desc))
				-- return
			-- else
				-- --pos.y = pos.y + anvil_item_displacement
				-- pos.y = pos.y + 7/16
				-- minetest.sound_play({name="anvil_clang"}, {pos=pos})
				-- minetest.add_particlespawner({
					-- amount = 10,
					-- time = 0.1,
					-- minpos = pos,
					-- maxpos = pos,
					-- minvel = {x=2, y=3, z=2},
					-- maxvel = {x=-2, y=1, z=-2},
					-- minacc = {x=0, y= -10, z=0},
					-- maxacc = {x=0, y= -10, z=0},
					-- minexptime = 0.5,
					-- maxexptime = 1,
					-- minsize = 1,
					-- maxsize = 1,
					-- collisiondetection = true,
					-- vertical = false,
					-- texture = "anvil_spark.png",
				-- })
			-- end
		
			-- -- do the actual repair
			-- input:add_wear( -5000 ) -- equals to what technic toolshop does in 5 seconds
			-- inv:set_stack("input", 1, input)
		
			-- -- damage the hammer slightly
			-- wielded:add_wear( 100 )
			-- puncher:set_wielded_item( wielded )
		end,

		on_dig = function(pos, node, digger)
			-- Clear any object disc
			local objs = minetest.get_objects_inside_radius(pos, 0.7)
			for _,obj in pairs(objs) do
				obj:remove()
			end
			-- Pop-up disc if existing
			local meta = minetest.get_meta(pos)
			local list = meta:get_inventory():get_list("input")
			if list then
				for _,item in pairs(list) do
					local drop_pos = {
						x=math.random(pos.x - 0.5, pos.x + 0.5),
						y=pos.y,
						z=math.random(pos.z - 0.5, pos.z + 0.5)}
					minetest.add_item(pos, item:get_name())
				end
			end
			-- Remove node
			minetest.remove_node(pos)
		end,
		
		on_blast = function(pos)
			local drops = {}
			default.get_inventory_drops(pos, "lib_tools:draft_table", drops)
			drops[#drops + 1] = "lib_tools:draft_table"
			minetest.remove_node(pos)
			return drops
		end
	})
end

-- Entity for shelf
minetest.register_entity("lib_tools:draft_table_item", {
	hp_max = 1,
	visual = "wielditem",
	visual_size = {x = 0.20, y = 0.20},
	collisionbox = {0,0,0, 0,0,0},
	physical = false,
	on_activate = function(self, staticdata)
		-- Staticdata
		local data = {}
		if staticdata ~= nil and staticdata ~= "" then
			local cols = string.split(staticdata, "|")
			data["itemstring"] = cols[1]
			data["visualsize"] = tonumber(cols[2])
		end

		-- Texture
		if temp_texture ~= nil then
			-- Set texture from temp
			self.itemstring = temp_texture
			temp_texture = nil
		elseif staticdata ~= nil and staticdata ~= "" then
			-- Set texture from static data
			self.itemstring = data.itemstring
		end
		-- Set texture if available
		if self.itemstring ~= nil then
			self.wield_item = self.itemstring
		end
		
		-- Visual size
		if temp_size ~= nil then
			self.visualsize = temp_size
			temp_size = nil
		elseif staticdata ~= nil and staticdata ~= "" then
			self.visualsize = data.visualsize
		end
		-- Set visual size if available
		if self.visualsize ~= nil then
			self.visual_size = {x=self.visualsize, y=self.visualsize}
		end

		-- Set object properties
		self.object:set_properties(self)
		
	end,
	get_staticdata = function(self)
		local result = ""
		if self.itemstring ~= nil then
			result = self.itemstring.."|"
		end
		if self.visualsize ~= nil then
			result = result..self.visualsize
		end
		return result
	end,
})

local default_table = {
	type = "fixed",
	fixed = {
		{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.375, -0.5, -0.375, -0.25, 0.375, -0.25}, -- NodeBox3
		{0.25, -0.5, -0.375, 0.375, 0.375, -0.25}, -- NodeBox5
		{-0.375, -0.5, 0.25, -0.25, 0.375, 0.375}, -- NodeBox6
		{0.25, -0.5, 0.25, 0.375, 0.375, 0.375}, -- NodeBox7
		{-0.3125, -0.125, -0.3125, 0.3125, -0.0625, 0.3125}, -- NodeBox8
	}
}



lib_tools.register_shelf("draft_table", {
	description = "Drafting Table (For crafting)",
	textures = {
		"lib_tools_draft_table_top.png",
		"worktable_side.png",
		"worktable_side.png",
		"worktable_side.png",
		"worktable_side.png",
		"worktable_front.png",
	},
	nodebox = default_table,
	capacity = 9,
	shown_items = 9
})

