extends CharacterBody2D

const SPEED = 70

var input_direction: get = _get_input_direction
var sprite_direction

@onready var sprite = $AnimatedSprite2D

func _get_input_direction():
	var x = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	var y = -int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	input_direction = Vector2(x,y)
	return input_direction
	
func _physics_process(_delta: float) -> void:
	velocity = input_direction * SPEED
	move_and_slide()
	
