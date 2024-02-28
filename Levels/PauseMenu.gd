extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if $Selector.visible == false:
			$Settings.visible = false
			$Selector.visible = true
		else:
			get_tree().paused = !get_tree().paused
			visible = !visible

func _on_settings_pressed():
	$Settings.visible = !$Settings.visible
	$Selector.visible = !$Selector.visible

func _on_resume_pressed():
	get_tree().paused = !get_tree().paused
	visible = !visible

func _on_quit_pressed():
	get_tree().quit()

func _on_back_button_pressed():
	$Settings.visible = false
	$Selector.visible = true

func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))

func _on_fps_enter_value_changed(value):
	Engine.max_fps = value
