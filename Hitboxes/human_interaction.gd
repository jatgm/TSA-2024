extends InteractionManager

func hover() -> void:
	$Person1Sprite.material.set_shader_parameter("opacity", 0.4)
	$Person1Sprite.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Person1Sprite.material.set_shader_parameter("opacity", 0)
	$Person1Sprite.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter):
	$Node2D/CanvasLayer.visible = true
	
func exit_bound() -> void: # These two can be overriden 
	pass
