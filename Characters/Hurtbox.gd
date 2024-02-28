extends Area2D

signal damage_taken
signal respawn_coin

func take_damage():
	damage_taken.emit()
	
func die():
	$"../".moving = false
	
func revive():
	$"../".moving = true
	$"../".respawn_coin()
	
