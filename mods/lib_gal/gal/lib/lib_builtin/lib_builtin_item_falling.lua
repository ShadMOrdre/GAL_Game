
-- Minetest: builtin/item.lua (override falling entity with new features)

-- override falling nodes to add damage

local function add_fall_damage(node, damage)

	if core.registered_nodes[node] then

		local group = core.registered_nodes[node].groups

		group.falling_node_damage = damage

		core.override_item(node, {groups = group})
	else
		print (node .. " not found to add falling_node_damage to")
	end
end

--add_fall_damage("default:sand", 2)
--add_fall_damage("default:desert_sand", 2)
--add_fall_damage("default:silver_sand", 2)
--add_fall_damage("default:gravel", 3)
--add_fall_damage("caverealms:coal_dust", 3)
--add_fall_damage("tnt:tnt_burning", 4)

add_fall_damage("gal:sand", 2)
add_fall_damage("gal:sand_desert", 2)
add_fall_damage("gal:sand_silver", 2)
add_fall_damage("gal:stone_gravel", 3)
--add_fall_damage("caverealms:coal_dust", 3)
add_fall_damage("tnt:tnt_burning", 4)

--
-- Falling stuff
--

local node_fall_hurt = minetest.setting_getbool("node_fall_hurt") ~= false
local delay = 0.1 -- used to simulate lag

local function fall_hurt_check(self, pos, dtime)

	if self.hurt_toggle then

		-- Get damage level from falling_node_damage group
		local damage = core.registered_nodes[self.node.name] and
			core.registered_nodes[self.node.name].groups.falling_node_damage

		if damage then

			local all_objects = minetest.get_objects_inside_radius(pos, 0.8)

			for _,obj in ipairs(all_objects) do

				local name = obj:get_luaentity() and
						obj:get_luaentity().name or ""

				if name ~= "__builtin:item"
						and name ~= "__builtin:falling_node" then

					obj:punch(self.object, 4.0, {
						damage_groups = {fleshy = damage}
					})

					self.hurt_toggle = false
				end
			end
		end
	else
		self.hurt_toggle = true
	end
end


core.register_entity(":__builtin:falling_node", {
	initial_properties = {
		visual = "wielditem",
		visual_size = {x = 0.667, y = 0.667},
		textures = {},
		physical = true,
		is_visible = false,
		collide_with_objects = false,
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},

	set_node = function(self, node, meta)

		self.node = node
		self.meta = meta
		self.hurt_toggle = true

		self.object:set_properties({is_visible = true, textures = {node.name}})
	end,

	get_staticdata = function(self)

		return core.serialize({node = self.node, meta = self.meta})
	end,

	on_activate = function(self, staticdata)

		self.object:set_armor_groups({immortal = 1})
		self.object:set_acceleration({x = 0, y = -10, z = 0})

		local ds = core.deserialize(staticdata)

		if ds and ds.node then

			self:set_node(ds.node, ds.meta)

		elseif ds then

			self:set_node(ds)

		elseif staticdata ~= "" then

			self:set_node({name = staticdata})
		end
	end,

	on_step = function(self, dtime)

		-- used to simulate a little lag
		self.timer = (self.timer or 0) + dtime

		if self.timer < delay then
			return
		end

		self.timer = 0

		-- Set gravity
		local acceleration = self.object:get_acceleration()

		if not vector.equals(acceleration, {x = 0, y = -10, z = 0}) then
			self.object:set_acceleration({x = 0, y = -10, z = 0})
		end

		local pos = self.object:get_pos()

		-- Position of bottom center point
		local below_pos = {x = pos.x, y = pos.y - 0.7, z = pos.z}

		-- Check for player/mobs below falling node and hurt them >:D
		if node_fall_hurt then
			fall_hurt_check(self, below_pos, dtime)
		end

		-- Avoid bugs caused by an unloaded node below
		local below_node = core.get_node(below_pos)

		-- Delete on contact with ignore at world edges
		if below_node.name == "ignore" then

			self.object:remove()
			return
		end

		local below_nodef = core.registered_nodes[below_node.name]

		-- Is it a level node we can add to?
		if below_nodef
		and below_nodef.leveled
		and below_node.name == self.node.name then

			local addlevel = self.node.level

			if not addlevel or addlevel <= 0 then
				addlevel = below_nodef.leveled
			end

			if core.add_node_level(below_pos, addlevel) == 0 then
				self.object:remove()
				return
			end
		end

		-- Stop node if it falls on walkable surface, or floats on water
		if (below_nodef and below_nodef.walkable == true)
		or (below_nodef
				and core.get_item_group(self.node.name, "float") ~= 0
				and below_nodef.liquidtype ~= "none") then

			self.object:set_velocity({x = 0, y = 0, z = 0})
		end

		-- Has the fallen node stopped moving ?
		local vel = self.object:get_velocity()

		if vector.equals(vel, {x = 0, y = 0, z = 0}) then

			local npos = self.object:get_pos()

			-- Get node we've landed inside
			local cnode = minetest.get_node(npos).name
			local cdef = core.registered_nodes[cnode]

			-- If 'air' or buildable_to or an attached_node then place node,
			-- otherwise drop falling node as an item instead.
			if cnode == "air"
			or (cdef and cdef.buildable_to == true)
			or (cdef and cdef.liquidtype ~= "none")
			or core.get_item_group(cnode, "attached_node") ~= 0 then

				-- Are we an attached node ? (grass, flowers, torch)
				if core.get_item_group(cnode, "attached_node") ~= 0 then

					-- Add drops from attached node
					local drops = core.get_node_drops(cnode, "")

					for _, dropped_item in pairs(drops) do
						core.add_item(npos, dropped_item)
					end

					-- Run script hook
					for _, callback in pairs(core.registered_on_dignodes) do
						callback(npos, cnode)
					end
				end

				-- Round position
				npos = vector.round(npos)

				-- Place falling entity as node and write any metadata
				core.add_node(npos, self.node)

				if self.meta then
					local meta = core.get_meta(npos)
					meta:from_table(self.meta)
				end

				-- Play placed sound
				local def = core.registered_nodes[self.node.name]

				if def.sounds and def.sounds.place and def.sounds.place.name then
					core.sound_play(def.sounds.place, {pos = npos})
				end

				-- Just incase we landed on other falling nodes
				core.check_for_falling(npos)
			else
				-- Add drops from falling node
				local drops = core.get_node_drops(self.node, "")

				for _, dropped_item in pairs(drops) do
					core.add_item(npos, dropped_item)
				end
			end

			-- Remove falling entity
			self.object:remove()
		end
	end
})
