	

local mult = gal.lib.voronoi.world_scale
local dist_metric = gal.lib.voronoi.distance_metric
local map_size = gal.lib.voronoi.map_size
local voronoi_recursion_1 = gal.lib.voronoi.voronoi_recursion_1
local voronoi_recursion_2 = gal.lib.voronoi.voronoi_recursion_2
local voronoi_recursion_3 = gal.lib.voronoi.voronoi_recursion_3
	
--##
--##	GET NEAREST CELL
--##

	function gal.lib.voronoi.get_nearest_cell(pos, dist_type, tier)
	
		if not pos then
			return
		end
	
		local d_type
		if not dist_type then
			d_type = dist_metric
		else
			d_type = dist_type
		end
		if not tier then
			tier = 3
		end
	
		local closest_cell_idx = 0
		local closest_cell_dist = 0
		local last_closest_idx = 0
		local vert_closest_idx = 0
		local last_dist
		local this_dist
		local vert_dist
		local t_x
		local t_z
		local edge = ""
	
		for i, point in ipairs(gal.lib.voronoi.points) do
	
			if point.tier == tier then
	
				t_x = pos.x-point.x
				t_z = pos.z-point.z
	
				this_dist = gal.lib.metrics.get_dist(t_x, t_z, d_type)
		
				if last_dist then
					if last_dist > this_dist then
						closest_cell_idx = i
						closest_cell_dist = this_dist
						last_dist = this_dist
						last_closest_idx = i
					elseif last_dist == this_dist then
						closest_cell_idx = i
						closest_cell_dist = this_dist

						if not gal.lib.voronoi.edgemap[pos] then
						--if not gal.lib.voronoi.edgemap[i] then
							gal.lib.voronoi.edgemap[pos] = {}
							--gal.lib.voronoi.edgemap[i] = {}
						end
						gal.lib.voronoi.edgemap[pos].c_i = i
						gal.lib.voronoi.edgemap[pos].n_i = last_closest_idx

						--if not gal.lib.voronoi.edgemap[i].[last_closest_idx] then
						--	gal.lib.voronoi.edgemap[i].[last_closest_idx] = {}
						--end
						--gal.lib.voronoi.edgemap[i].[last_closest_idx].pos = pos

						edge = "edge"

						if vert_dist then
							if vert_dist > last_dist then
								vert_dist = last_dist
								vert_closest_idx = last_closest_idx
							elseif vert_dist == last_dist then
								
								if not gal.lib.voronoi.vertexmap[pos] then
									gal.lib.voronoi.vertexmap[pos] = {}
								end
								gal.lib.voronoi.vertexmap[pos].c_i = i
								gal.lib.voronoi.vertexmap[pos].n1_i = last_closest_idx
								gal.lib.voronoi.vertexmap[pos].n2_i = vert_closest_idx

--[[
								if not gal.lib.voronoi.vertexmap[i] then
									gal.lib.voronoi.vertexmap[i] = {}
								end

								if not gal.lib.voronoi.vertexmap[i].[last_closest_idx] then
									gal.lib.voronoi.vertexmap[i].[last_closest_idx] = {}
								end

								if not gal.lib.voronoi.vertexmap[i].[last_closest_idx].[vert_closest_idx] then
									gal.lib.voronoi.vertexmap[i].[last_closest_idx].[vert_closest_idx] = {}
								end

								gal.lib.voronoi.vertexmap[i].[last_closest_idx].[vert_closest_idx].pos = pos
--]]
								edge = "vert"
								
							end
						else
							vert_dist = this_dist
							vert_closest_idx = i
						end
					end
				else
					closest_cell_idx = i
					closest_cell_dist = this_dist
					last_dist = this_dist
					last_closest_idx = i
				end
			end
		end
	
		return closest_cell_idx, closest_cell_dist, t_z, t_x, edge
	
	end
	
	function gal.lib.voronoi.get_closest_cell_from_neighbors(pos, dist_type, cell_idx)
	
		if not pos then
			return
		end
	
		local d_type
		if not dist_type then
			d_type = dist_metric
		else
			d_type = dist_type
		end
		if not tier then
			tier = 3
		end
	
		local closest_cell_idx = 0
		local closest_cell_dist = 0
		local last_closest_idx = 0
		local last_dist
		local this_dist
		local t_x
		local t_z
		local edge = false

		local c_x = pos.x - gal.lib.voronoi.points[cell_idx].x
		local c_z = pos.z - gal.lib.voronoi.points[cell_idx].z
		local c_dist = gal.lib.metrics.get_dist(c_x, c_z, d_type)

		for i, neighbor in pairs(gal.lib.voronoi.neighbors[cell_idx]) do

			t_x = pos.x-gal.lib.voronoi.points[i].x
			t_z = pos.z-gal.lib.voronoi.points[i].z

			this_dist = gal.lib.voronoi.get_dist(t_x, t_z, d_type)
	
			if last_dist then
				if last_dist > this_dist then
					closest_cell_idx = i
					closest_cell_dist = this_dist
					last_dist = this_dist
					last_closest_idx = i
				elseif last_dist == this_dist then
					closest_cell_idx = last_closest_idx
					closest_cell_dist = this_dist
					edge = true
					if not gal.lib.voronoi.edgemap[{x=pos.x,z=pos.z}] then
						gal.lib.voronoi.edgemap[{x=pos.x,z=pos.z}] = {}
					end
					gal.lib.voronoi.edgemap[{x=pos.x,z=pos.z}].c_i = cell_idx
					gal.lib.voronoi.edgemap[{x=pos.x,z=pos.z}].n_i = last_closest_idx
				end
			else
				closest_cell_idx = i
				closest_cell_dist = this_dist
				last_dist = this_dist
				last_closest_idx = i
			end
		end

		if c_dist <= closest_cell_dist then
			closest_cell_idx = cell_idx
			closest_cell_dist = c_dist
			t_x = c_x
			t_z = c_z
		end
	
		return closest_cell_idx, closest_cell_dist, t_z, t_x, edge
	
	end
	
