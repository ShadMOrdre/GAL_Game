-- Schematics that NPCs can build MUST have a metadata file.
-- Metadata files are in the format of minetest.conf
-- Here are the required params:
--[[
	# Schematic file name. NOT A PATH! Relative paths work.
	schematic (Schematic) string

	# Size of the bounding box. If the box is too big, you may see
	# unwanted nodes appear.
	size (Bounding Box Size) v3f

	# Floor of the building. Decides how much of the build is inset into the ground.
	floor (Floor Offset) int 0
]]

nbq.schemmetacache = {}

function nbq.get_schematic_data(schemfile)
	if nbq.schemmetacache[schemfile] then
		return nbq.schemmetacache[schemfile]
	end

	-- Use minetest's Settings class.
	local stn = Settings(schemfile)

	local schem = stn:get("schematic")
	local size  = stn:get("size")
	local floor = stn:get("floor") or 0

	if not schem then
		error("Schematic file name is not defined in the schematic metadata file.")
	end

	if not size or not minetest.string_to_pos(size) then
		error("Size parameter is required.")
	end

	size = minetest.string_to_pos(size)
	local dir = schemfile:gsub("/([%w._]+)$", "")

	local resp = {
		schematic = schem,
		path      = dir .. "/" .. schem,
		size      = size,
		floor     = floor,
	}

	nbq.schemmetacache[schemfile] = resp

	return resp
end
