# Attach this script to your ball node
extends CharacterBody2D # Or RigidBody2D if you want more physics interactions

# Exports
@export var speed = 400.0

# Node path to your sprite if you need to rotate it
@export var sprite_path = NodePath("../Sprite2D")

var sprite_node: Sprite2D # Variable to hold your sprite node

@export var spawn_marker: Marker2D = null

func _ready():
	# Get the sprite node when the scene is ready
	sprite_node = get_node(sprite_path)
	
	# Handle spawning
	if spawn_marker:
		# Set cursor to spawn marker position
		global_position = spawn_marker.global_position
		
		# Wait a frame for everything to be ready
		await get_tree().process_frame
		
		# Warp mouse to spawn position
		var spawn_global = spawn_marker.global_position
		var viewport = get_viewport()
		var canvas_transform = viewport.get_canvas_transform()
		var screen_position = canvas_transform * spawn_global
		Input.warp_mouse(screen_position)

func _process(delta):
	# Get the global mouse position
	global_position = get_global_mouse_position()

	# Calculate the direction to the mouse
	#var direction = (mouse_position - global_position).normalized()

	# Set the velocity
	#velocity = direction * speed

	# Move the ball
	#move_and_slide()

@export var gameover_scene_path : PackedScene = null
@export var main_menu : PackedScene = null

func _on_area_2d_body_entered(body):
	# 1. Controlla se l'oggetto (body) in collisione è nel Gruppo "finish"
	if body.is_in_group("finish"):
		get_tree().change_scene_to_packed(main_menu)
		
	if body.is_in_group("Wall"):
		# === CASO 2: OGGETTO SENZA TAG "finish" (o qualsiasi altro oggetto) ===
		if main_menu != null:
			get_tree().change_scene_to_packed(gameover_scene_path)
			pass
