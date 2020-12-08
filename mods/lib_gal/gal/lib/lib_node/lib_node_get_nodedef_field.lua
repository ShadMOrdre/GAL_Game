
--Get Node Definition Field

local function get_nodedef_field(nodename, fieldname)
	if not minetest.registered_items[nodename] then
		if not minetest.registered_items[nodename][fieldname] then
			return nil
		end
	end
	return minetest.registered_nodes[nodename][fieldname]
end
	
return get_nodedef_field

