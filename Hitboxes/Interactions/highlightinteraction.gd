extends InteractionManager

func hover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	$DialogPlayer.start_dialogue(interacter) # to pass in step
	if started:
		started = false
		$AudioStreamPlayer.playing = true
