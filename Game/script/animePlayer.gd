extends CharacterBody2D

# Speed variable determines the movement speed of the character
@export var speed = 150

# Variable to hold the sprite image
var sprite
# Variable to control movement
var move

# Function called when the scene is loaded
func _ready():
	# Load the character's sprite image from the specified path
	sprite = load("res://images/persoBase.png")
	# Set the loaded sprite as the texture for the character's sprite node
	$sprPerso.set_texture(sprite)
	# Enable movement by default
	move = true

# Function called every frame
func _process(delta):
	if move:
		# Reset the character's velocity
		velocity = Vector2()

		# Check for input actions to move the character and play corresponding animations
		if Input.is_action_pressed("ui_up"):
			velocity.y -= speed
			$animation.play("up")
		elif Input.is_action_pressed("ui_down"):
			velocity.y += speed
			$animation.play("down")
		elif Input.is_action_pressed("ui_right"):
			velocity.x += speed
			$animation.play("right")
		elif Input.is_action_pressed("ui_left"):
			velocity.x -= speed
			$animation.play("left")
		else:
			# If no movement keys are pressed, play idle animation
			$animation.play("stay")

		# Move the character based on the calculated velocity and handle collision
		move_and_slide()

# Placeholder function for player-specific actions or interactions
func player():
	pass
