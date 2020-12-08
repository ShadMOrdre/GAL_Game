-- Geomoria init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

--if lib_mg_voronoi.mg_world_scale < 0.1 then
--	return
--end
--if not lib_mg_v3d and lib_mg_v3d.name == "lib_mg_v3d" then
--	return
--end


geomoria_mod = {}
geomoria_mod.version = "1.0"
geomoria_mod.path = minetest.get_modpath(minetest.get_current_modname())
geomoria_mod.world = minetest.get_worldpath()
geomoria_mod.plans = {}
geomoria_mod.plans_keys = {}
geomoria_mod.geomoria_depth = -1

geomoria_mod.N = {}
geomoria_mod.N["S0"] = "gal:stone"
geomoria_mod.N["SB"] = "gal:stone_block"
geomoria_mod.N["SK"] = "gal:stone_brick"
geomoria_mod.N["SM"] = "gal:stone_brick_mossy"
geomoria_mod.N["CC"] = "gal:stone_cobble"
geomoria_mod.N["CM"] = "gal:stone_cobble_mossy"
geomoria_mod.N["DD"] = "gal:dirt"
geomoria_mod.N["WS"] = "gal:liquid_water_source"
geomoria_mod.N["WF"] = "gal:liquid_water_flowing"
geomoria_mod.N["LV"] = "gal:liquid_lava_source"
geomoria_mod.N["ST"] = "gal:stone_stairs"
--geomoria_mod.N["ST"] = "gal:stone_brick"
geomoria_mod.N["mb"] = "gal:mushroom_brown"
geomoria_mod.N["ML"] = "torch:torch"
geomoria_mod.N["LS"] = "gal:ladder_steel"
geomoria_mod.N["CS"] = "lib_chests:chest"
geomoria_mod.N["FN"] = "lib_forge:furnace"
geomoria_mod.N["DL"] = "gal:tree_jungle_trunk_allface_side_door_centered_with_window"
geomoria_mod.N["DR"] = "gal:tree_jungle_trunk_allface_side_door_centered_with_window_right"

local N = geomoria_mod.N

--[[
geomoria_mod.N["S0"] = "default:stone"
geomoria_mod.N["SB"] = "default:stone_block"
geomoria_mod.N["CC"] = "default:cobble"
geomoria_mod.N["CM"] = "default:mossycobble"
geomoria_mod.N["DD"] = "default:dirt"
geomoria_mod.N["WS"] = "default:water_source"
geomoria_mod.N["WF"] = "default:water_flowing"
geomoria_mod.N["LV"] = "default:lava_source"
geomoria_mod.N["ST"] = "stairs:stair_stone"
geomoria_mod.N["mb"] = "flowers:mushroom_brown"
geomoria_mod.N["ML"] = "default:meselamp"
geomoria_mod.N["LS"] = "default:ladder_steel"
--]]


-- Dungeon overgeneration puts mossycobble in inappropriate places.
minetest.set_mapgen_setting('mg_flags', "nodungeons", true)

--geomoria_mod.generate_ores = minetest.setting_getbool('geomoria_generate_ores')
if geomoria_mod.generate_ores == nil then
  geomoria_mod.generate_ores = false
end

--geomoria_mod.add_fissures = minetest.setting_getbool('geomoria_add_fissures')
if geomoria_mod.add_fissures == nil then
  geomoria_mod.add_fissures = true
end

--geomoria_mod.cheap_lighting = minetest.setting_getbool('geomoria_cheap_lighting')
if geomoria_mod.cheap_lighting == nil then
  geomoria_mod.cheap_lighting = false
end

--geomoria_mod.damage_level = minetest.setting_getbool('geomoria_damage_level')
geomoria_mod.damage_level = 5
geomoria_mod.damage_level = (13 - (geomoria_mod.damage_level or 5)) / 10


local treasure_chest = N["CS"]
if minetest.registered_items['booty:coffer'] then
  treasure_chest = 'booty:coffer'
end


-- This can be overridden to do complicated treasure placement.
--  'pos' is the coordinate where a chest would go.
--  'min/max' values are the coordinates of the room or hall.
--  'data' is the mapgen data for that chunk.
--  'area' is the VoxelArea structure for the chunk.
-- The function must return the get_content_id value for a node.
--
-- If you override this, it might make sense to save the original
--  function and call it, in case someone else overrides it.
--  However, there can be only one return value.
function geomoria_mod.treasure_chest_hook(pos, min_x, max_x, min_z, max_z, data, area, node)
  return node[treasure_chest]
end

