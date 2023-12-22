extends Node2D

# Function called when the button is pressed
func _on_button_pressed():
	# Check the state of the "pecheur" node
	if get_parent().get_node("pecheur").state == 1:
		# Change the state of the "pecheur" node to 2
		get_parent().get_node("pecheur").state = 2
		# Print a message to the console
		print("Yo")
		# Hide the current node
		visible = false
