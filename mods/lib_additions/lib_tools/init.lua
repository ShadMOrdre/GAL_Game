

lib_tools = {}

lib_tools.version = "2.0"
lib_tools.mt_version_compat = "5.0"
lib_tools.path = minetest.get_modpath(minetest.get_current_modname())

--OLD CODE REPLACE BY Shad MOrdre 20190204
-- internationalization boilerplate
--lib_tools.MP = minetest.get_modpath(minetest.get_current_modname())
--lib_tools.gettext, lib_tools.ngettext = dofile(lib_tools.MP.."/intllib.lua")
--local S = lib_tools.gettext
--local NS = lib_tools.ngettext
--local S, NS = dofile(MP.."/intllib.lua")

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_tools.path.."/intllib.lua")
	end
end
lib_tools.intllib = S

minetest.log(S("[MOD] lib_tools:  Loading..."))
minetest.log(S("[MOD] lib_tools:  Version                  :" .. lib_tools.version))
minetest.log(S("[MOD] lib_tools:  MT Version Compatibility :" .. lib_tools.mt_version_compat))
minetest.log(S("[MOD] lib_tools:  Path                     :" .. lib_tools.path))


dofile(lib_tools.path.."/lib_tools_sound_defaults.lua")

dofile(lib_tools.path.."/utils.lua")
dofile(lib_tools.path.."/registration.lua")

--dofile(lib_tools.path.."/anvil.lua")
dofile(lib_tools.path.."/chess.lua")
--dofile(lib_tools.path.."/cooking.lua")
dofile(lib_tools.path.."/craftguide.lua")
dofile(lib_tools.path.."/lib_tools_display.lua")
dofile(lib_tools.path.."/lib_tools_tannery.lua")
dofile(lib_tools.path.."/enchanting3.lua")
dofile(lib_tools.path.."/enchanting.lua")
--dofile(lib_tools.path.."/mailbox.lua")
dofile(lib_tools.path.."/mechanisms.lua")
--dofile(lib_tools.path.."/nodes_straw.lua")
dofile(lib_tools.path.."/rope.lua")

--dofile(lib_tools.path.."/dual_furnace.lua")

dofile(lib_tools.path.."/config.lua")
--dofile(lib_tools.path.."/rubber.lua")
--dofile(lib_tools.path.."/flashlight.lua")
--dofile(lib_tools.path.."/sonic_screwdriver.lua")
dofile(lib_tools.path.."/tree_tap.lua")

--dofile(lib_tools.path.."/camp_kettle.lua")
--dofile(lib_tools.path.."/spit_with_kettle.lua")
dofile(lib_tools.path.."/spinning_wheel.lua")
dofile(lib_tools.path .. "/draft_table.lua")
--dofile(lib_tools.path .. "/wheels.lua")



--dofile(lib_tools.path .. "/shelf_api.lua")
--dofile(lib_tools.path .. "/shelf_nodes.lua")


minetest.register_node("lib_tools:scaffolding", {
	description = S("Wooden Scaffold"),
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {choppy=3, oddly_breakable_by_hand=3},
	sounds = gal.node_sound_wood_defaults(),
})




minetest.register_craftitem("lib_tools:bowl", {
	description = "Bowl",
	inventory_image = "xdecor_bowl.png",
	wield_image = "xdecor_bowl.png"
})

minetest.register_craftitem("lib_tools:bowl_soup", {
	description = "Bowl of soup",
	inventory_image = "xdecor_bowl_soup.png",
	wield_image = "xdecor_bowl_soup.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 1,
	on_use = function(itemstack, user)
		itemstack:replace("lib_tools:bowl 1")
		if rawget(_G, "hunger") then
			minetest.item_eat(20)
		else
			user:set_hp(20)
		end
		return itemstack
	end
})

minetest.register_node("lib_tools:television", {
	description = "Television",
	light_source = 11,
	groups = {snappy=3},
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"xdecor_television_left.png^[transformR270",
		 "xdecor_television_left.png^[transformR90",
		 "xdecor_television_left.png^[transformFX",
		 "xdecor_television_left.png",
		 "xdecor_television_back.png",
		{name="xdecor_television_front_animated.png",
			animation = {type="vertical_frames", length=80.0}
		}
	}
})

