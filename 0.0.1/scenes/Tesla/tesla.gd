extends CharacterBody2D


var speed: = 100

var can_move = true
var input_direction :Vector2

func _process(delta):
	move_and_slide()

func _input(event):
	if can_move:
		input_direction = Vector2(0,
			Input.get_axis("move_up", "move_down")
		).normalized()
	
	velocity = input_direction * speed
