
local S = gal.intllib

local node_register_alias_to_game = function(node_mod, node_name, alias_mod, alias_node)

	if node_mod then
		if node_name then
			if alias_mod then
				if alias_node then

					minetest.register_alias(""..node_mod..":"..node_name.."", ":gal:"..node_name.."")
					minetest.register_alias(""..alias_mod..":"..alias_node.."", ":gal:"..node_name.."")
			
					minetest.register_alias(node_name, ":gal:"..node_name.."")
					minetest.register_alias(alias_node, ":gal:"..node_name.."")
			
					--minetest.register_alias(""..alias_mod..":"..alias_node.."", ""..node_mod..":"..node_name.."")
					--minetest.register_alias(":gal:"..node_name.."", ""..node_mod..":"..node_name.."")

					return true
				else
					minetest.log("[ERROR] lib_node_register_alias_to_game:  Alias Mod: " .. alias_mod .. " provided without alias_node.  Alias not registered.")
					return false
				end
			else
				minetest.log("[ERROR] lib_node_register_alias_to_game:  Node Name: " .. node_name .. " provided without alias_mod.  Alias not registered.")
				return false
			end
		else
			minetest.log("[ERROR] lib_node_register_alias_to_game:  Mod Name: " .. node_mod .. " provided without node_name.  Alias not registered.")
			return false
		end
	else
		minetest.log("[ERROR] lib_node_register_alias_to_game:  Node: UNKNOWN provided without node_mod.  Alias not registered.")
		return false
	end

end

return node_register_alias_to_game
