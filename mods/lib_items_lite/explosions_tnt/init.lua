local function register_tnt(name, def)
  local primed_name = "explosions_tnt:primed_" .. name
  local name = "explosions_tnt:" .. name
  local explode_hear_dist = 4 * math.sqrt(def.strength)

  local function on_blast_break(pos)
    minetest.after(0, function()
      explosions.explode(pos, {
        strength = def.strength,
      })
      minetest.sound_play(def.sound_explode, {
        pos = pos,
        max_hear_distance = explode_hear_dist
      })
    end)
    return true
  end

  local function primed_on_construct(pos)
    minetest.sound_play(def.sound_ignite, { pos = pos })
    minetest.get_node_timer(pos):start(def.fuse_time)
    minetest.check_for_falling(pos)
  end

  minetest.register_node(name, {
    description = def.description,
    tiles = { def.tile_top, def.tile_bottom, def.tile_side },
    groups = { oddly_breakable_by_hand = 3, blast_resistance = 25 },
    sounds = gal.node_sound_snow_defaults(),

    on_punch = function(pos)
      minetest.swap_node(pos, { name = primed_name })
      primed_on_construct(pos)
    end,

    on_blast_break = on_blast_break,
  })

  minetest.register_node(primed_name, {
    description = "Primed " .. def.description,
    tiles = { def.tile_top, def.tile_bottom, def.tile_side },
    groups = {
      oddly_breakable_by_hand = 3,
      falling_node = 1,
      blast_resistance = 25,
      not_in_creative_inventory = 1,
    },
    sounds = gal.node_sound_snow_defaults(),
    light_source = 10,
    drop = name,

    on_timer = function(pos)
      minetest.remove_node(pos)
      explosions.explode(pos, { strength = def.strength })
      minetest.sound_play(def.sound_explode, {
        pos = pos,
        max_hear_distance = explode_hear_dist
      })
    end,
    on_blast_break = on_blast_break,
    on_construct = primed_on_construct,
  })
end

register_tnt('tnt', {
  description = "TNT",
  strength = 1000,
  fuse_time = 4,
  tile_top = "explosions_tnt_tnt_top.png",
  tile_bottom = "explosions_tnt_tnt_bottom.png",
  tile_side = "explosions_tnt_tnt_side.png",
  sound_ignite = "explosions_tnt_tnt_ignite",
  sound_explode = "explosions_tnt_tnt_explode"
})

register_tnt('c4', {
  description = "C4",
  strength = 2000,
  fuse_time = 6,
  tile_top = "explosions_tnt_c4_top.png",
  tile_bottom = "explosions_tnt_c4_bottom.png",
  tile_side = "explosions_tnt_c4_side.png",
  sound_ignite = "explosions_tnt_tnt_ignite",
  sound_explode = "explosions_tnt_c4_explode"
})

register_tnt('nuke', {
  description = "NUKE",
  strength = 32000,
  fuse_time = 16,
  tile_top = "explosions_tnt_nuke_top.png",
  tile_bottom = "explosions_tnt_nuke_bottom.png",
  tile_side = "explosions_tnt_nuke_side.png",
  sound_ignite = "explosions_tnt_tnt_ignite",
  sound_explode = "explosions_tnt_nuke_explode"
})
