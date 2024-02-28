extends InteractionManager

signal unlock_phonebooth
signal disable_interaction

var started_coin_interaction = false

func _input(event):
	if event.is_action_pressed("interact"):
		if started_coin_interaction:	
			$DialogPlayer.start_dialogue()

func exit_bound():
	pass

func hover() -> void:
	$Sprite2D.material.set_shader_parameter("opacity", 0.4)
	$Sprite2D2.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$Sprite2D.material.set_shader_parameter("opacity", 0)
	$Sprite2D2.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	super.recieve_interaction(interacter)
	$"../AnimationPlayer".play("FadeMessage")
	unlock_phonebooth.emit()
	disable_interaction.emit()
	visible = false
	started_coin_interaction = true

func _on_cat_put_back_coin():
	visible = true
	started_coin_interaction = false
	$DialogPlayer.started_coin_dialog = false
	$DialogPlayer.current_index = "0"
