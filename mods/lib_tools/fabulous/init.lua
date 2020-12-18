fabulous = {}

local mod = fabulous
local minetest = minetest
local tostring = tostring
local pairs = pairs

mod.inventory_names = {
    fabulous_hat  = 'fabulous_hat',
    fabulous_face = 'fabulous_face',
    fabulous_body = 'fabulous_body',
    fabulous_arms = 'fabulous_arms',
    fabulous_legs = 'fabulous_legs',
  }
mod.items = {}
mod.players = {}

  
mod.build_formspec_label = function(location_x, location_y, label)
    return 'label[' .. tostring(location_x) .. ',' .. tostring(location_y) .. ';' .. label .. ']'
end


mod.build_formspec_list = function(inventory_type, inventory_list, location_x, location_y, width, height)
    return 'list[' .. inventory_type .. ';' ..
      inventory_list .. ';' ..
      tostring(location_x) .. ',' .. tostring(location_y) .. ';' ..
      tostring(width) .. ',' .. tostring(height) .. ';]'
end


local inv_src = 'current_player'
mod.formspec =  mod.build_formspec_label(1,1,'Hat') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_hat,  1, 2, 1, 1) .. 
                mod.build_formspec_label(2,1,'Face') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_face, 2, 2, 1, 1) .. 
                mod.build_formspec_label(3,1,'Body') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_body, 3, 2, 1, 1) .. 
                mod.build_formspec_label(4,1,'Arms') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_arms, 4, 2, 1, 1) .. 
                mod.build_formspec_label(5,1,'Legs') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_legs, 5, 2, 1, 1)


mod.check_or_create_inv = function(player)
  local inv = player:get_inventory()
  
  for i, slot in pairs(mod.inventory_names) do
    if inv:get_size(slot) < 1 then
      inv:set_size(slot, 1)
    end
  end
end


mod.slot_type_check = function(stack, slot)
  local item_name = stack:get_name()
  local group_num = minetest.get_item_group(item_name, slot)
  
  if group_num > 0 then
    return 1
  else
    return 0
  end
end

mod.node_name_to_entity_name = function(node)
  return node .. '_entity'
end


mod.attach_to_player = function(player, bone, entity_name, offset, rotation)
  local pos = player:getpos()
  local entity = minetest.add_entity(pos, entity_name)
  
  entity:set_attach(player, bone, offset, rotation)
  
  return entity
end


mod.detach_from_player = function(entity)
  if entity then
    if entity:get_attach() then
      entity:set_detach()
    end
    
    entity:remove()
  end
end


mod.slot_to_bone = function(slot)
  if slot == mod.inventory_names.fabulous_hat then return 'Head' end
  if slot == mod.inventory_names.fabulous_face then return 'Head' end
  if slot == mod.inventory_names.fabulous_body then return 'Body' end
  if slot == mod.inventory_names.fabulous_arms then return 'Arm' end
  if slot == mod.inventory_names.fabulous_legs then return 'Leg' end
end


mod.wear_item = function(player, node_name)
  local player_name = player:get_player_name()
  
  if not mod.players[player_name] then mod.players[player_name] = {} end
    
  local attached = mod.players[player_name]
  local pos = player:getpos()
  
  local item = mod.items[node_name]
  
  local entity_name = mod.node_name_to_entity_name(node_name)
  local bone = mod.slot_to_bone(item.slot)
    
  if bone == 'Arm' or bone == 'Leg' then
    local lbone = bone .. '_Left'
    local rbone = bone .. '_Right'
    
    local loffset = item.offset
    local roffset = item.offset
    
    local lrotation = {x = item.rotation.x, y = item.rotation.y, z= item.rotation.z}
    local rrotation = item.rotation
    
    local lentity = mod.attach_to_player(player, lbone, entity_name, loffset, lrotation)
    attached[item.slot .. lbone] = lentity
    
    local rentity = mod.attach_to_player(player, rbone, entity_name, roffset, rrotation)
    attached[item.slot .. rbone] = rentity
  else
    local entity = mod.attach_to_player(player, bone, entity_name, item.offset, item.rotation)
    attached[item.slot .. bone] = entity
  end
end


