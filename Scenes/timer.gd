extends Node2D

signal countdown_finished

# _on_button_pressed get_parent().start_countdown()

@export var start_time: float = 10.0
var time_left: float

@onready var seconds_label: Label = $Panel/Seconds
@onready var millis_label: Label = $Panel/Miliseconds   # EXACT same name as in the tree

func _ready() -> void:
	reset_timer()
	set_process(false)

func reset_timer() -> void:
	time_left = start_time
	_update_labels()

func start_countdown() -> void:
	set_process(true)

func _process(delta: float) -> void:
	time_left -= delta
	if time_left <= 0.0:
		time_left = 0.0
		_update_labels()
		set_process(false)
		countdown_finished.emit()
		return

	_update_labels()

func _update_labels() -> void:
	var secs := int(time_left)
	var millis := int((time_left - secs) * 100)

	seconds_label.text = str(secs).pad_zeros(2)
	millis_label.text = str(millis).pad_zeros(2)
