paraglider = {}
paraglider.use = {}
paraglider.automatic = false

minetest.register_craftitem("paraglider:paraglider", {
	description = "Paraglider",
	inventory_image = "paraglider_item.png",
	on_use = function(itemstack, user, pointed_thing)
		if not user then
			return
		end
		if paraglider.use[user:get_player_name()] == true then
			user:set_physics_override({
				gravity = 1,
				jump = 1,
			})
			paraglider.use[user:get_player_name()] = false	
		else
			user:set_physics_override({
				gravity = 0.02,
				jump = 0,
			})
			paraglider.use[user:get_player_name()] = true
		end
	end
})

if paraglider.automatic then
	minetest.register_globalstep(function(dtime)
		for _, player in pairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			--local controls = player:get_player_control()
			if paraglider.use[name] == true then
				local pos = player:getpos()
				if minetest.get_node(vector.new(pos.x, pos.y-1, pos.z)).name ~= "air" then
					player:set_physics_override({
						gravity = 1,
						jump = 1,
					})
					paraglider.use[name] = false
				end
			end
		end
	end)
end

minetest.register_craft({
	output = "paraglider:paraglider",
	recipe = {
		{"default:wool_white", "default:wool_white", "default:wool_white"},
		{"default:string_strong", "", "default:string_strong"},
		{"", "default:string_strong", ""},
	}
})

