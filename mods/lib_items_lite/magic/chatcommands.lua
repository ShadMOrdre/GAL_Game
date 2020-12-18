-- Wizard powers
--[[
minetest.register_chatcommand("whereis", {
	params = "<player>",
	privs = { server=true, },
	description = "Locate a player in rl",
	func = function(name, param)
		local pname = param
		print (name, param)
		local info = minetest.get_player_information(pname)
		print (info)
		local handle = io.popen("geoiplookup " .. info.address)
		local result = handle:read("*a")
		print (result)
		handle:close()
		minetest.chat_send_player(name, result)
	end,
})
]]
minetest.register_chatcommand("toad", {
	params = "<player>",
	privs = { privs=true, },
	description = "Turn a player into a toad and remove all privs.",
	func = function(name, param)
		local perps = string.split(param, " ")
		--for perp in perps do
			local perp = perps[1] or "Toady"
			minetest.chat_send_player(name, "You turn "..perp.." into a toad!")
			if not magic:player_exists(perp) then
				return false, "Player " .. perp .. " does not exist."
			end
			local privs = minetest.get_player_privs(perp)
			--toad function
			if not magic:toad(perp) then
				return false, "You fail to toad "..perp
			end
			minetest.log("action", name .. " toaded " .. perp)
			minetest.chat_send_player(name, "Player "..perp.." toaded! Revoked all.")
		--end for perp
	end,
})

minetest.register_chatcommand("jail", {
	params = "<player>",
	privs = { ban=true, },
	description = "Jail a player. (removes all privs but shout)",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "Crim"
		minetest.chat_send_player(name, "You send "..perp.." to jail.")
		if not magic:player_exists(perp) then
			return false, "Player " .. perp .. " does not exist."
		end
		--local privs = minetest.get_player_privs(perp)
		-- jail function
		magic:make_jailor(name)
		if not magic:jail(perp) then
			return false, "You fail to jail "..perp
		end
		minetest.log("action", name .. " jailed " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." jailed. Revoked all but shout.")
	end,
})

minetest.register_chatcommand("arrest", {
	params = "<player>",
	privs = { basic_privs=true, },
	description = "Arrest a player. (removes all privs but shout)",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "Suspect"
		minetest.chat_send_player(name, "You arrest "..perp)
		if not magic:player_exists(perp) then
			return false, "Player " .. perp .. " does not exist."
		end
		--local privs = minetest.get_player_privs(perp)
		-- arrest function
		magic:make_arrest(name)
		if not magic:arrest(perp) then
			return false, "You fail to arrest "..perp
		end
		minetest.log("action", name .. " arrested " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." arrested. Revoked all but shout.")
	end,
})

minetest.register_chatcommand("detain", {
	params = "<player>",
	privs = { basic_privs=true, },
	description = "Detain a player.",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "MissDemeanour"
		minetest.chat_send_player(name, "You send "..perp.." to the Chancellor's Office.")
		if not magic:player_exists(perp) then
			return false, "Player "..perp.." does not exist."
		end
		-- detain function
		magic:make_head(name)
		if not magic:detain(perp) then
			return false, "You fail to detain player " .. perp
		end
		minetest.log("action", name .. " detained " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." detained.")
	end,
})

-- Helper function to inform the user of the chat command result and effect ID.

local function notify(name, retcode)
	if(retcode == false) then
		minetest.chat_send_player(name, "Effect application failed. Effect was NOT applied.")
	else
		minetest.chat_send_player(name, "Effect applied. Effect ID: "..tostring(retcode))
	end
end

