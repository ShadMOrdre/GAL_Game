gal.player.proficiencies.abilities = {}
gal.player.proficiencies.abilities.all = {}
gal.player.proficiencies.abilities.energy = {}
gal.player.proficiencies.abilities.energy_hud = {}

gal.player.hud.register("abilities", {
	hud_elem_type = "statbar",
	position = { x = 1, y = 1 },
	text = "skills_abilities_energy.png",
	background = nil,
	number = 0,
	max = 20,
	size = { x=24, y=24 },
	offset = { x = -250, y = -120 },
})

minetest.register_on_joinplayer(function(player)
	if not player then
		return
	end
--	gal.player.proficiencies.abilities.energy_hud[player:get_player_name()] = player:hud_add({
--		hud_elem_type = "statbar",
--		position = {x=0.5,y=1.0},
--		size = {x=16, y=16},
--	   	offset = {x=-(32*5), y=-(48*2+32+8)},
--		text = "skills_abilities_energy.png",
--		number = 0,
--	})
--	    gal.player.hud.register("proficiencies", {
--	        hud_elem_type = "statbar",
--	        position = { x = 1, y = 1 },
--	        text = "skills_abilities_energy.png",
--	        background = nil,
--	        number = 0,
--	        max = 20,
--	        size = { x=24, y=24 },
--	        offset = { x = -250, y = -180 },
--	    })

	gal.player.proficiencies.abilities.energy[player:get_player_name()] = 40
	gal.player.hud.change_item(player, "proficiencies",{number=40})

	--gal.player.proficiencies.abilities.change_energy(player, 40)

end)

function gal.player.proficiencies.abilities.change_energy(player, v)
	gal.player.proficiencies.abilities.energy[player:get_player_name()] = gal.player.proficiencies.abilities.energy[player:get_player_name()] + v
	local val = 0
	if gal.player.proficiencies.abilities.energy[player:get_player_name()] > 39 then
		val = 0
	else
		val = gal.player.proficiencies.abilities.energy[player:get_player_name()]
	end
	--player:hud_change(gal.player.proficiencies.abilities.energy_hud[player:get_player_name()], "number",val)
	gal.player.hud.change_item(player, "proficiencies",{number=val})
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >=0.5 then
		for _, player in pairs(minetest.get_connected_players()) do
			local t_player_energy = gal.player.proficiencies.abilities.energy[player:get_player_name()]
			if t_player_energy and tonumber(t_player_energy) < 40 then
				gal.player.proficiencies.abilities.change_energy(player, 1)
				if gal.player.proficiencies.abilities.energy[player:get_player_name()] > 39 then
					gal.player.cmsg.push_message_player(player, "[energy] Your energy is full!")
				end
			end
		end
		timer = 0
	end
end)

function gal.player.proficiencies.abilities.register_ability(name, def)
	minetest.register_craftitem("gal:ability_" .. name, {
		description = def.description,
		inventory_image = def.img,
		skill = def.skill,
		on_use = function(itemstack, user, pointed_thing)
			if user == nil then return end
			if gal.player.proficiencies.lvls[user:get_player_name()] and gal.player.proficiencies.lvls[user:get_player_name()][def.skill] > def.lvl-1 then
				if gal.player.proficiencies.abilities.energy[user:get_player_name()] > def.energy -1 then
					def.on_use(itemstack, user, pointed_thing)
					gal.player.proficiencies.abilities.change_energy(user, -def.energy)
				else
					gal.player.cmsg.push_message_player(user, "[WARNING] You dont have enought energy to use this ability!")
				end
			else
				gal.player.cmsg.push_message_player(user, "[info] You have to be " .. def.skill .. " level "..tostring(def.lvl).. " to use this ability!")
			end
			return nil
		end
	})

	table.insert(gal.player.proficiencies.abilities.all, "proficiencies:ability_" .. name)
end

