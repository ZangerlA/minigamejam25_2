extends Node2D

var next_scene = preload("res://Scenes/start_screen.tscn")

func _on_video_stream_player_finished():
	get_tree().change_scene_to_packed(next_scene)
