
local S = gal.intllib

local node_register = function(name, def)

	if name then
		if def then
			minetest.register_node(":gal:" .. name, def)
			return name
		else
			minetest.log("[ERROR] lib_node_register:  Node Name: " .. name .. " provided without definition.  Node not registered.")
			return ""
		end
	else
		minetest.log("[ERROR] lib_node_register:  Cannot register unknown, empty, or malformed node name.  Node not registered.")
		return nil
	end

end

return node_register
