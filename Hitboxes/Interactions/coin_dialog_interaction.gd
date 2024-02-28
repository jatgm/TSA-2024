extends DialogPlayer

signal enable_interaction

var started_coin_dialog = false

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		get_tree().call_group("dogs", "transform")
		#get_tree().call_group("dialog_players", "disable")
		enable_interaction.emit()
		finish()

func start_dialogue():
	if enabled:
		if in_progress:
			if line_finished:
				next_line()
			else:
				text_label.visible_characters = 999
		if !started_coin_dialog:
			get_tree().call_group("dialog_players", "finish")
			background.visible = true
			name_background.visible = true
			in_progress = true
			#selected_text = scene_text[current_index]["dialogue"]
			visible = true
			show_text()
			started_coin_dialog = true
