
lib_books = {}
lib_books.name = "lib_books"
lib_books.ver_max = 0
lib_books.ver_min = 1
lib_books.ver_rev = 0
lib_books.ver_str = lib_books.ver_max .. "." .. lib_books.ver_min .. "." .. lib_books.ver_rev
lib_books.authorship = "shadmordre"
lib_books.license = "LGLv2.1"
lib_books.copyright = "2019"
lib_books.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_books.path_world = minetest.get_worldpath()

--lib_books.intllib = minetest.setting_get("lib_books_engine_translation") or false

lib_books.intllib = gal.intllib
local S = gal.intllib


minetest.log(S("[MOD] lib_books:  Loading..."))
minetest.log(S("[MOD] lib_books:  Version:") .. S(lib_books.ver_str))
minetest.log(S("[MOD] lib_books:  Legal Info: Copyright ") .. S(lib_books.copyright) .. " " .. S(lib_books.authorship) .. "")
minetest.log(S("[MOD] lib_books:  License: ") .. S(lib_books.license) .. "")

--minetest.log("[MOD] lib_books:  Loading...")
--minetest.log("[MOD] lib_books:  Version:" .. lib_books.ver_str)
--minetest.log("[MOD] lib_books:  Legal Info: Copyright " .. lib_books.copyright .. " " ..lib_books.authorship) .. "")
--minetest.log("[MOD] lib_books:  License: " .. lib_books.license .. "")

	
--[[
--
-- optimized helper to put all items in an inventory into a drops list
--

	function lib_books.get_inventory_drops(pos, inventory, drops)
		local inv = minetest.get_meta(pos):get_inventory()
		local n = #drops
		for i = 1, inv:get_size(inventory) do
			local stack = inv:get_stack(inventory, i)
			if stack:get_count() > 0 then
				drops[n+1] = stack:to_table()
				n = n + 1
			end
		end
	end
--]]


	dofile(lib_books.path_mod.."/lib_books_bookshelf.lua")
	
	dofile(lib_books.path_mod.."/lib_books_books.lua")
	



minetest.log(S("[MOD] lib_books:  Successfully loaded."))




























