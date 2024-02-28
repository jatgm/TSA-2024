extends Node2D

enum PHONEBOOTH_STATE {USING, NOT_USING, COOLDOWN}

@export var open = false
var state = PHONEBOOTH_STATE.NOT_USING
var current_interacter : CharacterBody2D

func _on_interaction_manager_enter_phonebooth(interacter):
	current_interacter = interacter
	if open:
		if state == PHONEBOOTH_STATE.USING:
			if interacter.step == 2 or interacter.step == 4:
				state = PHONEBOOTH_STATE.COOLDOWN
				var tween = get_tree().create_tween()
				$AnimationPlayer.play("remove_blackbars")
				tween.tween_property(interacter, "position", position+Vector2(0,40), 0.3).set_trans(Tween.TRANS_SINE)
				$UI.visible = false
				await get_tree().create_timer(0.4).timeout
				interacter.moving = true
				await get_tree().create_timer(1).timeout
				state = PHONEBOOTH_STATE.NOT_USING
				return
		if state == PHONEBOOTH_STATE.NOT_USING:
			if interacter.step <= 1:
				interacter.step = 1
			state = PHONEBOOTH_STATE.USING
			var tween = get_tree().create_tween()
			interacter.moving = false
			tween.tween_property(interacter, "position", position, 0.3).set_trans(Tween.TRANS_SINE)
			$AnimationPlayer.play("add_blackbars")
			await get_tree().create_timer(0.4).timeout
			if state == PHONEBOOTH_STATE.USING:
				if not interacter.step == 1: # first time you enter
					$UI.visible = true
					
			get_tree().call_group("dogs", "entered_phonebooth")
		if interacter.step == 1 or interacter.step == 3:
			$InteractionManager/DialogPlayer.start_dialogue(interacter.step)
			return
	else:
		$InteractionManager/DialogPlayer.start_dialogue()
		
func _on_interaction_manager_unlock_phonebooth():
	open = true

func _on_dialog_player_finish_first_time_dialog():
	if current_interacter.step == 1:
		$LevelCompleteAnimation.play("complete_level")
		$CompleteLevel.visible = true
		$UI.visible = true
		current_interacter.step += 1
	if current_interacter.step == 3:
		current_interacter.step = 4
		print("This should run")
