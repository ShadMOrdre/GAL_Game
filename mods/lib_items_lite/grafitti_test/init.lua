
grafitti_brushes = {}
grafitti_brushes.name = "grafitti_brushes"
grafitti_brushes.ver_max = 0
grafitti_brushes.ver_min = 1
grafitti_brushes.ver_rev = 0
grafitti_brushes.ver_str = grafitti_brushes.ver_max .. "." .. grafitti_brushes.ver_min .. "." .. grafitti_brushes.ver_rev
grafitti_brushes.authorship = "ShadMOrdre, Aspiremint"
grafitti_brushes.license = "LGLv2.1"
grafitti_brushes.copyright = "2019"
grafitti_brushes.path_mod = minetest.get_modpath(minetest.get_current_modname())
grafitti_brushes.path_world = minetest.get_worldpath()


grafitti_brushes.intllib = gal.intllib
local S = grafitti_brushes.intllib


minetest.log(S("[MOD] grafitti_brushes:  Loading..."))
minetest.log(S("[MOD] grafitti_brushes:  Version:") .. S(grafitti_brushes.ver_str))
minetest.log(S("[MOD] grafitti_brushes:  Legal Info: Copyright ") .. S(grafitti_brushes.copyright) .. " " .. S(grafitti_brushes.authorship) .. "")
minetest.log(S("[MOD] grafitti_brushes:  License: ") .. S(grafitti_brushes.license) .. "")


	
	dofile(grafitti_brushes.path_mod.."/brush_egyptian.lua")
	
	dofile(grafitti_brushes.path_mod.."/brush_runes.lua")
	
--[[
	minetest.register_on_mods_loaded(function()
		for node_name, node_def in pairs(minetest.registered_tools) do
			if node_name and node_name ~= "" then
				if node_def then
					if not node_def.original_description then
						local node_desc = node_def.description
						minetest.override_item(node_name, {
							--original_description = node_desc,
							description = toolranks.create_description(node_desc, 0, 1),
							--description = node_desc,
							after_use = toolranks.new_afteruse,
						})
					end
				end
			end
		end
	end)
--]]


minetest.log(S("[MOD] grafitti_brushes:  Successfully loaded."))

