
--// matrix.divnum ( m1, num )
-- Divide matrix by a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol

local function matrix_divnum( m1, num )
	local mtx = {}
	-- divide elements by number
	for i = 1,#m1 do
		local mtxi = {}
		mtx[i] = mtxi
		for j = 1,#m1[1] do
			mtxi[j] = m1[i][j] / num
		end
	end
	return setmetatable( mtx, matrix_meta )
end

return matrix_divnum
