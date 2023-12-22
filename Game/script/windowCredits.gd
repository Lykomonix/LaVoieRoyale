extends Node2D

# Called every frame
func _process(delta):
	# Checks if the 'ui_accept' action is pressed
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().Accueil()  # Calls the 'Accueil()' function from the parent node
