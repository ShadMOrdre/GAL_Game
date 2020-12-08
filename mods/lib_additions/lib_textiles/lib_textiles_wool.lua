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



-- flaxthreads made of dry_shrub. 2:1
minetest.register_craftitem("lib_textiles:thread_wool", {
	description = "Wool Thread",
	inventory_image = "lottclothes_flaxthread.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_textiles:thread_wool 2",
	recipe = {"default:dry_shrub","default:dry_shrub","default:dry_shrub","default:dry_shrub"}
})

-- flax, a fabric made of flaxthreads
for color, dye in pairs(fabric_colors) do
	minetest.register_craftitem("lib_textiles:cloth_wool_"..color, {
		description = color:gsub("^%l", string.upper).." Wool Cloth",
		inventory_image = "lottclothes_flax_"..color..".png"
	})
	
	if color == "white" then
		-- default to white
		minetest.register_craft({
			output = "lib_textiles:cloth_wool_"..color.." 3",
			recipe = {
				{"lib_textiles:thread_wool","lib_textiles:thread_wool","lib_textiles:thread_wool"},
				{"lib_textiles:thread_wool","lib_textiles:thread_wool","lib_textiles:thread_wool"},
				{"lib_textiles:thread_wool","lib_textiles:thread_wool","lib_textiles:thread_wool"},
			}
		})	
	else
		-- all other colors require little dye
		minetest.register_craft({
			output = "lib_textiles:cloth_wool_"..color.." 3",
			recipe = {
				{"lib_textiles:thread_wool",dye,"lib_textiles:thread_wool"},
				{dye,"lib_textiles:thread_wool",dye},
				{"lib_textiles:thread_wool",dye,"lib_textiles:thread_wool"},
			}
		})
	end
end




for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])

	minetest.register_node("lib_textiles:fabric_wool_" .. name, {
		description = S(desc .. " Wool Fabric"),
		tiles = {"lib_textiles_fabric_wool_" .. name .. ".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, lib_textiles_fabric_wool = 1},
		sounds = gal.node_sound_defaults(),
	})

	minetest.register_craft{
		type = "shapeless",
		output = "lib_textiles:" .. name,
		recipe = {"group:dye," .. craft_color_group, "group:lib_textiles_fabric_wool"},
	}

	--gal.lib.shapes..register_node("lib_textiles:fabric_wool_"..name.."", "slab")
	--gal.lib.shapes..register_node("lib_textiles:fabric_wool_"..name.."", "pane")
	--gal.lib.shapes..register_node("lib_textiles:fabric_wool_"..name.."", "pane_centered")


end


