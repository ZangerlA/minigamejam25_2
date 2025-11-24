extends Node

enum GameState {
	WAITING_TO_START,
	PLAYING,
	GAME_OVER
}

var current_state: GameState = GameState.WAITING_TO_START
var mazes_completed: int = 0
var current_button: Button = null  # Track which button was pressed

@export var timer_component: Node2D
@export var keypad: Node2D

func _ready() -> void:
	if timer_component and timer_component.has_signal("countdown_finished"):
		timer_component.countdown_finished.connect(_bomb_timer_timout)
	
	if keypad:
		_connect_keypad_buttons()


func _connect_keypad_buttons() -> void:
	for child in keypad.get_children():
		if child is Button:
			child.pressed.connect(_on_keypad_button_pressed.bind(child))


func _on_keypad_button_pressed(button: Button) -> void:
	if current_state == GameState.WAITING_TO_START:
		start_game()
	
	if current_state != GameState.PLAYING:
		return
	
	current_button = button
	get_tree().change_scene_to_file("res://Scenes/maze_1.tscn")
	

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		if current_state == GameState.WAITING_TO_START:
			start_game()


func start_game() -> void:
	current_state = GameState.PLAYING
	mazes_completed = 0

	if timer_component:
		timer_component.start_countdown()


func game_over() -> void:
	current_state = GameState.GAME_OVER
	
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://game_over.tscn")


func on_maze_solved(button_index: int = -1) -> void:
	if current_state != GameState.PLAYING:
		return
	
	mazes_completed += 1
	
	if button_index >= 0 and keypad:
		var buttons = keypad.get_children()
		if button_index < buttons.size() and buttons[button_index].has_method("setDone"):
			buttons[button_index].setDone()
	
	if timer_component:
		timer_component.reset_timer()
		timer_component.start_countdown()
	

func on_maze_failed() -> void:
	if current_state != GameState.PLAYING:
		return
	

func _bomb_timer_timout() -> void:
	if current_state == GameState.PLAYING:
		game_over()
