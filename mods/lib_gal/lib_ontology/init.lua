
-------------------------------------------------------------
-- lib_ontology  ©2020 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------


lib_ontology = {}
lib_ontology.name = "lib_ontology"
lib_ontology.ver_max = 0
lib_ontology.ver_min = 1
lib_ontology.ver_rev = 0
lib_ontology.ver_str = lib_ontology.ver_max .. "." .. lib_ontology.ver_min .. "." .. lib_ontology.ver_rev
lib_ontology.authorship = "ShadMordre"
lib_ontology.license = "LGLv2.1"
lib_ontology.copyright = "2019"
lib_ontology.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_ontology.path_world = minetest.get_worldpath()

--lib_ontology.intllib = minetest.setting_get("lib_ontology_engine_translation") or false

local S
local NS
--if not lib_ontology.intllib then
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		-- S = function(s) return s end
		-- internationalization boilerplate
		S, NS = dofile(lib_ontology.path_mod.."/intllib.lua")
	end
--else
--	S = minetest.get_translator(lib_ontology.name)
--end

lib_ontology.intllib = S

minetest.log(S("[MOD] lib_ontology:  Loading..."))
minetest.log(S("[MOD] lib_ontology:  Version:") .. S(lib_ontology.ver_str))
minetest.log(S("[MOD] lib_ontology:  Legal Info: Copyright ") .. S(lib_ontology.copyright) .. " " .. S(lib_ontology.authorship) .. "")
minetest.log(S("[MOD] lib_ontology:  License: ") .. S(lib_ontology.license) .. "")



lib_ontology.N = {}		--Registered Node defs
lib_ontology.T = {}		--Schematic Node defs
lib_ontology.G = {}		--Groups
lib_ontology.A = {}		--Aliases
lib_ontology.E = {}		--Entities




	--minetest.register_on_mods_loaded(function()
	--	for node_name, node_def in pairs(minetest.registered_nodes) do
	--		if node_name and node_name ~= "" then
	--			if node_def then




	--			end
	--		end
	--	end
	--end)



minetest.log(S("[MOD] lib_ontology:  Successfully loaded."))




























