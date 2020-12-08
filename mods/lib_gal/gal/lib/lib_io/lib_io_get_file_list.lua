
--function returns list of files in current dir


local function get_file_list(file_list_path)

	local file_list = minetest.get_dir_list( file_list_path, false );

	local idx_file_list = 0
	if file_list then

		for _,filename in ipairs( file_list ) do	
	
			idx_file_list = idx_file_list + 1

			local schemname = filename;

			if( not( schemname )) then
				return;
			end

			schem_file_list[idx_file_list] = filename
		end
    end
	schem_file_list_length = idx_file_list
end

return get_file_list
