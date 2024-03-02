extends DialogPlayer
	
signal done
signal unfreeze_cat

@export var cat : CharacterBody2D

func _input(event):
	if cat.step == 6:
		if event.is_action_pressed("interact"):
			start_dialogue()
			print("THIS MIGHT BE MY EVERYTHING")

func next_line():
	if (current_index).to_int() < len(scene_text):
		show_text()
	else:
		print("we finished")
		finish()
		cat.step = 7
		done.emit()
		unfreeze_cat.emit()
