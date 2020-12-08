
--// matrix.mulnum ( m1, num )
-- Multiply matrix with a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol

local function matrix_mulnum( m1, num )
	local mtx = {}
	-- multiply elements with number
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] * num
		end
	end
	return setmetatable( mtx, matrix_meta )
end

return matrix_mulnum
