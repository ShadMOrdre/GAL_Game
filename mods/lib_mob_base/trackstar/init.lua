--------------------------------------------------------
-- Minetest :: Trackstar Mod v1.0 (trackstar)
--
-- See README.txt for licensing and other information.
-- Copyright (c) 2016-2019, Leslie Ellen Krause
--
-- ./games/just_test_tribute/mods/trackstar/init.lua
--------------------------------------------------------

local INF = 1/0

trackstar = {}


function Set( )
	local data = { }
	local self = { size = 0 }

	self.iterator = function ( )
		local k
		return function ( )
			-- use parens so only return key
			k = ( next( data, k ) )
			return k
		end
	end
	self.exists = function ( key )
		return data[ key ] ~= nil
	end
	self.insert = function ( key )
		data[ key ] = true
		self.size = self.size + 1
	end
	self.delete = function ( key )
		data[ key ] = nil
		self.size = self.size - 1
	end
	return self
end

local function def( val1, val2 )
	if val1 == nil then return val2 else return val1 end
end

local function get_distance( node1, node2 )
	return math.sqrt( math.pow( node2.x - node1.x, 2 ) + math.pow( node2.z - node1.z, 2 ) )
end

local function get_best_scoring_node( myset, f_score )
	local min_score = INF
	local node

	for n in myset.iterator( ) do
		local score = f_score[ n ]
		if score < min_score then
			min_score = score
			node = n
		end
	end
	return node
end

local function is_walkable_node( node, can_jump, can_drop, can_open, can_duck )

	-- check for most common hints first
	if not node or node.type == "#" then
		return false
	elseif node.type == "." or node.type == "A" or node.type == "B" then
		return true
	elseif node.type == "$" and can_duck then
		return true
	elseif node.type == "/" and can_open then
		return true
	elseif node.type == "+" and can_jump then
		return true
	elseif node.type == "-" and can_drop then
		return true
	end
	return false
end

local function get_neighbors( node, graph, can_jump, can_drop, can_open, can_duck, can_skip )
	local neighbors = { }
	local ax = node.x
	local az = node.z
	local y = node.y

	for x = -1, 1 do
		for z = -1, 1 do
			local bx = ax + x
			local bz = az + z
if ax > 0 and bx > 0 and bz > 0 and az > 0 and az < 44 and bz < 44 and ax < 44 and bx < 44 then
			local bn = graph[ y ][ bz ][ bx ]

			if is_walkable_node( bn, can_jump, can_drop, can_open, can_duck ) then
				-- handle ascent/descent hints within graph
				if bn.type == "+" then
				--	bn = graph[ y + 1 ][ bz ][ bx ]
				elseif bn.type == "-" then
				--	bn = graph[ y - 1 ][ bz ][ bx ]
				end

				if can_skip then
					table.insert( neighbors, bn )
				else
					local bn1 = graph[ y ][ bz ][ ax ]
					local bn2 = graph[ y ][ az ][ bx ]

					if x == 0 or z == 0 or (
						is_walkable_node( bn1, can_jump, can_drop, can_open, can_duck ) and
						is_walkable_node( bn2, can_jump, can_drop, can_open, can_duck )
					) then
						table.insert( neighbors, bn )
					else
					end
				end
			end
end
		end
	end
	return neighbors
end

local function unwind_path( flat_path, came_from, node )
	if came_from[ node ] then
print( "*", node.x, node.z )
		table.insert( flat_path, 1, came_from[ node ] ) 
		return unwind_path( flat_path, came_from, came_from[ node ] )
	else
