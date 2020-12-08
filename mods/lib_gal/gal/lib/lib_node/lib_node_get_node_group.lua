
--Get Node Group


local function get_node_group(name, group)
	if not minetest.registered_nodes[name] or not minetest.registered_nodes[name].groups[group] then
		return 0
	end
	return minetest.registered_nodes[name]
end

return get_node_group
