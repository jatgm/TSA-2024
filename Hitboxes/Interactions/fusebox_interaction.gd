extends InteractionManager



func recieve_interaction(interacter) -> void:
	if interacter.step == 4:
		if $CanvasLayer.visible == true:
			$CanvasLayer.visible = false
			started = false
			return
		$CanvasLayer.visible = true
		if started:
			started = false
			$AudioStreamPlayer.playing = true
	if interacter.step == 5:
		print("POOPOPOPPOO")
		$DialogPlayer.start_dialogue()
		interacter.step+=1

func hover() -> void:
	$"Fuseboxtest-1png".material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$"Fuseboxtest-1png".material.set_shader_parameter("opacity", 0)

func exit_bound() -> void: # These two can be overriden 
	$CanvasLayer.visible = false
	started = true

