extends StaticBody2D

# Function called when an input event occurs
func _input(event):
	# Check if the event is a mouse button press (specifically left mouse button)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if the mouse click occurred within the Sprite2D node's area
		if get_node("Sprite2D").get_rect().has_point(to_local(event.position)):
			# Check the state of the parent's parent node
			if get_parent().get_parent().state == 1:
				# Change the state of the parent's parent node to 2
				get_parent().get_parent().state = 2
				# Hide the current node
				visible = false
				# Print a message to the console
				print("Tomate récoltée")
