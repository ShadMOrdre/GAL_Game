
--// matrix.mul ( m1, m2 )
-- Multiply two matrices; m1 columns must be equal to m2 rows
-- e.g. #m1[1] == #m2

local function matrix_mul( m1, m2 )
	-- multiply rows with columns
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m2[1] do
			local num = m1[i][1] * m2[1][j]
			for n = 2,#m1[1] do
				num = num + m1[i][n] * m2[n][j]
			end
			mtx[i][j] = num
		end
	end
	return setmetatable( mtx, matrix_meta )
end

return matrix_mul
