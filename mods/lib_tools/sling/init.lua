local sling_sneak = false

throwing.register_bow("sling:sling", {
  description = "Sling",
  texture = "sling_sling_inv.png",
  wield_image = "sling_sling_wield.png",
  cooldown = 1,
  delay = 0.4,
  sound = "sling_throw",
  allow_shot = function(player, itemstack, index)
    sling_sneak = player:get_player_control().sneak
    local ok = itemstack:get_name() ~= ""
    if sling_sneak == true then
      return ok
    else
      return ok, ok and ItemStack(nil)
    end
  end,
  spawn_arrow_entity = function(pos, arrow, player)
    local obj = minetest.add_entity(pos, "sling:sling_entity", tostring(sling_sneak))
    obj:set_properties{
      textures = {arrow},
    }
    return obj
  end
})

minetest.register_entity("sling:sling_entity", throwing.make_arrow_def{
  visual = "wielditem",
  visual_size = {x=0.2, y=0.2},
  collisionbox = {-0.2,-0.2,-0.2, 0.2,0.2,0.2},
  target = throwing.target_node,
  on_hit_sound = "",
  on_throw_sound = "",
  on_activate = function(self, staticdata)
          self.sneak = staticdata == "true"
  end,
  on_hit = function(self, pos, last_pos, node, object, hitter, data)
    if self.sneak then
      data.itemstack:set_count(1)
    end
    minetest.spawn_item(
      {
        x = math.floor(last_pos.x+0.5),
        y = math.floor(last_pos.y+0.5),
        z = math.floor(last_pos.z+0.5)
      },
      data.itemstack
    )
  end,
  on_throw = function(self, pos, thrower, itemstack, index, data)
      data.itemstack = itemstack
  end
})

if minetest.get_modpath("mcl_core") ~= nil then
  minetest.register_craft({
    output = "sling:sling",
    recipe = {
      {"mcl_mobitems:string", "", "mcl_mobitems:string"},
      {"mcl_mobitems:string", "", "mcl_mobitems:string"},
      {"mcl_mobitems:string", "mcl_mobitems:leather", "mcl_mobitems:string"}
    }
  })
elseif mobs ~= nil and mobs.mod == "redo" then
  minetest.register_craft({
  	output = "sling:sling",
  	recipe = {
  		{"farming:cotton", "", "farming:cotton"},
  		{"farming:cotton", "", "farming:cotton"},
  		{"farming:cotton", "mobs:leather", "farming:cotton"}
  	}
  })
else
  minetest.register_craft({
    output = "sling:sling",
    recipe = {
      {"farming:cotton", "", "farming:cotton"},
      {"farming:cotton", "", "farming:cotton"},
      {"farming:cotton", "group:wool", "farming:cotton"}
    }
  })
end
