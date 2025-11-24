extends Control

@onready var start_button: Button = $VBoxContainer/Button
@onready var quit_button: Button = $VBoxContainer/Button2

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
