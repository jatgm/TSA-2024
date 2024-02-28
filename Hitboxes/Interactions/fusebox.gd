extends DialogPlayer
	
signal done

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		print("we finished")
		finish()
		done.emit()
