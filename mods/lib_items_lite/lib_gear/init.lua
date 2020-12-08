
lib_gear = {}

minetest.register_node("lib_gear:sprocket_on", {
	description = "Sprocket On",
	drawtype = "mesh",
	mesh = "gear3d_sprocket.obj",
	tiles = 	{
		{
			name = "gear3d_sprocket_fwd.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 192,
				aspect_h = 30,
				length = 1,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	},
	groups = {choppy=2, oddly_breakable_by_hand=1},

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.swap_node( pos,  {name = "lib_gear:sprocket_off", param1 = node.param1, param2 = node.param2}  );
	end,

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

minetest.register_node("lib_gear:sprocket_on_rev", {
	description = "Sprocket On Reversed",
	drawtype = "mesh",
	mesh = "gear3d_sprocket.obj",
	tiles = 	{
		{
			name = "gear3d_sprocket_rev.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 192,
				aspect_h = 30,
				length = 1,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	},
	groups = {choppy=2, oddly_breakable_by_hand=1},

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.swap_node( pos,  {name = "lib_gear:sprocket_off", param1 = node.param1, param2 = node.param2}  );
	end,

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

minetest.register_node("lib_gear:sprocket_off", {
	description = "Sprocket Off",
	drawtype = "mesh",
	mesh = "gear3d_sprocket.obj",
	tiles = 	{ "gear3d_sprocket_fwd.png^[verticalframe:12:0", },
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	},
	groups = {choppy=2, oddly_breakable_by_hand=1},
	
	on_punch = function(pos, node, puncher, pointed_thing)
		minetest.swap_node( pos, {name = "lib_gear:sprocket_on", param1 = node.param1, param2 = node.param2} );
	end,

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.swap_node( pos, {name = "lib_gear:sprocket_on_rev", param1 = node.param1, param2 = node.param2} );
		-- if clicker:get_player_control().sneak then
			-- minetest.swap_node( pos, {name = "lib_gear:sprocket_on_rev", param1 = node.param1, param2 = node.param2} );
		-- else
			-- minetest.swap_node( pos, {name = "lib_gear:sprocket_on", param1 = node.param1, param2 = node.param2} );
		-- end
	end,

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




