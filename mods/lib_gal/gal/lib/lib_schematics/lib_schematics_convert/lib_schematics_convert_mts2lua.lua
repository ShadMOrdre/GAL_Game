local function convert_mts_to_lua(file_name)

	--local building = instabuild.path..'/schems/'..current_schem_name
	--local building = file_name

	--local str = minetest.serialize_schematic(building, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"
	local str = minetest.serialize_schematic(file_name, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"

	local schematic = loadstring(str)()

	local file = io.open(file_name .. ".lua", "w")

	file:write(dump(schematic))
	file:close()

	--print(dump(schematic))

end

return convert_mts_to_lua