--
-- fill chests
--
function geomoria_mod.fill_chest(pos)

	-- find chests within radius
	local chestpos = minetest.find_node_near(pos, 25, {N["CS"]}, true)
  
	if not chestpos then
		minetest.chat_send_all(" no chest_pos found near ".. tostring(pos))
		return
	else
		minetest.chat_send_all("chest_pos ".. tostring(chestpos))
	end
  
	-- initialize chest (mts chests don't have meta)
	local meta = minetest.get_meta(chestpos)
	--local meta = minetest.get_meta(pos)
	if meta:get_string("infotext") ~= "Chest" then
		minetest.registered_nodes[N["CS"]].on_construct(chestpos)
	end

	-- fill chest
	local inv = minetest.get_inventory( {type="node", pos=chestpos} )

	-- always
	inv:add_item("main", "gal:fruit_apple "..math.random(1,3))

	-- low value items
	if math.random(0,1) < 1 then

		inv:add_item("main", "gal:food_bread "..math.random(0,3))
		inv:add_item("main", "torch:torch "..math.random(0,3))

		if math.random(0,1) < 1 then

			inv:add_item("main", "gal:fruit_wheat "..math.random(0,3))
			inv:add_item("main", "gal:fruit_carrot "..math.random(0,3))
			inv:add_item("main", "gal:fruit_corn "..math.random(0,3))
		end
	end

	-- medium value items
	if math.random(0,3) < 1 then
		inv:add_item("main", "lib_handtools:tool_pick_bone "..math.random(0,1))
		inv:add_item("main", "lib_handtools:tool_axe_wood "..math.random(0,1))
		inv:add_item("main", "lib_handtools:tool_shovel_bone "..math.random(0,1))
		inv:add_item("main", "lib_handtools:tool_digging_stick "..math.random(0,1))
		inv:add_item("main", "lib_handtools:tool_fire_sticks "..math.random(0,1))
		inv:add_item("main", "lib_handtools:tool_cudgel "..math.random(0,1))
		inv:add_item("main", "lib_tools:crafting_guide "..math.random(0,1))
		inv:add_item("main", "lib_forge:anvil "..math.random(0,1))
		inv:add_item("main", "lib_forge:anvil_hammer "..math.random(0,1))
	end
end

--
-- initialize furnace
--
function geomoria_mod.initialize_furnace(pos)

	-- find chests within radius
	local furnacepos = minetest.find_node_near(pos, 7, {N["FN"]})

	-- initialize furnacepos (mts furnacepos don't have meta)
	if furnacepos then
		local meta = minetest.get_meta(furnacepos)
		if meta:get_string("infotext") ~= "furnace" then
			minetest.registered_nodes["lib_forge:furnace"].on_construct(furnacepos)
		end
	end
end


geomoria_mod.default_exits = {
  {act = 'fill', node = 'air', coords = {0, 1, 21, 3, 19, 2}},
  {act = 'fill', node = 'air', coords = {0, 1, 21, 3, 39, 2}},
  {act = 'fill', node = 'air', coords = {0, 1, 21, 3, 59, 2}},
  {act = 'fill', node = 'air', coords = {79, 1, 21, 3, 19, 2}},
  {act = 'fill', node = 'air', coords = {79, 1, 21, 3, 39, 2}},
  {act = 'fill', node = 'air', coords = {79, 1, 21, 3, 59, 2}},
  {act = 'fill', node = 'air', coords = {19, 2, 21, 3, 0, 1}},
  {act = 'fill', node = 'air', coords = {39, 2, 21, 3, 0, 1}},
  {act = 'fill', node = 'air', coords = {59, 2, 21, 3, 0, 1}},
  {act = 'fill', node = 'air', coords = {19, 2, 21, 3, 79, 1}},
  {act = 'fill', node = 'air', coords = {39, 2, 21, 3, 79, 1}},
  {act = 'fill', node = 'air', coords = {59, 2, 21, 3, 79, 1}},
  {act = 'fill', node = 'air', coords = {0, 1, 51, 3, 39, 2}},
  {act = 'fill', node = 'air', coords = {79, 1, 51, 3, 39, 2}},
  {act = 'fill', node = 'air', coords = {39, 2, 51, 3, 0, 1}},
  {act = 'fill', node = 'air', coords = {39, 2, 51, 3, 79, 1}},
}


function geomoria_mod.clone_node(name)
  if not (name and type(name) == 'string') then
    return
  end

  local node = minetest.registered_nodes[name]
  local node2 = table.copy(node)
  return node2
end


local node = geomoria_mod.clone_node(geomoria_mod.N["S0"])
--local node = geomoria_mod.clone_node('default:stone')
node.walkable = false
minetest.register_node('geomoria:false_wall', node)

local node = geomoria_mod.clone_node(geomoria_mod.N["SB"])
--local node = geomoria_mod.clone_node('default:stone_block')
node.walkable = false
minetest.register_node('geomoria:false_wall_block', node)


dofile(geomoria_mod.path .. "/plans.lua")

for k, v in pairs(geomoria_mod.plans) do
  geomoria_mod.plans_keys[#geomoria_mod.plans_keys+1] = k
end

dofile(geomoria_mod.path .. "/mapgen.lua")
