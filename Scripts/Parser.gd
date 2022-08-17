extends Node

signal ProcessTime(time)
signal ProcessData(data,level)
signal RenderComplete()
signal BeginRender(width,height)
signal StorePath(p)

func parse_csv(path) -> void:
	
	#'oh look at the time'
	var t = OS.get_ticks_msec()
	
	#file boilerplate
	var file = File.new()
	file.open(path, File.READ)
	
	var position := 0
	#reccomended way of looping through file
	while file.get_position() < file.get_len():
		var linefull = file.get_line()
		var line = linefull.split(",",false) #real parsing
		if position == 0:
			emit_signal("BeginRender",len(line)-1,file.get_len())
			yield(get_tree().create_timer(1.0), "timeout")
		emit_signal("ProcessData",line,position)
		position += 1
	
	emit_signal("RenderComplete")
	emit_signal("ProcessTime",OS.get_ticks_msec() - t)

func _on_FileOpen_file_selected(path):
	parse_csv(path)
	emit_signal("StorePath",path)
