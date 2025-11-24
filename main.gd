extends Node

enum GameState {
	WAITING_TO_START,
	PLAYING,
	GAME_OVER
}

var current_state: GameState = GameState.WAITING_TO_START
var mazes_completed: int = 0

@export var timer_component: Node2D
@export var keypad: Node2D

func _ready() -> void:
	if timer_component and timer_component.has_signal("countdown_finished"):
		timer_component.countdown_finished.connect(_bomb_timer_timout)
	

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
	
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")


func on_maze_solved() -> void:
	if current_state != GameState.PLAYING:
		return
	
	mazes_completed += 1
	
	if timer_component:
		timer_component.reset_timer()
		timer_component.start_countdown()
	

func on_maze_failed() -> void:
	if current_state != GameState.PLAYING:
		return
	

func _bomb_timer_timout() -> void:
	if current_state == GameState.PLAYING:
		game_over()