-- Enchant
minetest.register_chatcommand("enchant", {
	params = "",
	description = "Enchant wielded item.",
	privs = { magic=true, },
	func = function(name, param)
		-- Get wielded item.
		local player = minetest.get_player_by_name(name)
		local held = player:get_wielded_item()
		local holding = string.split(held:get_name(), ":")
		local magic_item = held:get_name()
		local this = {
			tool = "",
			gem = "",
			metal = "",
			modname = holding[1],
			item = string.split(holding[2], "_"),
			count = held:get_count(),
		}
		-- Translate this into appropriate magic item.
		if this.modname == "tool" then
			this.tool = this.item[1] 
			this.gem = this.item[2]
			magic_item = "magic:"..this.tool.."_"..this.gem
		elseif this.modname == "rings" then
			this.tool = "ring"
			this.gem = this.item[1]
			this.metal = this.item[2]
			magic_item = "magic:"..this.tool.."_"..this.gem.."_"..this.metal
		elseif this.modname == "potions" then
			this.tool = "potion"
			this.gem = this.item[1]
			magic_item = "magic:"..this.tool.."_"..this.gem
		elseif this.modname == "magic" then
			--minetest.chat_send_player(name, held:get_name().." is re-enchanted.")
			this.gem = this.item[2]
		else
			minetest.chat_send_player(name, held:get_name().." is not suitable for enchantment.")
			return false
		end
		
		-- Scan for helper nodes
		local here = player:getpos()
		local radius = 5
		local minp = {x=here.x-radius,y=here.y-radius,z=here.z-radius}
		local maxp = {x=here.x+radius,y=here.y+radius,z=here.z+radius}
		local power = #minetest.find_nodes_in_area(minp, maxp, "mineral:"..this.gem.."_stone")
		local booklearning = #minetest.find_nodes_in_area(minp, maxp, {
							"equipment:bookshelf", 
							"moretrees:beech_planks",
							"moretrees:beech_trunk"
						})
		if booklearning < 4 then 
			booklearning = 1 
		end
		local conductors = #minetest.find_nodes_in_area(minp, maxp, magic.stations[this.gem])
		local water = #minetest.find_nodes_in_area(minp, maxp, "group:water")
		local resistance = (77 * (water + 1)) - conductors
		if resistance < 1 then 
			resistance = 1 
		end
		local current = math.ceil(power / resistance)
		
		-- Calculate enchantment chance.
		local charge = current * math.random(booklearning)
		debug = ("%s casts enchantment on %s \
	 - Conductors: %d * Water: %d \
	Current: %d = Power: %d / Resistance: %d \
	 * Learning: %d =           Charge: %d \
	"):format(name, 
			held:get_name(), 
			conductors, 
			water, 
			current, 
			power, 
			resistance, 
			booklearning, 
			charge)
		minetest.log("action", debug)
		
		-- Replace item if enchantment succeeds.
		if charge > math.random(resistance) then
			minetest.chat_send_player(name, "Enchantment succeeds!")
			-- sanity check magic item
			if minetest.registered_items[magic_item] then
				minetest.log("action", dump(magic_item).." - "..dump(this))
				-- Replace item in hand.
				held:replace(magic_item.." "..this.count)
				if player:set_wielded_item(held) then
					minetest.chat_send_player(name, magic_item.." glows for a moment.")
				else
					local ret = playereffects.apply_effect_type("null", 5, minetest.get_player_by_name(name))
					notify(name, ret)
				end
			else
				minetest.chat_send_player(name, held:get_name().." cannot manifest -> "..magic_item)
				return false
			end
		else
			-- Give semi-random reasons for failure.
			local reasons = {
				"cosmic rays",
				"bad astrology",
				"the winds of karma blowing the wrong way",
				"interference from bad vibes",
				"synchronicity errors",
				"fluctuations in the time-space continuum",
				"geomantic anomalies",
				"quantum displacement",
				"the spell backfired",
			}
			local reason = ", possibly due to "..reasons[math.random(#reasons)]
			if booklearning < (resistance / charge) then
				reason = ", maybe due to lack of knowledge"
			end
			if water > 1 then
				reason = " because you are too close to water."
			elseif power < 1 or power < (resistance / charge) then
				reason = reason.." or lack of power"
			elseif resistance > (booklearning * power) then
				reason = reason.." or high resistance"
			elseif charge < 6 then
				reason = reason.." or you didn't generate enough magical charge."
			end
			-- Chance of klutzing
			if charge == 1 and math.random(booklearning) < 2 then 
				-- wielditem destroyed
				held:clear()
				player:set_wielded_item(held)
				reason = ", the item is destroyed. :("
			elseif current > 1 and math.random(booklearning) < 2 then
				-- destroy conductor nodes
				reason = " and you smell burning!"
			elseif charge > booklearning and math.random(booklearning) < 2 then
				-- blow gem blocks
				reason = " with a small explosion!"
			end
			minetest.chat_send_player(name, "Enchantment fails"..reason..". :(")
		end
	end,
})

-- Examples

------ Chat commands for the example effects ------
-- Null effect (never succeeds)
minetest.register_chatcommand("null", {
	params = "",
	description = "Does nothing.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("null", 5, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})

minetest.register_chatcommand("blind", {
	params = "",
	description = "Makes your screen black for a short time.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("blind", 5, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})
minetest.register_chatcommand("fast", {
	params = "",
	description = "Makes you fast for a short time.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("high_speed", 10, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})
minetest.register_chatcommand("hfast", {
	params = "",
	description = "Makes you fast for a short time (hidden effect).",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("high_speed_hidden", 10, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})
minetest.register_chatcommand("slow", {
	params = "",
	description = "Makes you slow for a long time.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("low_speed", 120, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})
minetest.register_chatcommand("highjump", {
	params = "",
	description = "Makes you jump higher for a short time.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("highjump", 20, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})

minetest.register_chatcommand("fly", {
	params = "",
	description = "Grants you the fly privilege for a minute. You keep the effect when you die.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("fly", 60, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})

minetest.register_chatcommand("regen", {
	params = "",
	description = "Gives you 1 half heart per second 10 times, healing you by 5 hearts in total.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("regen", 10, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})

minetest.register_chatcommand("slowregen", {
	params = "",
	description = "Gives you 1 half heart every 3 seconds 10 times, healing you by 5 hearts in total.",
	privs = { magic=true, },
	func = function(name, param)
		local ret = playereffects.apply_effect_type("slowregen", 10, minetest.get_player_by_name(name))
		notify(name, ret)
	end,
})

-- Dispel all active effects

minetest.register_chatcommand("dispelall", {
	params = "",
	description = "Dispels all magical effects.",
	privs = { basic_privs=true, },
	func = function(name, param)
		local effects = playereffects.get_player_effects(name)
		for e=1, #effects do
			playereffects.cancel_effect(effects[e].effect_id)
		end
		minetest.chat_send_player(name, "All magical effects dispelled.")
	end,
})

--[[ The stress test applies a shitload of effects at once.
This is used to test the performance of this mod at very large effect numbers. ]]
minetest.register_chatcommand("stresstest", {
	params = "[<effects>]",
	descriptions = "Start the stress test for Player Effects with <effects> effects.",
	privs = {server=true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local max = 100
		if(type(param)=="string") then
			if(type(tonumber(param)) == "number") then
				max = tonumber(param)
			end
		end
		minetest.debug("[playereffects] Stress test started for "..name.." with "..max.." effects.")
		for i=1,max do
			playereffects.apply_effect_type("stress", math.random(6,60), player)
			if(i%100==0) then
				minetest.debug("[playereffects] Effect "..i.." of "..max.." applied.")
				minetest.chat_send_player(name, "[playereffects] Effect "..i.." of "..max.." applied.")

			end
		end
	end
})
