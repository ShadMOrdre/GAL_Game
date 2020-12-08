


if gal.mapgen.name ~= "mg_voronoi" then
	return
end

-------------------------------------------------------------
-- mg_voronoi  ©2020 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------

mg_voronoi = {}
mg_voronoi.name = "mg_voronoi"
mg_voronoi.ver_max = 0
mg_voronoi.ver_min = 1
mg_voronoi.ver_rev = 0
mg_voronoi.ver_str = mg_voronoi.ver_max .. "." .. mg_voronoi.ver_min .. "." .. mg_voronoi.ver_rev
mg_voronoi.authorship = "ShadMOrdre"
mg_voronoi.license = "LGLv2.1"
mg_voronoi.copyright = "2020"
mg_voronoi.path_mod = minetest.get_modpath(minetest.get_current_modname())
mg_voronoi.path_world = minetest.get_worldpath()

mg_voronoi.intllib = gal.intllib
local S = gal.intllib

minetest.log(S("[MOD] mg_voronoi:  Loading..."))
minetest.log(S("[MOD] mg_voronoi:  Version:") .. S(mg_voronoi.ver_str))
minetest.log(S("[MOD] mg_voronoi:  Legal Info: Copyright ") .. S(mg_voronoi.copyright) .. " " .. S(mg_voronoi.authorship) .. "")
minetest.log(S("[MOD] mg_voronoi:  License: ") .. S(mg_voronoi.license) .. "")


	--mg_voronoi.voxel_mg_voronoi = minetest.setting_get("mg_voronoi_enable") or true				--true

-- switch for debugging
	mg_voronoi.debug = false


	dofile(mg_voronoi.path_mod.."/mg_voronoi_mapgen.lua")					--WORKING MAPGEN with and without biomes


minetest.log(S("[MOD] mg_voronoi:  Successfully loaded."))








