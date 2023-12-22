extends Node2D

# Variable to track the current choice (initial choice is 1)
var choix = 1

# Function called continuously every frame
func _process(delta):
	# Check for input to move the selection up if the current choice is not 1
	if Input.is_action_just_pressed("ui_up") and choix != 1:
		choix -= 1
		changePos()
	
	# Check for input to move the selection down if the current choice is not 3
	if Input.is_action_just_pressed("ui_down") and choix != 3:
		choix += 1
		changePos()
	
	# Check for input to confirm the selection
	if Input.is_action_just_pressed("ui_accept"):
		check()

# Function to change the position of the selection indicator based on the current choice
func changePos():
	match choix:
		1:
			$vente/Selection.position = Vector2(117, 120)
		2:
			$vente/Selection.position = Vector2(117, 190)
		3:
			$vente/Selection.position = Vector2(117, 237)

# Function to perform actions based on the selected choice
func check():
	match choix:
		1:
			get_parent().nouvellePartie()  # Start a new game
		2:
			get_parent().credits()  # Show credits
		3:
			get_tree().quit()  # Quit the game
