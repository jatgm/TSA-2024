extends InteractionManager

signal freezeCat

func hover() -> void:
	$Safe.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Safe.material.set_shader_parameter("opacity", 0)

func exit_bound():
	pass

func recieve_interaction(interacter) -> void:
	$Cypher.visible = true
	freezeCat.emit()