minetest.register_craftitem("gal:ability_book", {
	description = "Ability Book",
	inventory_image = "skills_abilities_book.png",
	on_use = function(itemstack, user, pointed_thing)
		if user == nil then return end
		local item = gal.player.proficiencies.abilities.all[math.random(#gal.player.proficiencies.abilities.all)]
		if user:get_inventory():room_for_item("main", item) then
			user:get_inventory():add_item("main", item)
			itemstack:take_item()
		else
			gal.player.cmsg.push_message_player(user, "[info] You don't have any free space in your inventory.")
		end
		return itemstack
	end
})
--table.insert(default.treasure_chest_items, "proficiencies:ability_book")

gal.player.proficiencies.abilities.register_ability("super_jump", {
	description = "Super Jump\n Level: 8\n Skill: hunter\n Time: 7.0\n Effect: gravity = 0.1\n Energy: 10",
	img = "skills_abilities_super_jump.png",
	skill = "hunter",
	lvl = 8,
	energy = 10,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			gravity = 0.1,
		})
		gal.player.cmsg.push_message_player(user, "[ability] + super jump")

		minetest.after(7.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				gravity = 1,
			})
			gal.player.cmsg.push_message_player(player, "[ability] - super jump")
		end, user)
	end
})

gal.player.proficiencies.abilities.register_ability("lift", {
	description = "Lift\n Level: 12\n Skill: hunter\n Time: 2.0\n Effect: gravity = -0.5\n Energy: 20",
	img = "skills_abilities_lift.png",
	skill = "hunter",
	lvl = 12,
	energy = 20,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			gravity = -0.5,
		})
		gal.player.cmsg.push_message_player(user, "[ability] + lift")

		minetest.after(2.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				gravity = 1,
			})
			gal.player.cmsg.push_message_player(player, "[ability] - lift")
		end, user)
	end
})

gal.player.proficiencies.abilities.register_ability("run", {
	description = "Run\n Level: 2\n Skill: hunter\n Time: 5.0\n Effect: speed = 2\n Energy: 20",
	img = "skills_abilities_run.png",
	skill = "hunter",
	lvl = 2,
	energy = 20,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			speed = 2,
		})
		gal.player.cmsg.push_message_player(user, "[ability] + run")

		minetest.after(5.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				speed = 1,
			})
			gal.player.cmsg.push_message_player(player, "[ability] - run")
		end, user)
	end
})

gal.player.proficiencies.abilities.register_ability("sprint", {
	description = "Sprint\n Level: 7\n Skill: hunter\n Time: 5.0\n Effect: speed = 3\n Energy: 20",
	img = "skills_abilities_run.png",
	skill = "hunter",
	lvl = 7,
	energy = 20,
	on_use = function(itemstack, user, pointed_thing)
		user:set_physics_override({
			speed = 3,
		})
		gal.player.cmsg.push_message_player(user, "[ability] + sprint")

		minetest.after(5.0, function(player)
			if not player or not player:is_player() then
				return
			end
			player:set_physics_override({
				speed = 1,
			})
			gal.player.cmsg.push_message_player(player, "[ability] - sprint")
		end, user)
	end
})

gal.player.proficiencies.abilities.register_ability("heal", {
	description = "Heal\n Level: 7\n Skill: farmer\n Effect: hp + 4\n Energy: 15",
	img = "skills_abilities_heal.png",
	skill = "farmer",
	lvl = 7,
	energy = 15,
	on_use = function(itemstack, user, pointed_thing)
		user:set_hp(user:get_hp()+4)
		gal.player.cmsg.push_message_player(user, "[ability][hp] + 4")
	end
})

gal.player.proficiencies.abilities.register_ability("grow", {
	description = "Grow\n Level: 3\n Skill: farmer\n Effect: -\n Energy: 30",
	img = "skills_abilities_grow.png",
	skill = "farmer",
	lvl = 3,
	energy = 30,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			if minetest.get_node(pointed_thing.under).name == "default:dirt" then
				minetest.set_node(pointed_thing.under, {name = "default:grass"})
			elseif minetest.get_node(pointed_thing.under).name == "default:dry_grass" then
				minetest.set_node(pointed_thing.under, {name = "default:grass"})
			elseif minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "default:plant_grass_5"})
			end
		end
	end
})
