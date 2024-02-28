extends CanvasLayer

var number = ""
signal cam_shake
var correct = false

func _process(_delta):
	if not correct:
		$ColorRect2/Label.text = number
	if len(number) >= 10:
		if number == "4250000000":
			correct = true
			$"../InteractionManager/DialogPlayer".start_dialogue(3) # should be passed in
			$"../".current_interacter.step = 3
			number = ""
			disable_buttons()
		else:
			$WrongSound.playing = true
			cam_shake.emit()
			number = ""
		
func disable_buttons():
	for i in get_child(0).get_children():
		if i.get_class() == "Button":
			i.disabled = true

func _on_button_0_pressed():
	number += "0"

func _on_button_1_pressed():
	number += "1"

func _on_button_2_pressed():
	number += "2"

func _on_button_3_pressed():
	number += "3"

func _on_button_4_pressed():
	number += "4"

func _on_button_5_pressed():
	number += "5"

func _on_button_6_pressed():
	number += "6"

func _on_button_7_pressed():
	number += "7"

func _on_button_8_pressed():
	number += "8"

func _on_button_9_pressed():
	number += "9"
