extends Node2D

var choix = 1


func _process(delta):
	if Input.is_action_just_pressed("ui_up") and choix != 1:
		choix-=1
		changePos()
	if Input.is_action_just_pressed("ui_down") and choix != 2:
		choix+=1
		changePos()
	if Input.is_action_just_pressed("ui_accept"):
		check()

func changePos():
	match choix:
		1:
			$zoneText/lblChoix.position = Vector2(672,864)
		2:
			$zoneText/lblChoix.position = Vector2(832,960)
			
func check():
		match choix:
			1:
				get_parent().Accueil()
			2:
				get_tree().quit()
