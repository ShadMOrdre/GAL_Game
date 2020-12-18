--function to register tamed dragon attacks

function mobs_races.register_fire(fname, texture, dmg, replace_node, explode, ice, variance, size)
minetest.register_entity(fname, {
	textures = {texture},
	velocity = 0.1,
	damage = dmg,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= fname and obj:get_luaentity().name ~= "mobs_races:dragon_red" and obj:get_luaentity().name ~= "mobs_races:dragon_blue" and obj:get_luaentity().name ~= "mobs_races:dragon_black" and obj:get_luaentity().name ~= "mobs_races:dragon_green" and obj:get_luaentity().name ~= "mobs_races:dragon_great_tame" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=3},
						}, nil)
					self.object:remove()
					end
				end
			end
			for dx=0,1 do
						for dy=0,1 do
							for dz=0,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= fname and n ~="gal:dirt_with_grass" and n ~="gal:dirt_with_grass_dry" and n ~="gal:stone"  then	
									if minetest.registered_nodes[n].groups.flammable --[[or math.random(1, 100) <= 1]] then
										minetest.env:set_node(t, {name=replace_node})
									self.object:remove()
									return
									end
									if ice and n == "gal:liquid_water_source" then
									minetest.env:set_node(t, {name="gal:ice"})
									self.object:remove()
									end
								end
							end
						end
					end
		local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			6, --amount
			0.3, --time
			{x=apos.x-variance, y=apos.y-variance, z=apos.z-variance}, --minpos
			{x=apos.x+variance, y=apos.y+variance, z=apos.z+variance}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=variance,y=-0.5-variance,z=variance}, --minacc
			{x=0.5+variance,y=0.5+variance,z=0.5+variance}, --maxacc
			0.1, --minexptime
			0.3, --maxexptime
			size, --minsize
			size+2, --maxsize
			false, --collisiondetection
			texture --texture
		)
		
	end,
})
end

mobs_races.register_fire("mobs_races:fire_plyr", "dmobs_fire.png", 2, "fire:basic_flame", true, false, 0.3, 1)
mobs_races.register_fire("mobs_races:ice_plyr", "dmobs_ice.png", 2, "default:ice", false, true, 0.5, 10)
mobs_races.register_fire("mobs_races:poison_plyr", "dmobs_poison.png", 2, "air", false, false, 0.3, 1)
mobs_races.register_fire("mobs_races:lightning_plyr", "dmobs_lightning.png", 2, "air", true, false, 0, 0.5)
