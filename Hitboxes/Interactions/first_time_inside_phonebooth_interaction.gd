extends DialogPlayer

signal finish_first_time_dialog

func start_dialogue(step = null):
	if step == 1:
		scene_file_text = "res://json/first_time_inside_phonebooth.json"
		scene_text = load_scene_text()
	if step == 3:

		scene_file_text = "res://json/phone_call.json"
		scene_text = load_scene_text()
	super.start_dialogue()
	
	
func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		print("we finished")
		finish()
		finish_first_time_dialog.emit()
