-- Only register one global step for this game and just call the respective globalstep functions
-- from within this function, preliminary testing shows that registering one globalstep and calling
-- all of your global step functions from there could slightly improve performance
-- having all dig node code in one function seemed to have the most improvement over calling several dignode
-- functions 



local function gal_player_globalstep(dtime)
	gal.player.player_loop(dtime)

	--sprint_globalstep(dtime)
	gal.player.sprint_globalstep(dtime)

		--  default.leaf_globalstep(dtime)
		    
		--  if blacksmith_globalstep ~= nil then  
		--  	blacksmith_globalstep(dtime)
		--  end
		  
		--  if mobs ~= nil then
		--  	mobs.global_step(dtime)
		--  end
		  
		--  abm_globalstep(dtime)
		  --ambience_globalstep(dtime)
		--  gal.player.seed = gal.player.seed + dtime
		--  math.randomseed(gal.player.seed)


end
minetest.register_globalstep(gal_player_globalstep)

local function gal_player_die_player(player)
	local name = player:get_player_name()
	if gal.player.api.player_attached[name] ~= nil and gal.player.api.player_attached[name] == true then
		local a = gal.player.api.player_attached[name]
		a.object:set_detach()
		gal.player.api.player_attached[name] = nil
		if a.name == "npc:kid_lost" then
			a.random_freq = 15
		end
	end
	--bones_on_dieplayer(player)
	skills_on_dieplayer(player)	
	gal.player.hunger.update_hunger(player, 20)
	gal.player.affects.player_died(player)
--	if sethome_respawnplayer(player) == false then  		
--		mg_villages.spawnplayer(player)
--	end
	gal.player.energy.respawnplayer(player)
	gal.player.data.increment(name,STAT_DIED,1)
	player:set_hp(gal.player.data.get_number(name,"max_hp"))
	return true
end

minetest.register_on_dieplayer(gal_player_die_player)

local function gal_player_dignode(pos, node, digger)
  --print("on_dignode")
  -- going to try to consolidate all on_dignode calls here so there is only one function call
  
  ---- ON DIG NODE FOR MONEY MOD
  --for k,v in pairs(money.convert_items) do
  --  if ( node.name == money.convert_items[k].dig_block ) then     
  --    money.stats[k].running_dug = money.stats[k].running_dug + 1 
  --  end
  --end
  
  if digger ~= nil and digger ~= "" then
    local name= digger:get_player_name()

    -- EXPERIENCE
    if minetest.registered_nodes[node.name] ~= nil then
      if minetest.registered_nodes[node.name]["skill"] ~= nil then
         gal.player.drop_item(pos,"experience:1_exp")
         gal.player.skills.add_exp(name,5)
      end
    end
  
    -- ENERGY
    gal.player.data.increment(name,"energy",-0.05)
    
    gal.player.data.increment(name,STAT_DUG,1)
    local dug = gal.player.data.get(name,STAT_DUG)
	if dug % 100 == 0 then
		local ppos = digger:getpos()
		-- every 100 give them some experience
		local base = 1
		local bonus = dug / 1800
		local decelerator = 2500		
		local exp = base + bonus - math.floor(dug / decelerator)
		gal.player.skills.add_exp(name,exp)
		local e = gal.player.experience.exp_to_items(exp)
		for _,item in pairs(e) do
			gal.player.drop_item(ppos,item)
		end
	end
  end
  
  gal.player.hunger.handle_node_actions(pos, node, digger)
end
minetest.register_on_dignode(gal_player_dignode)

local function gal_player_placenode(pos, node, placer)
  gal.player.hunger.handle_node_actions(pos,node,placer)
  if placer:is_player() then
	  local name = placer:get_player_name()
	  gal.player.data.increment(name,STAT_PLACED,1)
	  
	  local placed = gal.player.data.get(name,STAT_PLACED)
	  if placed % 100 == 0 then
	  	local ppos = placer:getpos()
	  	-- every 100 give them some experience
	  	local base = 1
		local bonus = placed / 1800
		local decelerator = 2500		
		local exp = base + bonus - math.floor(placed / decelerator)
		gal.player.skills.add_exp(name,exp) 
		local e = gal.player.experience.exp_to_items(exp)
		for _,item in pairs(e) do
			gal.player.drop_item(ppos,item)
		end
	  end
  end
end
minetest.register_on_placenode(gal_player_placenode)


local function on_generated(minp,maxp,seed)
	--mg_villages.on_generated(minp,maxp,seed)
	--quests.treasure.on_generated(minp,maxp)
end
minetest.register_on_generated(on_generated)

local function on_join(player)	
	gal.player.data.load_player(player:get_player_name())
	local name = player:get_player_name()
	if minetest.setting_getbool("enable_damage") then
		hunger_join_player(player)
	end
	-- for backward compatibility if player was created before max hp was added
	if gal.player.data.get_number(name,"max_hp") == 0 then
		local l = gal.player.data.get(name,"level")
		local hp = 6 + (( math.floor(l.level / 2) ) * 2)
		if hp > 20 then
			hp = 20
		end
		gal.player.data.set(name,"max_hp",hp)
	end

	--hud.change_item(player, "cmsg_bg", {number = 1})
	--hud.change_item(player, "quests_bg", {number = 1})

end
minetest.register_on_joinplayer(on_join)

local function on_leave(player)
	local name = player:get_player_name()
	gal.player.data.unload_player(name)
end
minetest.register_on_leaveplayer(on_leave)

local function on_new(player)
--	local hud_id = player:hud_add({
--		hud_elem_type = "image",
--		position = {x = 0.5, y = 0.5},
--		scale = {
--			x = -100,
--			y = -100
--		},
--		text = "gal.player.spawning_hud.png"
--	})
	local name = player:get_player_name()
	gal.player.data.load_player(name)
	-- set some defaults
	gal.player.data.set(name,"energy",20)
	gal.player.data.set(name,"stamina",0)
	gal.player.data.set(name,"mana",20)
	gal.player.data.set(name,"hunger_lvl",20)
	gal.player.data.set(name,"hunger_exhaus",0)
	gal.player.data.set(name,"speed",1)
	gal.player.data.set(name,"jump",1)
	gal.player.data.set(name,"gravity",1)
	gal.player.data.set(name,"level", {level=1,exp=0})
	gal.player.data.set(name,"max_health",6)
	player:set_hp(6)
	gal.player.skills.set_default_skills(name)
	gal.player.data.save_player(name)
	gal.player.data.set(name,"spawning_hud",hud_id)
--	gal.player.teleport(player,game_origin)
	minetest.after(3,gal.player.check_spawn,player)
end
minetest.register_on_newplayer(on_new)


local function on_shutdown()
	gal.player.data.save_all()
end
minetest.register_on_shutdown(on_shutdown)
