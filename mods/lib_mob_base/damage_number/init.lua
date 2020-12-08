for _,entity in pairs(minetest.registered_entities) do
	if entity.on_punch ~= nil then
		local punch_result = entity.on_punch
		entity.on_punch = function(self, hitter,time_from_last_punch, tool_capabilities, direction, pos)
			if self.object:get_armor_groups().fleshy ~= nil then
		
				if self.health ~= nil  then
		
					local entpos ={x=self.object:getpos().x, y=0.25+self.object:getpos().y, z=self.object:getpos().z} 
					local damage_output

					if tool_capabilities.full_punch_interval > time_from_last_punch then
						damage_output = math.floor((tool_capabilities.damage_groups.fleshy * (time_from_last_punch / tool_capabilities.full_punch_interval)) * (0.01*self.object:get_armor_groups().fleshy))
					else
						damage_output = math.floor(tool_capabilities.damage_groups.fleshy * (0.01*self.object:get_armor_groups().fleshy))
					end
	
					local damage_output_tenthousands = math.floor(damage_output*0.0001)
					local damage_output_thousands = math.floor(damage_output*0.001-(damage_output_tenthousands*10))
					local damage_output_hundreds = math.floor(damage_output*0.01-(damage_output_thousands*10)-(damage_output_tenthousands*100))
					local damage_output_tens = math.floor(damage_output*0.1-(damage_output_hundreds*10)-(damage_output_thousands*100)-(damage_output_tenthousands*1000))
					local damage_output_ones = math.floor(damage_output-(damage_output_hundreds*100)-(damage_output_tens*10)-(damage_output_thousands*1000)-(damage_output_tenthousands*10000))
	
					if damage_output < 10 then
						damage_output_tens = "empty"
						damage_output_hundreds = "empty"
						damage_output_thousands = "empty"
						damage_output_tenthousands = "empty"
					end
	
					if damage_output < 100 then
						damage_output_hundreds = "empty"
						damage_output_thousands = "empty"
						damage_output_tenthousands = "empty"
					end
	
					if damage_output < 1000 then
						damage_output_thousands = "empty"
						damage_output_tenthousands = "empty"
					end
	
					if damage_output < 10000 then
						damage_output_tenthousands = "empty"
					end
	
					minetest.add_particle({
						pos = entpos,
						velocity = {x=0, y=8, z=0},
						acceleration = {x=math.random(-8,8), y=math.random(-16,-8), z=math.random(-8,8)},
						expirationtime = 1.5,
						size = 18,
						collisiondetection = false,
						vertical = false,
						texture = "dmg_num_"..damage_output_tenthousands.."____.png^dmg_num_"..damage_output_thousands.."___.png^dmg_num_"..damage_output_hundreds.."__.png^dmg_num_"..damage_output_tens.."_.png^dmg_num_"..damage_output_ones..".png",
						glow = 30,
					})
				end
			end
	
			return punch_result(self, hitter, time_from_last_punch, tool_capabilities, direction)
		end 
	end
end

--[[
minetest.register_on_player_hpchange(function(player, hp_change)
	if hp_change <= 0 then
	
		local damage_output = (hp_change * -1)
		
		local damage_output_tenthousands = math.floor(damage_output*0.0001)
		local damage_output_thousands = math.floor(damage_output*0.001-(damage_output_tenthousands*10))
		local damage_output_hundreds = math.floor(damage_output*0.01-(damage_output_thousands*10)-(damage_output_tenthousands*100))
		local damage_output_tens = math.floor(damage_output*0.1-(damage_output_hundreds*10)-(damage_output_thousands*100)-(damage_output_tenthousands*1000))
		local damage_output_ones = math.floor(damage_output-(damage_output_hundreds*100)-(damage_output_tens*10)-(damage_output_thousands*1000)-(damage_output_tenthousands*10000))
		
		if damage_output < 10 then
			damage_output_tens = "empty"
			damage_output_hundreds = "empty"
			damage_output_thousands = "empty"
			damage_output_tenthousands = "empty"
		end
		
		if damage_output < 100 then
			damage_output_hundreds = "empty"
			damage_output_thousands = "empty"
			damage_output_tenthousands = "empty"
		end
		
		if damage_output < 1000 then
			damage_output_thousands = "empty"
			damage_output_tenthousands = "empty"
		end
		
		if damage_output < 10000 then
			damage_output_tenthousands = "empty"
		end
		
		local playerpos ={x=player:getpos().x, y=0.25+player:getpos().y, z=player:getpos().z} 
		
		minetest.add_particle({
			pos = playerpos,
			velocity = {x=0, y=8, z=0},
			acceleration = {x=math.random(-8,8), y=math.random(-16,-8), z=math.random(-8,8)},
			expirationtime = 1.5,
			size = 18,
			collisiondetection = false,
			vertical = false,
			texture = "dmg_num_"..damage_output_tenthousands.."____.png^dmg_num_"..damage_output_thousands.."___.png^dmg_num_"..damage_output_hundreds.."__.png^dmg_num_"..damage_output_tens.."_.png^dmg_num_"..damage_output_ones..".png",
			glow = 30,
		})
	end
end)
--]]
