extends InteractionManager

# No longer used but I will keep here for purposes

func recieve_interaction(_interacter) -> void:
	$DialogPlayer.start_dialogue()
	
func exit_bound() -> void:
	$DialogPlayer.finish()
