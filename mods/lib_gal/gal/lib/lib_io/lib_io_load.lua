
-- load list of generated lib_voronoi


local function load(pfilename)

	local file = io.open(gal.path_world.."/"..pfilename.."", "r")

	if file then

		local table = minetest.deserialize(file:read("*all"))

		if type(table) == "table" then

			return table

		end
	end

	return nil
end

