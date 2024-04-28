class_name speed_booster
extends Area2D

@export var speed := 0
@export var duration := 0

@onready var color_rect : ColorRect = $ColorRect

enum ColorChoice {Blue , Green}
@export var color_choice: ColorChoice


func _ready():
	if color_choice == ColorChoice.Green:
		color_rect.color = Color.GREEN

	if color_choice == ColorChoice.Blue:
		color_rect.color = Color.BLUE
