--This mod is licensed under CC BY-SA

local S = lib_textiles.intllib
local dyes = lib_textiles.dyes
local fabric_colors = {
	black  = "dye:black",
	blue   = "dye:blue",
	brown  = "dye:brown",
	green  = "dye:green",
	grey   = "dye:grey",
	pink   = "dye:pink",
	red    = "dye:red",
	white  = "dye:white",
	yellow = "dye:yellow"	
}




-- feltthreads
minetest.register_craftitem("lib_textiles:thread_cotton", {
	description = "Cotton Thread",
	inventory_image = "lottclothes_feltthread.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_textiles:thread_cotton 2",
	recipe = {"group:leaves","group:leaves","group:leaves","group:leaves"}
})

-- felt, a fabric made of feltthreads
for color, dye in pairs(fabric_colors) do
	minetest.register_craftitem("lib_textiles:cloth_cotton_"..color, {
		description = color:gsub("^%l", string.upper).." Cotton Cloth",
		inventory_image = "lottclothes_felt_"..color..".png"
	})
	
	if color == "white" then
		-- white is default color, all felt (no dye)
		minetest.register_craft({
			output = "lib_textiles:cloth_cotton_"..color.." 3",
			recipe = {
				{"lib_textiles:thread_cotton","lib_textiles:thread_cotton","lib_textiles:thread_cotton"},
				{"lib_textiles:thread_cotton","lib_textiles:thread_cotton","lib_textiles:thread_cotton"},
				{"lib_textiles:thread_cotton","lib_textiles:thread_cotton","lib_textiles:thread_cotton"},
			}
		})	
	else
		-- all other colors require little dye
		minetest.register_craft({
			output = "lib_textiles:cloth_cotton_"..color.." 3",
			recipe = {
				{"lib_textiles:thread_cotton",dye,"lib_textiles:thread_cotton"},
				{dye,"lib_textiles:thread_cotton",dye},
				{"lib_textiles:thread_cotton",dye,"lib_textiles:thread_cotton"},
			}
		})
	end
end





for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])

	minetest.register_node("lib_textiles:fabric_cotton_" .. name, {
		description = S(desc .. " Cotton Fabric"),
		tiles = {"lib_textiles_fabric_cotton_" .. name .. ".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_textiles_fabric_cotton = 1},
		sounds = gal.node_sound_defaults(),
	})

	minetest.register_craft{
		type = "shapeless",
		output = "lib_textiles:" .. name,
		recipe = {"group:dye," .. craft_color_group, "group:lib_textiles_fabric_cotton"},
	}

	--gal.lib.shapes.register_node("lib_textiles:fabric_cotton_"..name.."", "slab")
	--gal.lib.shapes.register_node("lib_textiles:fabric_cotton_"..name.."", "pane")
	--gal.lib.shapes.register_node("lib_textiles:fabric_cotton_"..name.."", "pane_centered")


end


