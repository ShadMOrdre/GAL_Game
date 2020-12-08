
-- save list of generated lib_voronoi


local function save(pobj, path)

	local file = io.open(gal.path_world .. "/" .. path .. "", "w")

	if file then

		file:write(minetest.serialize(pobj))
		file:close()

	end
end

return
