-- Universal Fluid API implementation
-- Copyright (c) 2018 Evert "Diamond" Prants <evert@lunasqu.ee>

--fluid_lib = rawget(_G, "fluid_lib") or {}


gal.lib.fluid.unit = "mB"
gal.lib.fluid.unit_description = "milli-bucket"

gal.lib.fluid.fluid_name_cache = {}
gal.lib.fluid.fluid_description_cache = {}

function gal.lib.fluid.cleanse_node_name(node)
	if gal.lib.fluid.fluid_name_cache[node] then
		return gal.lib.fluid.fluid_name_cache[node]
	end

	local no_mod    = node:gsub("^([%w_]+:)", "")
	local no_source = no_mod:gsub("(_?source_?)", "")

	gal.lib.fluid.fluid_name_cache[node] = no_source
	return no_source
end

function gal.lib.fluid.cleanse_node_description(node)
	if gal.lib.fluid.fluid_description_cache[node] then
		return gal.lib.fluid.fluid_description_cache[node]
	end

	local ndef = minetest.registered_nodes[node]
	if not ndef then return nil end

	local no_source = ndef.description:gsub("(%s?Source%s?)", "")

	gal.lib.fluid.fluid_description_cache[node] = no_source
	return no_source
end

function gal.lib.fluid.comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

dofile(gal.lib.fluid.path.."/lib_fluid_buffer.lua")
dofile(gal.lib.fluid.path.."/lib_fluid_node_io.lua")
