# Attach this script to your ball node
extends CharacterBody2D # Or RigidBody2D if you want more physics interactions

# Exports
@export var speed = 400.0

# Node path to your sprite if you need to rotate it
@export var sprite_path = NodePath("../Sprite2D")

var sprite_node: Sprite2D # Variable to hold your sprite node

func _ready():
	# Get the sprite node when the scene is ready
	sprite_node = get_node(sprite_path)

func _process(delta):
	# Get the global mouse position
	global_position = get_global_mouse_position()

	# Calculate the direction to the mouse
	#var direction = (mouse_position - global_position).normalized()

	# Set the velocity
	#velocity = direction * speed

	# Move the ball
	#move_and_slide()
