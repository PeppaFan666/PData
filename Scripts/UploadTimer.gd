extends Label

func _on_Parser_ProcessTime(time):
	var t = "Uploaded and rendered in %s ms"
	text = t % str(time)
