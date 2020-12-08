
--// matrix.sub ( m1 ,m2 )
-- Subtract two matrices; m2 may be of bigger size than m1

local function matrix_sub( m1, m2 )
	local mtx = {}
	for i = 1,#m1 do
		local m3i = {}
		mtx[i] = m3i
		for j = 1,#m1[1] do
			m3i[j] = m1[i][j] - m2[i][j]
		end
	end
	return setmetatable( mtx, matrix_meta )
end

return matrix_sub
