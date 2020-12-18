--This mod is licensed under CC BY-SA

--
--NOTES:
--Internal Schematic definition.
--schem = {
--	nodes = {},
--	size = {x=0,y=0,z=0},
--	data = {},
--	yslice_prob = {}
--}

mobs_npc.tool = {}

local region_list = {}
local region_list_length = 0
local region_list_idx = 0
local job_list = {}
local job_list_length = 0
local job_list_idx = 0
local soldier_list = {}
local soldier_list_length = 0
local soldier_list_idx = 0


local states = {
	"select_biome",			--  build town, build building, place schematic, convert mts2lua, convert mts2we, convert lua2mts, convert lua2we, convert we2lua, convert we2mts
	"select_job",
	"select_soldier_type",
	"spawn",				--  performs the action as defined in the various config settings
}


local current_state = states[1]
local current_region = mobs_npc.regions[1]               --TYPES:		"mts2lua", "lua2mts"
local current_job =  mobs_npc.jobs[1]
local current_soldier =  mobs_npc.soldiers[1]


local get_region_list = function()

	local idx_region = 1

	for r, rgn in pairs(mobs_npc.regions) do
		region_list[idx_region] = r
		idx_region = idx_region + 1
	end
	region_list_length = #region_list		--idx_region_list
end

get_region_list()
local current_region_name = region_list[1]

local get_job_list = function()

	local idx_job = 1

	for j, job in pairs(mobs_npc.jobs) do
		job_list[idx_job] = j
		idx_job = idx_job + 1
	end

	job_list_length = #job_list		--idx_job_list
end

get_job_list()
local current_job_name = job_list[1]

local get_soldier_list = function()

	local idx_soldier = 1

	for s, soldier in pairs(mobs_npc.soldiers) do
		soldier_list[idx_soldier] = s
		idx_soldier = idx_soldier + 1
	end

	soldier_list_length = #soldier_list		--idx_soldier_list
end

get_soldier_list()
local current_soldier_name = soldier_list[1]




minetest.register_craftitem("mobs_npc:npc_spawn_tool", {
    description = "NPC Spawner Tool",
    inventory_image = "mobs_chicken_egg.png^(character_1_preview.png^[mask:mobs_chicken_egg_overlay.png)",
    --
    -- save lua of schem
    --
    on_use = function(itemstack, placer, pointed_thing)
	
		if pointed_thing == nil then
			return
		end
	
		if current_state == states[1] then
			current_state = states[2]
		elseif current_state == states[2] then
			current_state = states[3]
		elseif current_state == states[3] then
			current_state = states[4]
		elseif current_state == states[4] then
			current_state = states[1]
		end
		minetest.chat_send_all( "Current State = " .. current_state)
		return itemstack
		
		
	end,
    
	on_secondary_use = function(itemstack, user, pointed_thing)

		if pointed_thing == nil then
		
			minetest.chat_send_all( "On Secondary Usage Happening Now at a Lua Function Near You!!!")
		
		end

	end,
	
    on_place = function(itemstack, placer, pointed_thing)

		if current_state == states[1] then

			if not r_ctr or r_ctr == nil then
				r_ctr = 1
			end
		
			if r_ctr == 1 then
				r_ctr = 2
			elseif r_ctr > 1 and r_ctr < #region_list then
				r_ctr = r_ctr + 1
			elseif r_ctr == #region_list then
				r_ctr = 1
			end
			current_region = region_list[r_ctr]
			minetest.chat_send_all( "Region Type = " .. current_region)
			
		elseif current_state == states[2] then

			if not j_ctr or j_ctr == nil then
				j_ctr = 1
			end
		
			if j_ctr == 1 then
				j_ctr = 2
			elseif j_ctr > 1 and j_ctr < #job_list then
				j_ctr = j_ctr + 1
			elseif j_ctr == #job_list then
				j_ctr = 1
			end
			current_job = job_list[j_ctr]
			minetest.chat_send_all( "Job Type = " .. current_job)
			
		elseif current_state == states[3] then

			if not s_ctr or s_ctr == nil then
				s_ctr = 1
			end
		
			if s_ctr == 1 then
				s_ctr = 2
			elseif s_ctr > 1 and s_ctr < #soldier_list then
				s_ctr = s_ctr + 1
			elseif s_ctr == #region_list then
				s_ctr = 1
			end
			current_soldier = soldier_list[s_ctr]
			minetest.chat_send_all( "Soldier Type = " .. current_soldier)
			
		elseif current_state == states[4] then
		
			local pos = pointed_thing.above

			-- does existing on_rightclick function exist?
			local under = minetest.get_node(pointed_thing.under)
			local def = minetest.registered_nodes[under.name]

			if def and def.on_rightclick then

				return def.on_rightclick(
						pointed_thing.under, under, placer, itemstack)
			end

			if pos
			and not minetest.is_protected(pos, placer:get_player_name()) then

				if not minetest.registered_entities[mob] then
					return
				end

				pos.y = pos.y + 1

				--local data = itemstack:get_metadata()
				local data = current_region .. "," .. current_job
				if current_job == "soldier" then
					data = data .. ";" .. current_soldier
				end

				local smob = minetest.add_entity(pos, "mobs_npc:town_npc", data)

				local ent = smob and smob:get_luaentity()

				if not ent then return end -- sanity check

				-- set owner if not a monster
				if ent.type ~= "monster" then
					ent.owner = placer:get_player_name()
					ent.tamed = true
				end

				---- since mob is unique we remove egg once spawned
				--itemstack:take_item()
			end

			return itemstack
--[[
			-- enable debug routines
			mobs_npc.debug = true
			local center_surface = pointed_thing.under

			if center_surface then
				local minp = {
					x=center_surface.x-mobs_npc.half_map_chunk_size, 
					y=center_surface.y-mobs_npc.half_map_chunk_size, 
					z=center_surface.z-mobs_npc.half_map_chunk_size
				}
				local maxp = {
					x=center_surface.x+mobs_npc.half_map_chunk_size, 
					y=center_surface.y+mobs_npc.half_map_chunk_size, 
					z=center_surface.z+mobs_npc.half_map_chunk_size
				}
				mobs_npc.place_settlement_circle(minp, maxp)
			end
--]]
		end
		
		return itemstack
	end,
})







