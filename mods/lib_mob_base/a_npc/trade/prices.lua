-- Price table for items bought/sold by NPC traders by Zorman2000
-- This table should be globally accessible so that other mods can set
-- prices as they see fit.

a_npc.trade.prices = {}

-- Define default currency (based on lumps from default)
a_npc.trade.prices.currency = {
  tier1 = {string = "gal:metal_gold_lump", name = "Gold lump"},
  tier2 = {string = "gal:metal_copper_lump", name = "Copper lump"},
  tier3 = {string = "gal:metal_iron_lump", name = "Iron lump"}
}

-- TODO: Set the currency depending on available mods

-- Table that contains the prices
a_npc.trade.prices.table = {}

-- Default definitions for in-game items
-- Tier 3 items: cheap items
a_npc.trade.prices.table["gal:stone_cobble"] =        {tier = a_npc.trade.prices.currency.tier3.string, count = 0.1}
a_npc.trade.prices.table["gal:flower_geranium_blue"] =      {tier = a_npc.trade.prices.currency.tier3.string, count = 0.5}
a_npc.trade.prices.table["gal:fruit_apple"]  =        {tier = a_npc.trade.prices.currency.tier3.string, count = 1}
a_npc.trade.prices.table["gal:tree_default_trunk"]  =         {tier = a_npc.trade.prices.currency.tier3.string, count = 2}
a_npc.trade.prices.table["gal:flower_rose"] =          {tier = a_npc.trade.prices.currency.tier3.string, count = 2}
a_npc.trade.prices.table["gal:stone"]  =        {tier = a_npc.trade.prices.currency.tier3.string, count = 2}
a_npc.trade.prices.table["gal:item_seed_cotton"] =   {tier = a_npc.trade.prices.currency.tier3.string, count = 3}
a_npc.trade.prices.table["gal:item_seed_wheat"] =    {tier = a_npc.trade.prices.currency.tier3.string, count = 3}
--a_npc.trade.prices.table["default:clay_lump"] =     {tier = a_npc.trade.prices.currency.tier3.string, count = 3}
a_npc.trade.prices.table["gal:tree_default_wood"]          = {tier = a_npc.trade.prices.currency.tier3.string, count = 3}
a_npc.trade.prices.table["mobs:meat_raw"]  =        {tier = a_npc.trade.prices.currency.tier3.string, count = 4}
a_npc.trade.prices.table["gal:tree_default_sapling"]       = {tier = a_npc.trade.prices.currency.tier3.string, count = 5}
a_npc.trade.prices.table["mobs:meat"]  =            {tier = a_npc.trade.prices.currency.tier3.string, count = 5}
a_npc.trade.prices.table["mobs:leather"]  =         {tier = a_npc.trade.prices.currency.tier3.string, count = 6}
a_npc.trade.prices.table["lib_handtools:tool_sword_stone"]  =  {tier = a_npc.trade.prices.currency.tier3.string, count = 6}
a_npc.trade.prices.table["lib_handtools:tool_shovel_stone"]  = {tier = a_npc.trade.prices.currency.tier3.string, count = 6}
a_npc.trade.prices.table["lib_handtools:tool_axe_stone"]  =    {tier = a_npc.trade.prices.currency.tier3.string, count = 6}
a_npc.trade.prices.table["lib_handtools:tool_hoe_stone"]  =    {tier = a_npc.trade.prices.currency.tier3.string, count = 6}
a_npc.trade.prices.table["lib_handtools:tool_pick_stone"]  =   {tier = a_npc.trade.prices.currency.tier3.string, count = 7}
a_npc.trade.prices.table["gal:item_cotton"] =        {tier = a_npc.trade.prices.currency.tier3.string, count = 15}
a_npc.trade.prices.table["gal:food_bread"]  =        {tier = a_npc.trade.prices.currency.tier3.string, count = 20}

-- Tier 2 items: medium priced items

-- Tier 1 items: expensive items
a_npc.trade.prices.table["gal:mineral_mese_crystal"]       = {tier = a_npc.trade.prices.currency.tier1.string, count = 45}
a_npc.trade.prices.table["gal:mineral_diamond"]            = {tier = a_npc.trade.prices.currency.tier1.string, count = 90}
a_npc.trade.prices.table["a_npc:marriage_ring"] = {tier = a_npc.trade.prices.currency.tier1.string, count = 100}

-- Functions
function a_npc.trade.prices.update(item_name, price)
	for key,value in pairs(a_npc.trade.prices.table) do
    if key == item_name then
      value = price
      return
    end
  end
  return nil
end

function a_npc.trade.prices.get(item_name)
  for key,value in pairs(a_npc.trade.prices.table) do
    if key == item_name then
      return {item_name = key, price = value}
    end
  end
  return nil
end

function a_npc.trade.prices.add(item_name, price)
	if a_npc.trade.prices.get(item_name) == nil then
		a_npc.trade.prices.table[item_name] = price
	else
		a_npc.trade.prices.update(item_name, price)
	end
end

function a_npc.trade.prices.remove(item_name)
  a_npc.trade.prices.table[item_name] = nil
end

-- Gets all the item for a specified budget
function a_npc.trade.prices.get_items_for_currency_count(tier, count, price_factor)
  local result = {}
  --minetest.log("Currency quantity: "..dump(count))
  for item_name, price in pairs(a_npc.trade.prices.table) do
    -- Check price currency is of the same tier
    if price.tier == tier and price.count <= count then
      result[item_name] = {price = price}

      --minetest.log("Item name: "..dump(item_name)..", Price: "..dump(price))

      local min_buying_item_count = 1
      -- Calculate price NPC is going to buy for
      local buying_price_count = price.count * price_factor
      -- Check if the buying price is not an integer
      if buying_price_count % 1 ~= 0 then
        -- If not, increase the buying item count until we get an integer
        local adjust = 1 / price_factor
        if price.count < 1 then
          adjust = 1 / (price.count * price_factor)
        end
        min_buying_item_count = min_buying_item_count * adjust
      end 
      --minetest.log("Minimum item buy quantity: "..dump(min_buying_item_count))
      --minetest.log("Minimum item price quantity: "..dump(buying_price_count))
      -- Calculate maximum buyable quantity
      local max_buying_item_count = min_buying_item_count
      while ((max_buying_item_count + min_buying_item_count) * buying_price_count <= count) do
        max_buying_item_count = max_buying_item_count + min_buying_item_count
      end
      --minetest.log("Maximum item buy quantity: "..dump(max_buying_item_count))

      result[item_name].min_buyable_item_count = min_buying_item_count
      result[item_name].min_buyable_item_price = buying_price_count
      result[item_name].max_buyable_item_count = max_buying_item_count
    end
  end
  --minetest.log("Final result: "..dump(result))
  return result
end

-- This methods will compare the given item string to the
-- currencies set in the currencies table. Returns true if
-- itemstring is a currency.
function a_npc.trade.prices.is_item_currency(itemstring)
  if a_npc.get_item_name(itemstring) == a_npc.trade.prices.currency.tier3.string
    or a_npc.get_item_name(itemstring) == a_npc.trade.prices.currency.tier2.string
    or a_npc.get_item_name(itemstring) == a_npc.trade.prices.currency.tier1.string then
    return true
  end
  return false
end
