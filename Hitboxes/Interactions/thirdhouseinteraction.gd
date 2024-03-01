extends InteractionManager

var text = ""

var interacter

signal freeze_cat
signal unfreezeCat
signal teleportCatToHouse
signal unBoundCamera

func hover() -> void:
	$House3.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$House3.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	interacter = interacter
	if interacter.step == 5:
		teleportToHouse()
		
func exit_bound() -> void: # These two can be overriden 
	pass

func _on_button_pressed():
	if text.to_upper() == "CATLITTER":
		$InteractionManager/Cypher.visible = false
		$AnimationPlayer.play("complete_level")
	   
		unfreezeCat.emit() 
		 
func teleportToHouse():
	unBoundCamera.emit()
	teleportCatToHouse.emit()


func _on_text_edit_text_changed():
	text = $InteractionManager/Cypher/ColorRect/TextEdit.text 
