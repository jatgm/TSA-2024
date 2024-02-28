extends InteractionManager

func recieve_interaction(interacter) -> void:
	$DialogPlayer.start_dialogue(interacter)
	if started:
		started = false
		$AudioStreamPlayer.playing = true
	
func hover() -> void:
	$House1.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$House1.material.set_shader_parameter("opacity", 0)
