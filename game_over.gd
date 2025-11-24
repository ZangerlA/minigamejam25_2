extends Node2D

var next_scene = preload("res://Scenes/start_screen.tscn")

@export var video_player: VideoStreamPlayer

func _ready():
	MusicManager.stop_music()
	if video_player:
		video_player.finished.connect(_on_video_stream_player_finished)

func _on_video_stream_player_finished():
	get_tree().change_scene_to_packed(next_scene)
