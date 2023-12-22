extends Sprite2D

# Detects mouse input events
func _input(event):
	# Checks for left mouse button press
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Checks if the mouse click is within the sprite's area
		if get_rect().has_point(to_local(event.position)):
			# Toggles between two states based on the sprite's frame
			if frame == 0:
				# Disable the 'Camera' and make 'sprHere' visible when frame is 0
				get_parent().get_parent().get_node("player/Camera").enabled = false
				get_parent().get_parent().get_node("player/sprHere").visible = true
				frame = 1  # Update frame to 1
			else:
				# Enable the 'Camera' and hide 'sprHere' when frame is not 0
				get_parent().get_parent().get_node("player/Camera").enabled = true
				get_parent().get_parent().get_node("player/sprHere").visible = false
				frame = 0  # Update frame to 0
