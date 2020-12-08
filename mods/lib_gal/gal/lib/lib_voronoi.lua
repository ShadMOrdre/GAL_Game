


--Voronoi library

gal.lib.voronoi = {}
gal.lib.voronoi.name = "lib_voronoi"
gal.lib.voronoi.path = gal.lib.path .. "/lib_voronoi"
gal.lib.voronoi.ver_maj = 0
gal.lib.voronoi.ver_min = 0
gal.lib.voronoi.ver_rev = 1


	gal.lib.voronoi.world_scale = 0.1
	gal.lib.voronoi.distance_metric = "cm"
	gal.lib.voronoi.map_size = 60000 * gal.lib.voronoi.world_scale
	gal.lib.voronoi.voronoi_recursion_1 = 17
	gal.lib.voronoi.voronoi_recursion_2 = 17
	gal.lib.voronoi.voronoi_recursion_3 = 17
		
	gal.lib.voronoi.points = {}
	gal.lib.voronoi.neighbors = {}
	gal.lib.voronoi.edgemap = {}
	gal.lib.voronoi.vertexmap = {}

	gal.lib.voronoi.file2d = "2d_data_points.txt"
	gal.lib.voronoi.file3d = "3d_data_points.txt"

	gal.lib.metrics.set_dist_func(gal.lib.voronoi.distance_metric)

	dofile(gal.lib.voronoi.path .. "/voronoi_init.lua")

	--gal.lib.voronoi.some_function = dofile(gal.lib.voronoi.path .. "/voronoi_init.lua")










