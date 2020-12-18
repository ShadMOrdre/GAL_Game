
-- grafitti.register_grafitti(node_name, def)  
-- -- node_name (eg. "default:stone")  
-- -- def : {  
-- --   image,  
-- --   size = {x, y}, (optional, default: {1, 1})  
-- --   center = {row, col}, (optional, default: {0, 0})  
-- --   pointable (optional, default: false)  
-- -- }  

grafitti.register_grafitti("grafitti_brushes:eye", {  
  image = "pyramids_eye.png"
})
grafitti.register_grafitti("grafitti_brushes:man", {  
  image = "pyramids_men.png"
})
grafitti.register_grafitti("grafitti_brushes:sun", {  
  image = "pyramids_sun.png"
})

grafitti.set_palette_width(8)  

grafitti.palette_build("grafitti_brushes:palette_egypt")  

grafitti.register_brush("grafitti_brushes:brush_egypt", {  
  description = "Palette Brush - Egypt",  
  inventory_image = "palette_brush_egypt.png", 
  wield_image = "palette_brush_egypt.png^[transformR270",
  palette = "grafitti_brushes:palette_egypt",
  recipe = {{"gal:sand"}}
})


