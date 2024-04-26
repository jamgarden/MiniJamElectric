extends ParallaxBackground


@onready var move_speed :int = 50

func _process(delta):
	scroll_offset.x -= move_speed*delta
