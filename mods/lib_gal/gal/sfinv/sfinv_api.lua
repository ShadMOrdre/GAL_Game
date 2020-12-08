

gal.sfinv.pages = {}
gal.sfinv.pages_unordered = {}
gal.sfinv.contexts = {}
gal.sfinv.enabled = true


function gal.sfinv.register_page(name, def)
	assert(name, "Invalid sfinv page. Requires a name")
	assert(def, "Invalid sfinv page. Requires a def[inition] table")
	assert(def.get, "Invalid sfinv page. Def requires a get function.")
	assert(not gal.sfinv.pages[name], "Attempt to register already registered sfinv page " .. dump(name))

	gal.sfinv.pages[name] = def
	def.name = name
	table.insert(gal.sfinv.pages_unordered, def)
end

function gal.sfinv.override_page(name, def)
	assert(name, "Invalid sfinv page override. Requires a name")
	assert(def, "Invalid sfinv page override. Requires a def[inition] table")
	local page = gal.sfinv.pages[name]
	assert(page, "Attempt to override sfinv page " .. dump(name) .. " which does not exist.")
	for key, value in pairs(def) do
		page[key] = value
	end
end

function gal.sfinv.get_nav_fs(player, context, nav, current_idx)
	-- Only show tabs if there is more than one page
	if #nav > 1 then
		return "tabheader[0,0;tabs;" .. table.concat(nav, ",") .. ";" .. current_idx .. ";true;false]"
	else
		return ""
	end
end

local theme_main = "bgcolor[#080808BB;true]" .. gal.gui.gui_bg ..
		gal.gui.gui_bg_img

local theme_inv = gal.gui.gui_slots .. [[
		list[current_player;main;0,4.7;8,1;]
		list[current_player;main;0,5.85;8,3;8]
	]]

function gal.sfinv.make_formspec(player, context, content, show_inv, size)
	local tmp = {
		size or "size[8,8.6]",
		theme_main,
		gal.sfinv.get_nav_fs(player, context, context.nav_titles, context.nav_idx),
		content
	}
	if show_inv then
		tmp[#tmp + 1] = theme_inv
	end
	return table.concat(tmp, "")
end

function gal.sfinv.get_homepage_name(player)
	return "sfinv:crafting"
end

function gal.sfinv.get_formspec(player, context)
	-- Generate navigation tabs
	local nav = {}
	local nav_ids = {}
	local current_idx = 1
	for i, pdef in pairs(gal.sfinv.pages_unordered) do
		if not pdef.is_in_nav or pdef:is_in_nav(player, context) then
			nav[#nav + 1] = pdef.title
			nav_ids[#nav_ids + 1] = pdef.name
			if pdef.name == context.page then
				current_idx = #nav_ids
			end
		end
	end
	context.nav = nav_ids
	context.nav_titles = nav
	context.nav_idx = current_idx

	-- Generate formspec
	local page = gal.sfinv.pages[context.page] or gal.sfinv.pages["404"]
	if page then
		return page:get(player, context)
	else
		local old_page = context.page
		context.page = gal.sfinv.get_homepage_name(player)
		assert(gal.sfinv.pages[context.page], "[sfinv] Invalid homepage")
		minetest.log("warning", "[sfinv] Couldn't find " .. dump(old_page) .. " so using switching to homepage")
		return gal.sfinv.get_formspec(player, context)
	end
end

function gal.sfinv.get_or_create_context(player)
	local name = player:get_player_name()
	local context = gal.sfinv.contexts[name]
	if not context then
		context = {
			page = gal.sfinv.get_homepage_name(player)
		}
		gal.sfinv.contexts[name] = context
	end
	return context
end

function gal.sfinv.set_context(player, context)
	gal.sfinv.contexts[player:get_player_name()] = context
end

function gal.sfinv.set_player_inventory_formspec(player, context)
	local fs = gal.sfinv.get_formspec(player,
			context or gal.sfinv.get_or_create_context(player))
	player:set_inventory_formspec(fs)
end

function gal.sfinv.set_page(player, pagename)
	local context = gal.sfinv.get_or_create_context(player)
	local oldpage = gal.sfinv.pages[context.page]
	if oldpage and oldpage.on_leave then
		oldpage:on_leave(player, context)
	end
	context.page = pagename
	local page = gal.sfinv.pages[pagename]
	if page.on_enter then
		page:on_enter(player, context)
	end
	gal.sfinv.set_player_inventory_formspec(player, context)
end

minetest.register_on_joinplayer(function(player)
	if gal.sfinv.enabled then
		minetest.after(0.5, function()
			gal.sfinv.set_player_inventory_formspec(player)
		end)
	end
end)

minetest.register_on_leaveplayer(function(player)
	gal.sfinv.contexts[player:get_player_name()] = nil
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" or not gal.sfinv.enabled then
		return false
	end

	-- Get Context
	local name = player:get_player_name()
	local context = gal.sfinv.contexts[name]
	if not context then
		gal.sfinv.set_player_inventory_formspec(player)
		return false
	end

	-- Was a tab selected?
	if fields.tabs and context.nav then
		local tid = tonumber(fields.tabs)
		if tid and tid > 0 then
			local id = context.nav[tid]
			local page = gal.sfinv.pages[id]
			if id and page then
				gal.sfinv.set_page(player, id)
			end
		end
	else
		-- Pass event to page
		local page = gal.sfinv.pages[context.page]
		if page and page.on_player_receive_fields then
			return page:on_player_receive_fields(player, context, fields)
		end
	end
end)
