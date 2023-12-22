extends Node2D

var choix = 1  # Variable to track the choice

# Called every frame
func _process(delta):
	# Handles 'ui_up' and 'ui_down' actions to modify 'choix'
	if Input.is_action_just_pressed("ui_up") and choix != 1:
		choix -= 1
		changePos()
	if Input.is_action_just_pressed("ui_down") and choix != 2:
		choix += 1
		changePos()
	# Executes 'check()' when 'ui_accept' action is pressed
	if Input.is_action_just_pressed("ui_accept"):
		check()

# Function to update the position of 'lblChoix' based on 'choix'
func changePos():
	# Matches 'choix' and updates the position of 'lblChoix' accordingly
	match choix:
		1:
			$zoneText/lblChoix.position = Vector2(672, 864)
		2:
			$zoneText/lblChoix.position = Vector2(832, 960)

# Function to execute actions based on 'choix'
func check():
	# Matches 'choix' and executes different actions based on its value
	match choix:
		1:
			get_parent().Accueil()  # Calls the 'Accueil()' function from the parent node
		2:
			get_tree().quit()  # Quits the game
