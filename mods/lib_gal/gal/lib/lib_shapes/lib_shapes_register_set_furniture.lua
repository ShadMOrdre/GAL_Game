

local S = gal.lib.shapes.intllib

local _lib_furniture = {}

local nodes_created = 0


gal.lib.shapes.register_furniture_node = function(node_mat, shape)

	local node_mod = ""
	local node_name = ""
	local node_def = {}
	local new_node = {}
	local new_node_name = ""
	local new_node_def = {}
	local new_node_tiles = {}
	local new_node_groups = {}

	local shape_def = {}
	local shape_tiles = {}
	local shape_node_box = {}
	local shape_selection_box = {}
	local shape_collision_box = {}

	shape_def = gal.lib.shapes.registered_shapes["shape_" .. shape]
	shape_tiles = shape_def.tiles
	shape_node_box = shape_def.node_box
	shape_selection_box = shape_def.selection_box
	shape_collision_box = shape_def.collision_box

	--node_mod, node_name = unpack(node_mat:split(":", true))
	node_def = minetest.registered_nodes["gal:"..node_mat]

	--new_node_name = "" .. node_name .. "_" .. shape
	new_node_name = "" .. node_mat .. "_" .. shape

	new_node_groups = node_def.groups
	--new_node_groups.not_in_creative_inventory = 1
	new_node_groups.lib_shaped_node = 1
	new_node_groups.lib_furniture = 1
	
	if node_def.tiles then
		if shape_def.tiles then
			if shape_def.tiles[1] then
				if node_def.tiles[1] then
					new_node_tiles[1] = string.gsub(shape_def.tiles[1], "wall_texture", node_def.tiles[1])
				end
			else
				new_node_tiles[1] = node_def.tiles[1]
			end
				
			if shape_def.tiles[2] then
				if node_def.tiles[2] then
					new_node_tiles[2] = string.gsub(shape_def.tiles[2], "wall_texture", node_def.tiles[2])
				else
					new_node_tiles[2] = string.gsub(shape_def.tiles[2], "wall_texture", node_def.tiles[1])
				end
			else
				if node_def.tiles[2] then
					new_node_tiles[2] = node_def.tiles[2]
				else
					new_node_tiles[2] = node_def.tiles[1]
				end
			end
				
			if shape_def.tiles[3] then
				if node_def.tiles[3] then
					new_node_tiles[3] = string.gsub(shape_def.tiles[3], "wall_texture", node_def.tiles[3])
				else
					new_node_tiles[3] = string.gsub(shape_def.tiles[3], "wall_texture", node_def.tiles[1])
				end
			else
				if node_def.tiles[3] then
					new_node_tiles[3] = node_def.tiles[3]
				else
					new_node_tiles[3] = node_def.tiles[1]
				end
			end
				
			if shape_def.tiles[4] then
				if node_def.tiles[4] then
					new_node_tiles[4] = string.gsub(shape_def.tiles[4], "wall_texture", node_def.tiles[4])
				else
					if node_def.tiles[3] then
						new_node_tiles[4] = string.gsub(shape_def.tiles[4], "wall_texture", node_def.tiles[3])
					else
						new_node_tiles[4] = string.gsub(shape_def.tiles[4], "wall_texture", node_def.tiles[1])
					end
				end
			else
				if node_def.tiles[4] then
					new_node_tiles[4] = node_def.tiles[4]
				else
					if node_def.tiles[3] then
						new_node_tiles[4] = node_def.tiles[3]
					else
						new_node_tiles[4] = node_def.tiles[1]
					end
				end
			end
				
			if shape_def.tiles[5] then
				if node_def.tiles[5] then
					new_node_tiles[5] = string.gsub(shape_def.tiles[5], "wall_texture", node_def.tiles[5])
				else
					if node_def.tiles[3] then
						new_node_tiles[5] = string.gsub(shape_def.tiles[5], "wall_texture", node_def.tiles[3])
					else
						new_node_tiles[5] = string.gsub(shape_def.tiles[5], "wall_texture", node_def.tiles[1])
					end
				end
			else
				if node_def.tiles[5] then
					new_node_tiles[5] = node_def.tiles[5]
				else
					if node_def.tiles[3] then
						new_node_tiles[5] = node_def.tiles[3]
					else
						new_node_tiles[5] = node_def.tiles[1]
					end
				end
			end
				
			if shape_def.tiles[6] then
				if node_def.tiles[6] then
					new_node_tiles[6] = string.gsub(shape_def.tiles[6], "wall_texture", node_def.tiles[6])
				else
					if node_def.tiles[3] then
						new_node_tiles[6] = string.gsub(shape_def.tiles[6], "wall_texture", node_def.tiles[3])
					else
						new_node_tiles[6] = string.gsub(shape_def.tiles[6], "wall_texture", node_def.tiles[1])
					end
				end
			else
				if node_def.tiles[6] then
					new_node_tiles[6] = node_def.tiles[6]
				else
					if node_def.tiles[3] then
						new_node_tiles[6] = node_def.tiles[3]
					else
						new_node_tiles[6] = node_def.tiles[1]
					end
				end
			end
			
		else
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
	end

	new_node_def = {
		description = S(node_def.description .. "_" .. shape_def.description),
		drawtype = "nodebox",
		tiles = new_node_tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		connects_to = { "group:wall", "group:stone", "group:lib_furniture", "group:lib_doors", "group:lib_fences", "group:lib_general", "group:lib_shaped_node" },
		is_ground_content = false,
		walkable = true,
		groups = new_node_groups,
		sounds = node_def.sounds,
		node_box = shape_node_box,
		selection_box = shape_selection_box,
		collision_box = shape_collision_box,
		
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

	if (string.find(new_node_name, "chair")) or (string.find(new_node_name, "sofa")) then
		--new_node_def.on_rightclick = gal.lib.shapes.sittable(pos, node, clicker, itemstack, pointed_thing)
		new_node_def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			pos.y = pos.y + 0  -- Sitting position.
			gal.lib.shapes.sit(pos, node, clicker, pointed_thing)
		end

	end
	
	if (string.find(new_node_name, "bed")) then
		new_node_def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			beds.on_rightclick(pos, clicker)
		end
	end
	
	gal.lib.node.register_to_game(new_node_name, new_node_def)
	
	minetest.register_craft({
		output = new_node_name .. " 99",
		recipe = {
			{ '', '', '' },
			{ '', 'gal:shape_' .. shape, ''},
			{ '', node_mat, ''},
		}
	})

end


gal.lib.shapes.register_furniture_set = function(node_mat)

	--gal.lib.shapes.register_furniture_node(node_mat, "bed_simple")

	gal.lib.shapes.register_furniture_node(node_mat, "chair_arm_01")
	gal.lib.shapes.register_furniture_node(node_mat, "chair_arm_02")
	
	gal.lib.shapes.register_furniture_node(node_mat, "sofa_basic_01_corner")
	gal.lib.shapes.register_furniture_node(node_mat, "sofa_basic_01_left")
	gal.lib.shapes.register_furniture_node(node_mat, "sofa_basic_01_right")
	gal.lib.shapes.register_furniture_node(node_mat, "sofa_basic_01_section")
	
	
	gal.lib.shapes.register_furniture_node(node_mat, "cabinet_basic_01")
	
	gal.lib.shapes.register_furniture_node(node_mat, "chair_basic_01")
	
	gal.lib.shapes.register_furniture_node(node_mat, "stool_basic_01")
	
	gal.lib.shapes.register_furniture_node(node_mat, "table_basic_01")
	gal.lib.shapes.register_furniture_node(node_mat, "table_basic_02")
	gal.lib.shapes.register_furniture_node(node_mat, "table_half_01")
	gal.lib.shapes.register_furniture_node(node_mat, "table_section_01")

	nodes_created = nodes_created + 1

end







