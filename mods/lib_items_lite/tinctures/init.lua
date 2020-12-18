tinctures = {}
function tinctures.register_potion(name, def)
	for i = 1, 5 do
		minetest.register_craftitem(name .. "_" .. tostring(i), {
			description = def.description .. "\n Level : " .. tostring(i),
			inventory_image = def.img,
		 
			on_drop = function(itemstack, dropper, pos)
				if not dropper or not dropper:is_player() then
					return
				end
				return def.on_use(itemstack, dropper, i)
			end,

			on_use = function(itemstack, user, pointed_thing)
				if not user or not user:is_player() then
					return
				end
				return def.on_use(itemstack, user, i)
			end,
		})
	end
end

tinctures.register_potion("tinctures:healing", {
	description = "Potion of Healing",
	img = "tinctures_red.png",
	on_use = function(itemstack, user, lvl)
		if not user or not user:is_player() then
			return
		end
		gal.player.cmsg.push_message_player(user, "[hp] + ".. tostring(10+lvl))
		user:set_hp(user:get_hp()+10+lvl)
		itemstack:take_item()
		return itemstack
	end
})

tinctures.register_potion("tinctures:jumping", {
	description = "Potion of Jumping",
	img = "tinctures_blue.png",
	on_use = function(itemstack, user, lvl)
		if not user or not user:is_player() then
			return
		end
		user:set_physics_override({
			gravity = 0.1,
		})
		gal.player.cmsg.push_message_player(user, "[effect] + jump")

		minetest.after(10.0+lvl*2, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				gravity = 1,	
			})
			gal.player.cmsg.push_message_player(pl, "[effect] - jump")
		end, user)
		itemstack:take_item()
		return itemstack
	end
})

tinctures.register_potion("tinctures:running", {
	description = "Potion of Running",
	img = "tinctures_yellow.png",
	on_use = function(itemstack, user, lvl)
		if not user or not user:is_player() then
			return
		end
		user:set_physics_override({
			speed = 3,
		})
		gal.player.cmsg.push_message_player(user, "[effect] + speed")

		minetest.after(10.0+lvl*2, function(pl)
			if not pl or not pl:is_player() then
				return
			end
			pl:set_physics_override({
				speed = 1,	
			})
			gal.player.cmsg.push_message_player(pl, "[effect] - speed")
		end, user)
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem("tinctures:strange", {
	description = "Strange Potion",
	inventory_image = "tinctures_black.png",
})

minetest.register_craftitem("tinctures:glass", {
	description = "Glass",
	inventory_image = "tinctures_glass.png",
})

minetest.register_craftitem("tinctures:upgrading", {
	description = "Potion of Upgrading",
	inventory_image = "tinctures_green.png",
})

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "tinctures:strange",
	recipe = {"tinctures:glass", "juice:cactus", "juice:cactus", "juice:water"},
	replacements = {
		{"juice:cactus", "juice:glass"},
		{"juice:cactus", "juice:glass"},
		{"juice:water", "juice:glass"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "tinctures:running",
	recipe = {"juice:water", "juice:water", "farming:sugar", "tinctures:glass"},
	replacements = {
		{"juice:water", "juice:glass"},
		{"juice:water", "juice:glass"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "tinctures:jumping",
	recipe = {"juice:water", "juice:water", "juice:apple", "tinctures:glass"},
	replacements = {
		{"juice:water", "juice:glass"},
		{"juice:water", "juice:glass"},
		{"juice:apple", "juice:glass"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "tinctures:upgrading",
	recipe = {"tinctures:strange", "default:stone_item", "farming:cactus", "default:sand"},
})

minetest.register_craft({
	output = "tinctures:glass 15",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "", "default:glass"},
		{"default:glass", "default:glass", "default:glass"},
	}
})
