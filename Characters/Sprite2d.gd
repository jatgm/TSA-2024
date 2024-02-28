extends Sprite2D

@onready var occluder = $LightOccluder2d

# Called when the node enters the scene tree for the first time.
func addrotation(degree : int):
	occluder.rotation += degree
	rotation += degree