mod.remove_item = function(player, slot)
  local player_name = player:get_player_name()
  
  if not mod.players[player_name] then mod.players[player_name] = {} end
    
  local attached = mod.players[player_name]
  local bone = mod.slot_to_bone(slot)
  
  if bone then
    if bone == 'Arm' or bone == 'Leg' then
      local lbone = bone .. '_Left'
      local rbone = bone .. '_Right'
      
      local lentity = attached[slot .. lbone]
      if lentity then
        mod.detach_from_player(lentity)
      end
      
      local rentity = attached[slot .. rbone]
      if rentity then
        mod.detach_from_player(rentity)
      end
    else
      local entity = attached[slot .. bone]
      if entity then
        mod.detach_from_player(entity)
      end
    end
  
  end
end


mod.allow_player_inventory_action = function(player, action, inventory, inventory_info)
  local list = inventory_info.to_list or 
    inventory_info.from_list or
    inventory_info.listname
  
  if mod.inventory_names[list] then
    if action == 'move' then
      local stack = inventory:get_stack(inventory_info.from_list, inventory_info.from_index)
      
      return mod.slot_type_check(stack, list)
    end
    
    if action == 'put' then
      local stack = inventory_info.stack
      return mod.slot_type_check(stack, list)
    end
    
    if action == 'take' then
      return 1
    end
  end
end


mod.on_player_inventory_action = function(player, action, inventory, inventory_info)
  if mod.inventory_names[inventory_info.listname] or
        mod.inventory_names[inventory_info.to_list] or
        mod.inventory_names[inventory_info.from_list] then
    if action == 'move' then
      local from_list = inventory_info.from_list
      local to_list = inventory_info.to_list
      local to_item = inventory:get_stack(inventory_info.to_list, inventory_info.to_index):get_name()
      
      if mod.inventory_names[from_list] then
        mod.remove_item(player, from_list)
      end
      if mod.inventory_names[to_list] then
        mod.remove_item(player, to_list)
        mod.wear_item(player, to_item)
      end
      
      return 1
    end
    
    if action == 'put' then
      return 1
    end
    
    if action == 'take' then
      mod.remove_item(player, inventory_info.listname)
      return 1
    end
  end
end


mod.wear_all = function(player)
  local inv = player:get_inventory()
  
  for i, slot in pairs(mod.inventory_names) do
    if not inv:is_empty(slot) then
        local item = inv:get_stack(slot, 1):get_name()
        mod.wear_item(player, item)
    end
  end
end


mod.remove_all = function(player)
  local player_name = player:get_player_name()
  local attached = mod.players[player_name]
  
  if attached then
    for i, entity in pairs(attached) do
      mod.detach_from_player(entity)
    end
  end
end


mod.remove_unattached_items = function(entity)
  if not entity:get_attach() then
    entity:remove()
  end
end


mod.item_on_activate = function(self, staticdata, dtime_s)
  minetest.after(0.01, mod.remove_unattached_items, self.object)
end


mod.register_fabulousness = function(name, slot, node_def, scale, offset, rotation)
  minetest.register_node(name, node_def)
  
  local entity_def = {
		initial_properties = {
      physical = true,
      collide_with_objects = false,
      visual = 'wielditem',
      visual_size = {x = scale, y = scale},
      textures = {name},
    },
    on_activate = mod.item_on_activate,
  }

  minetest.register_entity(mod.node_name_to_entity_name(name), entity_def)
  mod.items[name] = {slot = slot, offset = offset, rotation = rotation}
end


-- init bits

local modpath = minetest.get_modpath('fabulous')
dofile(modpath .. '/items.lua')

gal.sfinv.register_page("fabulous:sfinv_gui", {
  title = 'Fabulous!',
  get = function(self, player, context)
    local fs = 'size[5,2]' .. mod.formspec
    return gal.sfinv.make_formspec(player, context, fs, true)
  end,
})

minetest.register_allow_player_inventory_action(mod.allow_player_inventory_action)

minetest.register_on_player_inventory_action(mod.on_player_inventory_action)

minetest.register_on_joinplayer(function(player)
  mod.check_or_create_inv(player)
  mod.wear_all(player)
end)

minetest.register_on_leaveplayer(function(player, timed_out)
  mod.remove_all(player)
end)

minetest.register_on_shutdown(function()
  for i, attached in pairs(mod.players) do
    if attached then
      for j, entity in pairs(attached) do
        mod.detach_from_player(entity)
      end
    end
  end
end)