minetest.register_node("lib_tools:trampoline", {
	description = "Trampoline",
	drawtype = "nodebox",
	tiles = {"xdecor_trampoline.png", "mailbox_blank16.png", "xdecor_trampoline_sides.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1, fall_damage_add_percent=-80, bouncy=90},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5}, -- NodeBox1
		},
	},
	sounds = {footstep = {name="xdecor_bouncy", gain=0.8}},
})


minetest.register_node("lib_tools:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "nodebox",
	tiles = {"default_wood.png","default_wood.png","(default_wood.png^[transformR90)^[colorize:#00FFFF:30"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = p1.x - placer_pos.x,
				y = p1.y - placer_pos.y,
				z = p1.z - placer_pos.z
			}
			param2 = minetest.dir_to_facedir(dir)
		end

		if p0.y-1 == p1.y then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end

		return minetest.item_place(itemstack, placer, pointed_thing, param2)
	end,
})

minetest.register_node("lib_tools:ladder_junglewood", {
	description = "Jungle Wood Ladder",
	drawtype = "nodebox",
	tiles = {"default_junglewood.png","default_junglewood.png","default_junglewood.png^[transformR90"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = gal.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = p1.x - placer_pos.x,
				y = p1.y - placer_pos.y,
				z = p1.z - placer_pos.z
			}
			param2 = minetest.dir_to_facedir(dir)
		end

		if p0.y-1 == p1.y then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end

		return minetest.item_place(itemstack, placer, pointed_thing, param2)
	end,
})

minetest.register_node("lib_tools:ladder_steel", {
	description = "Steel Ladder",
	drawtype = "nodebox",
	tiles = {"default_steel_block.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.375, 0.5, 0.5}, -- LeftSupport
			{0.375, -0.5, 0.3125, 0.4375, 0.5, 0.5}, -- RightSupport
			{-0.5, -0.4375, 0.375, 0.5, -0.375, 0.5}, -- RungBottom
			{-0.5, -0.1875, 0.375, 0.5, -0.125, 0.5}, -- RungUpperBottom
			{-0.5, 0.0625, 0.375, 0.5, 0.125, 0.5}, -- RungLowerTop
			{-0.5, 0.3125, 0.375, 0.5, 0.375, 0.5}, -- RungTop
		}
	},
	groups = {choppy = 2},
	sounds = gal.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		local placer_pos = placer:getpos()
		if placer_pos then
			local dir = {
				x = p1.x - placer_pos.x,
				y = p1.y - placer_pos.y,
				z = p1.z - placer_pos.z
			}
			param2 = minetest.dir_to_facedir(dir)
		end

		if p0.y-1 == p1.y then
			param2 = param2 + 20
			if param2 == 21 then
				param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end

		return minetest.item_place(itemstack, placer, pointed_thing, param2)
	end,
})





minetest.register_craft({
	output = "lib_tools:bowl 3",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

minetest.register_craft({
	output = "lib_tools:cauldron_empty",
	recipe = {
		{"default:iron_lump", "", "default:iron_lump"},
		{"default:iron_lump", "", "default:iron_lump"},
		{"default:iron_lump", "default:iron_lump", "default:iron_lump"}
	}
})

minetest.register_craft({
	output = "lib_tools:enchantment_table",
	recipe = {
		{"", "default:book", ""},
		{"default:diamond", "default:obsidian", "default:diamond"},
		{"default:obsidian", "default:obsidian", "default:obsidian"}
	}
})

minetest.register_craft({
	output = "lib_tools:lever_off",
	recipe = {
		{"group:stick"},
		{"group:stone"}
	}
})

minetest.register_craft({
	output = "lib_tools:mailbox",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"dye:red", "default:paper", "dye:red"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "lib_tools:pressure_stone_off",
	type = "shapeless",
	recipe = {"group:stone", "group:stone"}
})

minetest.register_craft({
	output = "lib_tools:pressure_wood_off",
	type = "shapeless",
	recipe = {"group:wood", "group:wood"}
})

minetest.register_craft({
	output = "lib_tools:tv",
	recipe = {
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"}
	}
})

minetest.register_craftitem("lib_tools:iron_stick", {
	description = "Iron Stick",
	inventory_image = "darkage_iron_stick.png",
})



minetest.log(S("[MOD] lib_tools:  Successfully Loaded."))

