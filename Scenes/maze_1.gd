extends Node2D

@export var gameover_scene_path : PackedScene = null
@export var main_menu : PackedScene = null
func _ready():
	$Timer.start_countdown()
	

func on_timer_countdown_finished():
	if gameover_scene_path != null:
		get_tree().change_scene_to_packed(gameover_scene_path)


func _on_finish_maze_player_reached_finish():
	if main_menu != null:
		get_tree().change_scene_to_packed(main_menu)
