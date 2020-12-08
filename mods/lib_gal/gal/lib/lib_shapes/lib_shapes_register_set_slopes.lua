

local S = gal.lib.shapes.intllib

local nodes_created = 0

gal.lib.shapes.register_slope = function(node_mat, slope)

	local node_mod = ""
	local node_name = ""
	local node_def = {}
	local new_node = {}
	local new_node_name = ""
	local new_node_def = {}
	local new_node_tiles = {}
	local new_node_groups = {}

--[[
	local slope_def = {}
	--local slope_tiles = {}
	local slope_node_box = {}
	local slope_selection_box = {}
	local slope_collision_box = {}

	slope_def = gal.lib.shapes.registered_slopes["slope_" .. slope]
	slope_node_box = slope_def.node_box
	slope_selection_box = slope_def.selection_box
	slope_collision_box = slope_def.collision_box
--]]

	--node_mod, node_name = unpack(node_mat:split(":", true))
	node_def = minetest.registered_nodes["gal:"..node_mat]

	--new_node_name = node_mod .. ":" .. node_name .. "_" .. slope
	new_node_name = "" .. node_name .. "_" .. slope

	new_node_groups = table.copy(node_def.groups)
	--new_node_groups.not_in_creative_inventory = 1
	new_node_groups.lib_sloped_node = 3
	
	if node_def.tiles then
		if node_def.tiles[1] then
			new_node_tiles[1] = node_def.tiles[1]
		else
			new_node_tiles[1] = node_def.tiles
		end
		if node_def.tiles[2] then
			new_node_tiles[2] = node_def.tiles[2]
		else
			new_node_tiles[2] = new_node_tiles[1]
		end
		if node_def.tiles[3] then
			new_node_tiles[3] = node_def.tiles[3]
		else
			new_node_tiles[3] = new_node_tiles[2]
		end
		if node_def.tiles[4] then
			new_node_tiles[4] = node_def.tiles[4]
		else
			new_node_tiles[4] = new_node_tiles[3]
		end
		if node_def.tiles[5] then
			new_node_tiles[5] = node_def.tiles[5]
		else
			new_node_tiles[5] = new_node_tiles[3]
		end
		if node_def.tiles[6] then
			new_node_tiles[6] = node_def.tiles[6]
		else
			new_node_tiles[6] = new_node_tiles[3]
		end
	end

	new_node_def = {
		description = node_def.description .. "_" .. slope,
		drawtype = "mesh",
		tiles = new_node_tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = true,
		groups = new_node_groups,
		sounds = node_def.sounds,
		mesh = slope .. ".obj",
		--selection_box = slope_selection_box,
		--collision_box = slope_collision_box,
		
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
	}
	
	gal.lib.node.register_to_game(new_node_name, new_node_def)
	
	--minetest.register_craft({
	--	output = new_node_name .. " 99",
	--	recipe = {
	--		{ '', '', '' },
	--		{ '', 'gal:slope_' .. slope, ''},
	--		{ '', node_mat, ''},
	--	}
	--})

end

gal.lib.shapes.register_slope_set = function(node_mat)

	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_cut")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_half")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_half_raised")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner_cut")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner_cut_half")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner_cut_half_raised")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner_half")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_inner_half_raised")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer_cut")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer_cut_half")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer_cut_half_raised")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer_half")
	gal.lib.shapes.register_slope(node_mat, "moreblocks_slope_outer_half_raised")
	--gal.lib.shapes.register_slope(node_mat, "natural_slopes_inner")
	--gal.lib.shapes.register_slope(node_mat, "natural_slopes_outer")
	gal.lib.shapes.register_slope(node_mat, "natural_slopes_pike")
	--gal.lib.shapes.register_slope(node_mat, "natural_slopes_straight")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slope")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slopecorner")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slopecorner2")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slopeinsidecorner")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slopeinsidecorner2")
	--gal.lib.shapes.register_slope(node_mat, "simplyslopes_slopeinsidecorner2_copy")
	gal.lib.shapes.register_slope(node_mat, "block_1")
	gal.lib.shapes.register_slope(node_mat, "block_2")
	gal.lib.shapes.register_slope(node_mat, "block_3")
	gal.lib.shapes.register_slope(node_mat, "block_4")
	gal.lib.shapes.register_slope(node_mat, "block_5")
	gal.lib.shapes.register_slope(node_mat, "block_6")
	gal.lib.shapes.register_slope(node_mat, "block_7")
	gal.lib.shapes.register_slope(node_mat, "block_8")
	gal.lib.shapes.register_slope(node_mat, "block_9")
	gal.lib.shapes.register_slope(node_mat, "block_full")
	gal.lib.shapes.register_slope(node_mat, "corner")
	gal.lib.shapes.register_slope(node_mat, "inner_corner_ramp")
	gal.lib.shapes.register_slope(node_mat, "inner_corner_ramp_flat")
	gal.lib.shapes.register_slope(node_mat, "outer_corner_ramp")
	gal.lib.shapes.register_slope(node_mat, "outer_corner_ramp_flat")
	gal.lib.shapes.register_slope(node_mat, "pyramid")
	gal.lib.shapes.register_slope(node_mat, "pyramid_connected_corner")
	gal.lib.shapes.register_slope(node_mat, "pyramid_connected_cross")
	gal.lib.shapes.register_slope(node_mat, "pyramid_connected_end")
	gal.lib.shapes.register_slope(node_mat, "pyramid_connected_straight")
	gal.lib.shapes.register_slope(node_mat, "pyramid_connected_t")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight_connected_corner")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight_connected_cross")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight_connected_end")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight_connected_straight")
	gal.lib.shapes.register_slope(node_mat, "pyramid_halfheight_connected_t")
	gal.lib.shapes.register_slope(node_mat, "ramp")
	gal.lib.shapes.register_slope(node_mat, "ramps_inner_corner_ramp")
	gal.lib.shapes.register_slope(node_mat, "ramps_outer_corner_ramp")
	gal.lib.shapes.register_slope(node_mat, "ramps_ramp")

	nodes_created = nodes_created + 1

end


