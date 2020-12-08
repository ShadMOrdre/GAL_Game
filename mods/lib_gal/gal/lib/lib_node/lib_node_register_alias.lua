
local S = gal.intllib

--gal.lib.node.register = {}

local node_register = function(node_mod, node_name, alias_mod, alias_node)


		minetest.register_alias(""..alias_mod..":"..alias_node.."", ""..node_mod..":"..node_name.."")
		minetest.register_alias(""..alias_node.."", ""..node_mod..":"..node_name.."")

		minetest.register_alias("node_name", ""..node_mod..":"..node_name.."")


end

return node_register
