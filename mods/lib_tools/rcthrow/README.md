# RCTHROW

## function rcbows.THROW_bow(name, def)

Example:

```
rcthrow.register_throw("throw_weapons:steel_hatchet", {
	description = S("Steel Hatchet"),
	inventory_image = "throw_weapons_hatchet_inv.png",
	wield_image = "throw_weapons_hatchet.png", --optional
	throw_image = "throw_weapons_hatchet.png", --optional
	strength = 10,
	throw_damage = 10,
	throw_uses = 30,
	throw_sounds = {
		max_hear_distance = 10,
		gain = 0.6,
	},
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:wood", "default:steel_ingot"},
		{"group:wood", "", ""},
	},
	primary_use = {
		tool_capabilities = {
			full_punch_interval = 1.0,
			max_drop_level=1,
			groupcaps={
				choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=15, maxlevel=2},
			},
		damage_groups = {fleshy=5},
			},
		sound = {breaks = "default_tool_breaks"},
		groups = {axe = 1}
	},
})
```

## Strength

- The strength definition is maximum value.
- The real throwing strength will depend on the player health.

## primary_use Definition

You can use the tool as a regular tool plus throw it.

1. If you do not define a "primary_use", then the throwing item is launched by using it.

1. If you define a "primary_use":

- It is the regular definition of the "minetest.register_tool": tool_capabilities, damage_groups, aound and groups.

- When you use the item (left-click), this "primary_use" definition applies.

- When you right-click, the item is thrown.

## Audio

1. If you define ``sounds={}``, you get the default sounds.

For no sound at all do not declare 'sounds'.

Also you can set the sound parameters 'max_hear_distance' and 'gain'.

In example:
```
sounds = {
	max_hear_distance = 10,
	gain = 0.4,
}
```

2. You also can define your own soundfiles.

You can set "soundfile_throw" and/or "soundfile_hit".

In example:
```
sounds = {
	soundfile_throw = "my_throw_sound"
	soundfile_hit = "my_hit_sound"
	max_hear_distance = 5,
	--set the gain by default (0.5)
}
```
## Drop

By default it is dropped the self throwing item when reachs a solid node.

If you want not any drop at all, add:
```
drop = "",
```
