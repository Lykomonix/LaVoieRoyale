extends Sprite2D

# Detects mouse input events
func _input(event):
	# Checks for left mouse button press
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Checks if the mouse click is within the sprite's area
		if get_rect().has_point(to_local(event.position)):
			# Toggles the visibility of the 'item' node when clicked
			if get_parent().get_node("item").visible:
				get_parent().get_node("item").visible = false
				self.frame = 0  # Set sprite frame to 0 (assuming it's a sprite sheet)
			else:
				get_parent().get_node("item").visible = true
				self.frame = 1  # Set sprite frame to 1 (assuming it's a sprite sheet)
				print(get_parent().get_parent().inventaire)  # Print inventory info or perform an action
