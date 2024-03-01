extends Node2D

var current_hovering : String
var current_order = ""

signal shake_cam
signal freeze_cat
signal unfreeze_cat			

func checkWinningConditions():
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
	$InteractionManager3/CanvasLayer/TextureRect/BlueWirePic.visible = true
	$InteractionManager3/CanvasLayer/TextureRect/CutBlueWire.visible = false

	$InteractionManager3/CanvasLayer/TextureRect/RedWirePic.visible = true
	$InteractionManager3/CanvasLayer/TextureRect/CutRedWire.visible = false

	$InteractionManager3/CanvasLayer/TextureRect/GreenWirePic.visible = true
	$InteractionManager3/CanvasLayer/TextureRect/CutGreenWire.visible = false

	$InteractionManager3/CanvasLayer/TextureRect/YellowWirePic.visible = true
	$InteractionManager3/CanvasLayer/TextureRect/CutYellowWire.visible = false
					

func _on_button_pressed():
	$InteractionManager3/CanvasLayer/TextureRect/BlueWirePic.visible = false
	$InteractionManager3/CanvasLayer/TextureRect/CutBlueWire.visible = true
	current_order += "b"
	checkWinningConditions()

func _on_red_button_node_pressed():
	$InteractionManager3/CanvasLayer/TextureRect/RedWirePic.visible = false
	$InteractionManager3/CanvasLayer/TextureRect/CutRedWire.visible = true
	current_order += "r"
	checkWinningConditions()

func _on_green_button_node_pressed():
	$InteractionManager3/CanvasLayer/TextureRect/GreenWirePic.visible = false
	$InteractionManager3/CanvasLayer/TextureRect/CutGreenWire.visible = true
	current_order += "g"
	checkWinningConditions()

func _on_yellow_button_node_pressed():
	$InteractionManager3/CanvasLayer/TextureRect/YellowWirePic.visible = false
	$InteractionManager3/CanvasLayer/TextureRect/CutYellowWire.visible = true
	current_order += "y"
	checkWinningConditions()

