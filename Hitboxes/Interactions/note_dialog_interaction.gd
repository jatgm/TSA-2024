extends DialogPlayer

func start_dialogue(interacter = null):
	if interacter.step == 2:
		scene_file_text = "res://json/note_second_time.json"
		scene_text = load_scene_text()
	super.start_dialogue()
