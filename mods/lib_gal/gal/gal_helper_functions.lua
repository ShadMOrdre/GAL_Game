





--    gal.library.read_csv = dofile(gal.path_mod .. "/csv.lua")

--    function table.contains_substring(t, s)
--       if type(s) ~= "string" then
--          return nil
--       end
--
--      for key, value in pairs(t) do
--        if type(value) == 'string' and s:find(value) then
--             if key then
--                return key
--             else
--                return true
--             end
--        end
--      end
--      return false
--    end

    gal.get_node_drops = function (fullRockNode, cobbleRockNode)
       return {
          max_items = 1,
          items = {
             {
                -- drop the cobble variant with 1/3 chance
                items = {cobbleRockNode},
                rarity = 3,
             },
             {
                -- drop the full node with 2/3 chance
                items = {fullRockNode},
             }
          }
       }
    end

    --Dig upwards
    gal.dig_up = function(pos, node, digger)
       if digger == nil then return end
       local np = {x = pos.x, y = pos.y + 1, z = pos.z}
       local nn = minetest.get_node(np)
       if nn.name == node.name then
          minetest.node_dig(np, nn, digger)
       end
    end

--
-- optimized helper to put all items in an inventory into a drops list
--

	gal.get_inventory_drops = function(pos, inventory, drops)
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


    gal.key_node = ""

    -- NOTICE: This method is not an official part of the API yet.
    -- This method may change in future.
    gal.can_interact_with_node = function(player, pos)
       if player then
          if minetest.check_player_privs(player, "protection_bypass") then
             return true
          end
       else
          return false
       end

       local meta = minetest.get_meta(pos)
       local owner = meta:get_string("owner")

       if not owner or owner == "" or owner == player:get_player_name() then
          return true
       end

       -- Is player wielding the right key?
       local item = player:get_wielded_item()
       if item:get_name() == gal.key_node then
          local key_meta = item:get_meta()

          if key_meta:get_string("secret") == "" then
             local key_oldmeta = item:get_metadata()
             if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
                return false
             end

             key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
             item:set_metadata("")
          end

          return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
       end

       return false
    end



	function gal.intersects_protection(minp, maxp, player_name, interval)
		-- 'interval' is the largest allowed interval for the 3D lattice of checks
	
		-- Compute the optimal float step 'd' for each axis so that all corners and
		-- borders are checked. 'd' will be smaller or equal to 'interval'.
		-- Subtracting 1e-4 ensures that the max co-ordinate will be reached by the
		-- for loop (which might otherwise not be the case due to rounding errors).
		local d = {}
		for _, c in pairs({"x", "y", "z"}) do
			if maxp[c] > minp[c] then
				d[c] = (maxp[c] - minp[c]) / math.ceil((maxp[c] - minp[c]) / interval) - 1e-4
			elseif maxp[c] == minp[c] then
				d[c] = 1 -- Any value larger than 0 to avoid division by zero
			else -- maxp[c] < minp[c], print error and treat as protection intersected
				minetest.log("error", "maxp < minp in 'utils.intersects_protection()'")
				return true
			end
		end
	
		for zf = minp.z, maxp.z, d.z do
			local z = math.floor(zf + 0.5)
			for yf = minp.y, maxp.y, d.y do
				local y = math.floor(yf + 0.5)
				for xf = minp.x, maxp.x, d.x do
					local x = math.floor(xf + 0.5)
					if minetest.is_protected({x = x, y = y, z = z}, player_name) then
						return true
					end
				end
			end
		end
	
		return false
	end

	function gal.clone_node(name)
		local node = table.copy(minetest.registered_nodes[name])
		return node
	end













