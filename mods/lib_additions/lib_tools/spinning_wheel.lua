

local S = lib_tools.intllib

--[[
	description = S("Stick"),
	_doc_items_longdesc = S("A multiuse tool, used for digging, prying, poking, and other things."),
	_doc_items_usagehelp = S("Use this stick to dig up small rocks, carve into a spear or handle for tools, use for building."),
--]]

local wheel_on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	-- -- meta:set_string("formspec", "invsize[10,11;]"..
		-- -- "background[-0.15,-0.25;10.40,11.75;clothing_loom_background.png]"..
		-- -- "list[current_name;input;7,2;1,1;]"..
		-- -- "list[current_name;output;7,4;1,1;]"..
		-- -- "label[7,1.5;Input Textile:]"..
		-- -- "label[7,3.5;Output Thread:]"..
		-- -- "label[0,0;Spinning Wheel:]"..
		-- -- "label[4,1.5;Spin]"..
		-- -- "item_image_button[4,2;1,1;clothing:feltthread;spin; ]"..
		-- -- "list[current_player;main;1,7;8,4;]")
	meta:set_string("infotext", "Spinning Wheel")
	local inv = meta:get_inventory()
	inv:set_size("output", 1)
end



spinning_wheel = {
  setting = {
    item_displacement = 7/16,
  }
}

local tmp = {}

minetest.register_entity("lib_tools:thread_item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.33,y=.33},
	tiles = {"lottclothes_flaxthread.png"},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
	on_activate = function(self, staticdata)
		if tmp.nodename ~= nil and tmp.texture ~= nil then
			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(';')
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures={self.texture}})
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end
		return ""
	end,
})

local remove_item = function(pos, node)
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y + spinning_wheel.setting.item_displacement, z = pos.z}, .5)
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "lib_tools:thread_item" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if not inv:is_empty("output") then
		pos.y = pos.y + spinning_wheel.setting.item_displacement
		tmp.nodename = node.name
		tmp.texture = inv:get_stack("output", 1):get_name()
		local e = minetest.add_entity(pos,"lib_tools:thread_item")
		local yaw = math.pi*2 - node.param2 * math.pi/2
		e:setyaw(yaw)
	end
end



