
--//  matrix.div ( m1, m2 )
-- Divide two matrices; m1 columns must be equal to m2 rows
-- m2 must be square, to be inverted,
-- if that fails returns the rank of m2 as second argument
-- e.g. #m1[1] == #m2; #m2 == #m2[1]

local function matrix_div( m1, m2 )
	local rank; m2,rank = matrix.invert( m2 )
	if not m2 then return m2, rank end -- singular
	return matrix.mul( m1, m2 )
end

return matrix_div
