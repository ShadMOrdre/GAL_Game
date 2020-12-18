local mod = fabulous
local prefix = 'fabulous:'
local glasses_scale = 0.4
local glasses00 = {}
glasses00.name = prefix .. 'glasses00'
glasses00.slot = mod.inventory_names.fabulous_face
glasses00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Brown Glasses',
                        tiles = {
                          'default_wood.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
                            {-0.5, -0.125, -0.375, -0.4375, -0.0625, -0.0625}, -- NodeBox2
                            {-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.375}, -- NodeBox3
                            {-0.5, -0.0625, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
                            {-0.5, -0.0625, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
                            {-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
                            {-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
                            {-0.4375, 0.0625, 0.4375, 0.0625, 0.125, 0.5}, -- NodeBox8
                            {-0.4375, 0.0625, -0.5, 0.0625, 0.125, -0.4375}, -- NodeBox9
                          }
                        }
                      }
glasses00.scale = glasses_scale
glasses00.offset = {x = 0, y = 1.5, z = 0}
glasses00.rotation = {x = 0, y = -90, z = 0}
mod.register_fabulousness(glasses00.name, glasses00.slot, glasses00.node_def, glasses00.scale, glasses00.offset, glasses00.rotation)


local glasses01 = {}
glasses01.name = prefix .. 'glasses01'
glasses01.slot = mod.inventory_names.fabulous_face
glasses01.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Gray Glasses',
                        tiles = {
                          'default_stone.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
                            {-0.5, -0.125, -0.3125, -0.4375, -0.0625, -0.0625}, -- NodeBox2
                            {-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.3125}, -- NodeBox3
                            {-0.5, 0, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
                            {-0.5, 0, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
                            {-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
                            {-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
                            {-0.4375, 0.0625, 0.4375, 0.0625, 0.1875, 0.5}, -- NodeBox8
                            {-0.4375, 0.0625, -0.5, 0.0625, 0.1875, -0.4375}, -- NodeBox9
                            {-0.4375, -0.0625, -0.375, -0.375, 0.1875, -0.0625}, -- NodeBox10
                            {-0.4375, -0.0625, 0.0625, -0.375, 0.1875, 0.375}, -- NodeBox11
                          }
                        }
                      }
glasses01.scale = glasses_scale
glasses01.offset = {x = 0, y = 1.5, z = 0}
glasses01.rotation = {x = 0, y = -90, z = 0}
mod.register_fabulousness(glasses01.name, glasses01.slot, glasses01.node_def, glasses01.scale, glasses01.offset, glasses01.rotation)

local glasses02 = {}
glasses02.name = prefix .. 'glasses02'
glasses02.slot = mod.inventory_names.fabulous_face
glasses02.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Fabulous Glasses',
                        tiles = {
                          'default_diamond_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
                            {-0.5, -0.125, -0.3125, -0.4375, -0.0625, -0.0625}, -- NodeBox2
                            {-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.3125}, -- NodeBox3
                            {-0.5, 0, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
                            {-0.5, 0, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
                            {-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
                            {-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
                            {-0.4375, 0.0625, 0.4375, 0.0625, 0.1875, 0.5}, -- NodeBox8
                            {-0.4375, 0.0625, -0.5, 0.0625, 0.1875, -0.4375}, -- NodeBox9
                            {-0.4375, -0.0625, -0.375, -0.375, 0.1875, -0.0625}, -- NodeBox10
                            {-0.4375, -0.0625, 0.0625, -0.375, 0.1875, 0.375}, -- NodeBox11
                          }
                        }
                      }
glasses02.scale = glasses_scale
glasses02.offset = {x = 0, y = 1.5, z = 0}
glasses02.rotation = {x = 0, y = -90, z = 0}
mod.register_fabulousness(glasses02.name, glasses02.slot, glasses02.node_def, glasses02.scale, glasses02.offset, glasses02.rotation)


local stash00 = {}
stash00.name = prefix .. 'stash00'
stash00.slot = mod.inventory_names.fabulous_face
stash00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Fabulous Mustache',
                        tiles = {
                          'default_obsidian_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.0625, -0.1875, -0.5, 0.0625, -0.125, -0.4375}, -- NodeBox13
                            {-0.1875, -0.25, -0.5, -0.0625, -0.125, -0.4375}, -- NodeBox14
                            {0.0625, -0.25, -0.5, 0.1875, -0.125, -0.4375}, -- NodeBox15
                            {0.1875, -0.3125, -0.5, 0.3125, -0.1875, -0.4375}, -- NodeBox16
                            {-0.3125, -0.3125, -0.5, -0.1875, -0.1875, -0.4375}, -- NodeBox17
                            {-0.375, -0.25, -0.5, -0.3125, -0.125, -0.4375}, -- NodeBox18
                            {0.3125, -0.25, -0.5, 0.375, -0.125, -0.4375}, -- NodeBox19
                          }
                        }
                      }
stash00.scale = 0.5
stash00.offset = {x = 0, y = 2, z = 0.95}
stash00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(stash00.name, stash00.slot, stash00.node_def, stash00.scale, stash00.offset, stash00.rotation)


local monocle00 = {}
monocle00.name = prefix .. 'monocle00'
monocle00.slot = mod.inventory_names.fabulous_face
monocle00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Fabulous Monocle',
                        tiles = {
                          'default_steel_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {0.125, -0.25, -0.5, 0.3125, -0.1875, -0.4375}, -- NodeBox19
                            {0.125, 0, -0.5, 0.3125, 0.0625, -0.4375}, -- NodeBox20
                            {0.0625, -0.1875, -0.5, 0.125, 0, -0.4375}, -- NodeBox21
                            {0.3125, -0.1875, -0.5, 0.375, 0, -0.4375}, -- NodeBox22
                            {0.3125, -0.3125, -0.5, 0.375, -0.25, -0.4375}, -- NodeBox23
                            {0.3125, -0.4375, -0.5, 0.375, -0.375, -0.4375}, -- NodeBox24
                            {0.375, -0.5, -0.5, 0.4375, -0.4375, -0.4375}, -- NodeBox25
                            {0.375, -0.375, -0.5, 0.4375, -0.3125, -0.4375}, -- NodeBox26
                          }
                        }
                      }
monocle00.scale = 0.5
monocle00.offset = {x = -0.6, y = 2.6, z = 1}
monocle00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(monocle00.name, monocle00.slot, monocle00.node_def, monocle00.scale, monocle00.offset, monocle00.rotation)


local hat00 = {}
hat00.name = prefix .. 'hat00'
hat00.slot = mod.inventory_names.fabulous_hat
hat00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_hat = 1},
                        description = 'Fabulous Hat',
                        tiles = {
                          'default_snow.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.3125, -0.3125, -0.5, 0.3125, 0, 0.5}, -- NodeBox1
                            {-0.5, -0.3125, -0.3125, -0.3125, 0, 0.3125}, -- NodeBox2
                            {0.3125, -0.3125, -0.3125, 0.5, 0, 0.3125}, -- NodeBox3
                            {-0.3125, 0, -0.3125, 0.3125, 0.25, 0.3125}, -- NodeBox4
                            {-0.375, -0.5, -0.375, 0.375, -0.25, 0.375}, -- NodeBox5
                          }
                        }
                      }