minetest.register_node("lib_tools:spinning_wheel", {
	description = S("Spinning Wheel"),
	_doc_items_longdesc = S("Punching the spinning wheel with leaves, hemp, cotton or wool will produce thread or string."),
	_doc_items_usagehelp = S("Punching this node while holding leaves, hemp, cotton, or wool will produce thread or string."),
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakable_by_hand=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.1875, -0.1875, 0.5, -0.125}, -- NodeBox1
			{-0.25, -0.5, 0.3125, -0.1875, -0.125, 0.375}, -- NodeBox2
			{0.1875, -0.5, -0.1875, 0.25, 0.5, -0.125}, -- NodeBox3
			{0.1875, -0.5, 0.3125, 0.25, -0.125, 0.375}, -- NodeBox4
			{-0.1875, -0.125, -0.3125, -0.125, -0.0625, 0.4375}, -- NodeBox5
			{0.125, -0.125, -0.3125, 0.1875, -0.0625, 0.4375}, -- NodeBox6
			{-0.0625, -0.3125, -0.5, 0.0625, 0.125, -0.4375}, -- NodeBox7
			{0.0625, -0.3125, 0.125, -0.0625, 0.125, 0.1875}, -- NodeBox8
			{-0.0625, 0.1875, -0.375, 0.0625, 0.25, 0.0625}, -- NodeBox9
			{-0.0625, -0.4375, -0.375, 0.0625, -0.375, 0.0625}, -- NodeBox10
			{-0.125, -0.125, -0.1875, 0.125, -0.0625, -0.125}, -- NodeBox11
			{-0.03125, -0.375, -0.1875, 0.03125, 0.1875, -0.125}, -- NodeBox12
			{-0.03125, -0.125, -0.4375, 0.03125, -0.0625, 0.125}, -- NodeBox13
			{-0.1875, -0.0625, 0.25, 0.1875, 0, 0.5}, -- NodeBox14
			{-0.0625, 0.125, 0.0625, 0.0625, 0.1875, 0.125}, -- NodeBox15
			{-0.0625, -0.375, 0.0625, 0.0625, -0.3125, 0.125}, -- NodeBox16
			{-0.0625, -0.375, -0.4375, 0.0625, -0.3125, -0.375}, -- NodeBox17
			{-0.0625, 0.125, -0.4375, 0.0625, 0.1875, -0.375}, -- NodeBox18
		}
	},
	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		-- -- meta:set_string("formspec", "invsize[10,11;]"..
			-- -- "background[-0.15,-0.25;10.40,11.75;clothing_loom_background.png]"..
			-- -- "list[current_name;input;7,2;1,1;]"..
			-- -- "list[current_name;output;7,4;1,1;]"..
			-- -- "label[7,1.5;Input Textile:]"..
			-- -- "label[7,3.5;Output Thread:]"..
			-- -- "label[0,0;Spinning Wheel:]"..
			-- -- "label[4,1.5;Spin]"..
			-- -- "item_image_button[4,2;1,1;clothing:feltthread;spin; ]"..
			-- -- "list[current_player;main;1,7;8,4;]")
		meta:set_string("infotext", "Spinning Wheel")
		local inv = meta:get_inventory()
		inv:set_size("output", 1)
	end,
	
	after_place_node = function(pos, placer)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", (placer:get_player_name() or ""))
		meta:set_string("infotext", "Spinning Wheel (owned by " .. (placer:get_player_name() or "") .. ")")
	end,
	
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("output") then
			return false
		end
		return true
	end,
	
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if listname~="output" then
			return 0
		end
		return stack:get_count()
	end,
	
	-- -- on_receive_fields = function(pos, formname, fields, sender)
		-- -- local meta = minetest.env:get_meta(pos)
		-- -- local inv = meta:get_inventory()
		-- -- if inv:is_empty("input") then
			-- -- return
		-- -- end
		-- -- local output = nil
		-- -- local qty = nil

		-- -- if fields["spin"] then
			-- -- if inv["input"] == "wool:wool" then
				-- -- output = "clothing:flaxthread"
				-- -- qty = "1"
			-- -- elseif inv["input"] == "farming:cotton" then
				-- -- output = "clothing:feltthread"
				-- -- qty = "1"
			-- -- end
		-- -- end

		-- -- if output and qty then
			-- -- local inputstack = inv:get_stack("input", 1)
			-- -- local outputstack = inv:get_stack("output", 1)
			-- -- local woolcol = inputstack:get_name()
			-- -- if woolcol then
				-- -- local color = woolcol:gsub("wool:", "")
				-- -- local stack = output..color.." "..qty
				-- -- if minetest.registered_items[output..color] and
						-- -- inv:room_for_item("output", stack) then
					-- -- inv:add_item("output", stack)
					-- -- inputstack:take_item()
					-- -- inv:set_stack("input", 1, inputstack)
				-- -- end
			-- -- end
		-- -- end
	-- -- end,
	
	on_rightclick = function(pos, node, clicker, itemstack)
		if itemstack:get_count() == 0 then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv:is_empty("output") then
				local return_stack = inv:get_stack("output", 1)
				inv:set_stack("output", 1, nil)
				local wield_index = clicker:get_wield_index()
				clicker:get_inventory():set_stack("main", wield_index, return_stack)
				remove_item(pos, node)
				return return_stack
			end		
		end
		-- local this_def = minetest.registered_nodes[node.name]
		-- if this_def.allow_metadata_inventory_put(pos, "output", 1, itemstack:peek_item(), clicker) > 0 then
			-- local s = itemstack:take_item()
			-- local meta = minetest.get_meta(pos)
			-- local inv = meta:get_inventory()
			-- inv:add_item("output", s)
			-- --update_item(pos,node)
		-- end
		-- return itemstack
	end,
	
	on_punch = function(pos, node, puncher)
		if( not( pos ) or not( node ) or not( puncher )) then
			return
		end

		local wielded = puncher:get_wielded_item()
		local meta = minetest.get_meta(pos)
		local inv  = meta:get_inventory()
		
		if wielded:get_count() == 0 then
			if not inv:is_empty("output") then
				local return_stack = inv:get_stack("output", 1)
				inv:set_stack("output", 1, nil)
				local wield_index = puncher:get_wield_index()
				puncher:get_inventory():set_stack("main", wield_index, return_stack)
				remove_item(pos, node)
			end		
		end
		
		-- only punching with the hammer is supposed to work
		-- if wielded:get_name() ~= 'lib_tools:anvil_hammer' then
			-- return
		-- end
		if wielded:get_name() ~= 'farming:cotton' then
			return
		end
		-- if (not string.find(wielded:get_name(), "fabric_cotton")) or (not string.find(wielded:get_name(), "fabric_wool")) then
			-- return
		-- end

		
		-- local input = inv:get_stack('output',1)
	
		-- only tools can be repaired
		-- if( not( input ) 
		-- or input:is_empty()
				-- or input:get_name() == "technic:water_can" 
				-- or input:get_name() == "technic:lava_can" ) then
			-- return
		-- end
	
		-- 65535 is max damage
		--local damage_state = 40-math.floor(input:get_wear()/1638)
		local damage_state = 40-math.floor(8/1638)
		--local damage_state = 8
	
		--local tool_name = input:get_name()

		local hud2 = nil
		local hud3 = nil
		if( damage_state > 0 ) then
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
				number = damage_state,
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
		if(   damage_state == 0 ) then
			local tool_desc
			if minetest.registered_items[wielded] and minetest.registered_items[wielded].description then
				tool_desc = minetest.registered_items[wielded].description
			else
				tool_desc = wielded
			end
			minetest.chat_send_player( puncher:get_player_name(), S('Your @1 has been spun successfully.', tool_desc))
			return
		else
			--pos.y = pos.y + anvil_item_displacement
			pos.y = pos.y + 7/16
			minetest.sound_play({name="default_dig_snappy"}, {pos=pos})
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
				--texture = "anvil_spark.png",
			})
		end
	
		-- do the actual repair
		--input:add_wear( -5000 ) -- equals to what technic toolshop does in 5 seconds
		-- --inv:set_stack("input", 1, input)
		-- --inv:add_item("output", s)
		if (string.find(wielded:get_name(), "cotton")) then
			inv:set_stack("output", 1, "lib_textiles:thread_cotton")
		elseif (string.find(wielded:get_name(), "wool")) then
			inv:set_stack("output", 1, "lib_textiles:thread_wool")
		else
			inv:set_stack("output", 1, "farming:string")
		end
		update_item(pos,node)
	
		-- damage the hammer slightly
		--wielded:add_wear( 100 )
		puncher:set_wielded_item( wielded )
	end,

})

--Craft

minetest.register_craft({
	output = 'lib_tools:spinning_wheel',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:stick', "group:wood", 'group:stick'},
	},
})
