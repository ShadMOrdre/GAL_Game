
-- Schematics Library

gal.lib.schematics = {}
gal.lib.schematics.name = "schematics"
gal.lib.schematics.path = gal.lib.path .. "/lib_schematics"
gal.lib.schematics.ver_maj = 0
gal.lib.schematics.ver_min = 0
gal.lib.schematics.ver_rev = 1


local schem_list = {
	schem_name = "",
	--local schem_size = {
	--	local x = nil,
	--	local y = nil,
	--	local z = nil
	--},
	--local schem_data = {},
	--local schem_yslice = {}
	schem_def = {}
}



--game.lib.schematics.delete

gal.lib.schematics.insert = function(name, def)
	schem_list[name] = def
end

gal.lib.schematics.select = function(name)
	return schem_list[name].def
end

--gal.lib.schematics.update


gal.lib.schematics.convert = dofile(gal.lib.schematics.path .. "/lib_schematics_convert.lua")
--gal.lib.schematics.convert = {}
--gal.lib.schematics.convert.mts2lua = dofile(gal.lib.schematics.path .. "/lib_schematics_convert/lib_schematics_convert_mts2lua.lua")
--gal.lib.schematics.convert_mts2lua = dofile(gal.lib.schematics.path .. "/lib_schematics_convert/lib_schematics_convert_mts2lua.lua")
--gal.lib.schematics.convert.mts2we
--gal.lib.schematics.convert.lua2mts
--gal.lib.schematics.convert.lua2we
--gal.lib.schematics.convert.we2lua
--gal.lib.schematics.convert.we2mts

--gal.lib.schematics.load.lua
--gal.lib.schematics.load.mts
--gal.lib.schematics.load.we

--gal.lib.schematics.save.lua
--gal.lib.schematics.save.mts
--gal.lib.schematics.save.we

--gal.lib.schematics.place
--gal.lib.schematics.get_node_list