hat00.scale = 0.5
hat00.offset = {x = 0, y = 6, z = 0.5}
hat00.rotation = {x = 20, y = 20, z = 0}
mod.register_fabulousness(hat00.name, hat00.slot, hat00.node_def, hat00.scale, hat00.offset, hat00.rotation)


local hat01 = {}
hat01.name = prefix .. 'hat01'
hat01.slot = mod.inventory_names.fabulous_hat
hat01.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_hat = 1},
                        description = 'Fabulous Top Hat',
                        tiles = {
                          'default_coal_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox6
                            {-0.3125, -0.4375, -0.3125, 0.3125, 0, 0.3125}, -- NodeBox7
                          }
                        }
                      }
hat01.scale = 0.55
hat01.offset = {x = 0, y = 7, z = 0.5}
hat01.rotation = {x = 10, y = 0, z = 0}
mod.register_fabulousness(hat01.name, hat01.slot, hat01.node_def, hat01.scale, hat01.offset, hat01.rotation)


local hat02 = {}
hat02.name = prefix .. 'hat02'
hat02.slot = mod.inventory_names.fabulous_hat
hat02.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_hat = 1},
                        description = 'Fabulous Cowboy Hat',
                        tiles = {
                          'default_desert_sandstone.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox6
                            {-0.5, -0.4375, -0.375, -0.4375, -0.25, 0.375}, -- NodeBox7
                            {0.4375, -0.4375, -0.375, 0.5, -0.25, 0.375}, -- NodeBox8
                            {-0.3125, -0.4375, -0.3125, 0.3125, -0.1875, 0.3125}, -- NodeBox9
                            {-0.25, -0.1875, -0.25, 0.25, 0, 0.25}, -- NodeBox10
                            {-0.1875, 0, -0.1875, -0.0625, 0.125, 0.1875}, -- NodeBox11
                            {0.0625, 0, -0.1875, 0.1875, 0.125, 0.1875}, -- NodeBox12
                          }
                        }
                      }
