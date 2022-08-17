extends TextureRect



func _on_Visualizer_RenderComplete(image):
	var tex = ImageTexture.new()
	tex.create_from_image(image)
	texture = tex
	#tex.free()
