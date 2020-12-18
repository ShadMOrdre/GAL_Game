-- Node functionality registry for NPC actions by Zorman2000
---------------------------------------------------------------------------------------
-- In this script, some functionality and information required for nodes
-- to be used correctly by an NPC is described.
-- To avoid as many definitions as possible, the names of the nodes
-- can actually be prefixes.

-- This table will contain the registered nodes
a_npc.actions.nodes = {
  doors = {},
  beds = {},
  sittable = {}
}


---------------------------------------------------------------------------------------
-- Beds functionality supported by default
---------------------------------------------------------------------------------------
-- Functionality for default beds.
-- Since other mods may be used in the same way as the default beds, 
-- this one is a global registration
a_npc.actions.nodes.default_bed_registration = {
  get_lay_pos = function(pos, dir)
    return {x = pos.x + dir.x / 2, y = pos.y + 1, z = pos.z + dir.z / 2}
  end,
  type = "bed"
}

-- The code used in get_lay_pos is from cottages mod and slightly modified.
local cottages_bed_registration = {
  get_lay_pos = function(pos, dir)
    return {x = pos.x + dir.x / 2, y = pos.y + 1.4, z = pos.z + dir.z / 2}
  end,
  type = "bed"
}

local cottages_mat_registration = {
  get_lay_pos = function(pos, dir)
    return {x = pos.x + dir.x / 2, y = pos.y + 1, z = pos.z + dir.z / 2}
  end,
  type = "mat"
}

---------------------------------------------------------------------------------------
-- Sitting functionality supported by default
---------------------------------------------------------------------------------------
-- Functionality for allowing the NPC to sit on default stairs and cottages' bench
local sittable_stair_registration = {
  get_sit_pos = function(pos, param2)
    local result = {x=pos.x, y=pos.y+1, z=pos.z};
    if param2 == 0 then
      result.z = result.z-0.2;
    elseif param2 == 1 then
      result.x = result.x-0.2;
    elseif param2 == 2 then
      result.z = result.z+0.2;
    elseif param2 == 3 then
      result.x = result.x+0.2;
    end
    return result
  end
}

local cottages_bench_registration = {
  get_sit_pos = function(pos, param2)
    local result = {x=pos.x, y=pos.y+1, z=pos.z};
    if param2 == 0 then
      result.z = result.z+0.3;
    elseif param2 == 1 then
      result.x = result.x+0.3;
    elseif param2 == 2 then
      result.z = result.z-0.3;
    elseif param2 == 3 then
      result.x = result.x-0.3;
    end
    return result
  end
}


---------------------------------------------------------------------------------------
-- Registry of bed nodes
---------------------------------------------------------------------------------------
-- Default beds.
a_npc.actions.nodes.beds["beds:bed_bottom"] = a_npc.actions.nodes.default_bed_registration
a_npc.actions.nodes.beds["beds:fancy_bed_bottom"] = a_npc.actions.nodes.default_bed_registration

-- Cottages beds
a_npc.actions.nodes.beds["cottages:bed_foot"] = cottages_bed_registration
a_npc.actions.nodes.beds["cottages:sleeping_mat"] = cottages_mat_registration
a_npc.actions.nodes.beds["cottages:straw_mat"] = cottages_mat_registration

---------------------------------------------------------------------------------------
-- Registry of sittable nodes
---------------------------------------------------------------------------------------
-- Normal wooden stairs
a_npc.actions.nodes.sittable["gal:tree_default_wood_stairs"] = sittable_stair_registration
-- Cottages bench
a_npc.actions.nodes.sittable["cottages:bench"] = cottages_bench_registration