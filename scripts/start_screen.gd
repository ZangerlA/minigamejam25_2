extends Control

@onready var start_button: Button = $VBoxContainer/Button
@onready var quit_button: Button = $VBoxContainer/Button2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func play_music():
	audio_stream_player.stream = preload("res://music/bomb_music.mp3")
	audio_stream_player.play()

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
