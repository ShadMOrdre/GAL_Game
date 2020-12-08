
--function returns list of files in current dir

local function get_file_list(file_list_path)

	local file_list = minetest.get_dir_list(file_list_path, false );
	local idx_file_list = 0
	if file_list then
		for _,filename in ipairs( file_list ) do		
			idx_file_list = idx_file_list + 1


			-- we need the filename without extension (*.mts, *.we, *.wem)
			local schemname = filename;
			local i = string.find(           filename, '.mts',  -4 );
			if( i ) then
				schemname = string.sub( filename, 1, i-1 );
			else
				i = string.find(         filename, '.we',   -3 );
				if( i ) then
					schemname = string.sub( filename, 1, i-1 );
				else
					i = string.find( filename, '.wem',  -4 );
					if( i ) then
						schemname = string.sub( filename, 1, i-1 );
					else
						i = string.find( filename, '.schematic', -10 );
						if( i ) then
							schemname = string.sub( filename, 1, i-1 );
						else
							i = string.find( filename, '.lua', -10 );
							if( i ) then
								schemname = string.sub( filename, 1, i-1 );
							else
								return;
							end
						end
					end
				end
			end

			-- only add known file types
			if( not( schemname )) then
				return;
			end

			schem_file_list[idx_file_list] = filename
		end
    end
	schem_file_list_length = idx_file_list
end

return get_file_list
