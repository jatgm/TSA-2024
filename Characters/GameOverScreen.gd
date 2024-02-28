extends CanvasLayer

func die():
	$AnimationPlayer.play("blinking")
	visible = true

func _input(event):
	if event.is_action_pressed("interact"):
		if visible:
			visible = false
			get_tree().call_group("dogs", "respawn")
