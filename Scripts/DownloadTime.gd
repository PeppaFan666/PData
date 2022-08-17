extends Label


func _on_Writer_RenderData(time, pieces):
	var st = "Wrote %s values in %s ms"
	text = st % [str(time),str(pieces)]
