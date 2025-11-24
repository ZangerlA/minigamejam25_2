extends Button

@export var redrect_scene_path : String = ""
@export var no_level_Text : Label = null

var flag_green : bool = false


func _on_pressed():
	if redrect_scene_path != "":
		get_tree().change_scene_to_file(redrect_scene_path)
	else:
		print_debug("No scene path provided!")
		# TODO Not Implemented yet text here

func setDone():
	flag_green = true
	self.modulate = Color(0.0, 1.0, 0.0)
