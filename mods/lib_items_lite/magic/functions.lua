-- player_exists()from CommonLib
--	by Rubenwardy

function magic:player_exists( name )
	local privs = minetest.get_player_privs( name );
	if( not( privs )) then
		return false;
	else
		return true;
	end
end

function magic:detain(playername)
	local perp = minetest.get_player_by_name(playername)
	if perp then
		perp:setpos({x=-18, y=3, z=-23})
	else
		return false;
	end
	return true;
end

function magic:make_head(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos({x=-23, y=3, z=-23})
	return true;
end

function magic:arrest(playername)
	local perp = minetest.get_player_by_name(playername)
	--minetest.set_player_privs(perp, {shout = true})
	if perp then
		perp:setpos({x=-34, y=-2, z=-68})
	else
		return false;
	end
	return true;
end

function magic:make_arrest(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos({x=-34, y=-2, z=-68})
	return true;
end

function magic:toad(playername)
	local perp = minetest.get_player_by_name(playername)
	minetest.set_player_privs(playername, {shout = false})
	perp:set_properties({
			visual = "mesh",
			textures = {"player_MrToad.png"},
			visual_size = {x=0.77, y=0.23},
		})
	return true;
end

function magic:jail(playername)
	local perp = minetest.get_player_by_name(playername)
	minetest.set_player_privs(perp, {shout = true})
	if perp then
		perp:setpos({x=0, y=-23000, z=0})
	else
		return false;
	end
	return true;
end

function magic:make_jailor(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos({x=19, y=-23000, z=19})
	return true;
end
