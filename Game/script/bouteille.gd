extends Node2D

func _on_button_pressed():
	if get_parent().get_node("tavernier").state == 1:
		get_parent().get_node("tavernier").state = 2
		print("Yo")
		visible=false