--##
--##	GET NEAREST MIDPOINT
--##

	function gal.lib.voronoi.get_nearest_midpoint(pos, cell_neighbors)
	
		if not pos then
			return
		end
	
		local d_type = dist_metric
	
		local c_midpoint
		local m_dist
		local this_dist
		local c_z
		local c_x
		local last_dist
	
		for i, i_neighbor in pairs(cell_neighbors) do
	
			t_x = pos.x-i_neighbor.m_x
			t_z = pos.z-i_neighbor.m_z
	
			this_dist = gal.lib.metrics.get_dist(t_x, t_z, d_type)
	
			if last_dist then
				if last_dist >= this_dist then
					last_dist = this_dist
					c_midpoint = i
					c_z =  i_neighbor.m_z
					c_x = i_neighbor.m_x
				end
			else
					last_dist = this_dist
			end
		end
	
		return c_midpoint, c_z, c_x
	
	end


--##
--##	GET CELL NEIGHBORS
--##

	function gal.lib.voronoi.get_cell_neighbors(cell_idx)
	
		local curr_cell = gal.lib.voronoi.points[cell_idx]
		local t_neighbors = {}
	
		if gal.lib.voronoi.neighbors[cell_idx] then

			t_neighbors = gal.lib.voronoi.neighbors[cell_idx]

		else

			gal.lib.voronoi.neighbors[cell_idx] = {}

			for i, i_point in ipairs(gal.lib.voronoi.points) do
	
				if i_point.tier == curr_cell.tier then
		
					local t_mid_x, t_mid_z
					local t_mid_cell
					local neighbor_add = false
		
					if i ~= cell_idx then
			
						t_mid_x, t_mid_z = gal.lib.metrics.get_midpoint({x = i_point.x, z = i_point.z}, {x = curr_cell.x, z = curr_cell.z})
		
						t_mid_cell = gal.lib.voronoi.get_nearest_cell({x = t_mid_x, z = t_mid_z}, dist_metric, curr_cell.tier)
		
						if (t_mid_cell == i) or (t_mid_cell == cell_idx) then
							neighbor_add = true
						end
		
					end
		
					if neighbor_add == true then
		
						gal.lib.voronoi.neighbors[cell_idx][i] = {}
						gal.lib.voronoi.neighbors[cell_idx][i].m_z = t_mid_z
						gal.lib.voronoi.neighbors[cell_idx][i].m_x = t_mid_x
						gal.lib.voronoi.neighbors[cell_idx][i].cm_zd = curr_cell.z - t_mid_z
						gal.lib.voronoi.neighbors[cell_idx][i].cm_xd = curr_cell.x - t_mid_x

						t_neighbors = gal.lib.voronoi.neighbors[cell_idx]

					end
				end
			end
		end
	
		return t_neighbors
	
	end

	function gal.lib.voronoi.get_all_neighbors()

		for i_p, i_point in ipairs(gal.lib.voronoi.points) do

			gal.lib.voronoi.get_cell_neighbors(i_p)

		end

	end
	
	
