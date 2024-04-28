extends CharacterBody2D

signal picked_up_sped(speed:int, duration:int)
signal about_to_transition

@export_file("*.tscn","*.scn","*.res") var scene_to_load := ""
@export var transition_speed_seconds := -1.0
@export var fade_sound := false
@export var grab_focus_on_start := false

var game_over := false 
var speed: = 100

var can_move = true
var input_direction :Vector2

func _process(delta):
	move_and_slide()
	pos_check()

func _input(event):
	if can_move:
		input_direction = Vector2(0,
			Input.get_axis("move_up", "move_down")
		).normalized()
	
	velocity = input_direction * speed


func pos_check():
	if position.x <0 :
		game_over = true
		emit_signal("about_to_transition")
		TransitionMgr.transition_to(scene_to_load, transition_speed_seconds, fade_sound)


func _on_area_2d_area_entered(area):
	if area is speed_booster:
		picked_up_sped.emit(area.speed,area.duration)
