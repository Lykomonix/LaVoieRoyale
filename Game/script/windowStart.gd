extends Node2D

var choix = 1  # Choice variable initially set to 1

func _process(delta):
	# Processes input for menu navigation
	if Input.is_action_just_pressed("ui_up") and choix != 1:
		choix -= 1
		changePos()
	if Input.is_action_just_pressed("ui_down") and choix != 3:
		choix += 1
		changePos()
	if Input.is_action_just_pressed("ui_accept"):
		check()

func changePos():
	# Changes the position of a label based on the current choice
	match choix:
		1:
			$zoneText/lblChoix.position = Vector2(736, 768)
		2:
			$zoneText/lblChoix.position = Vector2(832, 864)
		3:
			$zoneText/lblChoix.position = Vector2(832, 960)

func check():
	# Executes different actions based on the current choice
	match choix:
		1:
			get_parent().nouvellePartie()  # Starts a new game
		2:
			get_parent().credits()  # Shows the credits
		3:
			get_tree().quit()  # Quits the game
