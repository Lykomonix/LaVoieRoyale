extends Sprite2D

func _input(event):
	if get_parent().player_in_chat_zone and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		
		if get_viewport_rect().has_point(to_local(event.position)):
			print("You selected:", self.name)
			get_parent().to_start = true
