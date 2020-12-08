
-- grafitti.register_grafitti(node_name, def)  
-- -- node_name (eg. "default:stone")  
-- -- def : {  
-- --   image,  
-- --   size = {x, y}, (optional, default: {1, 1})  
-- --   center = {row, col}, (optional, default: {0, 0})  
-- --   pointable (optional, default: false)  
-- -- }  

grafitti.register_grafitti("grafitti_test:eye", {  
  image = "pyramids_eye.png"
})
grafitti.register_grafitti("grafitti_test:man", {  
  image = "pyramids_men.png"
})
grafitti.register_grafitti("grafitti_test:sun", {  
  image = "pyramids_sun.png"
})

grafitti.set_palette_width(8)  

grafitti.palette_build("grafitti_test:egypt_palette")  

grafitti.register_brush("grafitti_test:brush_egypt", {  
  description = "Palette Brush - Egypt",  
  inventory_image = "palette_brush_egypt.png", 
  wield_image = "palette_brush_egypt.png^[transformR270",
  palette = "grafitti_test:egypt_palette",
  recipe = {{"lib_materials:sand"}}
})


