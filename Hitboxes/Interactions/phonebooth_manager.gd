extends InteractionManager

signal enter_phonebooth(interacter)

func hover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Sprite2d.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void: # open the phonebooth UI
	enter_phonebooth.emit(interacter)
	if started:
		started = false
		$AudioStreamPlayer.playing = true

