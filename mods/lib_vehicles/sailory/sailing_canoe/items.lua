local S = minetest.get_translator("sailing_canoe")

minetest.register_craftitem("sailing_canoe:sail", {
  description = S("Sail"),
  inventory_image = "sailing_canoe_sail.png",
})


local itemdef =
{
	description = S("Canoe"),
	stack_max = 1,
	inventory_image = "sailing_canoe_inventory.png",
	wield_image = "sailing_canoe_wield.png",
	wield_scale = {x = 2, y = 2, z = 1},
	liquids_pointable = true,
	groups = {flammable = 2},

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node"
		then
			return
		end
		
		local meta = itemstack:get_meta()
		local flag_color = meta:get_string("flag_color")
		local sail_color = meta:get_string("sail_color")
		
		if flag_color == ""
		then
			flag_color = "red"
		end
		if sail_color == ""
		then
			sail_color = "white"
		end
		
		local staticdata = minetest.serialize(
			{
				flag_color = flag_color,
				sail_color = sail_color,
			})
		minetest.add_entity(pointed_thing.above, "sailing_canoe:canoe", staticdata)
	end,
}

minetest.register_craftitem("sailing_canoe:canoe", itemdef)
