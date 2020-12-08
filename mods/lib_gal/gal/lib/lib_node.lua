
--Node library

gal.lib.node = {}
gal.lib.node.name = "lib_node"
gal.lib.node.path = gal.lib.path .. "/lib_node"
gal.lib.node.ver_maj = 0
gal.lib.node.ver_min = 0
gal.lib.node.ver_rev = 1

node_registration_override = false
if node_registration_override then
	local mt_register_node = minetest.register_node
	function minetest.register_node(name, def)
		mt_register_node(":gal:" .. name, def)
	end
else

end



gal.lib.node.get_node_group = dofile(gal.lib.node.path .. "/lib_node_get_node_group.lua")

gal.lib.node.get_item_groups = dofile(gal.lib.node.path .. "/lib_node_get_item_groups.lua")

gal.lib.node.get_nodedef_field = dofile(gal.lib.node.path .. "/lib_node_get_nodedef_field.lua")




gal.lib.node.register_csv = dofile(gal.lib.node.path .. "/lib_node_register_csv.lua")

gal.lib.node.register_csv_to_game = dofile(gal.lib.node.path .. "/lib_node_register_csv_to_game.lua")

gal.lib.node.register = dofile(gal.lib.node.path .. "/lib_node_register.lua")

gal.lib.node.register_to_game = dofile(gal.lib.node.path .. "/lib_node_register_to_game.lua")

gal.lib.node.register_alias = dofile(gal.lib.node.path .. "/lib_node_register_alias.lua")

gal.lib.node.register_alias_to_game = dofile(gal.lib.node.path .. "/lib_node_register_alias_to_game.lua")


