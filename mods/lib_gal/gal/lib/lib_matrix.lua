
--Matrix Library

gal.lib.matrix = {}
gal.lib.matrix.name = "lib_matrix"
gal.lib.matrix.path = gal.lib.path .. "/lib_matrix"
gal.lib.matrix.ver_maj = 0
gal.lib.matrix.ver_min = 0
gal.lib.matrix.ver_rev = 1


--[[

LUA MODULE

  matrix v$(_VERSION) - matrix functions implemented with Lua tables
	
SYNOPSIS

  local matrix = require 'matrix'
  m1 = matrix{{8,4,1},{6,8,3}}
  m2 = matrix{{-8,1,3},{5,2,1}}
  assert(m1 + m2 == matrix{{0,5,4},{11,10,4}})
  
DESCRIPTION

  With simple matrices this script is quite useful, though for more
  exact calculations, one would probably use a program like Matlab instead.
  Matrices of size 100x100 can still be handled very well.
  The error for the determinant and the inverted matrix is around 10^-9
  with a 100x100 matrix and an element range from -100 to 100.
 	
   Characteristics:
	
	- functions called via matrix.<function> should be able to handle
	  any table matrix of structure t[i][j] = value
	- can handle a type of complex matrix
	- can handle symbolic matrices. (Symbolic matrices cannot be
	  used with complex matrices.)
	- arithmetic functions do not change the matrix itself
	  but build and return a new matrix
	- functions are intended to be light on checks
	  since one gets a Lua error on incorrect use anyways
	- uses mainly Gauss-Jordan elimination
	- for Lua tables optimised determinant calculation (fast)
	  but not invoking any checks for special types of matrices
	- vectors can be set up via vec1 = matrix{{ 1,2,3 }}^'T' or matrix{1,2,3}
	- vectors can be multiplied to a scalar via num = vec1^'T' * vec2
	  where num will be a matrix with the result in mtx[1][1],
	  or use num = vec1:scalar( vec2 ), where num is a number

API
	
	matrix function list:

	matrix.add
	matrix.columns
	matrix.concath
	matrix.concatv
	matrix.copy
	matrix.cross
	matrix.det
	matrix.div
	matrix.divnum
	matrix.dogauss
	matrix.elementstostring
	matrix.getelement
	matrix.gsub
	matrix.invert
	matrix.ipairs
	matrix.latex
	matrix.len
	matrix.mul
	matrix.mulnum
	matrix:new
	matrix.normf
	matrix.normmax
	matrix.pow
	matrix.print
	matrix.random
	matrix.replace
	matrix.root
	matrix.rotl
	matrix.rotr
	matrix.round
	matrix.rows
	matrix.scalar
	matrix.setelement
	matrix.size
	matrix.solve
	matrix.sqrt
	matrix.sub
	matrix.subm
	matrix.tostring
	matrix.transpose
	matrix.type
	
	See code and test_matrix.lua.

DEPENDENCIES

  None (other than Lua 5.1 or 5.2).  May be used with complex.lua.

HOME PAGE

  http://luamatrix.luaforge.net
  http://lua-users.org/wiki/LuaMatrix

DOWNLOAD/INSTALL

  ./util.mk
  cd tmp/*
  luarocks make
  
LICENSE
  
  Licensed under the same terms as Lua itself.
	
  Developers:
    Michael Lutz (chillcode) - original author
    David Manura http://lua-users.org/wiki/DavidManura
--]]

--////////////
--// matrix //
--////////////

local matrix = {_TYPE='module', _NAME='matrix', _VERSION='0.2.11.20120416'}

-- access to the metatable we set at the end of the file
local matrix_meta = {}

--/////////////////////////////
--// Get 'new' matrix object //
--/////////////////////////////

--// matrix:new ( rows [, columns [, value]] )
-- if rows is a table then sets rows as matrix
-- if rows is a table of structure {1,2,3} then it sets it as a vector matrix
-- if rows and columns are given and are numbers, returns a matrix with size rowsxcolumns
-- if num is given then returns a matrix with given size and all values set to num
-- if rows is given as number and columns is "I", will return an identity matrix of size rowsxrows
function matrix:new( rows, columns, value )
	-- check for given matrix
	if type( rows ) == "table" then
		-- check for vector
		if type(rows[1]) ~= "table" then -- expect a vector
			return setmetatable( {{rows[1]},{rows[2]},{rows[3]}},matrix_meta )
		end
		return setmetatable( rows,matrix_meta )
	end
	-- get matrix table
	local mtx = {}
	local value = value or 0
	-- build identity matrix of given rows
	if columns == "I" then
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,rows do
				if i == j then
					mtx[i][j] = 1
				else
					mtx[i][j] = 0
				end
			end
		end
	-- build new matrix
	else
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,columns do
				mtx[i][j] = value
			end
		end
	end
	-- return matrix with shared metatable
	return setmetatable( mtx,matrix_meta )
end

--// matrix ( rows [, comlumns [, value]] )
-- set __call behaviour of matrix
-- for matrix( ... ) as matrix.new( ... )
setmetatable( matrix, { __call = function( ... ) return matrix.new( ... ) end } )


-- functions are designed to be light on checks
-- so we get Lua errors instead on wrong input
-- matrix.<functions> should handle any table of structure t[i][j] = value
-- we always return a matrix with scripts metatable
-- cause its faster than setmetatable( mtx, getmetatable( input matrix ) )

--///////////////////////////////
--// matrix 'matrix' functions //
--///////////////////////////////

--// for real, complex and symbolic matrices //--

-- note: real and complex matrices may be added, subtracted, etc.
--		real and symbolic matrices may also be added, subtracted, etc.
--		but one should avoid using symbolic matrices with complex ones
--		since it is not clear which metatable then is used



--// matrix.add ( m1, m2 )
-- Add two matrices; m2 may be of bigger size than m1

gal.lib.matrix.add = dofile(gal.lib.matrix.path .. "/lib_matrix_add.lua")



--// matrix.sub ( m1 ,m2 )
-- Subtract two matrices; m2 may be of bigger size than m1

gal.lib.matrix.sub = dofile(gal.lib.matrix.path .. "/lib_matrix_sub.lua")



--// matrix.mul ( m1, m2 )
-- Multiply two matrices; m1 columns must be equal to m2 rows
-- e.g. #m1[1] == #m2

gal.lib.matrix.mul = dofile(gal.lib.matrix.path .. "/lib_matrix_mul.lua")



--//  matrix.div ( m1, m2 )
-- Divide two matrices; m1 columns must be equal to m2 rows
-- m2 must be square, to be inverted,
-- if that fails returns the rank of m2 as second argument
-- e.g. #m1[1] == #m2; #m2 == #m2[1]

gal.lib.matrix.div = dofile(gal.lib.matrix.path .. "/lib_matrix_div.lua")



--// matrix.mulnum ( m1, num )
-- Multiply matrix with a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol

gal.lib.matrix.mulnum = dofile(gal.lib.matrix.path .. "/lib_matrix_mulnum.lua")



--// matrix.divnum ( m1, num )
-- Divide matrix by a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol

gal.lib.matrix.divnum = dofile(gal.lib.matrix.path .. "/lib_matrix_divnum.lua")




























