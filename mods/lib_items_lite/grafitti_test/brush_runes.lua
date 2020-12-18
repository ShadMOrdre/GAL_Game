
-- grafitti.register_grafitti(node_name, def)  
-- -- node_name (eg. "default:stone")  
-- -- def : {  
-- --   image,  
-- --   size = {x, y}, (optional, default: {1, 1})  
-- --   center = {row, col}, (optional, default: {0, 0})  
-- --   pointable (optional, default: false)  
-- -- }  

grafitti.register_grafitti("grafitti_brushes:algiz", {  
  image = "ancientrunes_overlay_algiz.png"
})
grafitti.register_grafitti("grafitti_brushes:ansuz", {  
  image = "ancientrunes_overlay_ansuz.png"
})
grafitti.register_grafitti("grafitti_brushes:berkanan", {  
  image = "ancientrunes_overlay_berkanan.png"
})
grafitti.register_grafitti("grafitti_brushes:dagaz", {  
  image = "ancientrunes_overlay_dagaz.png"
})
grafitti.register_grafitti("grafitti_brushes:ehwaz", {  
  image = "ancientrunes_overlay_ehwaz.png"
})
grafitti.register_grafitti("grafitti_brushes:fehu", {  
  image = "ancientrunes_overlay_fehu.png"
})
grafitti.register_grafitti("grafitti_brushes:gyfu", {  
  image = "ancientrunes_overlay_gyfu.png"
})
grafitti.register_grafitti("grafitti_brushes:hagalaz", {  
  image = "ancientrunes_overlay_hagalaz.png"
})
grafitti.register_grafitti("grafitti_brushes:ihwa", {  
  image = "ancientrunes_overlay_ihwa.png"
})
grafitti.register_grafitti("grafitti_brushes:isaz", {  
  image = "ancientrunes_overlay_isaz.png"
})
grafitti.register_grafitti("grafitti_brushes:jera", {  
  image = "ancientrunes_overlay_jera.png"
})
grafitti.register_grafitti("grafitti_brushes:kaunan", {  
  image = "ancientrunes_overlay_kaunan.png"
})
grafitti.register_grafitti("grafitti_brushes:laguz", {  
  image = "ancientrunes_overlay_laguz.png"
})
grafitti.register_grafitti("grafitti_brushes:mannaz", {  
  image = "ancientrunes_overlay_mannaz.png"
})
grafitti.register_grafitti("grafitti_brushes:naudiz", {  
  image = "ancientrunes_overlay_naudiz.png"
})
grafitti.register_grafitti("grafitti_brushes:othala", {  
  image = "ancientrunes_overlay_othala.png"
})
grafitti.register_grafitti("grafitti_brushes:peorth", {  
  image = "ancientrunes_overlay_peorth.png"
})
grafitti.register_grafitti("grafitti_brushes:raido", {  
  image = "ancientrunes_overlay_raido.png"
})
grafitti.register_grafitti("grafitti_brushes:sowilo", {  
  image = "ancientrunes_overlay_sowilo.png"
})
grafitti.register_grafitti("grafitti_brushes:thurisaz", {  
  image = "ancientrunes_overlay_thurisaz.png"
})
grafitti.register_grafitti("grafitti_brushes:tiwaz", {  
  image = "ancientrunes_overlay_tiwaz.png"
})
grafitti.register_grafitti("grafitti_brushes:ur", {  
  image = "ancientrunes_overlay_ur.png"
})
grafitti.register_grafitti("grafitti_brushes:wynn", {  
  image = "ancientrunes_overlay_wynn.png"
})
grafitti.register_grafitti("grafitti_brushes:yngvi", {  
  image = "ancientrunes_overlay_yngvi.png"
})


grafitti.set_palette_width(8)  

grafitti.palette_build("grafitti_brushes:palette_runes")  



grafitti.register_brush("grafitti_brushes:brush_runes", {  
  description = "Palette Brush - Runes",  
  inventory_image = "ancientrunes_tool_burin_steel.png", 
  wield_image = "ancientrunes_tool_burin_steel.png",
  palette = "grafitti_brushes:palette_runes",
  recipe = {{"gal:metal_steel_ingot"}}
})


