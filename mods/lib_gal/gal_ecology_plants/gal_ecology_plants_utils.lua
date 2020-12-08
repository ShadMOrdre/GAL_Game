

--[[
--
-- Papyrus and cactus growing
--

-- Wrapping the functions in ABM action is necessary to make overriding them possible

function lib_ecology.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if minetest.get_item_group(minetest.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "default:cactus"})
	return true
end

function lib_ecology.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	local name = minetest.get_node(pos).name
	if name ~= "lib_materials:dirt_with_grass" and name ~= "lib_materials:dirt" then
		return
	end
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "default:papyrus"})
	return true
end

minetest.register_abm({
	label = "Grow cactus",
	nodenames = {"default:cactus"},
	neighbors = {"group:sand"},
	interval = 12,
	chance = 83,
	action = function(...)
		lib_ecology.grow_cactus(...)
	end
})

minetest.register_abm({
	label = "Grow papyrus",
	nodenames = {"default:papyrus"},
	neighbors = {"lib_materials:dirt", "lib_materials:dirt_with_grass"},
	interval = 14,
	chance = 71,
	action = function(...)
		lib_ecology.grow_papyrus(...)
	end
})
--]]

