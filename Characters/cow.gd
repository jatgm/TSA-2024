extends CharacterBody2D

enum COW_STATE {IDLE, WALK}

@export var move_speed : float = 20
var idle_time = 5
var walk_time = 2

@onready var animation_tree = $AnimationTree
@onready var sprite = $InteractionManager/Sprite2d
@onready var timer = $Timer
@onready var state_machine = animation_tree.get("parameters/playback")

var move_direction : Vector2 = Vector2.ZERO
var current_state : COW_STATE = COW_STATE.WALK

func _ready():
	
	pick_new_state()
	
func _physics_process(_delta):
	if current_state == COW_STATE.WALK:
		velocity = move_direction * move_speed
		
		move_and_slide()

#generates random walk vector
func select_new_direction():
	move_direction = Vector2(
		randi_range(-1,1),
		randi_range(-1,1)
	)
	
	if move_direction.x < 0:
		sprite.flip_h = true
	elif move_direction.x > 0:
		sprite.flip_h = false
	
func pick_new_state():
	if current_state == COW_STATE.IDLE:
		state_machine.travel("walk")
		current_state = COW_STATE.WALK
		select_new_direction()
		timer.start(walk_time+randi_range(-1, 2))
		
	elif current_state == COW_STATE.WALK:
		
		state_machine.travel("idle")
		current_state = COW_STATE.IDLE
		timer.start(idle_time+randi_range(-1, 2))

func _on_timer_timeout():
	pick_new_state()
