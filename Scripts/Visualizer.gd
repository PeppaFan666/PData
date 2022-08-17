extends Node

signal RenderComplete(image)

var img := Image.new()

func _on_Parser_ProcessData(data : PoolStringArray, level : int):
	var x := 0
	for value in data:
		if value.is_valid_integer():
			if x >= img.get_width() or level >= img.get_height():
				continue
			img.set_pixel(x,level,Color(1,0,0))


func _on_Parser_RenderComplete():
	emit_signal("RenderComplete",img)


func _on_Parser_BeginRender(_width, _height):
	img.create(275,300,false,Image.FORMAT_RGB8)
	img.lock()
