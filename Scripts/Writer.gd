extends Node

var filepath;
signal RenderData(time,pieces)
func _on_FileDialog_file_selected(path):
	write(path)
	
func write(path):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string(convert_csv())
	file.close()

func convert_csv() -> String:
	
	#'oh look at the time'
	var t = OS.get_ticks_msec()
	
	#file boilerplate
	var file = File.new()
	file.open(filepath, File.READ)
	var res := ""
	var position := 0
	var pieces:=0
	while file.get_position() < file.get_len():
		var linefull = file.get_line()
		var line = linefull.split(",",false)
		for string in line:
			if position == 0: #headers
				res += str(string)
			else:
				res += str(string.hash())
			pieces += 1
			res += ","
		res += "\n"
		position+=1
	
	emit_signal("RenderData",OS.get_ticks_msec() - t,pieces)
	return res


func _on_Parser_StorePath(p):
	filepath = p
