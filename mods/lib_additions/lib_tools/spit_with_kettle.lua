local spit_with_kettle, sounds = {}, {}

-- Add more ingredients here that make a soup.
local ingredients_list = {
	"apple", "mushroom", "honey", "pumpkin", "egg", "bread", "meat",
	"chicken", "carrot", "potato", "melon", "rhubarb", "cucumber",
	"corn", "beans", "berries", "grapes", "tomato", "wheat"
}

spit_with_kettle.cbox = {
	{0,  0, 0,  16, 16, 0},
	{0,  0, 16, 16, 16, 0},
	{0,  0, 0,  0,  16, 16},
	{16, 0, 0,  0,  16, 16},
	{0,  0, 0,  16, 8,  16}
}

function spit_with_kettle.stop_sound(pos)
	local spos = minetest.hash_node_position(pos)
	if sounds[spos] then minetest.sound_stop(sounds[spos]) end
end

function spit_with_kettle.idle_construct(pos)
	local timer = minetest.get_node_timer(pos)
	timer:start(10.0)
	spit_with_kettle.stop_sound(pos)
end

function spit_with_kettle.boiling_construct(pos)
	local spos = minetest.hash_node_position(pos)
	sounds[spos] = minetest.sound_play("xdecor_boiling_water", {
		pos=pos, max_hear_distance=5, gain=0.8, loop=true
	})

	local meta = minetest.get_meta(pos)
	meta:set_string("infotext", "spit_with_kettle (active) - Drop some foods inside to make a soup")

	local timer = minetest.get_node_timer(pos)
	timer:start(5.0)
end

