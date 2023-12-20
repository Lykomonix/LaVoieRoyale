extends CharacterBody2D

var player
var player_in_chat_zone = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_chat_zone:	
		match get_parent().inventaire.size():
			0:
				get_parent().ajouteItem("épée")
			1:
				get_parent().ajouteItem("pantalon")
			2:
				get_parent().ajouteItem("bottes")
			3:
				get_parent().ajouteItem("chemise")
			4:
				get_parent().ajouteItem("cape")
			5:
				get_parent().ajouteItem("chapeau")

func _on_dialogue_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		$sprQuest.frame = 1


func _on_dialogue_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
		$sprQuest.frame = 0
		

