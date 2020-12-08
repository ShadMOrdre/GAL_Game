lib_tools.pixelbox = function(size, boxes)
	local fixed = {}
	for _, box in pairs(boxes) do
		-- `unpack` has been changed to `table.unpack` in newest Lua versions.
		local x, y, z, w, h, l = unpack(box)
		fixed[#fixed+1] = {
			(x / size) - 0.5,
			(y / size) - 0.5,
			(z / size) - 0.5,
			((x + w) / size) - 0.5,
			((y + h) / size) - 0.5,
			((z + l) / size) - 0.5
		}
	end
	return { type = "fixed", fixed = fixed }
end

