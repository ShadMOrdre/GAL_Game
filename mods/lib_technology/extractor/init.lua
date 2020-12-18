local chest = minetest.get_content_id("lib_chests:chest");

local chest_formspec =
	"size[8,9]"..
	gal.gui.gui_bg..
	gal.gui.gui_bg_img..
	gal.gui.gui_slots..
	"list[current_name;main;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
	"listring[current_name;main]"..
	"listring[current_player;main]"..
	gal.gui.get_hotbar_bg(0,4.85)

minetest.register_node("extractor:extractor", {
	description = "Extractor",
	inventory_image = "extractor_item.png",
	groups = {oddly_breakable_by_hand = 3},
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {"extractor.png"},
	selection_box = {type="regular"},
	node_box = {
		type = "fixed",
		fixed = {
			--spout
			{-0.3, 0.3, -0.3, 0.3, 0.0, 0.3},
			{-0.15, 0.3, -0.15, 0.15, 0.5, 0.15},
			--funnel base
			{-0.5, 0.0, -0.5, 0.5, -0.1, 0.5},
			--funnel walls
			{-0.5, 0.0, 0.4, 0.5, -0.5, 0.5},
			{0.4, 0.0, -0.5, 0.5, -0.5, 0.5},
			{-0.5, 0.0, -0.5, -0.4, -0.5, 0.5},
			{-0.5, 0.0, -0.5, 0.5, -0.5, -0.4},
		},	  
	},
	
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	
	on_dig = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory("main")
		
		for i, stack in ipairs(inv:get_list("main")) do
			local x = math.random(-4,4)/10
			local z = math.random(-4,4)/10
			
			minetest.env:add_item({x = pos.x + x, y = pos.y, z = pos.z + z}, stack)
			stack:clear()
			
			inv:set_stack("main", i, stack)
		end
		
		minetest.env:add_item(pos, "extractor:extractor")
		minetest.remove_node(pos)
	end,
})

minetest.register_abm({
	nodenames = {"extractor:extractor"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()

		for _,object in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
				if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
					local posob = object:getpos()
					if math.abs(posob.x-pos.x) <= 0.5 and (posob.y-pos.y <= 0.85 and posob.y-pos.y >= 0.3) then
						inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
						object:get_luaentity().itemstring = ""
						object:remove()
					end
				end
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"extractor:extractor"},
	neighbors = {"lib_chests:chest","lib_forge:furnace","lib_forge:furnace_active"},
	interval = 1.0,
	chance = 1,
	
	action = function(pos, node, active_object_count, active_object_count_wider)
		local min = {x=pos.x-1,y=pos.y-1,z=pos.z-1}
		local max = {x=pos.x+1,y=pos.y+1,z=pos.z+1}
		local vm = minetest.get_voxel_manip()	
		local emin, emax = vm:read_from_map(min,max)
		local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
		local data = vm:get_data()	

		local a = vm:get_node_at({x=pos.x,y=pos.y-1,z=pos.z}).name
		local b = vm:get_node_at({x=pos.x,y=pos.y+1,z=pos.z}).name

		if b == "lib_chests:chest" then
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			local invsize = inv:get_size("main")

			local meta2 = minetest.get_meta({x=pos.x,y=pos.y+1,z=pos.z});
			local inv2 = meta2:get_inventory()
			local invsize2 = inv2:get_size("main")
			if inv2:is_empty("main") == false then
				for i = 1,invsize2 do
					local stack = inv2:get_stack("main", i)
					local item = stack:get_name()
					if item ~= "" then
						if inv:room_for_item("main", item) == true then
						  stack:take_item(1)
						  inv2:set_stack("main", i, stack)

						  inv:add_item("main", item)
						  break
						end
					end
				end
			end
		end
		if b == "lib_forge:furnace" or b == "lib_forge:furnace_active" then
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			local invsize = inv:get_size("main")

			local meta2 = minetest.get_meta({x=pos.x,y=pos.y+1,z=pos.z});
			local inv2 = meta2:get_inventory()
			local invsize2 = inv2:get_size("dst")
			if inv2:is_empty("dst") == false then
				for i = 1,invsize2 do
					local stack = inv2:get_stack("dst", i)
					local item = stack:get_name()
					if item ~= "" then
						if inv:room_for_item("main", item) == true then
						  stack:take_item(1)
						  inv2:set_stack("dst", i, stack)

						  inv:add_item("main", item)
						  break
						end
					
					end
				end
			end
		end

		if a == "lib_chests:chest" then
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if inv:is_empty("main") == true then
				return
			end
			local invsize = inv:get_size("main")

			local meta2 = minetest.get_meta({x=pos.x,y=pos.y-1,z=pos.z});
			local inv2 = meta2:get_inventory()
			local invsize2 = inv2:get_size("main")
		
			for i = 1,invsize do
				local stack = inv:get_stack("main", i)
				local item = stack:get_name()
				if item ~= "" then
					if inv2:room_for_item("main", item) == true then
						stack:take_item(1)
						inv:set_stack("main", i, stack)

						inv2:add_item("main", item)
						break
					end
				end
			end
		elseif a == "lib_forge:furnace" or a == "lib_forge:furnace_active" then
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if inv:is_empty("main") == true then
				return
			end
			local invsize = inv:get_size("main")

			local meta2 = minetest.get_meta({x=pos.x,y=pos.y-1,z=pos.z});
			local inv2 = meta2:get_inventory()
			local invsize2 = inv2:get_size("src")
		
			for i = 1,invsize do
				local stack = inv:get_stack("main", i)
				local item = stack:get_name()
				if item ~= "" then
					if inv2:room_for_item("src", item) == true then
						stack:take_item(1)
						inv:set_stack("main", i, stack)

						inv2:add_item("src", item)
						break
					end
					
				end
			end
		elseif a == "air" then
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			if inv:is_empty("main") == true then
				return
			end
			local invsize = inv:get_size("main")

			for i = 1,invsize do
				local stack = inv:get_stack("main", i)
				local item = stack:get_name()
				
				if item ~= "" then
					stack:take_item(1)
					inv:set_stack("main", i, stack)

					minetest.env:add_item({x=pos.x + (math.random(-3,3)/10),y=pos.y-0.25,z=pos.z + (math.random(-3,3)/10)}, item)
					break
				end
			end
		end
	end,
})
minetest.register_craft({
	output = "extractor:extractor",
	recipe = {
		{"","default:steel_ingot",""},
		{"default:steel_ingot","default:chest","default:steel_ingot"},
		{"default:steel_ingot","","default:steel_ingot"},
	}
})