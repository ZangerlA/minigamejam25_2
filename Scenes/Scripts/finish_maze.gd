extends Area2D

signal player_reached_finish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	var win_label = Label.new()
	win_label.text = "YOU WIN!"
	win_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	win_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	win_label.add_theme_font_size_override("font_size", 64)
	win_label.position = Vector2(200, 200)
	win_label.size = Vector2(400, 100)
	win_label.z_index = 100
	get_tree().root.add_child(win_label)
	
	await get_tree().create_timer(2.0).timeout
	win_label.queue_free()
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