function spit_with_kettle.filling(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()

	if wield_item:sub(1,7) == "bucket:" then
		if wield_item:sub(-6) == "_empty" and not (node.name:sub(-6) == "_empty") then
			if itemstack:get_count() > 1 then
				if inv:room_for_item("main", "bucket:bucket_water 1") then
					itemstack:take_item()
					inv:add_item("main", "bucket:bucket_water 1")
				else
					minetest.chat_send_player(clicker:get_player_name(),
						"No room in your inventory to add a bucket of water.")
					return itemstack
				end
			else
				itemstack:replace("bucket:bucket_water")
			end
			minetest.set_node(pos, {name="lib_tools:spit_with_kettle_empty", param2=node.param2})
		elseif wield_item:sub(-6) == "_water" and node.name:sub(-6) == "_empty" then
			minetest.set_node(pos, {name="lib_tools:spit_with_kettle_idle", param2=node.param2})
			itemstack:replace("bucket:bucket_empty")
		end
		return itemstack
	end
end

function spit_with_kettle.idle_timer(pos)
	local below_node = {x=pos.x, y=pos.y-1, z=pos.z}
	if not minetest.get_node(below_node).name:find("fire") then
		return true
	end

	local node = minetest.get_node(pos)
	minetest.set_node(pos, {name="lib_tools:spit_with_kettle_boiling", param2=node.param2})
	return true
end

-- Ugly hack to determine if an item has the function `minetest.item_eat` in its definition.
local function eatable(itemstring)
	local item = itemstring:match("[%w_:]+")
	local on_use_def = minetest.registered_items[item].on_use
	if not on_use_def then return end
	return string.format("%q", string.dump(on_use_def)):find("item_eat")
end

function spit_with_kettle.boiling_timer(pos)
	local node = minetest.get_node(pos)
	local objs = minetest.get_objects_inside_radius(pos, 0.5)
	if not next(objs) then return true end

	local ingredients = {}
	for _, obj in pairs(objs) do
		if obj and not obj:is_player() and obj:get_luaentity().itemstring then
			local itemstring = obj:get_luaentity().itemstring
			local food = itemstring:match(":([%w_]+)")

			for _, ingredient in pairs(ingredients_list) do
				if food and (eatable(itemstring) or food:find(ingredient)) then
					ingredients[#ingredients+1] = food break
				end
			end
		end
	end

	if #ingredients >= 2 then
		for _, obj in pairs(objs) do obj:remove() end
		minetest.set_node(pos, {name="lib_tools:spit_with_kettle_soup", param2=node.param2})
	end

	local node_under = {x=pos.x, y=pos.y-1, z=pos.z}
	if not minetest.get_node(node_under).name:find("fire") then
		minetest.set_node(pos, {name="lib_tools:spit_with_kettle_idle", param2=node.param2})
	end
	return true
end

function spit_with_kettle.take_soup(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item()

	if wield_item:get_name() == "lib_tools:bowl" then
		if wield_item:get_count() > 1 then
			if inv:room_for_item("main", "lib_tools:bowl_soup 1") then
				itemstack:take_item()
				inv:add_item("main", "lib_tools:bowl_soup 1")
			else
				minetest.chat_send_player(clicker:get_player_name(),
					"No room in your inventory to add a bowl of soup.")
				return itemstack
			end
		else
			itemstack:replace("lib_tools:bowl_soup 1")
		end

		minetest.set_node(pos, {name="lib_tools:spit_with_kettle_empty", param2=node.param2})
	end
	return itemstack
end

lib_tools.register("spit_with_kettle_empty", {
	description = "spit_with_kettle",
	drawtype = "nodebox",
	groups = {cracky=2, oddly_breakable_by_hand=1},
	tiles = {"xdecor_cauldron_top_empty.png", "xdecor_cauldron_sides.png"},
	infotext = "spit_with_kettle (empty)",
	node_box = {
		type = "fixed",
		fixed = {

			{-0.225, 0.3125, 0.025, -0.2025, 0.4375, 0.0375}, -- rope1
			{0.2025, 0.3125, 0.025, 0.225, 0.4375, 0.0375}, -- rope2
			{-0.3125, -0.5, -0.0625, 0.3125, -0.3125, 0.125}, -- Log
			{-0.375, 0.4375, 0, 0.375, 0.5, 0.0625}, -- spit
			{-0.5, -0.5, 0, -0.375, 0.5, 0.0625}, -- xneg leg
			{0.375, -0.5, 0, 0.5, 0.5, 0.0625}, -- xpos leg
			
			{-0.1875, 0, -0.1875, 0.1875, 0.3125, -0.125}, -- zneg kettle side
			{-0.1875, 0, 0.1875, 0.1875, 0.3125, 0.25}, -- zpos kettle side
			{-0.25, 0, -0.125, -0.1875, 0.3125, 0.1875}, -- xneg kettle side
			{0.1875, 0, -0.125, 0.25, 0.3125, 0.1875}, -- xpos kettle side
			{-0.1875, -0.0625, -0.125, 0.1875, 0, 0.1875}, --  kettle bottom
			
			-- {-0.4375, 0.25, -0.0625, -0.375, 0.5, 0}, -- xneg zneg leg
			-- {-0.4375, 0, -0.125, -0.375, 0.25, -0.0625}, -- xneg zneg leg
			-- {-0.5, -0.25, -0.1875, -0.4375, 0, -0.125}, -- xneg zneg leg
			-- {-0.5, -0.5, -0.25, -0.4375, -0.25, -0.1875}, -- xneg zneg leg
			-- {-0.4375, 0.25, 0.0625, -0.375, 0.5, 0.125}, -- xneg zpos leg
			-- {-0.4375, 0, 0.125, -0.375, 0.25, 0.1875}, -- xneg zpos leg
			-- {-0.5, -0.25, 0.1875, -0.4375, 0, 0.25}, -- xneg zpos leg
			-- {-0.5, -0.5, 0.25, -0.4375, -0.25, 0.3125}, -- xneg zpos leg
			-- {0.375, 0.25, -0.0625, 0.4375, 0.5, 0}, -- xpos zneg leg
			-- {0.375, 0, -0.125, 0.4375, 0.25, -0.0625}, -- xpos zneg leg
			-- {0.4375, -0.25, -0.1875, 0.5, 0, -0.125}, -- xpos zneg leg
			-- {0.4375, -0.5, -0.25, 0.5, -0.25, -0.1875}, -- xpos zneg leg
			-- {0.375, 0.25, 0.0625, 0.4375, 0.5, 0.125}, -- xpos zpos leg
			-- {0.375, 0, 0.125, 0.4375, 0.25, 0.1875}, -- xpos zpos leg
			-- {0.4375, -0.25, 0.1875, 0.5, 0, 0.25}, -- xpos zpos leg
			-- {0.4375, -0.5, 0.25, 0.5, -0.25, 0.3125}, -- xpos zpos leg
			-- {-0.5, -0.5, -0.5, 0, -0.375, -0.375}, -- rock xneg zneg
			-- {0.0625, -0.5, -0.5, 0.5, -0.375, -0.375}, -- rock xpos zneg
			-- {-0.0625, -0.5, 0.375, 0.5, -0.375, 0.5}, -- rock xpos zpos
			-- {-0.5, -0.5, 0.375, -0.125, -0.375, 0.5}, -- rock xneg zpos
			-- {-0.5, -0.5, -0.125, -0.375, -0.375, 0.1875}, -- rock xneg z0
			-- {0.375, -0.5, -0.125, 0.5, -0.375, 0.1875}, -- rock xpos z0

			-- {-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			-- {-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			-- {-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			-- {-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			-- {-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			-- {-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			-- {-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		},
	},
	on_rotate = screwdriver.rotate_simple,
	on_construct = function(pos)
		spit_with_kettle.stop_sound(pos)
	end,
	on_rightclick = spit_with_kettle.filling,
})

lib_tools.register("spit_with_kettle_idle", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	tiles = {"xdecor_cauldron_top_idle.png", "xdecor_cauldron_sides.png"},
	drop = "lib_tools:spit_with_kettle_empty",
	infotext = "spit_with_kettle (idle)",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.225, 0.3125, 0.025, -0.2025, 0.4375, 0.0375}, -- rope1
			{0.2025, 0.3125, 0.025, 0.225, 0.4375, 0.0375}, -- rope2
			{-0.3125, -0.5, -0.0625, 0.3125, -0.3125, 0.125}, -- Log
			{-0.375, 0.4375, 0, 0.375, 0.5, 0.0625}, -- spit
			{-0.5, -0.5, 0, -0.375, 0.5, 0.0625}, -- xneg leg
			{0.375, -0.5, 0, 0.5, 0.5, 0.0625}, -- xpos leg
			
			{-0.1875, 0, -0.1875, 0.1875, 0.3125, -0.125}, -- zneg kettle side
			{-0.1875, 0, 0.1875, 0.1875, 0.3125, 0.25}, -- zpos kettle side
			{-0.25, 0, -0.125, -0.1875, 0.3125, 0.1875}, -- xneg kettle side
			{0.1875, 0, -0.125, 0.25, 0.3125, 0.1875}, -- xpos kettle side
			{-0.1875, -0.0625, -0.125, 0.1875, 0, 0.1875}, --  kettle bottom
		},
	},
	on_rotate = screwdriver.rotate_simple,
	on_rightclick = spit_with_kettle.filling,
	on_construct = spit_with_kettle.idle_construct,
	on_timer = spit_with_kettle.idle_timer
})

lib_tools.register("spit_with_kettle_boiling", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	drop = "lib_tools:spit_with_kettle_empty",
	infotext = "spit_with_kettle (active) - Drop foods inside to make a soup",
	damage_per_second = 2,
	tiles = {{name="xdecor_cauldron_top_anim_boiling_water.png",
			animation={type="vertical_frames", length=3.0}},
		"xdecor_cauldron_sides.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.225, 0.3125, 0.025, -0.2025, 0.4375, 0.0375}, -- rope1
			{0.2025, 0.3125, 0.025, 0.225, 0.4375, 0.0375}, -- rope2
			{-0.3125, -0.5, -0.0625, 0.3125, -0.3125, 0.125}, -- Log
			{-0.375, 0.4375, 0, 0.375, 0.5, 0.0625}, -- spit
			{-0.5, -0.5, 0, -0.375, 0.5, 0.0625}, -- xneg leg
			{0.375, -0.5, 0, 0.5, 0.5, 0.0625}, -- xpos leg
			
			{-0.1875, 0, -0.1875, 0.1875, 0.3125, -0.125}, -- zneg kettle side
			{-0.1875, 0, 0.1875, 0.1875, 0.3125, 0.25}, -- zpos kettle side
			{-0.25, 0, -0.125, -0.1875, 0.3125, 0.1875}, -- xneg kettle side
			{0.1875, 0, -0.125, 0.25, 0.3125, 0.1875}, -- xpos kettle side
			{-0.1875, -0.0625, -0.125, 0.1875, 0, 0.1875}, --  kettle bottom
		},
	},
	on_rotate = screwdriver.rotate_simple,
	on_rightclick = spit_with_kettle.filling,
	on_construct = spit_with_kettle.boiling_construct,
	on_destruct = function(pos)
		spit_with_kettle.stop_sound(pos)
	end,
	on_timer = spit_with_kettle.boiling_timer
})

lib_tools.register("spit_with_kettle_soup", {
	groups = {cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drawtype = "nodebox",
	drop = "lib_tools:spit_with_kettle_empty",
	infotext = "spit_with_kettle (active) - Use a bowl to eat the soup",
	damage_per_second = 2,
	tiles = {{name="xdecor_cauldron_top_anim_soup.png",
			animation={type="vertical_frames", length=3.0}},
		"xdecor_cauldron_sides.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.225, 0.3125, 0.025, -0.2025, 0.4375, 0.0375}, -- rope1
			{0.2025, 0.3125, 0.025, 0.225, 0.4375, 0.0375}, -- rope2
			{-0.3125, -0.5, -0.0625, 0.3125, -0.3125, 0.125}, -- Log
			{-0.375, 0.4375, 0, 0.375, 0.5, 0.0625}, -- spit
			{-0.5, -0.5, 0, -0.375, 0.5, 0.0625}, -- xneg leg
			{0.375, -0.5, 0, 0.5, 0.5, 0.0625}, -- xpos leg
			
			{-0.1875, 0, -0.1875, 0.1875, 0.3125, -0.125}, -- zneg kettle side
			{-0.1875, 0, 0.1875, 0.1875, 0.3125, 0.25}, -- zpos kettle side
			{-0.25, 0, -0.125, -0.1875, 0.3125, 0.1875}, -- xneg kettle side
			{0.1875, 0, -0.125, 0.25, 0.3125, 0.1875}, -- xpos kettle side
			{-0.1875, -0.0625, -0.125, 0.1875, 0, 0.1875}, --  kettle bottom
		},
	},
	on_rotate = screwdriver.rotate_simple,
	on_rightclick = spit_with_kettle.take_soup,
	on_destruct = function(pos)
		spit_with_kettle.stop_sound(pos)
	end
})

