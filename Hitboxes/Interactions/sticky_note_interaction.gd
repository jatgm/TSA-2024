extends InteractionManager

func hover() -> void:
	$Stickynote.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Stickynote.material.set_shader_parameter("opacity", 0)
