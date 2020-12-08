minetest.register_craftitem("gal:blueprint", {
	description = "lib_shapes Blueprint",
	inventory_image = "lib_node_shapes_blueprint.png",
})
minetest.register_craft({
	output = 'gal:blueprint',
	recipe = {
		{'default:paper', 'default:paper', 'default:paper'},
		{'default:paper', 'gal:pencil', 'default:paper'},
		{'default:paper', 'default:paper', 'default:paper'},
	}
})

minetest.register_craftitem("gal:pencil", {
	description = "lib_shapes Pencil",
	inventory_image = "lib_node_shapes_pencil.png",
})
minetest.register_craft({
	output = 'gal:pencil',
	recipe = {
		{'', 'group:stick', ''},
		{'', 'default:coal_lump', ''},
		{'', '', ''},
	}
})

