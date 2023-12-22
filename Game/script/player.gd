extends CharacterBody2D

# Speed of the character
var speed = 300

func _ready():
	pass  # No initialization required in this context, so the function is empty

func _process(delta):
	velocity = Vector2()  # Reset the character's movement velocity every frame
	
	# Check input actions for movement and update velocity accordingly
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed  # Move upward (negative y-axis direction)
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed  # Move downward (positive y-axis direction)
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed  # Move to the right (positive x-axis direction)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed  # Move to the left (negative x-axis direction)
	
	move_and_slide()  # Apply the calculated velocity to move the character, ensuring collision handling