--[[

function gal.lib.voronoi.calculate_cell_vertices(cell_idx)

	local t_vertex = {}

	for i_c, i_cell in pairs(gal.lib.voronoi.cells) do
		if i_cell.c_i ==  cell_idx then
			if gal.lib.voronoi.points[i_cell.n_i].tier == gal.lib.voronoi.points[i_cell.c_i].tier then
				for i_n, i_neighbor in pairs(gal.lib.voronoi.cells) do
					if i_neighbor.c_i ==  i_cell.n_i then
						if gal.lib.voronoi.points[i_neighbor.n_i].tier == gal.lib.voronoi.points[i_neighbor.c_i].tier then
							for i_c, i_triple in pairs(gal.lib.voronoi.cells) do
								if (i_triple.c_i ==  i_neighbor.n_i) and (i_triple.c_i ~=  i_cell.c_i) then
									if gal.lib.voronoi.points[i_neighbor.n_i].tier == gal.lib.voronoi.points[i_neighbor.c_i].tier then
						
										local v_idx = i_cell.c_i .. "-" .. i_neighbor.c_i .. "-" .. i_triple.c_i
										--local c_pos = {x = i_cell.c_x, z = i_cell.c_z}
										--local n_pos = {x = i_neighbor.c_x, z = i_neighbor.c_z}
										--local t_pos = {x = i_triple.c_x, z = i_triple.c_z}
						
										--local tri_x, tri_z = gal.lib.voronoi.get_triangulation_2d(c_pos, n_pos, t_pos)
										local tri_x, tri_z = gal.lib.metrics.get_triangulation_2d({x = i_cell.c_x, z = i_cell.c_z}, {x = i_neighbor.c_x, z = i_neighbor.c_z}, {x = i_triple.c_x, z = i_triple.c_z})
										local cv_slope, cv_rise, cv_run = gal.lib.metrics.get_slope({x = i_cell.c_x, z = i_cell.c_z}, {x = tri_x, z = tri_z})
										--local edge_slope, edge_run, edge_rise = gal.lib.voronoi.get_slope_inverse({x = i_cell.c_x, z = i_cell.c_z}, {x = tri_x, z = tri_z})

										local t_compass
										local t_dir = {x = 0, z = 0}
						
										t_vertex[v_idx] = {}
										t_vertex[v_idx].c_i = i_cell.c_i
										t_vertex[v_idx].c_x = i_cell.c_x
										t_vertex[v_idx].c_z = i_cell.c_z
											--t_vertex[v_idx].c_pos = c_pos

										t_vertex[v_idx].n1_i = i_neighbor.c_i
										t_vertex[v_idx].n1_x = i_neighbor.c_x
										t_vertex[v_idx].n1_z = i_neighbor.c_z
											--t_vertex[v_idx].n1_pos = n_pos

										t_vertex[v_idx].n2_i = i_triple.c_i
										t_vertex[v_idx].n2_x = i_triple.c_x
										t_vertex[v_idx].n2_z = i_triple.c_z
											--t_vertex[v_idx].n2_pos = t_pos

										t_vertex[v_idx].v_x = tri_x
										t_vertex[v_idx].v_z = tri_z
											--t_vertex[v_idx].v_pos = {x = tri_x, z = tri_z}
						
										if tri_z > i_cell.c_z then
											t_dir.z = 1
											t_compass = "N"
										elseif tri_z < i_cell.c_z then
											t_dir.z = -1
											t_compass = "S"
										else
											t_dir.z = 0
											t_compass = ""
										end
										if tri_x > i_cell.c_x then
											t_dir.x = 1
											t_compass = t_compass .. "E"
										elseif tri_x < i_cell.c_x then
											t_dir.x = -1
											t_compass = t_compass .. "W"
										else
											t_dir.x = 0
											t_compass = t_compass .. ""
										end
										t_vertex[v_idx].v_d = t_dir
										t_vertex[v_idx].v_c = t_compass
	
											--t_vertex[v_idx].v_pos = {x = tri_x, z = tri_z}
										t_vertex[v_idx].cv_s = cv_slope
										t_vertex[v_idx].cv_sx = cv_run
										t_vertex[v_idx].cv_sz = cv_rise
									end
								end
							end
						end
					end
				end
			end
		end
	end

	--minetest.log("VERTICES: " .. dump(t_vertex))
	--print("VERTICES: " .. dump(t_vertex))

	return t_vertex

end

function gal.lib.voronoi.get_vertices_data()

	--local t_vertex = {}

	local temp_list = "#Idx|C_I|C_Pos|N1_I|N1_Pos|N2_I|N2_Pos|V_Pos\n"
	--local temp_vertices = "#Idx|C_I|C_Pos|N1_I|N1_Pos|N2_I|N2_Pos|V_Pos\n"
	local temp_vertices = ""
	local temp_vertex = ""
	
	local t0 = os.clock()
	minetest.log("[lib_voronoi] Voronoi Vertices Data generation start")

	for i_c, i_cell in pairs(gal.lib.voronoi.cells) do

		if gal.lib.voronoi.points[i_cell.n_i].tier == gal.lib.voronoi.points[i_cell.c_i].tier then

			for i_n, i_neighbor in pairs(gal.lib.voronoi.cells) do

				if i_neighbor.c_i ==  i_cell.n_i then

					if gal.lib.voronoi.points[i_neighbor.n_i].tier == gal.lib.voronoi.points[i_neighbor.c_i].tier then

						for i_c, i_triple in pairs(gal.lib.voronoi.cells) do

							if (i_triple.c_i ==  i_neighbor.n_i) and (i_triple.c_i ~=  i_cell.c_i) then

								if gal.lib.voronoi.points[i_neighbor.n_i].tier == gal.lib.voronoi.points[i_neighbor.c_i].tier then
					
									local v_idx = i_cell.c_i .. "-" .. i_neighbor.c_i .. "-" .. i_triple.c_i
									--local c_pos = {x = i_cell.c_x, z = i_cell.c_z}
									--local n_pos = {x = i_neighbor.c_x, z = i_neighbor.c_z}
									--local t_pos = {x = i_triple.c_x, z = i_triple.c_z}
					
									--local tri_x, tri_z = gal.lib.voronoi.get_triangulation_2d(c_pos, n_pos, t_pos)
									local tri_x, tri_z = gal.lib.metrics.get_triangulation_2d({x = i_cell.c_x, z = i_cell.c_z}, {x = i_neighbor.c_x, z = i_neighbor.c_z}, {x = i_triple.c_x, z = i_triple.c_z})
									local cv_slope, cv_rise, cv_run = gal.lib.metrics.get_slope({x = i_cell.c_x, z = i_cell.c_z}, {x = tri_x, z = tri_z})
									--local edge_slope, edge_run, edge_rise = gal.lib.voronoi.get_slope_inverse({x = i_cell.c_x, z = i_cell.c_z}, {x = tri_x, z = tri_z})

									local t_compass
									local t_dir = {x = 0, z = 0}
						
									gal.lib.voronoi.vertices[v_idx] = {}
									gal.lib.voronoi.vertices[v_idx].c_i = i_cell.c_i
									gal.lib.voronoi.vertices[v_idx].c_x = i_cell.c_x
									gal.lib.voronoi.vertices[v_idx].c_z = i_cell.c_z
										--gal.lib.voronoi.vertices[v_idx].c_pos = c_pos

									gal.lib.voronoi.vertices[v_idx].n1_i = i_neighbor.c_i
									gal.lib.voronoi.vertices[v_idx].n1_x = i_neighbor.c_x
									gal.lib.voronoi.vertices[v_idx].n1_z = i_neighbor.c_z
										--gal.lib.voronoi.vertices[v_idx].n1_pos = n_pos

									gal.lib.voronoi.vertices[v_idx].n2_i = i_triple.c_i
									gal.lib.voronoi.vertices[v_idx].n2_x = i_triple.c_x
									gal.lib.voronoi.vertices[v_idx].n2_z = i_triple.c_z
										--gal.lib.voronoi.vertices[v_idx].n2_pos = t_pos

									gal.lib.voronoi.vertices[v_idx].v_x = tri_x
									gal.lib.voronoi.vertices[v_idx].v_z = tri_z

									if tri_z > i_cell.c_z then
										t_dir.z = 1
										t_compass = "N"
									elseif tri_z < i_cell.c_z then
										t_dir.z = -1
										t_compass = "S"
									else
										t_dir.z = 0
										t_compass = ""
									end
									if tri_x > i_cell.c_x then
										t_dir.x = 1
										t_compass = t_compass .. "E"
									elseif tri_x < i_cell.c_x then
										t_dir.x = -1
										t_compass = t_compass .. "W"
									else
										t_dir.x = 0
										t_compass = t_compass .. ""
									end
									--gal.lib.voronoi.vertices[v_idx].v_d = t_dir
									--gal.lib.voronoi.vertices[v_idx].v_c = t_compass

										--gal.lib.voronoi.vertices[v_idx].v_pos = {x = tri_x, z = tri_z}
									gal.lib.voronoi.vertices[v_idx].cv_s = cv_slope
									gal.lib.voronoi.vertices[v_idx].cv_sx = cv_run
									gal.lib.voronoi.vertices[v_idx].cv_sz = cv_rise
					
									--	     "|{" .. t_dir.z .. "," .. t_dir.x .. "}|" .. t_compass .. 
									temp_vertex = v_idx .. "|".. i_cell.c_i .. "|".. i_cell.c_x .. "|" .. i_cell.c_z .. 
										     "|".. i_neighbor.c_i .. "|".. i_neighbor.c_x .. "|" .. i_neighbor.c_z .. 
										     "|".. i_triple.c_i .. "|".. i_triple.c_x .. "|" .. i_triple.c_z .. 
										     "|".. tri_x .. "|" .. tri_z .. 
										     "|".. cv_slope .. "|" .. cv_run .. "|" .. cv_rise .. "\n"

									--temp_vertex = v_idx .. "|".. i_cell.c_i .. 
									--	     "|".. i_neighbor.c_i .. 
									--	     "|".. i_triple.c_i .. 
									--	     "|".. tri_x .. "|" .. tri_z .. 
									--	     "|".. cv_slope .. "|" .. cv_run .. "|" .. cv_rise .. "\n"
								end
							end
						end

						temp_vertices = temp_vertex
						temp_vertex = ""

					end
				end
			end

			temp_list = temp_list .. temp_vertices
			temp_vertices = ""

		end
	end

	local t1 = os.clock()
	minetest.log("[lib_voronoi] Voronoi Vertices Data generation time " .. (t1-t0) .. " ms")
	print("[lib_voronoi] Voronoi Vertices Data generation time " .. (t1-t0) .. " ms")

	local lm_cells = gal.lib.voronoi.cells
	local lm_vertices = gal.lib.voronoi.vertices

	minetest.log("[lib_voronoi] # of Cells: " .. #lm_cells .. ";  # of Vertices: " .. #lm_vertices .. ";")
	print("[lib_voronoi] # of Cells: " .. #gal.lib.voronoi.cells .. ";  # of Vertices: " .. #gal.lib.voronoi.vertices .. ";")

	--minetest.log("VERTICES: " .. dump(gal.lib.voronoi.vertices))
	--print("VERTICES: " .. dump(t_vertex))

	--for i_v, i_vertex in pairs(gal.lib.voronoi.vertices) do
	--	temp_vertices = temp_vertices .. i_v .. "|".. i_vertex.c_i .. "|".. i_vertex.c_x .. "|" .. i_vertex.c_z .. 
	--		     "|".. i_vertex.n1_i .. "|".. i_vertex.n1_x .. "|" .. i_vertex.n1_z .. 
	--		     "|".. i_vertex.n2_i .. "|".. i_vertex.n2_x .. "|" .. i_vertex.n2_z .. 
	--		     "|".. i_vertex.v_x .. "|" .. i_vertex.v_z .. "\n"
	--end

	gal.lib.voronoi.save_csv(temp_list, "lib_voronoi_data_vertices.txt")

	-- Random cell generation finished. Check the timer to know the elapsed time.
	local t2 = os.clock()
	minetest.log("[lib_voronoi] Voronoi Vertices Data save time " .. (t2-t1) .. " ms")
	print("[lib_voronoi] Voronoi Vertices Data save time " .. (t2-t1) .. " ms")

	-- Print generation time of this mapchunk.
	local chugent = math.ceil((os.clock() - t0) * 1000)
	minetest.log("[lib_voronoi] Voronoi Vertices Data Total Time " .. chugent .. " seconds")
	print("[lib_voronoi] Voronoi Vertices Data Total Time " .. chugent .. " seconds")

end


function gal.lib.voronoi.load_vertices()

	local t_vertices
	if voronoi_mod_defaults == true then
		t_vertices = gal.lib.voronoi.load_defaults_csv("|", "lib_voronoi_data_vertices.txt")
	end

	if (t_vertices == nil) then
		t_vertices = gal.lib.voronoi.load_csv("|", "lib_voronoi_data_vertices.txt")
	end

	if (t_vertices == nil) then

		minetest.log("[lib_voronoi] Voronoi Vertex Data file not found.  Generating data instead.")
		print("[lib_voronoi] Voronoi Vertex Data file not found.  Generating data instead.")
		minetest.log("This is processing intensive, and may take a while, but only needs to run once to generate the data.  Please be patient.")
		print("This is processing intensive, and may take a while, but only needs to run once to generate the data.  Please be patient.")

		gal.lib.voronoi.get_vertices_data()

	else

		for i_v, t_vertex in pairs(t_vertices) do
			--#Idx|C_I|C_Pos|N1_I|N1_Pos|N2_I|N2_Pos|V_Pos
			--#v_i|c_i|c_x|c_z|n1_i|n1_x|n1_z|n2_i|n2_x|n2_z|v_x|v_z
			local v_idx, c_idx, c_posx, c_posz, n1_idx, n1_posx, n1_posz, n2_idx, n2_posx, n2_posz, v_posx, v_posz, cv_slope, cv_run, cv_rise = unpack(t_vertex)
			--local v_idx, c_idx, c_posx, c_posz, n1_idx, n1_posx, n1_posz, n2_idx, n2_posx, n2_posz, v_posx, v_posz, v_dir, v_compass, cv_slope, cv_run, cv_rise = unpack(t_vertex)
			--local v_idx, c_idx, n1_idx, n2_idx, v_posx, v_posz, cv_slope, cv_run, cv_rise = unpack(t_vertex)
	
			gal.lib.voronoi.vertices[v_idx] = {}
			gal.lib.voronoi.vertices[v_idx].c_i = tonumber(c_idx)
			if voronoi_scaled then

				gal.lib.voronoi.vertices[v_idx].c_z = (tonumber(c_posz) * 0.1)
				gal.lib.voronoi.vertices[v_idx].c_x = (tonumber(c_posx) * 0.1)
				gal.lib.voronoi.vertices[v_idx].n1_i = tonumber(n1_idx)
				gal.lib.voronoi.vertices[v_idx].n1_x = (tonumber(n1_posx) * 0.1)
				gal.lib.voronoi.vertices[v_idx].n1_z = (tonumber(n1_posz) * 0.1)
				gal.lib.voronoi.vertices[v_idx].n2_i = tonumber(n2_idx)
				gal.lib.voronoi.vertices[v_idx].n2_x = (tonumber(n2_posx) * 0.1)
				gal.lib.voronoi.vertices[v_idx].n2_z = (tonumber(n2_posz) * 0.1)
				gal.lib.voronoi.vertices[v_idx].v_x = (tonumber(v_posx) * 0.1)
				gal.lib.voronoi.vertices[v_idx].v_z = (tonumber(v_posz) * 0.1)
				gal.lib.voronoi.vertices[v_idx].cv_s = (tonumber(cv_slope) * 0.1)
				gal.lib.voronoi.vertices[v_idx].cv_sx = (tonumber(cv_run) * 0.1)
				gal.lib.voronoi.vertices[v_idx].cv_sz = (tonumber(cv_rise) * 0.1)

			else

				gal.lib.voronoi.vertices[v_idx].c_z = tonumber(c_posz)
				gal.lib.voronoi.vertices[v_idx].c_x = tonumber(c_posx)
				gal.lib.voronoi.vertices[v_idx].n1_i = tonumber(n1_idx)
				gal.lib.voronoi.vertices[v_idx].n1_x = tonumber(n1_posx)
				gal.lib.voronoi.vertices[v_idx].n1_z = tonumber(n1_posz)
				gal.lib.voronoi.vertices[v_idx].n2_i = tonumber(n2_idx)
				gal.lib.voronoi.vertices[v_idx].n2_x = tonumber(n2_posx)
				gal.lib.voronoi.vertices[v_idx].n2_z = tonumber(n2_posz)
				gal.lib.voronoi.vertices[v_idx].v_x = tonumber(v_posx)
				gal.lib.voronoi.vertices[v_idx].v_z = tonumber(v_posz)
				gal.lib.voronoi.vertices[v_idx].cv_s = tonumber(cv_slope)
				gal.lib.voronoi.vertices[v_idx].cv_sx = tonumber(cv_run)
				gal.lib.voronoi.vertices[v_idx].cv_sz = tonumber(cv_rise)

			end
			--gal.lib.voronoi.vertices[v_idx].v_d = v_dir
			--gal.lib.voronoi.vertices[v_idx].v_c = v_compass
		end
		minetest.log("[lib_voronoi] Voronoi Vertex Data loaded from file.")

	end
end


--]]


--##
--##	GENERATE VORONOI POINTS (2D)
--##

	function gal.lib.voronoi.make_voronoi_recursive_lite(cells_x, cells_y, cells_z, size, dist_type)
	
		if not cells_x or not cells_y or not cells_z or not size then
			return
		end
	
		-- Start time of voronoi generation.
		local t0 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Generation Start")
	
		local temp_points = "#Cell_Idx|Cell_Z|Cell_X|Tier\n" ..
				    "#C_Idx|C_Z|C_X|Tier\n"
	
		--Prevents points from too near edges, ideally creating more evenly sized cells.
		local size_offset = (size * 0.5) * 0.1
		local size_half = size * 0.5
	
		local v_idx = 1
	
		for i_c = 1, cells_x do
	
			--local m_pt_x = t_points[v_idx].x
			--local m_pt_z = t_points[v_idx].z
			local m_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local m_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
			gal.lib.voronoi.points[v_idx].z = m_pt_z
			gal.lib.voronoi.points[v_idx].x = m_pt_x
	
			gal.lib.voronoi.points[v_idx].tier = 1
	
			--t_points[v_idx] = {x = m_pt_x, z = m_pt_z}
			temp_points = temp_points .. v_idx .. "|" .. m_pt_z .. "|" .. m_pt_x .. 
					"|" .. "1" .. "\n"
	
			v_idx = v_idx + 1
	
		end
		temp_points = temp_points .. "#" .. "\n"
		local t1 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 1 Generation Time: " .. (t1-t0) .. " ms")
	
	
		--#(cells_x * (cells_y - 1))
		for i_t = 1, (cells_x * cells_y) do
	
			local p_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local p_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
			gal.lib.voronoi.points[v_idx].z = p_pt_z
			gal.lib.voronoi.points[v_idx].x = p_pt_x
	
			gal.lib.voronoi.points[v_idx].tier = 2
	
			temp_points = temp_points .. v_idx .. "|" .. p_pt_z .. "|" .. p_pt_x .. 
					"|" .. "2" .. "\n"
	
			v_idx = v_idx + 1
		end
		temp_points = temp_points .. "#" .. "\n"
		local t2 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 2 Generation Time: " .. (t2-t1) .. " ms")
	
	
		--#((cells_x * cells_y * cells_z) - (cells_x * cells_y))
		for i_c = 1, (cells_x * cells_y * cells_z) do
	
			local c_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local c_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
			gal.lib.voronoi.points[v_idx].z = c_pt_z
			gal.lib.voronoi.points[v_idx].x = c_pt_x
	
			gal.lib.voronoi.points[v_idx].tier = 3
	
			temp_points = temp_points .. v_idx .. "|" .. c_pt_z .. "|" .. c_pt_x .. 
					"|" .. "3" .. "\n"
	
			v_idx = v_idx + 1
	
		end
		temp_points = temp_points .. "#" .. "\n"
		local t3 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 3 Generation Time: " .. (t3-t2) .. " ms")
	
		--gal.lib.csv.save(temp_points, gal.path_world .. "/" .. gal.lib.voronoi.file2d)
		local t4 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Save Data Time: " .. (t4-t3) .. " ms")
	
		-- Random Points generation finished. Check the timer to know the elapsed time.
		local t5 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Total Generation Time: " .. (t5-t0) .. " ms")
	
	end

	function gal.lib.voronoi.make_voronoi_recursive_3d_lite(cells_x, cells_y, cells_z, size, dist_type)
	
		if not cells_x or not cells_y or not cells_z or not size then
			return
		end
	
		-- Start time of voronoi generation.
		local t0 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Generation Start")
	
		local temp_points = "#Cell_Idx|Cell_Z|Cell_Y|Cell_X|Master_Idx|Parent_Idx|Tier\n" ..
				    "#C_Idx|C_Z|C_Y|C_X|M_Idx|P_Idx|Tier\n"
	
		--Prevents points from too near edges, ideally creating more evenly sized cells.
		local size_offset = size * 0.1
		local size_half = size * 0.5
	
		local v_idx = 1
	
		for i_c = 1, cells_x do
	
			local m_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local m_pt_y = math.random(base_min, base_rng)
			local m_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
	
			gal.lib.voronoi.points[v_idx].z = m_pt_z
			gal.lib.voronoi.points[v_idx].y = m_pt_y
			gal.lib.voronoi.points[v_idx].x = m_pt_x
	
			gal.lib.voronoi.points[v_idx].tier = 1
	
			--t_points[v_idx] = {x = m_pt_x, z = m_pt_z}
			temp_points = temp_points .. v_idx .. "|" .. m_pt_z .. "|" .. m_pt_y .. "|" .. m_pt_x .. 
					"|" .. "1" .. "\n"
	
			v_idx = v_idx + 1
	
		end
		temp_points = temp_points .. "#" .. "\n"
		local t1 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 1 Generation Time: " .. (t1-t0) .. " ms")
	
	
		--#(cells_x * (cells_y - 1))
		for i_t = 1, (cells_x * cells_y) do
	
			local p_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local p_pt_y = math.random(base_min, base_rng)
			local p_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
			gal.lib.voronoi.points[v_idx].z = p_pt_z
			gal.lib.voronoi.points[v_idx].y = p_pt_y
			gal.lib.voronoi.points[v_idx].x = p_pt_x
	
			gal.lib.voronoi.points[v_idx].tier = 2
	
			temp_points = temp_points .. v_idx .. "|" .. p_pt_z .. "|" .. p_pt_y .. "|" .. p_pt_x .. 
					"|" .. "2" .. "\n"
	
			v_idx = v_idx + 1
		end
		temp_points = temp_points .. "#" .. "\n"
		local t2 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 2 Generation Time: " .. (t2-t1) .. " ms")
	
	
		--#((cells_x * cells_y * cells_z) - (cells_x * cells_y))
		for i_c = 1, (cells_x * cells_y * cells_z) do
	
			local c_pt_x = math.random(1 + size_offset, size - size_offset) - size_half
			local c_pt_y = math.random(base_min, base_rng)
			local c_pt_z = math.random(1 + size_offset, size - size_offset) - size_half
	
			gal.lib.voronoi.points[v_idx] = {}
			gal.lib.voronoi.points[v_idx].z = c_pt_z
			gal.lib.voronoi.points[v_idx].y = c_pt_y
			gal.lib.voronoi.points[v_idx].x = c_pt_x
	
	
			gal.lib.voronoi.points[v_idx].tier = 3
	
			temp_points = temp_points .. v_idx .. "|" .. c_pt_z .. "|" .. c_pt_y .. "|" .. c_pt_x .. 
					"|" .. "3" .. "\n"
	
			v_idx = v_idx + 1
	
		end
		temp_points = temp_points .. "#" .. "\n"
		local t3 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Tier 3 Generation Time: " .. (t3-t2) .. " ms")
	
		--gal.lib.csv.save(temp_points, gal.lib.voronoi.file3d)
		local t4 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Save Data Time: " .. (t4-t3) .. " ms")
	
		-- Random Points generation finished. Check the timer to know the elapsed time.
		local t5 = os.clock()
		minetest.log("[lib_voronoi] Recursive Voronoi Cell Random Points Total Generation Time: " .. (t5-t0) .. " ms")
	
	end


--##
--##	LOAD VORONOI POINTS
--##

--## 2D
	function gal.lib.voronoi.load_points_lite(pfile)
	
		if not pfile or pfile == "" then
			gal.lib.voronoi.mg_voronoi_defaults = true
			pfile = "" .. gal.lib.voronoi.path .. "/" .. gal.lib.voronoi.file2d .. ""
		end

		local t_points
	
		if gal.lib.voronoi.mg_voronoi_defaults == true then
			t_points = gal.lib.csv.load_modpath("|", pfile)
		end
	
		if (t_points == nil) then
			t_points = gal.lib.csv.load("|", pfile)
		end
	
		if (t_points == nil) then
	
			minetest.log("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
			print("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
	
			gal.lib.voronoi.make_voronoi_recursive_lite(voronoi_recursion_1, voronoi_recursion_2, voronoi_recursion_3, map_size, dist_metric)
	
		else
	
			for i_p, p_point in ipairs(t_points) do
		
				local idx, p_z, p_x, p_tier = unpack(p_point)
	
				gal.lib.voronoi.points[tonumber(idx)] = {}
		
				gal.lib.voronoi.points[tonumber(idx)].z = (tonumber(p_z)) * mult
				gal.lib.voronoi.points[tonumber(idx)].x = (tonumber(p_x)) * mult

				gal.lib.voronoi.points[tonumber(idx)].tier = tonumber(p_tier)
		
			end
	
			minetest.log("[lib_voronoi] Voronoi Cell Points loaded from file.")
	
		end
	end

--## 3D
	function gal.lib.voronoi.load_points_3d_lite(pfile)
	
		if not pfile or pfile == "" then
			gal.lib.voronoi.mg_voronoi_defaults = true
			pfile = "" .. gal.lib.voronoi.path .. "/" .. gal.lib.voronoi.file3d .. ""
		end

		local t_points
		local t_scale = mg_scale_factor
	
		if voronoi_mod_defaults == true then
			t_points = gal.lib.csv.load_modpath("|", pfile)
		end
	
		if (t_points == nil) then
			t_points = gal.lib.csv.load("|", pfile)
		end
	
		if (t_points == nil) then
	
			minetest.log("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
			print("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
	
			if voronoi_type == "single" then
				gal.lib.voronoi.get_points(voronoi_cells, map_size)
			else
				--gal.lib.voronoi.get_points2(voronoi_recursion_1, voronoi_recursion_2, voronoi_recursion_3, map_size)
				gal.lib.voronoi.make_voronoi_recursive_3d_lite(voronoi_recursion_1, voronoi_recursion_2, voronoi_recursion_3, map_size, mg_distance_measurement)
			end
	
		else
	
			for i_p, p_point in ipairs(t_points) do
		
				local idx, p_z, p_y, p_x, p_tier = unpack(p_point)
	
				gal.lib.voronoi.points[tonumber(idx)] = {}
		
				gal.lib.voronoi.points[tonumber(idx)].z = tonumber(p_z) * mult
				gal.lib.voronoi.points[tonumber(idx)].y = tonumber(p_y) * mult
				gal.lib.voronoi.points[tonumber(idx)].x = tonumber(p_x) * mult
	
				gal.lib.voronoi.points[tonumber(idx)].tier = tonumber(p_tier)
	
			end
	
			minetest.log("[lib_voronoi] Voronoi Cell Points loaded from file.")
	
		end
	end


--##
--##	LOAD CELL NEIGHBORS (2D)
--##

	function gal.lib.voronoi.load_neighbors(pfile)
	
		if not pfile or pfile == "" then
			--gal.lib.voronoi.mg_voronoi_defaults = true
			--pfile = "" .. gal.lib.voronoi.path .. "/" .. gal.lib.voronoi.file2d .. ""
			return
		end

		local t_neighbors
	
		--if gal.lib.voronoi.mg_voronoi_defaults == true then
		--	--t_neighbors = gal.lib.csv.load_modpath("|", pfile)
		--end
	
		if (t_neighbors == nil) then
			t_neighbors = gal.lib.csv.load("|", pfile)
		end
	
		if (t_neighbors == nil) then
	
			--minetest.log("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
			--print("[lib_voronoi] Voronoi Cell Points file not found.  Using randomly generated points.")
	
			if gal.lib.voronoi.voronoi_type == "single" then
				gal.lib.voronoi.get_all_neighbors()
			end
	
		else
	
			for i_p, p_neighbors in ipairs(t_neighbors) do
		
				local c_i, n_i, m_z, m_x, cm_zd, cm_xd = unpack(p_neighbors)
	
				if not (gal.lib.voronoi.neighbors[tonumber(c_i)]) then
					gal.lib.voronoi.neighbors[tonumber(c_i)] = {}
				end

				gal.lib.voronoi.neighbors[tonumber(c_i)][tonumber(n_i)] = {}
				gal.lib.voronoi.neighbors[tonumber(c_i)][tonumber(n_i)].m_z = tonumber(m_z)
				gal.lib.voronoi.neighbors[tonumber(c_i)][tonumber(n_i)].m_x = tonumber(m_x)
				gal.lib.voronoi.neighbors[tonumber(c_i)][tonumber(n_i)].cm_zd = tonumber(cm_zd)
				gal.lib.voronoi.neighbors[tonumber(c_i)][tonumber(n_i)].cm_xd = tonumber(cm_xd)
		
			end
	
			minetest.log("[lib_voronoi] Voronoi Cell Neighbors loaded from file.")
	
		end
	end

	function gal.lib.voronoi.save_neighbors(pfile)

		if not pfile or pfile == "" then
			return
		end

		local temp_neighbors = "#Cell_Index|Neighbor_Index|Midpoint_Zpos|Midpoint_Xpos|CellMidpoint_ZDistance|CellMidpoint_XDistance\n"
		
		for i_c, i_cell in pairs(gal.lib.voronoi.neighbors) do

			temp_neighbors = temp_neighbors .. "#C_I|N_I|M_Z|M_X|CM_ZD|CM_XD\n"

			--minetest.log("i_cell: " .. dump(i_cell))
			--print("i_cell: " .. dump(i_cell))
	
			for i_n, i_neighbor in pairs(i_cell) do

				temp_neighbors = temp_neighbors .. i_c .. "|" .. i_n .. "|" .. i_neighbor.m_z .. "|" .. i_neighbor.m_x .. "|" .. i_neighbor.cm_zd .. "|" .. i_neighbor.cm_xd .. "\n"

			end

			temp_neighbors = temp_neighbors .. "#" .. "\n"

		end

		gal.lib.voronoi.save_csv(temp_neighbors, pfile)
	
	end


--##
--##	LOAD EDGE MAP (2D)
--##

	function gal.lib.voronoi.load_edgemap(pfile)

		if not pfile or pfile == "" then
			--gal.lib.voronoi.mg_voronoi_defaults = true
			--pfile = "" .. gal.lib.voronoi.path .. "/" .. gal.lib.voronoi.file2d .. ""
			return
		end

		local t_edgemap

		--if gal.lib.voronoi.mg_voronoi_defaults == true then
		--	t_edgemap = gal.lib.csv.load_modpath("|", pfile)
		--end

		if (t_edgemap == nil) then
			t_edgemap = gal.lib.csv.load("|", pfile)
		end

		if (t_edgemap ~= nil) then

			for i_p, p_edgemap in ipairs(t_edgemap) do

				local e_x, e_z, c_i, n_i = unpack(p_edgemap)

				local e_pos = {x = tonumber(e_x), z = tonumber(e_z)}

				if not (gal.lib.voronoi.edgemap[e_pos]) then
					gal.lib.voronoi.edgemap[e_pos] = {}
				end

				gal.lib.voronoi.edgemap[e_pos].c_i = tonumber(c_i)
				gal.lib.voronoi.edgemap[e_pos].n_i = tonumber(n_i)

			end

			minetest.log("[lib_voronoi] Voronoi Edge Map loaded from file.")

		end
	end

	function gal.lib.voronoi.save_edgemap(pfile)

		if not pfile or pfile == "" then
			return
		end

		local temp_edgemap = "#Edge_XPos|Edge_ZPos|Cell_Index|Neighbor_Index\n"
		temp_edgemap = temp_edgemap .. "#E_X|E_Z|C_I|N_I\n"

		for i_e, i_edge in pairs(gal.lib.voronoi.edgemap) do

			temp_edgemap = temp_edgemap .. i_e.x .. "|" .. i_e.z .. "|" .. i_edge.c_i .. "|" .. i_edge.n_i .. "\n"

		end
	
		gal.lib.voronoi.save_csv(temp_edgemap, pfile)
	
	end


	
--##
--##	LOAD VORONOI DATA (2D)
--##

	minetest.log("[MOD] gal.lib.voronoi:  Voronoi Data Processing ...")

	--gal.lib.voronoi.load_points_lite()
	--gal.lib.voronoi.load_neighbors()
	--gal.lib.voronoi.load_edgemap()
	----gal.lib.voronoi.load_vertices()


	minetest.log("[MOD] gal.lib.voronoi:  Voronoi Data Processing Completed.")

	--minetest.log("[MOD] gal.lib.voronoi:   Base Max:" .. base_max .. ";  Base Min:" .. base_min .. ";  Base Range:" .. base_rng .. ";  Ease Factor:" .. easing_factor .. ";")
	--print("[lib_voronoi] Base Max:" .. base_max .. ";  Base Min:" .. base_min .. ";  Base Range:" .. base_rng .. ";  Ease Factor:" .. easing_factor .. ";")

	--minetest.log("[MOD] gal.lib.voronoi:   Base Height:" .. base_height)
	--print("[lib_voronoi] Base Height:" .. base_height)















