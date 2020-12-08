--
-- Register biomes
--


-- Define constants that can be used in csv
local heights = {
	ocean_depth = gal_geology.ocean_depth,
	beach_depth = gal_geology.beach_depth,
	sea_level = gal_geology.sea_level,
	beach = gal_geology.maxheight_beach,
	coastal = gal_geology.maxheight_coastal,
	lowland = gal_geology.maxheight_lowland,
	shelf = gal_geology.maxheight_shelf,
	highland = gal_geology.maxheight_highland,
	mountain = gal_geology.maxheight_mountain,
	snow_min = gal_geology.minheight_snow,
	snow_max = gal_geology.maxheight_snow,
	strato = gal_geology.maxheight_strato,
}

local temperatures = {
	hot = gal_geology.temperature_hot,
	warm = gal_geology.temperature_warm,
	temperate = gal_geology.temperature_temperate,
	cool = gal_geology.temperature_cool,
	cold = gal_geology.temperature_cold,
}

local humidities = {
	humid = gal_geology.humidity_humid,
	semihumid = gal_geology.humidity_semihumid,
	temperate = gal_geology.humidity_temperate,
	semiarid = gal_geology.humidity_semiarid,
	arid = gal_geology.humidity_arid,
}

local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end

for i, biome in ipairs(gal.lib.csv.read("|", gal_geology.path .. "/" .. gal_geology.biome_data_file .. ".csv")) do

	--#Name|Dust|NodeTop|NodeTopDepth|Filler|FillerDepth|Stone|WaterTop|WaterTopDepth|Water|River water|RiverBed|RiverBedDepth|CaveLiquid|DungeonNode|DungeonAlt|DungeonStair|Y-min|Y-max|Temperature|Humidity|MaxPos|MinPos|VerticalBlend
	local a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x = unpack(biome)
	--minetest.log(a .. ", " .. b .. ", " .. c .. ", " .. d .. ", " .. e .. ", " .. f .. ", " .. g .. ", " .. h .. ", " .. i .. ", " .. j .. ", " .. k .. ", " .. l)

	-- Parse node names: transform empty strings into nil and separate node and count
--	b = read_node_str(b)
--	local c1, c2 = read_node_str(c)
--	local d1, d2 = read_node_str(d)
--	e = read_node_str(e)
--	local f1, f2 = read_node_str(f)
--	g = read_node_str(g)
--	h = read_node_str(h)

	minetest.register_biome({
		name = a,
		node_dust = b or nil,
		node_top = c or nil,
		depth_top = tonumber(d),
		node_filler = e or nil,
		depth_filler = tonumber(f),
		node_stone = g or nil,
		node_water_top = h or nil,
		depth_water_top = tonumber(i),
		node_water = j or nil,
		node_river_water = k or nil,
		node_riverbed = l or nil,
		depth_riverbed = tonumber(m),
		node_cave_liquid = n or nil,
		node_dungeon = o or nil,
		node_dungeon_alt = p or nil,
		node_dungeon_stair = q or nil,
		y_min = tonumber(r) or heights[r],
		y_max = tonumber(s) or heights[s],
		heat_point = tonumber(t) or temperatures[t],
		humidity_point = tonumber(u) or humidities[u],
		max_pos = tonumber(v),
		min_pos = tonumber(w),
		vertical_blend = tonumber(x) or gal_geology.biome_vertical_blend,
	})
end






















