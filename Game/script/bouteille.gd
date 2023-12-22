extends Node2D

# Function called when the button is pressed
func _on_button_pressed():
	# Check the state of the "tavernier" node
	if get_parent().get_node("tavernier").state == 1:
		# Change the state of the "tavernier" node to 2
		get_parent().get_node("tavernier").state = 2
		# Print a message to the console
		print("Yo")
		# Hide the current node
		visible = false
