-- NPCBuildQueue
-- Copyright (c) 2018  Evert "Diamond" Prants <evert@lunasqu.ee>

local modpath = minetest.get_modpath("npcbuildqueue")
local ZERO_POS = {x = 0, y = 0, z = 0}

nbq = {}
nbq.modpath = modpath

-- Ensure correct mobs mod
if not rawget(_G, "mobs") then
	error("Mobs missing!")
elseif not mobs.mod or mobs.mod ~= "redo" then
	error("You have the wrong mobs mod installed. NBQ requires Mobs Redo by Tenplus1!")
end

-- Used to keep track of building tasks
nbq.queues = {}

-- Convert VoxelManip to a table of layers.
function nbq.schematic_build_data_tree(qid)
	local sdata  = nbq.queues[qid]
	if not sdata then return nil end

	if nbq.queues[qid]["dt"] then
		nbq.queues[qid].vm = nil
		return nbq.queues[qid]["dt"]
	end

	local vm     = sdata.vm
	local size   = sdata.size
	local origin = sdata.origin

	local data   = vm:get_data()
	local param2 = vm:get_param2_data()

	local e1, e2 = vm:read_from_map(ZERO_POS, sdata.size)
	local area   = VoxelArea:new{MinEdge=e1, MaxEdge=e2}

	local node_list = {}
	
	for y = 0, size.y do
		node_list[y + 1] = {}
		for x = 0, size.x do
			for z = 0, size.z do
				local npid = area:index(x, y, z)

				local node = minetest.get_name_from_content_id(data[npid])
				local p2   = param2[npid]

				node_list[y + 1][#node_list[y + 1] + 1] = {
					node, p2, vector.add(origin, {x = x, y = y - (sdata.floor + 1), z = z})
				}
			end
		end
	end

	-- Save the generated data structure
	nbq.queues[qid].vm = nil
	nbq.queues[qid]["dt"] = node_list

	return node_list
end

-- Instruct mob `self` to start building `schematic`.
-- `schematic` MUST be a path to a metadata file! (See `metafile.lua` for help)
-- `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
-- `speed` is build delay in seconds.
function nbq.build_schematic(self, schematic, pos, rot, speed)
	if self.state == "building" then return nil end

	local schematic_data = nbq.get_schematic_data(schematic)
	local vm = VoxelManip(ZERO_POS, schematic_data.size)

	local loaded = minetest.place_schematic_on_vmanip(
		vm, 					-- VoxelManip
		ZERO_POS, 				-- Position in the VM
		schematic_data.path, 	-- Schematic path
		rot or "0", 			-- Rotation
		nil, 					-- Replacements
		true, 					-- Force Replacement
		{} 						-- Flags
	)

	if not loaded then
		return nil
	end

	-- Generate an unique Queue ID.
	local qpid = (math.random(1, 1000) * math.random(1, 10000)) .. self.name .. (math.random(1, 1000) ^ 2)

	-- Add to queue.
	nbq.queues[qpid] = {
		vm        = vm,
		schematic = schematic,
		speed     = speed,
		origin    = pos,
		size      = schematic_data.size,
		floor     = schematic_data.floor,
	}

	-- Build the NPC-readable data tree.
	local dtree = nbq.schematic_build_data_tree(qpid)

	-- Instruct the NPC to start building the next time it ticks.
	self.build_queue_id = qpid
	self.build_height   = #dtree

	-- Set NPC's variables.
	if self.build_in_layer == nil then
		self.build_in_height = 1
		self.build_in_layer  = 1
	end

	-- Instructs the NPC to resume building if the world was reloaded.
	self.build_queue_resume = {
		schematic = schematic,
		speed     = speed,
		origin    = pos,
		rot       = rot,
	}

	return qpid
end

-- Remove all build related data from the mob
local function clear_build_state(self, wipe_cache)
	self.state = "stand"

	-- Remove from queue
	if wipe_cache then
		if nbq.queues[self.build_queue_id] then
			nbq.queues[self.build_queue_id] = nil
		end
	end

	self.build_queue_resume = nil
	self.build_queue_id     = nil
	self.build_in_layer     = nil
end

-- Call this from `do_custom`
function nbq.build_process(self, dtime)
	-- Build queue present but no order, order to build
	if self.build_queue_id and not self.state == "building" then
		self.state = "building"
		print("Build queue present but no order, ordering NPC to build..")
	end

	-- No build queue, abort
	if self.state == "building" and not self.build_queue_id then
		self.state = "stand"
		print("No build queue, abort")
		return
	end

	if not self.build_queue_id then return end

	-- Resume building in case the world was reloaded.
	if not nbq.queues[self.build_queue_id] then
		if self.build_queue_resume then
			local resume = self.build_queue_resume
			nbq.build_schematic(self, resume.schematic, resume.origin, 
				resume.rot, resume.speed)
			return
		end

		clear_build_state(self)
		print("Invalid build queue")
		return
	end

	-- Layered node data object
	if not nbq.queues[self.build_queue_id]["dt"] then
		clear_build_state(self)
		print("No layered data object in queued build")
		return
	end

	-- Build queue variables
	local bq    = nbq.queues[self.build_queue_id]
	local dt    = bq.dt
	local layer = dt[self.build_in_height]

	-- Timer
	self.build_tick = (self.build_tick or 0) + dtime
	if self.build_tick < bq.speed then return end
	self.build_tick = 0

	----------------------
	-- Proceed to build --
	----------------------

	-- Skip queue if layer is invalid
	if not layer then
		clear_build_state(self, true)
		return
	end

	local caret = layer[self.build_in_layer]

	-- Determine the position we're building at
	if not caret then
		if self.build_in_height < self.build_height then
			-- Proceed to next layer
			self.build_in_height = self.build_in_height + 1
			self.build_in_layer = 1
			return
		else
			-- Finished
			print("Build finished")
			clear_build_state(self, true)
			return
		end
	end

	-- Node parameters at caret
	local caret_pos    = caret[3]
	local caret_node   = caret[1]
	local caret_param2 = caret[2]

	-- Determine if the NPC needs to move to the location or not
	local pos = self.object:get_pos()
	local dist_bld = vector.distance(caret[3], pos)

	-- Make the NPC look towards the node they're interacting with
	-- TODO: Make NPC movements more realistic
	local dir = vector.direction(pos, caret_pos)
	----mobs:yaw(self, math.atan2(-dir.x, dir.z))

	-- Get the node at the caret
	local node_at_caret = minetest.get_node(caret_pos).name

	-- Check if we need to break or place
	local place = true
	if (caret_node == "air" and node_at_caret ~= "air") or 
		(caret_node ~= "air" and node_at_caret ~= "air") then
		place = false
	end

	-- Skip air/existing node
	-- Don't replace grass with dirt
	if ((caret_node == "air" and node_at_caret == "air") or (caret_node == node_at_caret)) or
		(caret_node:match("dirt") ~= nil and node_at_caret:match("dirt") ~= nil) then
		self.build_in_layer = self.build_in_layer + 1
		self.build_tick     = bq.speed
		return
	end

	-- Punch animation
	mobs:set_animation(self, "punch")

	-- "Break"
	if not place then
		minetest.set_node(caret_pos, {name = "air"})
		return
	end

	-- Place
	minetest.set_node(caret_pos, {name = caret_node, param2 = caret_param2})

	-- Go to next position in the next tick :)
	self.build_in_layer = self.build_in_layer + 1
end

-- Metadata file
dofile(modpath.."/metafile.lua")

-- Example code
dofile(modpath.."/example.lua")
