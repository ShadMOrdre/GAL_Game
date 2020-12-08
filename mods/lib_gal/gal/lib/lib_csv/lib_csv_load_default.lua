

local function load_csv(separator, path)
	local file = io.open(""..path.."", "r")
	if file then
		local t = {}
		for line in file:lines() do
			if line:sub(1,1) ~= "#" and line:find("[^%"..separator.."% ]") then
				table.insert(t, line:split(separator, true))
			end
		end
		if type(t) == "table" then
			return t
		end
	end

	return nil
end

return load_csv
