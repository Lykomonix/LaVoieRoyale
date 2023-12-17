extends CharacterBody2D

var player
var player_in_chat_zone = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_chat_zone:	
		var my_random_number = get_parent().rng.randi_range(0, 5)
		match my_random_number:
			0:
				if(!get_parent().possede("épée")):
					get_parent().ajouteItem("épée")
				else:
					get_parent().ajouteArgent()
			1:
				if(!get_parent().possede("chapeau")):
					get_parent().ajouteItem("chapeau")
				else:
					get_parent().ajouteArgent()
			2:
				if(!get_parent().possede("chemise")):
					get_parent().ajouteItem("chemise")
				else:
					get_parent().ajouteArgent()
			3:
				if(!get_parent().possede("cape")):
					get_parent().ajouteItem("cape")
				else:
					get_parent().ajouteArgent()
			4:
				if(!get_parent().possede("pantalon")):
					get_parent().ajouteItem("pantalon")
				else:
					get_parent().ajouteArgent()
			5:
				if(!get_parent().possede("bottes")):
					get_parent().ajouteItem("bottes")
				else:
					get_parent().ajouteArgent()

func _on_dialogue_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		$sprQuest.frame = 1


func _on_dialogue_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
		$sprQuest.frame = 0
