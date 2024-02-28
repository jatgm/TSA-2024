extends CharacterBody2D

@onready var camera = $"../Camera2d"
@onready var remote_transform = $"../cat/RemoteTransform2D"
@onready var cat = $"../cat"
@onready var sprite = $InteractionManager/dog_sprite
@onready var original_position = position
@export var backup_dog = false

var tracking = false
var antecendant = false
var lerp_intensity = 15
var chasing = false
var colliding = false
var current_interaction : Area2D
var hit_times = 0 
var in_phonebooth = false

signal take_damage
signal shake_cam(magnitude)

func transform():
	chasing = true
	$InteractionManager.enabled = false

func entered_phonebooth():
	in_phonebooth = true
	await get_tree().create_timer(5.0).timeout
	get_tree().call_group("dogs", "queue_free")

func respawn():
	if current_interaction != null:
		current_interaction.revive()
		position = original_position
		current_interaction.get_parent().position = Vector2(495.105,-111.709)
	chasing = false
	$InteractionManager.enabled = true
	$DamageIndication/AnimationPlayer.play("RESET")
	position = original_position
	hit_times = 0
	$GameOverScreen/AnimationPlayer.play("RESET")
	$AnimationPlayer.play("RESET")

func _physics_process(delta):
	if not backup_dog:
		if tracking:
			camera.position = camera.position.lerp(Vector2((cat.position.x + position.x)/2, (cat.position.y + position.y)/2), 5*delta)
		if not tracking and antecendant:
			camera.position = camera.position.lerp(cat.position, lerp_intensity*delta)
			if camera.position.distance_to(cat.position) < 4:
				camera.code_based_tracking = !false
				remote_transform.update_position = !false
				
	if chasing:
		if not in_phonebooth:
			velocity = round(position.direction_to(cat.position)) * 75
		if in_phonebooth:
			velocity = round(position.direction_to(Vector2(134.303,585.86))) * 75
		update_animation_parameters(position.direction_to(cat.position))

		move_and_slide()	
			
func _on_interaction_manager_start(interacter):
	if not tracking:
		if not backup_dog:
			camera.code_based_tracking = false
			remote_transform.update_position = false
			tracking = true
			antecendant = true
			var tween = get_tree().create_tween()
			tween.tween_property(camera, "zoom", Vector2(4.5,4.5), 0.5)

func _on_interaction_manager_leave():
	if not backup_dog:
		tracking = !true
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", Vector2(4,4), 0.7)

func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		if abs(move_input.x) > .5:
			if move_input > Vector2(0.1,0):
				$AnimationPlayer.play("move right")
			if move_input < Vector2(-0.1,0):
				$AnimationPlayer.play("move left")

func _on_hitbox_area_entered(area):
	colliding = true
	current_interaction = area
	
func _on_hitbox_area_exited(area):
	colliding = false
	current_interaction = null

func _on_damage_timer_timeout():
	if colliding and chasing:
		$AudioStreamPlayer.playing = true
		take_damage.emit()
		$DamageIndication/AnimationPlayer.play("damage_screen")
		shake_cam.emit(1)
		current_interaction.take_damage()
		hit_times += 1
		if hit_times >= 3:
			$GameOverScreen.die()
			current_interaction.die()
			get_tree().call_group("dialog_players", "enable")
