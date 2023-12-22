extends Node2D

# Called when a button is pressed
func _on_button_pressed():
	# Checks if the 'paysan' node's state is 1
	if get_parent().get_node("paysan").state == 1:
		# Updates the 'paysan' node's state to 2
		get_parent().get_node("paysan").state = 2
		print("Yo")  # Prints "Yo" to the console
		visible = false  # Hides the node
