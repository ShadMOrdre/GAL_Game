
--Mapgen object.


gal.mapgen.name = "gal_mapgen"
gal.mapgen.path = gal.path_mod .. "/mapgen"
gal.mapgen.ver_maj = 0
gal.mapgen.ver_min = 0
gal.mapgen.ver_rev = 1


--engine mapgen parameters.
gal.mapgen.mg_params = minetest.get_mapgen_params()
gal.mapgen.mg_seed = gal.mapgen.mg_params.seed


--## Valid choices are:
--## mg_v7, mg_v3d, mg_valleys2d, mg_valleys3d, mg_voronoi,
gal.mapgen.name = "mg_v3d"
gal.mapgen.natural_slopes = true


gal.mapgen.heightmap = {}
gal.mapgen.biomemap = {}
gal.mapgen.biome_info = {}


gal.mapgen.mg_world_scale = 1

if gal.mapgen.name == "mg_voronoi" then
	gal.lib.voronoi.world_scale = gal.mapgen.mg_world_scale
	gal.lib.voronoi.file2d = "" .. gal.path_world .. "/" .. "2d_data_points.txt"
	gal.lib.voronoi.file3d = "" .. gal.path_world .. "/" .. "3d_data_points.txt"
	gal.mapgen.distance_metric = "cm"
	gal.lib.voronoi.distance_metric = gal.mapgen.distance_metric
	gal.lib.metrics.set_dist_func(gal.lib.voronoi.distance_metric)
	gal.lib.voronoi.load_points_lite("" .. gal.path_world .. "/" .. "2d_data_points.txt")
	--gal.lib.voronoi.load_neighbors()
	--gal.lib.voronoi.load_edgemap()
end


gal.mapgen.water_level = (1 * gal.mapgen.mg_world_scale)

gal.mapgen.mgv7_mapgen_scale_factor =  8
gal.mapgen.biome_vertical_range =  40 * gal.mapgen.mg_world_scale
gal.mapgen.biome_vertical_blend = (gal.mapgen.biome_vertical_range / 5) * gal.mapgen.mg_world_scale
gal.mapgen.mg_biome_mode = "full"


--DEFAULTS
-- -192, -4, 0, 4, 30, 60, 90, 120, 150, 285, 485, 1250
-- -192, -4, 0, 4, 40, 80, 120, 160, 200, 380, 780, 1800
gal.mapgen.ocean_depth = -192 * gal.mapgen.mg_world_scale
gal.mapgen.beach_depth = -4 * gal.mapgen.mg_world_scale
gal.mapgen.sea_level = 0
gal.mapgen.maxheight_beach = 4 * gal.mapgen.mg_world_scale
gal.mapgen.maxheight_coastal = gal.mapgen.sea_level + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_lowland = gal.mapgen.maxheight_coastal + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_shelf = gal.mapgen.maxheight_lowland + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_highland = gal.mapgen.maxheight_shelf + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_mountain = gal.mapgen.maxheight_highland + gal.mapgen.biome_vertical_range
gal.mapgen.minheight_snow = gal.mapgen.maxheight_mountain + gal.mapgen.biome_vertical_range
gal.mapgen.maxheight_snow = gal.mapgen.minheight_snow  + (gal.mapgen.biome_vertical_range * 2)
gal.mapgen.maxheight_strato = gal.mapgen.maxheight_snow  + (gal.mapgen.biome_vertical_range * (gal.mapgen.biome_vertical_blend / 2))

-- 100, 75, 50, 25, 0
-- 90, 75, 50, 25, 10
-- 90, 70, 50, 30, 10
gal.mapgen.temperature_hot = 100
gal.mapgen.temperature_warm = 75
gal.mapgen.temperature_temperate = 50
gal.mapgen.temperature_cool = 25
gal.mapgen.temperature_cold = 0
gal.mapgen.humidity_humid = 100
gal.mapgen.humidity_semihumid = 75
gal.mapgen.humidity_temperate = 50
gal.mapgen.humidity_semiarid = 25
gal.mapgen.humidity_arid = 0


gal.mapgen.c_air				= nil
gal.mapgen.c_ignore				= nil

gal.mapgen.c_top				= nil
gal.mapgen.c_filler				= nil
gal.mapgen.c_stone				= nil
gal.mapgen.c_water				= nil
gal.mapgen.c_river				= nil
gal.mapgen.c_gravel				= nil

gal.mapgen.c_lava				= nil
gal.mapgen.c_ice				= nil
gal.mapgen.c_mud				= nil

gal.mapgen.c_cobble				= nil
gal.mapgen.c_mossy				= nil
gal.mapgen.c_block				= nil
gal.mapgen.c_brick				= nil
gal.mapgen.c_sand				= nil
gal.mapgen.c_dirt				= nil
gal.mapgen.c_dirtperm				= nil
gal.mapgen.c_dirtgrass				= nil


dofile(gal.mapgen.path .. "/mapgen_biome_data.lua")
dofile(gal.mapgen.path .. "/mapgen_biome_functions.lua")












