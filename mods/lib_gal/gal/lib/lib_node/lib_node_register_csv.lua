--
-- Register nodes that are define within a .csv (Comma Separated Value) file.
--
--
--
-- Define constants that can be used in csv

local S = gal.intllib

local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end


local function node_registration(separator, csv_path)
	for i, stone in ipairs(gal.lib.csv.read(separator, csv_path)) do
	
		local node_name, descript, alias_mod, alias_node, tile_string, draw_type, param_type, use_alpha, sun_prop, damage, grnd_cont, leg_min, groups, groups2, max_drop, drops, sounds, grp_crack,grp_crumb,grp_chop,grp_snap,grp_bend,grp_obh,grp_lvl,grp_stone,grp_sand,grp_glass,grp_ore,grp_metal,grp_mineral,grp_ice,grp_snow,grp_dirt,grp_grass,grp_soil,grp_bclay,grp_liquid,grp_lava,grp_ignite,grp_mud,grp_oil,grp_flam,grp_quick,grp_water,grp_pof,grp_cool_lava,grp_fall_node,grp_nici,grp_nojump,grp_mohs,grp_rocktype,grp_mattype = unpack(stone)
	
		-- Parse node names: transform empty strings into nil and separate node and count
		node_name = read_node_str(node_name)
		descript = read_node_str(descript)
		alias_mod = read_node_str(alias_mod)
		alias_node = read_node_str(alias_node)
	
		local new_node_def = {
			description = S("Stone - "..descript..""),
			tiles = {},
			groups = {},
			sounds = {},
		}
	
		if draw_type ~= "" then
			new_node_def.drawtype = draw_type
		end
	
		if param_type ~= "" then
			new_node_def.paramtype = param_type
		end
	
		if use_alpha ~= "" then
			new_node_def.use_texture_alpha = use_alpha
		end
	
		if sun_prop ~= "" then
			new_node_def.sunlight_propagates = sun_prop
		end
	
		if damage ~= "" then
			if tonumber(damage) > 0 then
				new_node_def.damage_per_second = tonumber(damage)
			end
		end
	
		if grnd_cont ~= "" then
			new_node_def.is_ground_content = grnd_cont
		end
	
		if leg_min ~= "" then
			new_node_def.legacy_mineral = leg_min
		end		
	
		if drops == "" then
			drops = nil
		end
	
		if drops then
	
			minetest.log(drops)
	
			if drops:find("[^%,% ]") then
				local new_drop1, new_drop2, new_drop3, new_drop4, new_drop5, new_drop6
				new_node_def.drop = {}
				if max_drop then
					new_node_def.drop.max_items = max_drop
				end
				new_node_def.drop.items = {}
				--new_node_def.drop.items.items = {}
				new_drop1, new_drop2, new_drop3, new_drop4, new_drop5, new_drop6 = unpack(drops:split(",", true))
	
				local new_drop_name, new_drop_rarity
				if new_drop1 then
	
					minetest.log(new_drop1)
	
					new_drop_name, new_drop_rarity = unpack(new_drop1:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[1] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[1] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[1] = {items = {new_drop1}}
					end
				else
					new_node_def.drop.items[1] = {items = {drops}}
				end
				if new_drop2 then
	
					minetest.log(new_drop2)
	
					new_drop_name, new_drop_rarity = unpack(new_drop2:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[2] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[2] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[2] = {items = {new_drop2}}
					end
				else
					new_node_def.drop.items[2] = {items = {drops}}
				end
				if new_drop3 then
	
					minetest.log(new_drop3)
	
					new_drop_name, new_drop_rarity = unpack(new_drop3:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[3] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[3] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[3] = {items = {new_drop3}}
					end
				else
					new_node_def.drop.items[3] = {items = {drops}}
				end
				if new_drop4 then
	
					minetest.log(new_drop4)
	
					new_drop_name, new_drop_rarity = unpack(new_drop4:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[4] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[4] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[4] = {items = {new_drop4}}
					end
				else
					new_node_def.drop.items[4] = {items = {drops}}
				end
				if new_drop5 then
	
					minetest.log(new_drop5)
	
					new_drop_name, new_drop_rarity = unpack(new_drop5:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[5] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[5] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[5] = {items = {new_drop5}}
					end
				else
					new_node_def.drop.items[5] = {items = {drops}}
				end
				if new_drop6 then
	
					minetest.log(new_drop6)
	
					new_drop_name, new_drop_rarity = unpack(new_drop6:split(" ", true))
					if new_drop_name then
	
						minetest.log(new_drop_name)
	
						if new_drop_rarity then
	
							minetest.log(new_drop_rarity)
	
							new_node_def.drop.items[6] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
						else
							new_node_def.drop.items[6] = {items = {new_drop_name}}
						end
					else
						new_node_def.drop.items[6] = {items = {new_drop6}}
					end
				else
					new_node_def.drop.items[6] = {items = {drops}}
				end
	
			else
	
				new_node_def.drop = drops
	
			end
		end
	
		if tile_string then
			local new_tile1, new_tile2, new_tile3, new_tile4, new_tile5, new_tile6
			if tile_string:find("[^%,% ]") then
				new_tile1, new_tile2, new_tile3, new_tile4, new_tile5, new_tile6 = unpack(tile_string:split(",", true))
			else
				new_tile1 = tile_string
			end
	
			if new_tile1 then
				new_node_def.tiles[1] = new_tile1
			end
			if new_tile2 and new_tile2 ~= "" then
				new_node_def.tiles[2] = new_tile2
			else
				new_node_def.tiles[2] = new_tile1
			end
			if new_tile3 and new_tile3 ~= "" then
				new_node_def.tiles[3] = new_tile3
			else
				new_node_def.tiles[3] = new_tile2
			end
			if new_tile4 and new_tile4 ~= "" then
				new_node_def.tiles[4] = new_tile4
			else
				new_node_def.tiles[4] = new_tile3
			end
			if new_tile5 and new_tile5 ~= "" then
				new_node_def.tiles[5] = new_tile5
			else
				new_node_def.tiles[5] = new_tile3
			end
			if new_tile6 and new_tile6 ~= "" then
				new_node_def.tiles[6] = new_tile6
			else
				new_node_def.tiles[6] = new_tile3
			end
		end
		
		if sounds and sounds ~= "" then
			if sounds == "dirt" then
				new_node_def.sounds = gal.node_sound_dirt_defaults()
			elseif sounds == "stone" then
				new_node_def.sounds = gal.node_sound_stone_defaults()
			elseif sounds == "sand" then
				new_node_def.sounds = gal.node_sound_sand_defaults()
			elseif sounds == "gravel" then
				new_node_def.sounds = gal.node_sound_gravel_defaults()
			elseif sounds == "glass" then
				new_node_def.sounds = gal.node_sound_glass_defaults()
			elseif sounds == "metal" then
				new_node_def.sounds = gal.node_sound_metal_defaults()
			elseif sounds == "water" then
				new_node_def.sounds = gal.node_sound_water_defaults()
			elseif sounds == "snow" then
				new_node_def.sounds = gal.node_sound_snow_defaults()
			else
	
			end
		end
	
		--if groups then
			--local new_node_groups = {}
			if grp_crack then
				new_node_def.groups.cracky = tonumber(grp_crack)
			end
			if grp_crumb then
				new_node_def.groups.crumbly = tonumber(grp_crumb)
			end
			if grp_chop then
				new_node_def.groups.choppy = tonumber(grp_chop)
			end
			if grp_snap then
				new_node_def.groups.snappy = tonumber(grp_snap)
			end
			if grp_bend then
				new_node_def.groups.bendy = tonumber(grp_bend)
			end
			if grp_obh then
				new_node_def.groups.oddly_breakable_by_hand = tonumber(grp_obh)
			end
			if grp_lvl then
				new_node_def.groups.level = tonumber(grp_lvl)
			end
			if grp_stone then
				new_node_def.groups.stone = tonumber(grp_stone)
			end
			if grp_sand then
				new_node_def.groups.sand = tonumber(grp_sand)
			end
			if grp_glass then
				new_node_def.groups.glass = tonumber(grp_glass)
			end
			if grp_ore then
				new_node_def.groups.ore = tonumber(grp_ore)
			end
			if grp_metal then
				new_node_def.groups.metal = tonumber(grp_metal)
			end
			if grp_mineral then
				new_node_def.groups.mineral = tonumber(grp_mineral)
			end
			if grp_ice then
				new_node_def.groups.ice = tonumber(grp_ice)
			end
			if grp_snow then
				new_node_def.groups.snowy = tonumber(grp_snow)
			end
			if grp_dirt then
				new_node_def.groups.dirt = tonumber(grp_dirt)
			end
			if grp_grass then
				new_node_def.groups.grass = tonumber(grp_grass)
			end
			if grp_soil then
				new_node_def.groups.soil = tonumber(grp_soil)
			end
			if grp_bclay then
				new_node_def.groups.bakedclay = tonumber(grp_bclay)
			end
			if grp_liquid then
				new_node_def.groups.liquid = tonumber(grp_liquid)
			end
			if grp_lava then
				new_node_def.groups.lava = tonumber(grp_lava)
			end
			if grp_ignite then
				new_node_def.groups.igniter = tonumber(grp_ignite)
			end
			if grp_mud then
				new_node_def.groups.mud = tonumber(grp_mud)
			end
			if grp_oil then
				new_node_def.groups.oil = tonumber(grp_oil)
			end
			if grp_flam then
				new_node_def.groups.flammable = tonumber(grp_flam)
			end
			if grp_quick then
				new_node_def.groups.quicksand = tonumber(grp_quick)
			end
			if grp_water then
				new_node_def.groups.water = tonumber(grp_water)
			end
			if grp_pof then
				new_node_def.groups.puts_out_fire = tonumber(grp_pof)
			end
			if grp_cool_lava then
				new_node_def.groups.cools_lava = tonumber(grp_cool_lava)
			end
			if grp_fall_node then
				new_node_def.groups.falling_node = tonumber(grp_fall_node)
			end
			if grp_nici then
				new_node_def.groups.not_in_creative_inventory = tonumber(grp_nici)
			end
			if grp_nojump then
				new_node_def.groups.disable_jump = tonumber(grp_nojump)
			end
		--end


		if alias_mod and alias_node then
	
			minetest.register_node(":gal:"..node_name.."", new_node_def)

			--minetest.register_alias(""..alias_mod..":"..alias_node.."", "gal:"..node_name.."")
			--minetest.register_alias(""..alias_node.."", "gal:"..node_name.."")

			--minetest.register_alias(""..node_name.."", "gal:"..node_name.."")
	
		else
	
			minetest.register_node(":gal:"..node_name.."", new_node_def)
			--minetest.register_alias(""..node_name.."", "gal:"..node_name.."")
	
	
		end

	
	end
end

return node_registration