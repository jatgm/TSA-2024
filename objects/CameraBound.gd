extends ColorRect

@onready var camera = $"../Camera2d"

func _ready():
	camera.limit_left = position.x - 134
	camera.limit_top = position.y
	camera.limit_right = position.x - 134 + size.x
	camera.limit_bottom = position.y + size.y
