
local S = lib_pottery.intllib
local dyes = lib_pottery.dyes

for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])

	minetest.register_node("lib_pottery:bowl_clay_" .. name, {
		description = S(desc .. " Clay Cup and Bowl"),
		drawtype = "nodebox",
		tiles = {"lib_materials_clay_baked_" .. name .. ".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_pottery = 1},
		--sounds = default.node_sound_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.375, 0, -0.4375, 0}, -- NodeBox1
				{-0.375, -0.4375, -0.4375, 0, -0.25, -0.375}, -- NodeBox2
				{-0.375, -0.4375, 0, 0, -0.25, 0.0625}, -- NodeBox3
				{-0.4375, -0.4375, -0.375, -0.375, -0.25, 0}, -- NodeBox4
				{0, -0.4375, -0.375, 0.0625, -0.25, 0}, -- NodeBox5
				{0.1875, -0.5, 0.1875, 0.3125, -0.4375, 0.3125}, -- NodeBox6
				{0.125, -0.4375, 0.1875, 0.1875, -0.0625, 0.3125}, -- NodeBox7
				{0.3125, -0.4375, 0.1875, 0.375, -0.0625, 0.3125}, -- NodeBox8
				{0.1875, -0.4375, 0.125, 0.3125, -0.0625, 0.1875}, -- NodeBox9
				{0.1875, -0.4375, 0.3125, 0.3125, -0.0625, 0.375}, -- NodeBox10
			},
		},

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

	minetest.register_node("lib_pottery:mortar_clay_" .. name, {
		description = S(desc .. " Clay Mortar and Pestle"),
		drawtype = "nodebox",
		tiles = {"lib_materials_clay_baked_" .. name .. ".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_pottery = 1},
		--sounds = default.node_sound_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
				{-0.1875, -0.4375, -0.1875, 0.1875, -0.375, 0.1875}, -- NodeBox2
				{-0.3125, -0.375, -0.3125, -0.1875, 0.125, 0.3125}, -- NodeBox3
				{0.1875, -0.375, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox4
				{-0.3125, -0.375, -0.3125, 0.3125, 0.125, -0.1875}, -- NodeBox5
				{-0.3125, -0.375, 0.1875, 0.3125, 0.125, 0.3125}, -- NodeBox6
				{-0.1875, -0.375, -0.1875, 0.25, -0.0625, 0.1875}, -- NodeBox7
				{-0.3125, -0.5, -0.5, 0.3125, -0.375, -0.375}, -- NodeBox8
			},
		},

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

	minetest.register_node("lib_pottery:pot_clay_" .. name, {
		description = S(desc .. " Clay Pot"),
		drawtype = "nodebox",
		tiles = {"lib_materials_clay_baked_" .. name .. ".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_pottery = 1},
		--sounds = default.node_sound_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, 0.5, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox1
				{-0.375, 0.4375, -0.375, 0.375, 0.375, 0.375}, -- NodeBox2
				{-0.3125, 0.375, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox3
				{-0.375, 0.3125, -0.375, 0.375, -0.5, 0.375}, -- NodeBox4
				{-0.4375, 0.25, -0.4375, 0.4375, -0.3125, 0.4375}, -- NodeBox5
				{-0.5, 0.1875, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox6
				{-0.4375, -0.375, -0.4375, 0.4375, -0.5, 0.4375}, -- NodeBox7
			},
		},

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

	minetest.register_node("lib_pottery:vase_small_clay_" .. name, {
		description = S(desc .. " Clay Vase Small"),
		drawtype = "nodebox",
		tiles = {"lib_materials_clay_baked_" .. name .. ".png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_pottery = 1},
		--sounds = default.node_sound_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.25, 0.125}, -- NodeBox1
				{-0.25, -0.375, -0.25, 0.25, 0.0625, 0.25}, -- NodeBox2
				{-0.3125, -0.25, -0.3125, 0.3125, 0, 0.3125}, -- NodeBox2
				{-0.1875, 0.125, -0.1875, 0.1875, 0.25, 0.1875}, -- NodeBox3
			},
		},

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

	minetest.register_node("lib_pottery:vase_large_clay_" .. name, {
		description = S(desc .. " Clay Vase Large"),
		drawtype = "mesh",
		mesh = "vase.obj",
		tiles = {"lib_materials_clay_baked_" .. name .. ".png"},
		visual_scale = 0.5,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_pottery = 1},
		--sounds = default.node_sound_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.25, -0.5, -0.25, 0.25, 0.375, 0.25},
			},
		},

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

	-- minetest.register_craft{
		-- type = "shapeless",
		-- output = "lib_pottery:vase_clay_" .. name,
		-- recipe = {"group:dye," .. craft_color_group, "group:baked_clay"},
	-- }
end


