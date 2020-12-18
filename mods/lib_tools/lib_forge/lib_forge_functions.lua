

--
-- initialize furnace
--
function lib_forge.initialize_furnace(pos)

	-- find chests within radius
	local furnacepos = minetest.find_node_near(pos, 7, {"lib_forge:furnace"})

	-- initialize furnacepos (mts furnacepos don't have meta)
	if furnacepos then
		local meta = minetest.get_meta(furnacepos)
		if meta:get_string("infotext") ~= "furnace" then
			minetest.registered_nodes["lib_forge:furnace"].on_construct(furnacepos)
		end
	end
end

--
-- initialize furnace
--
function lib_forge.initialize_dual_furnace(pos)

	-- find chests within radius
	local furnacepos = minetest.find_node_near(pos, 7, {"lib_forge:dual_furnace"})

	-- initialize furnacepos (mts furnacepos don't have meta)
	if furnacepos then
		local meta = minetest.get_meta(furnacepos)
		if meta:get_string("infotext") ~= "furnace" then
			minetest.registered_nodes["lib_forge:dual_furnace"].on_construct(furnacepos)
		end
	end
end

