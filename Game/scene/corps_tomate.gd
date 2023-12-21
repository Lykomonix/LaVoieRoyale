extends StaticBody2D


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_node("Sprite2D").get_rect().has_point(to_local(event.position)):
			if get_parent().get_parent().state == 1:
				get_parent().get_parent().state = 2
				visible = false
				print("Tomate récoltée")
