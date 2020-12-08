


minetest.override_item("gal:litter_sticks", {
	on_place = function(itemstack, placer, pointed_thing)
		local sound_pos = pointed_thing.above or placer:get_pos()
		minetest.sound_play(
			"default_tool_breaks",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = placer:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if node_under == "gal:litter_sticks" then
				if minetest.get_node(pointed_thing.above).name == "air" then
					minetest.set_node(pointed_thing.under, {name = "lib_handtools:campfire_unlit"})
				end
			else
				if minetest.get_node(pointed_thing.above).name == "air" then
					minetest.set_node(pointed_thing.above, {name = "gal:litter_sticks"})
				end
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(2000)
			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
	end,
})




