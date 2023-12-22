extends Sprite2D

# Detects mouse input events when the player is in the chat zone
func _input(event):
	# Checks if the player is in the chat zone and if the left mouse button is pressed
	if get_parent().player_in_chat_zone and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Checks if the mouse click is within the viewport
		if get_viewport_rect().has_point(to_local(event.position)):
			# Prints the name of the selected sprite
			print("You selected:", self.name)
			# Sets a flag in the parent indicating the need to start an action
			get_parent().to_start = true
