places = {}
places.pos = {}
places.places_file = minetest.get_worldpath() .. "/places"
places.show_places = false

function places.register_place(name, pos)
	places.pos[name] = pos
end

function places.load_places()
	local input = io.open(places.places_file, "r")
	if input then
		local str = input:read()
		if str then
			print("[info] places string : " .. str)
			if minetest.deserialize(str) then
				places.pos = minetest.deserialize(str)
			end
		else 
			print("[warning] places file is empty")
		end
		io.close(input)
	else
		print("[ERROR] couldnt find places file")
	end
end

function places.save_places()
	if places.pos then
		local output = io.open(places.places_file, "w")
		local str = minetest.serialize(places.pos)
		output:write(str)
		io.close(output)
	end
end

minetest.register_chatcommand("add_place", {
	params = "<name>",
	description = "Add a place",
	privs = {server=true},
	func = function(name, text)
		if places.pos[text] then 
			return true, "There already is a place named " .. text
		end	
		local player = minetest.get_player_by_name(name)
		if not(player) then
			return true, "Error couldnt find player " .. name
		end
		places.pos[text] = player:getpos()
		places.save_places()
		return true, "Added a place named " .. text
	end,
})

minetest.register_chatcommand("goto", {
	params = "<name>",
	description = "Goto a place",
	privs = {},
	func = function(name, text)
		if not(places.pos[text]) then 
			return true, "There is no place named " .. text
		end	
		local player = minetest.get_player_by_name(name)
		if not(player) then
			return true, "Error couldnt find player " .. name
		end
		player:setpos(places.pos[text])

		return true, "Teleported to " .. text
	end,
})

minetest.register_chatcommand("list_places", {
	params = "",
	description = "Shows a list of all places",
	privs = {server=true},
	func = function(name, text)
		if not(places.pos) then 
			return false, "Error"
		end	
		
		local my_places = {}
		for name, pos in pairs(places.pos) do
			table.insert(my_places, name)
		end
		
		return true, table.concat(my_places, ", ")
	end,
})

minetest.register_on_joinplayer(function(player)
	if not places.show_places then
		return
	end
	if places.pos then
		for k, v in pairs(places.pos) do 
			player:hud_add({
				hud_elem_type = "waypoint",
				name = k,
				text = "",
				number = 255,
				world_pos = v
			})
		end
	end
end)

places.load_places()
