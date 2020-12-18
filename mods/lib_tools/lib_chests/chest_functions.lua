


lib_chests.treasure = {

	always = {
		common = {
			{item = "gal:fruit_apple", prob = 3},
		},
		rare = {
			{item = "torch:torch", prob = 4},
		}
	},
	lowval = {
		common = {
			{item = "gal:food_bread", prob = 4},
			{item = "gal:tool_bucket_wood_empty", prob = 1},
		},
		rare = {
			{item = "gal:fruit_wheat", prob = 4},
			{item = "gal:fruit_carrot", prob = 4},
			{item = "gal:fruit_corn", prob = 4},
		}
	},
	medval = {
		common = {
			{item = "lib_handtools:tool_pick_bone", prob = 1},
			{item = "lib_handtools:tool_axe_wood", prob = 1},
			{item = "lib_handtools:tool_shovel_bone", prob = 1},
			{item = "lib_handtools:tool_digging_stick", prob = 1},
			{item = "lib_handtools:tool_fire_sticks", prob = 1},
			{item = "lib_handtools:tool_cudgel", prob = 1},
		},
		rare = {
			{item = "lib_tools:crafting_guide", prob = 1},
		}
	},
	highval = {
		common = {
			{item = "lib_handtools:tool_pick_stone", prob = 1},
			{item = "lib_handtools:tool_axe_stone", prob = 1},
			{item = "lib_handtools:tool_shovel_stone", prob = 1},
			{item = "lib_handtools:tool_hoe_stone", prob = 1},
			{item = "lib_handtools:tool_club_stone", prob = 1},
		},
		rare = {
			{item = "lib_forge:anvil", prob = 1},
			{item = "lib_forge:anvil_hammer", prob = 1},
		}
	},
	rare = {
		common = {
			{item = "lib_handtools:tool_pick_bronze", prob = 1},
			{item = "lib_handtools:tool_axe_bronze", prob = 1},
			{item = "lib_handtools:tool_shovel_bronze", prob = 1},
			{item = "lib_handtools:tool_hoe_bronze", prob = 1},
			{item = "lib_handtools:tool_sword_bronze", prob = 1},
		},
		rare = {
			{item = "lib_chests:chest", prob = 1},
			{item = "lib_forge:furnace_inactive", prob = 1},
		}
	}
}


function lib_chests.fill_chest(pos)

	local treasure = lib_chests.treasure

	-- find chests within radius
	local chestpos = minetest.find_node_near(pos, 25, {"lib_chests:chest"}, true)
  
	if not chestpos then
		minetest.chat_send_all(" no chest_pos found near ".. tostring(pos))
		return
	else
		minetest.chat_send_all("chest_pos ".. tostring(chestpos))
	end
  
	-- initialize chest (mts chests don't have meta)
	local meta = minetest.get_meta(chestpos)
	--local meta = minetest.get_meta(pos)
	if meta:get_string("infotext") ~= "Chest" then
		minetest.registered_nodes["lib_chests:chest"].on_construct(chestpos)
	end

	-- fill chest
	local inv = minetest.get_inventory( {type="node", pos=chestpos} )

	-- always
	for t = 1, #treasure.always.common do
		local i = treasure.always.common[t].item
		local p = treasure.always.common[t].prob
		inv:add_item("main", i .. " " .. math.random(1,p))
	end
	if math.random(0,1) < 1 then
		for t = 1, #treasure.always.rare do
			local i = treasure.always.rare[t].item
			local p = treasure.always.rare[t].prob
			inv:add_item("main", i .. " " .. math.random(1,p))
		end
	end

	-- low value items
	if math.random(0,1) < 1 then
		for t = 1, #treasure.lowval.common do
			local i = treasure.lowval.common[t].item
			local p = treasure.lowval.common[t].prob
			inv:add_item("main", i .. " " .. math.random(1,p))
		end
		if math.random(0,1) < 1 then
			for t = 1, #treasure.lowval.rare do
				local i = treasure.lowval.rare[t].item
				local p = treasure.lowval.rare[t].prob
				inv:add_item("main", i .. " " .. math.random(1,p))
			end
		end
	end

	-- medium value items
	if math.random(0,3) < 1 then
		for t = 1, #treasure.medval.common do
			local i = treasure.medval.common[t].item
			local p = treasure.medval.common[t].prob
			inv:add_item("main", i .. " " .. math.random(1,p))
		end
		if math.random(0,1) < 1 then
			for t = 1, #treasure.medval.rare do
				local i = treasure.medval.rare[t].item
				local p = treasure.medval.rare[t].prob
				inv:add_item("main", i .. " " .. math.random(1,p))
			end
		end
	end

	-- high value items
	if math.random(0,5) < 1 then
		for t = 1, #treasure.highval.common do
			local i = treasure.highval.common[t].item
			local p = treasure.highval.common[t].prob
			inv:add_item("main", i .. " " .. math.random(1,p))
		end
		if math.random(0,2) < 1 then
			for t = 1, #treasure.highval.rare do
				local i = treasure.highval.rare[t].item
				local p = treasure.highval.rare[t].prob
				inv:add_item("main", i .. " " .. math.random(1,p))
			end
		end
	end

	-- rare items
	if math.random(0,10) < 1 then
		for t = 1, #treasure.rare.common do
			local i = treasure.rare.common[t].item
			local p = treasure.rare.common[t].prob
			inv:add_item("main", i .. " " .. math.random(1,p))
		end
		if math.random(0,5) < 1 then
			for t = 1, #treasure.lowval.rare do
				local i = treasure.rare.rare[t].item
				local p = treasure.rare.rare[t].prob
				inv:add_item("main", i .. " " .. math.random(1,p))
			end
		end
	end
end


lib_chests.init_chests = function(pos)

	minetest.registered_nodes["lib_chests:chest"].on_construct(pos)

	minetest.after(3,lib_chests.fill_chest,pos)

end