print( "END", node.x, node.z, #flat_path )
		return flat_path
	end
end

local function filter_path( path )
	local idx = 1
	if #path > 1 then
		local old_dir
		repeat
			idx = idx + 1
			local node1 = path[ idx - 1 ]
			local node2 = path[ idx ]
			local dir = { x = node2.x - node1.x, z = node2.z - node1.z }

			node1.is_apex = not old_dir or dir.x ~= old_dir.x or dir.z ~= old_dir.z

			old_dir = dir
		until not path[ idx + 1 ]
	end
	path[ idx ].is_apex = true
end

local function find_path( base_node, goal_node, graph, options )
	if base_node == nil or goal_node == nil then return nil end		-- sanity check!

	local can_jump = def( options.can_jump, false )
	local can_drop = def( options.can_drop, true )
	local can_open = def( options.can_open, false )
	local can_duck = def( options.can_duck, true )
	local can_skip = def( options.can_skip, false )
	local can_fall = def( options.can_fall, false )
	local closedset = Set( )
	local openset = Set{ }
	local came_from = { }
	local g_score = { }
	local f_score = { }

	if not is_walkable_node( base_node, can_jump, can_drop, can_open, can_duck ) then
		-- fail if non-walkable starting node
		return nil
	end

	g_score[ base_node ] = 0
	f_score[ base_node ] = g_score[ base_node ] + get_distance( base_node, goal_node )

	openset.insert( base_node )

	while openset.size > 0 do
		local this_node = get_best_scoring_node( openset, f_score )
		if this_node == goal_node then
			local path = unwind_path( { goal_node }, came_from, goal_node )
--			table.insert( path, goal_node )
			filter_path( path )

			return path
		end

		openset.delete( this_node )
		closedset.insert( this_node )

		local neighbors = get_neighbors( this_node, graph, can_jump, can_drop, can_open, can_duck, can_skip )
		for _, next_node in ipairs( neighbors ) do

			if not closedset.exists( next_node ) then
				local tentative_g_score = g_score[ this_node ] + get_distance( this_node, next_node )
				 
				if not openset.exists( next_node ) or tentative_g_score < g_score[ next_node ] then 
					came_from[ next_node ] = this_node
					g_score[ next_node ] = tentative_g_score
					f_score[ next_node ] = g_score[ next_node ] + get_distance( next_node, goal_node )
					if not openset.exists( next_node ) then
						openset.insert( next_node )
					end
				end
			end
		end
	end
	return nil -- no valid path
end

----------------------------------------------------------------

-- nodes are stored in compressed "graph" for efficiency
--  # wall, not saved in graph
--  @ avoid (can start here, but never walk here)
--    air, not saved in graph
--  . floor
--  / door
--  $ ceiling (above node blocking)
--  + single jump (ascends grid for neighbor check)
--  - single drop (descends grid for neighbor check)
--  x cliff (probably requires much more storage and processing, unless enable storage of walls so could just assume air is cliff)

local graph = {}
local world = { }

local map = { }
map[ 1 ] = { }
map[ 2 ] = {
	".........................#.................",
	"...........................................",
	".................................++........",
	"...........#..#.......#/#...####..+........",
	"...#########..#########.#####X.##..........",
	"...##+####+#..#+...........#...##.+..###...",
	".../......./.............../...##.+..###...",
	"...#......./...............#...##.+..###...",
	"...###....##..#............##..##....###...",
	"....#+....+#..#.............#/##..+..###...",
	"....#......#..#......#......#.##.++..###...",
	"....#+....+#..#.............#.##.+...###...",
	"....#......#..#................#.....###...",
	"....#.++++.#..#...............##.+...###...",
	"....########//###..#####....#.##.+...###...",
	"..../.........#X#..######......#.++..###...",
	"..../........./.#..#...#......##.....###...",
	"....#......#..####..........#.###+++.###...",
	"...##..........+#..######...#..X#.++.###...",
	"....#..........##..#....#...#/###+++.###...",
	"....#..............#.......................",
	"....#......................................",
	"....#..............#.......................",
	"....#..........##..#....#..##/###+++.###...",
	"...##..........+#..######...#..X#.++.###...",
	"....#......#..####..........#.###+++.###...",
	"..../........./.#...###........#.....###...",
	"..../.........#X#...###+......##.++..###...",
	"....########//###...###.....#.##.+...###...",
	"....#+..####..#...............##.+...###...",
	"....#......#..#................#.....###...",
	"....#++...+#..#.............#.##.+...###...",
	"....#.....+#..#......#......#.##.++..###...",
	"....#+....+#..#.............#/##..+..###...",
	"...####...##..#............##..##....###...",
	"...#.+#..../...............#...##.+..###...",
	".../......./.............../...##.+..###...",
	"...##.#++++#..#............#...##.+..###...",
	"...#########..#########.#####X.##..........",
	"...........#..#.......#/#...####..+........",
	".................................++........",
	"......####.................................",
	".........................#.................",
}

function plot( x, y, z, type )
	local str = string.sub( map[ y ][ z ], 1, x - 1 ) .. type .. string.sub( map[ y ][ z ], x + 1 )
	map[ y ][ z ] = str
end

function glob( x, y, z )
--	if z >= 1 and z <= #map and y >= 1 and y <= #map[ 1 ] and x >= 1 and x <= #map[ 1 ][ 1 ] then
                return string.sub( map[ y ][ z ], x, x )
--	end
end

function colorize( str )
	str = string.gsub( str, "[ox]", "\027[32m%1\027[0m" )
	str = string.gsub( str, "[AB]", "\027[33m%1\027[0m" )
	str = string.gsub( str, "#", "\027[39m#\027[0m" )
	str = string.gsub( str, "%.", "\027[30;1m%1\027[0m" )
	str = string.gsub( str, "[-+]", "\027[36m%1\027[0m" )
	return str
end

function get_pos( obj )
	local y = math.floor( obj.y + 0.5 )
	local z = math.floor( obj.z + 0.5 )
	local x = math.floor( obj.x + 0.5 )

print( "?", x, y, z )
	if graph[ y ] and graph[ y ][ z ] and graph[ y ][ z ][ x ] then
		return graph[ y ][ z ][ x ]
	else
		return nil
	end
end

graph = { }
for y = 1, #map do
	print( "Reading Map Layer:", y )
	graph[ y ] = { }
	for z = 1, #map[ y ] do
		graph[ y ][ z ] = { }
		for x = 1, #map[ y ][ 1 ] do	-- assume first row length as baseline for all rows
			local type = glob( x, y, z )
--			if type ~= " " and type ~= "#" then
				-- only store walkable nodes (ignore air and solids)
				graph[ y ][ z ][ x ] = { x = x, y = y, z = z, type = type }

--			end
		end
--		print( "[" .. map[ y ][ z ] .. "]" )
	end
end

function trackstar.calculate_path( pos1, pos2, is_optimized )
	-- translate world coordinates to matrix indices (player pos must be lowered by 0.5)
	local base_node = get_pos( { x = 22 + pos1.x, y = pos2.y, z = 22 - pos1.z } )
	local goal_node = get_pos( { x = 22 + pos2.x, y = pos2.y, z = 22 - pos2.z } )

	print( "*** Calculating path ***" )
	if not base_node or not goal_node then
		print ( "No valid node found!" )
		return nil
	end

	print( string.format( "Base: x=%d, y=%d, z=%d", base_node.x, base_node.y, base_node.z ) )
	print( string.format( "Goal: x=%d, y=%d, z=%d", goal_node.x, goal_node.y, goal_node.z ) )

	local path = find_path( base_node, goal_node, graph, { can_duck = false, can_jump = true, can_drop = false, can_open = true } )
	if not path then
		print ( "No valid path found!" )
		return nil
	else
		local waypoints = { }

		for i, node in ipairs ( path ) do
			if not is_optimized or node.is_apex then
				table.insert( waypoints, { pos = { x = -22 + node.x, y = node.y, z = 22 - node.z }, type = node.type } )
			end
			plot( node.x, node.y, node.z, not is_optimized and "o" or node.is_apex and "o" or "x" )
		end

--		plot( base_node.x, base_node.y, base_node.z, "A" )
--		plot( goal_node.x, goal_node.y, goal_node.z, "B" )

		for z = 1, #map[ pos2.y ] do
			print( colorize( "[" .. map[ pos2.y ][ z ] .. "]" ) )
		end

		for i, node in ipairs ( path ) do
			plot( node.x, node.y, node.z, "." )	-- hack to reset map :/
		end

		return waypoints
	end
end

--[[
--WIP: Generate the hint_map automatically from 3d grid
--
local hint_map = { }
for y = 1, #map do
        hint_map[ y ] = { }
        for z = 1, #map[ 1 ] do
                hint_map[ y ][ z ] = { }
                for x = 1, #map[ 1 ][ 1 ] do
                        table.insert( hint_map[ y ][ z ], "?" )
                end
        end
end

for y = 1, #map - 1 do

        print( "Layer:", y )
        for z = 1, #map[ 1 ] do

                for x = 1, #map[ 1 ][ 1 ] do

                        local ta = "?"
                        local tb = y > 1 and hint_map[ y ][ z ][ x ] or nil

                        if tb == "!" then
                                local node_above = glob( x, y + 1, z )
                                if node_above == " "  then
                                        ta = "."
                                        tb = "+"
                                else
                                        ta = "#"
                                        tb = "#"
                                end
                        elseif not tb then
                                local node = glob( x, y, z )
                                local node_above = glob( x, y + 1, z )

                                -- ! = predict walkable (above)
                                -- ^ = predict step down (above)
                                if node == "A" then
                                        A = { x = x, y = y, z = z }
                                        tb = "."
                                elseif node == "B" then
                                        B = { x = x, y = y, z = z }
                                        tb = "."
                                elseif node == " " then
                                        if node_above == " " then
                                                ta = " "
                                                tb = "."
                                        else
                                                ta = "!"
                                                tb = "$"
                                        end
                                elseif node == "#" then
                                        if node_above == " "  then
                                                ta = "."
                                                tb = "+"
                                        else
                                                ta = "!"
                                                tb = "#"
                                        end
                                elseif node == "|" then
                                        ta = "X"
                                        tb = "/"
                                else
                                        ta = "?"
                                        tb = "?"
                                end
                        end

                        hint_map[ y ][ z ] = tb
                        hint_map[ y + 1 ][ z ][ x ] = ta
io.write( tb )
                end
io.write( "\n" )
print( table.concat( hint_map[ y ][ z ] ) )
        end
end
]]
