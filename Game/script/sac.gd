extends Sprite2D

var sfx
func _ready():
	sfx = load("res://images/homme.wav")
	get_parent().get_node("son").stream = sfx

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if get_parent().get_node("item").visible:
				get_parent().get_node("item").visible = false
				self.frame = 0
			else:
				get_parent().get_node("item").visible = true
				self.frame = 1
				get_parent().get_node("son").play()
			
