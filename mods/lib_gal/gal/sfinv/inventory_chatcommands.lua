

------------------------
--Inventory management--
------------------------
--You need the "invmanage" priv to run the commands. 
------------------------

minetest.register_privilege("invmanage", "Player can use clearinv and copyinv")

minetest.register_chatcommand("clearinv", { --Register the clear command.
	params = "<Player>",
	description = "Clear inventory of a player",
	privs = {invmanage = true},
	func = function(name,text)
	
    local input, rf = io.open(minetest.get_worldpath() .. "/players/" .. text, "r") --Check if the player file exist to prevent crash.
	if input then

	local inv = minetest.get_inventory({type="player", name=text}) --Get your inventory and stock it in inv.
	
	for i = 1 ,inv:get_size("main"), 1 do -- clear items of the main inventory grid of the player.    
	inv:set_stack("main", i, nil)
	 end
	
	for i = 1 ,inv:get_size("craft"), 1 do  -- clear items of the craft grid of the player.    
	inv:set_stack("craft", i, nil)
	end
	
	end
	end,
})

minetest.register_chatcommand("copyinv", { --Register the copy command.
	params = "<PlayerYouCopy>",
	description = "copy the inventory of a player and place the items in your inventory.",
	privs = {invmanage = true},
	func = function(yname,param)
	
    local input, rf = io.open(minetest.get_worldpath() .. "/players/" .. param, "r") --Check if the player file exist to prevent crash.
	if input then

	local otherinv = minetest.get_inventory({type="player", name=param}) --Get the other player inventory and stock it in otherinv.
	local inv = minetest.get_inventory({type="player", name=yname})      --Get your inventory and stock it in inv.
	
	for i = 1 ,inv:get_size("main"), 1 do      -- Get items in the main inventory grid of the other player.    
	inv:set_stack("main", i, otherinv:get_stack("main", i))
	 end
	 
	for i = 1 ,inv:get_size("craft"), 1 do     -- Get items in the craft grid of the other player.             
	inv:set_stack("craft", i, otherinv:get_stack("craft", i))
	end
	
	end
	end,
})

minetest.register_chatcommand("setinv", { --Register the setinv command.
	params = "<player> <slot> <item> <value>",
	description = "Set an item in a specific slot of a player inventory.",
	privs = {invmanage = true},
	func = function(yname,param)
	
		local playername
		local slotname
		local itemname
		local itemnb = nil

		playername, slotname, itemname , itemnb = string.match(param, "([^%s]+)[, ]*([^%s]+)[, ]*([^%s]+)[, ]*([^%s]*)")
		slotname = tonumber(slotname)
		itemnb = tonumber(itemnb)

		if playername ~= nil then
--			local input, rf = io.open(minetest.get_worldpath() .. "/players/" .. playername, "r") --Check if the player file exist to prevent crash.
--			if input then

				local inv = minetest.get_inventory({type="player", name=playername}) --Get the player inventory and stock it in otherinv.
			
				if slotname ~= nil then
				
					if slotname < inv:get_size("main") and slotname > 0 then
					
						if itemnb ~= nil then
							inv:set_stack("main", slotname, itemname .. " " .. itemnb)
						end

						if itemnb == nil then
							inv:set_stack("main", slotname, itemname .. " " .. 1)
						end
					end
				end
--			end
		end
	end,
})







minetest.register_chatcommand("sendstack", {
    params = "<player>",
    description = "Send the item you are currently holding to the receiver's inventory.",
    privs = {ban = true,},
    func = function(name, param)
        local sender = minetest.get_player_by_name(name)
        local receiver = minetest.get_player_by_name(param)
        if not receiver then
            return false, "\""..param.."\" is not a valid player."
        end

        if name == param then
            return false, "You cannot send items to yourself."
        end

        local sendstack = sender:get_wielded_item()
        if sendstack:is_empty() then
            return false, "You must be holding the item you wish to send."
        end
        local sendstackname = sendstack:get_name()
        local sendstackcount = sendstack:get_count()
        local stackstring = sendstackname.." "..sendstackcount

        local leftover = receiver:get_inventory():add_item("main", sendstack)
        sender:set_wielded_item(leftover)

        local partiality = ""
        if leftover:is_empty() then
            partiality = ""
        elseif leftover:get_count() == sendstack:get_count() then
            partiality = "could not be "
        else
            partiality = "partially "
        end
        minetest.log("action", ("%s %ssent to %s from %s"):format(stackstring, partiality, param, name))
        minetest.chat_send_player(param, ("%q %ssent to inventory from player %s."):format(stackstring, partiality, name))
        return true, ("%q %ssent to %s."):format(stackstring, partiality, param)
    end,
})







