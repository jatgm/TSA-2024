extends InteractionManager

var text = ""

signal freeze_cat 

func hover() -> void:
	$House3.material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$House3.material.set_shader_parameter("opacity", 0)

func recieve_interaction(interacter) -> void:
	if interacter.step == 5:
		$CanvasLayer.visible = true
		freeze_cat.emit()
func exit_bound() -> void: # These two can be overriden 
	pass

func _on_line_edit_text_changed(new_text):
	text = new_text

func _on_button_pressed():
	if text.to_upper() == "CATLITTER":
		$Node2D/CanvasLayer.visible = true
		$CanvasLayer.visible = false
		
