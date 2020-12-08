sample_quest = { } 

-- Add a list of quest definitions
sample_quest.quests = {
	[1] = { "simple_walk", "Walk 200 nodes", 200, "Walking is hard, but you have to learn it."},
	[2] = { "start_digging", "Dig 10 nodes", 10, "As long as you can not dig, you are not a real miner."}, 
	[3] = { "first_wood", "Craft 8 wood planks", 8, "Once upon a time, everything was wood."},
	[4] = { "first_tool", "Craft a wooden pickaxe", 1, "It might be useful to use a tool instead of your bare hand."}
}
sample_quest.current_quest = {}

-- function which starts the next quest in the questrow
function sample_quest.next_quest(playername, questname) 
	sample_quest.current_quest[playername] = sample_quest.current_quest[playername] + 1
	if (sample_quest.quests[sample_quest.current_quest[playername]] == nil) then
		return
	end
	print(sample_quest.quests[sample_quest.current_quest[playername]][1])
	minetest.after(1, function()
		quests.start_quest(playername, "sample_quest:" .. sample_quest.quests[sample_quest.current_quest[playername]][1]) 
	end)
end

-- Register the quests defined above
for _,quest in ipairs(sample_quest.quests) do
	quests.register_quest("sample_quest:" .. quest[1],
			{ title = quest[2],
			  description = quest[4],
			  max = quest[3],
			  autoaccept = true,
			  callback = sample_quest.next_quest })

end

-- Add another quest, where the end of the quest doesn't end itself
quests.register_quest("sample_quest:stone", 
	{ title = "Dig one stone",
	  description = "Welcome to the stoneage.",
	  max = 1,
	  autoaccept = false,
	  callback = nil })


local oldpos = {}
minetest.register_on_joinplayer(function (player)
	sample_quest.current_quest[player:get_player_name()] = 0 -- set the first quest
	sample_quest.next_quest(player:get_player_name(), "") -- start the first quest
--	quests.show_hud(player:get_player_name())
	oldpos[player:get_player_name()] = player:getpos() -- remember the current location for movement based quests
end)

-- For quests where you have to dig something, the updates happen here
minetest.register_on_dignode(function(pos, oldnode, digger)
	quests.update_quest(digger:get_player_name(), "sample_quest:start_digging", 1)
	if (oldnode.name == "default:stone") then
		quests.update_quest(digger:get_player_name(), "sample_quest:stone", 1)
		minetest.after(5, quests.accept_quest, digger:get_player_name(), "sample_quest:stone")
		-- this shows the possibility to end the quest to a later time
		-- an example would be to return to an NPC before you get the reward
		-- (quests.accept_quest() returns true when the quest is finished, which
		-- is ignored here)
	end
end)

-- movement based quests have to check on a regular basis for a changed position of the 
-- player. Here every second, the quest is updated.
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if (timer >= 1) then
		local players = minetest.get_connected_players()
		for _,player in ipairs(players) do
			if (oldpos[player:get_player_name()] ~= nil) then
				local playername = player:get_player_name()
				local pos = player:getpos()
				quests.update_quest(player:get_player_name(), "sample_quest:simple_walk", math.sqrt(math.pow(oldpos[playername].x - pos.x, 2) + math.pow(oldpos[playername].y - pos.y, 2) + math.pow(oldpos[playername].z - pos.z,2))) -- Update the quest by the distance
			end
			oldpos[player:get_player_name()] = player:getpos() -- remember the current position for the next check
		end
		timer = 0
	end
end)

-- Each quest that has something to do with craft goes here
minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	local playername = player:get_player_name()
	if (itemstack:get_name() == "default:wood") then
		quests.update_quest(playername, "sample_quest:first_wood", itemstack:get_count())
	elseif (itemstack:get_name() == "default:pick_wood") then
		-- update the first_tool quest and start, when it is finished, another quest
		if (quests.update_quest(playername, "sample_quest:first_tool", itemstack:get_count())) then
			quests.start_quest(playername, "sample_quest:stone") 
		end
	end
	return nil
end)

minetest.register_chatcommand("next_quest",{
	func = function(name, param) 
		sample_quest.next_quest(name)
	end
})
