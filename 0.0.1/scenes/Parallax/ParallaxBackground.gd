extends ParallaxBackground


@onready var move_speed :int = 50
var old_speed :int

func _process(delta):
	scroll_offset.x -= move_speed*delta


func _on_tesla_picked_up_sped(speed, duration):
	if duration == 0:
		move_speed += speed
	else :
		old_speed = move_speed
		move_speed += speed
		await get_tree().create_timer(duration).timeout
		move_speed = old_speed