hat02.scale = 0.55
hat02.offset = {x = 0, y = 7, z = 0.5}
hat02.rotation = {x = 10, y = 0, z = 0}
mod.register_fabulousness(hat02.name, hat02.slot, hat02.node_def, hat02.scale, hat02.offset, hat02.rotation)


local coat00 = {}
coat00.name = prefix .. 'coat00'
coat00.slot = mod.inventory_names.fabulous_body
coat00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_body = 1},
                        description = 'Fabulous Coat',
                        tiles = {
                          'default_snow.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.4375, 0.3125, -0.25, 0.4375, 0.5, 0.3125}, -- NodeBox1
                            {-0.4375, -0.5, -0.25, 0.4375, -0.3125, 0.3125}, -- NodeBox2
                            {-0.5, 0.125, -0.3125, 0.5, 0.3125, 0.375}, -- NodeBox3
                            {-0.5, -0.3125, -0.3125, 0.5, -0.125, 0.375}, -- NodeBox4
                            {-0.4375, -0.125, -0.25, 0.4375, 0.125, 0.3125}, -- NodeBox5
                          }
                        }
                      }
coat00.scale = 0.5
coat00.offset = {x = 0, y = 2.6, z = 0}
coat00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(coat00.name, coat00.slot, coat00.node_def, coat00.scale, coat00.offset, coat00.rotation)

local coat_arms_00 = {}
coat_arms_00.name = prefix .. 'coat_arms_00'
coat_arms_00.slot = mod.inventory_names.fabulous_arms
coat_arms_00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_arms = 1},
                        description = 'Fabulous Coat Arms',
                        tiles = {
                          'default_snow.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.25, 0.3125, -0.25, 0.25, 0.5, 0.3125}, -- NodeBox1
                            {-0.25, -0.5, -0.25, 0.25, -0.3125, 0.3125}, -- NodeBox2
                            {-0.3125, 0.125, -0.3125, 0.3125, 0.3125, 0.375}, -- NodeBox3
                            {-0.3125, -0.3125, -0.3125, 0.3125, -0.125, 0.375}, -- NodeBox4
                            {-0.25, -0.125, -0.25, 0.25, 0.125, 0.3125}, -- NodeBox5
                          }
                        }
                      }
coat_arms_00.scale = 0.4
coat_arms_00.offset = {x = 0, y = 1.9, z = 0}
coat_arms_00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(coat_arms_00.name, coat_arms_00.slot, coat_arms_00.node_def, coat_arms_00.scale, coat_arms_00.offset, coat_arms_00.rotation)


local coat01 = {}
coat01.name = prefix .. 'coat01'
coat01.slot = mod.inventory_names.fabulous_body
coat01.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_body = 1},
                        description = 'Fabulous Black Coat',
                        tiles = {
                          'default_coal_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.25, -0.125, -0.1875, 0.25, 0.375, 0.1875}, -- NodeBox1
                            {-0.25, -0.5, 0.125, 0.25, -0.125, 0.1875}, -- NodeBox2
                            {-0.25, -0.375, -0.125, -0.1875, -0.125, 0.125}, -- NodeBox3
                            {0.1875, -0.375, -0.125, 0.25, -0.125, 0.125}, -- NodeBox4
                            {-0.25, 0.375, 0.125, 0.25, 0.5, 0.1875}, -- NodeBox5
                            {0.1875, 0.375, -0.125, 0.25, 0.5, 0.125}, -- NodeBox6
                            {-0.25, 0.375, -0.125, -0.1875, 0.5, 0.125}, -- NodeBox7
                            {0.0625, 0.375, -0.1875, 0.1875, 0.5, -0.125}, -- NodeBox8
                            {-0.25, 0.375, -0.1875, -0.125, 0.5, -0.125}, -- NodeBox9
                          }
                        }
                      }
coat01.scale = 0.85
coat01.offset = {x = 0, y = 1.6, z = 0}
coat01.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(coat01.name, coat01.slot, coat01.node_def, coat01.scale, coat01.offset, coat01.rotation)


local coat_arms_01 = {}
coat_arms_01.name = prefix .. 'coat_arms_01'
coat_arms_01.slot = mod.inventory_names.fabulous_arms
coat_arms_01.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_arms = 1},
                        description = 'Fabulous Black Coat Arms',
                        tiles = {
                          'default_coal_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox10
                            {-0.25, -0.5, -0.25, 0.25, -0.25, 0.25}, -- NodeBox11
                          }
                        }
                      }
coat_arms_01.scale = 0.41
coat_arms_01.offset = {x = 0, y = 1.9, z = 0}
coat_arms_01.rotation = {x = 180, y = 0, z = 0}
mod.register_fabulousness(coat_arms_01.name, coat_arms_01.slot, coat_arms_01.node_def, coat_arms_01.scale, coat_arms_01.offset, coat_arms_01.rotation)


