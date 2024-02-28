extends Node2D

var current_hovering : String
var current_order = ""

signal shake_cam
signal freeze_cat
signal unfreeze_cat

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			match current_hovering:
				"blue":
					$InteractionManager3/CanvasLayer/BlueWire/BlueWire.visible = false
					$InteractionManager3/CanvasLayer/BlueWire/CutBlueWire.visible = true
					current_order += "b"
				"red":
					$InteractionManager3/CanvasLayer/RedWire/RedWire.visible = false
					$InteractionManager3/CanvasLayer/RedWire/CutRedWire.visible = true
					current_order += "r"
				"green":
					$InteractionManager3/CanvasLayer/GreenWire/GreenWire.visible = false
					$InteractionManager3/CanvasLayer/GreenWire/CutGreenWire.visible = true
					current_order += "g"
				"yellow":
					$InteractionManager3/CanvasLayer/YellowWire/YellowWire.visible = false
					$InteractionManager3/CanvasLayer/YellowWire/CutYellowWire.visible = true
					current_order += "y"
			if len(current_order) == 4:
				if current_order != "bryg":
					$InteractionManager3/WrongSound.playing = true
					current_order = ""
					reset()
					shake_cam.emit()
				if current_order == "bryg":
					$AnimationPlayer.play("complete_level")
					$CompleteLevel.visible = true
					$"../cat".step = 5
					$InteractionManager3/DialogPlayer.start_dialogue()
					$InteractionManager3/CanvasLayer.visible = false
					freeze_cat.emit()
					

func reset():
	$InteractionManager3/CanvasLayer/BlueWire/BlueWire.visible = true
	$InteractionManager3/CanvasLayer/BlueWire/CutBlueWire.visible = false

	$InteractionManager3/CanvasLayer/RedWire/RedWire.visible = true
	$InteractionManager3/CanvasLayer/RedWire/CutRedWire.visible = false

	$InteractionManager3/CanvasLayer/GreenWire/GreenWire.visible = true
	$InteractionManager3/CanvasLayer/GreenWire/CutGreenWire.visible = false

	$InteractionManager3/CanvasLayer/YellowWire/YellowWire.visible = true
	$InteractionManager3/CanvasLayer/YellowWire/CutYellowWire.visible = false
					
func _on_blue_wire_mouse_entered():
	current_hovering = "blue"

func _on_red_wire_mouse_entered():
	current_hovering = "red"

func _on_green_wire_mouse_entered():
	current_hovering = "green"

func _on_yellow_wire_mouse_entered():
	current_hovering = "yellow"

func _on_dialog_player_done():
	unfreeze_cat.emit()
