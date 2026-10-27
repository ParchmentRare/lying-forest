extends CharacterBody2D

const SPEED = 70

var input_direction: get = _get_input_direction
var sprite_direction = "down": get = _get_sprite_direction

@onready var sprite = $AnimatedSprite2D

func _get_input_direction():
	var x = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	var y = -int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	input_direction = Vector2(x,y)
	return input_direction
	
func _physics_process(_delta: float) -> void:
	velocity = input_direction * SPEED
	move_and_slide()
	
	set_animation("walk")
	if velocity == Vector2.ZERO:
		sprite.stop()
		
	
func _get_sprite_direction():
	match input_direction:
		Vector2.LEFT:
			sprite_direction = "left"
		Vector2.RIGHT:
			sprite_direction = "right"
		Vector2.UP:
			sprite_direction = "up"
		Vector2.DOWN:
			sprite_direction = "down"
	return sprite_direction
	
func set_animation(animation):
	var direction = "side" if sprite_direction in ["left", "right"] else sprite_direction
	sprite.play(animation + direction)
	sprite.flip_h = (sprite_direction == "left")
