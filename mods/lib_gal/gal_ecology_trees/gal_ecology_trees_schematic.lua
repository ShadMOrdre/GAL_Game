
-- Schematics Library

gal_ecology_trees.schematics = {}
gal_ecology_trees.schematics.ver_maj = 0
gal_ecology_trees.schematics.ver_min = 0
gal_ecology_trees.schematics.ver_rev = 1

	--nodes = {},
local schem_list = {
	name = "",
	def = {}
}


gal_ecology_trees.schematics.insert = function(name, def)
	schem_list[name] = def
end

gal_ecology_trees.schematics.select = function(name)
	return schem_list[name]
end


