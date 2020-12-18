blueprint = {}
blueprint.all = {}

function blueprint.register_blueprint(name, def)
	table.insert(def.materials, "blueprint:"..name)
	table.insert(blueprint.all, "blueprint:"..name)

	minetest.register_craftitem(":blueprint:"..name, {
		description = "Blueprint : " .. def.description,
		inventory_image = "blueprint_blueprint.png^[colorize:"..def.color..":80",
	})

	minetest.register_craft({
		type = "shapeless",
		output = def.out,
		recipe = def.materials,
		replacements = {
			{"blueprint:"..name, "blueprint:"..name}
		}
	})
end

minetest.register_craftitem("blueprint:empty", {
	description = "Empty Blueprint",
	inventory_image = "blueprint_empty.png",
	on_place = function(itemstack, placer, pointed_thing)
		local item = blueprint.all[math.random(#blueprint.all)]
		if placer:get_inventory():room_for_item("main", item) then
			placer:get_inventory():add_item("main", item)
			itemstack:take_item()
		else
			gal.player.cmsg.push_message_player(placer, "[info] You don't have any free space in your inventory.")	
		end
		return itemstack
	end
})

--table.insert(default.treasure_chest_items, "blueprint:empty")
