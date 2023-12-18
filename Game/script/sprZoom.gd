extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if frame == 0:
				get_parent().get_parent().get_node("player/Camera").enabled = false
				get_parent().get_parent().get_node("player/sprHere").visible = true
				frame = 1
			else:
				get_parent().get_parent().get_node("player/Camera").enabled = true
				get_parent().get_parent().get_node("player/sprHere").visible = false
				frame = 0
