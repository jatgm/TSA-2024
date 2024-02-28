extends AnimatedSprite2D

@onready var dog_head_occluder = $dog_head_occluder

func _on_frame_changed():
	if animation == "sitting":
		if frame == 0:
			$frame_1_occluder.visible = false
			$frame_0_occluder.visible = true
		if frame == 1:
			$frame_1_occluder.visible = true
			$frame_0_occluder.visible = false

func _on_animation_changed():
	if animation != "sitting":
		$frame_0_occluder.visible = false
		$frame_1_occluder.visible = false
		$dog_head_occluder.visible = true


func addrotation(degree : int):
	rotation += degree
	
	
	