local pants_00 = {}
pants_00.name = prefix .. 'pants_00'
pants_00.slot = mod.inventory_names.fabulous_legs
pants_00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_legs = 1},
                        description = 'Fabulous Pants',
                        tiles = {
                          'default_snow.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.25, 0.3125, -0.25, 0.25, 0.5, 0.3125}, -- NodeBox1
                            {-0.25, -0.5, -0.25, 0.25, -0.3125, 0.3125}, -- NodeBox2
                            {-0.3125, 0.125, -0.3125, 0.3125, 0.3125, 0.375}, -- NodeBox3
                            {-0.3125, -0.3125, -0.3125, 0.3125, -0.125, 0.375}, -- NodeBox4
                            {-0.25, -0.125, -0.25, 0.25, 0.125, 0.3125}, -- NodeBox5
                          }
                        }
                      }
pants_00.scale = 0.4
pants_00.offset = {x = 0, y = 2.5, z = 0}
pants_00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(pants_00.name, pants_00.slot, pants_00.node_def, pants_00.scale, pants_00.offset, pants_00.rotation)


local mask00 = {}
mask00.name = prefix .. 'mask00'
mask00.slot = mod.inventory_names.fabulous_face
mask00.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Fabulous Skull Mask',
                        tiles = {
                          'default_coral_skeleton.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.3125, 0.0625, -0.5, 0.3125, 0.25, -0.3125}, -- NodeBox1
                            {-0.0625, -0.125, -0.5, 0.0625, 0.0625, -0.3125}, -- NodeBox2
                            {-0.3125, -0.125, -0.5, -0.25, 0.0625, -0.3125}, -- NodeBox3
                            {0.25, -0.125, -0.5, 0.3125, 0.0625, -0.3125}, -- NodeBox4
                            {-0.3125, -0.25, -0.5, 0.3125, -0.125, -0.3125}, -- NodeBox5
                            {-0.0625, -0.375, -0.4375, 0.0625, -0.25, -0.3125}, -- NodeBox6
                            {-0.3125, -0.375, -0.4375, -0.1875, -0.25, -0.3125}, -- NodeBox7
                            {0.1875, -0.375, -0.4375, 0.3125, -0.25, -0.3125}, -- NodeBox8
                            {-0.25, 0.25, -0.4375, 0.25, 0.375, -0.3125}, -- NodeBox9
                          }
                        }
                      }
mask00.scale = 0.5
mask00.offset = {x = 0, y = 1.9, z = 0}
mask00.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(mask00.name, mask00.slot, mask00.node_def, mask00.scale, mask00.offset, mask00.rotation)


local mask01 = {}
mask01.name = prefix .. 'mask01'
mask01.slot = mod.inventory_names.fabulous_face
mask01.node_def =  {
                        groups = {oddly_breakable_by_hand = 1, fabulous_face = 1},
                        description = 'Fabulous Bear Mask',
                        tiles = {
                          'default_bronze_block.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.375, -0.375, -0.375, 0.375, 0.375, 0.375}, -- NodeBox1
                            {-0.25, 0.375, -0.25, 0.25, 0.5, 0.25}, -- NodeBox2
                            {-0.25, -0.5, -0.25, 0.25, -0.375, 0.25}, -- NodeBox3
                            {0.375, -0.25, -0.25, 0.5, 0.25, 0.25}, -- NodeBox4
                            {-0.5, -0.25, -0.25, -0.375, 0.25, 0.25}, -- NodeBox5
                            {-0.25, 0.0625, -0.4375, -0.0625, 0.25, -0.375}, -- NodeBox6
                            {0.0625, 0.0625, -0.4375, 0.25, 0.25, -0.375}, -- NodeBox7
                            {-0.0625, -0.1875, -0.5, 0.0625, 0, -0.375}, -- NodeBox8
                            {-0.1875, -0.3125, -0.4375, 0.1875, -0.125, -0.375}, -- NodeBox9
                            {-0.5, 0.3125, 0, -0.3125, 0.5, 0.0625}, -- NodeBox10
                            {0.3125, 0.3125, 0, 0.5, 0.5, 0.0625}, -- NodeBox11
                            {-0.25, -0.25, 0.375, 0.25, 0.25, 0.5}, -- NodeBox12
                          }
                        }
                      }
mask01.scale = 0.5
mask01.offset = {x = 0, y = 1.9, z = 0}
mask01.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(mask01.name, mask01.slot, mask01.node_def, mask01.scale, mask01.offset, mask01.rotation)
