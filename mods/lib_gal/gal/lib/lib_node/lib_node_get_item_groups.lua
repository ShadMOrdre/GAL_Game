
--Get Item Groups
	
local function get_item_groups(name, groups)
	if not minetest.registered_items[name] or not minetest.registered_items[name].groups[group] then
		return 0
	end
	return minetest.registered_items[name].groups[group]
end
	
return get_item_groups

