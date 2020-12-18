----- EXAMPLE EFFECT TYPES -----

--[[ API
effect_id: unique identifier string
description: Human-readable short description of the effect. Will be exposed to the HUD, if `hidden` == `false`.
icon: This is optional. It can be the file name of a texture. Should have a size of 16px16px. Will be exposed to the HUD, if `hidden` == `false`.
groups: A table of groups to which this effect type belongs.
apply: Function to be called when effect is applied. See `playereffects.register_effect_type`.
cancel: Function to be called when effect is cancelled. See `playereffects.register_effect_type`.
hidden: If false, description and icon are displayed on the HUD when this effect is active.
cancel_on_death: If this is true, the effect will be cancelled automatically when the player dies.
repeat_interval: is an optional number. When specified, the effects of this type becomes a repeating effect. Repeating effects call `apply` an arbitrary number of times; non-repeating effects just call it once when the effect is created. The number specifies the interval in seconds between each call. Iff this parameter is `nil`, the effect type is a non-repeating effect.
]]

-- Null effect. 
-- The apply function always returns false, which means applying the effect will never succeed.

playereffects.register_effect_type("null", 
	"No effect", 
	nil, 
	{},
	function()
		return false
	end
)

-- Makes the player screen black for 5 seconds (very experimental!)

playereffects.register_effect_type("blind", 
	"Blind", 
	nil, 
	{},
	function(player)
		local hudid = player:hud_add({
			hud_elem_type = "image",
			position = { x=0.5, y=0.5 },
			scale = { x=-100, y=-100 },
			text = "playereffects_example_black.png",
		})
		if(hudid ~= nil) then
			return { hudid = hudid }
		else
			minetest.log("error", "[playereffects] [examples] The effect \"Blind\" could not be applied. The call to hud_add(...) failed.")
			return false
		end
	end,
	function(effect, player)
		player:hud_remove(effect.metadata.hudid)
	end
)

-- Makes the user faster
playereffects.register_effect_type("high_speed", 
	"High speed", 
	"magic_fast.png", 
	{"speed"}, 
	function(player)
		player:set_physics_override(4,nil,nil)
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
	end
)

-- Makes the user faster (hidden effect)
playereffects.register_effect_type("high_speed_hidden", 
	"High speed", 
	nil, 
	{"speed"}, 
	function(player)
		player:set_physics_override(4,nil,nil)
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
	end,
	true
)

-- Slows the user down
playereffects.register_effect_type("low_speed", 
	"Low speed", 
	nil, 
	{"speed"}, 
	function(player)
		player:set_physics_override(0.25,nil,nil)
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
	end
)

-- Increases the jump height
playereffects.register_effect_type("highjump", 
	"Greater jump height", 
	"magic_jump.png", 
	{"jump"},
	function(player)
		player:set_physics_override(nil,2,nil)
	end,
	function(effect, player)
		player:set_physics_override(nil,1,nil)
	end
)

-- Adds the "fly" privilege. Keep the privilege even if the player dies
playereffects.register_effect_type("fly", 
	"Fly mode available", 
	"magic_fly.png", 
	{"fly"},
	function(player)
		local playername = player:get_player_name()
		local privs = minetest.get_player_privs(playername)
		privs.fly = true
		minetest.set_player_privs(playername, privs)
	end,
	function(effect, player)
		local privs = minetest.get_player_privs(effect.playername)
		privs.fly = nil
		minetest.set_player_privs(effect.playername, privs)
	end,
	false, -- not hidden
	false  -- do NOT cancel the effect on death
)

-- Single shot healing: Adds 8 HP
playereffects.register_effect_type("heal", 
	"Healing", 
	"heart.png", 
	{"health"},
	function(player)
		player:set_hp(player:get_hp()+8)
	end
)

-- Repeating effect type: Adds 1 HP per second
playereffects.register_effect_type("regen", 
	"Regeneration", 
	"heart.png", 
	{"health"},
	function(player)
		player:set_hp(player:get_hp()+1)
	end,
	nil, 
	nil, 
	nil, 
	1
)

-- Repeating effect type: Adds 1 HP per 3 seconds
playereffects.register_effect_type("slowregen", 
	"Slow Regeneration", 
	"heart.png", 
	{"health"},
	function(player)
		player:set_hp(player:get_hp()+1)
	end,
	nil, 
	nil, 
	nil, 
	15
)


-- Dummy effect for the stress test
playereffects.register_effect_type("stress", 
	"Stress Test Effect", 
	nil, 
	{},
	function(player)
	end,
	function(effect, player)
	end
)



