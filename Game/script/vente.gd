extends ColorRect

var choix = 1
var focus = false
var vendeur

func _process(delta):
	if focus:
		if vendeur == "notaire":
			if Input.is_action_just_pressed("ui_up") and choix != 1:
				choix-=1
				changePos()
			if Input.is_action_just_pressed("ui_down") and choix != 3:
				choix+=1
				changePos()
		else:
			if Input.is_action_just_pressed("ui_up") and choix != 1:
				choix-=1
				changePos()
			if Input.is_action_just_pressed("ui_down") and choix != 2:
				choix+=1
				changePos()
		if Input.is_action_just_pressed("ui_accept"):
			check()
		
func changePos():
	if vendeur == "notaire":
		match choix:
			1:
				$lblChoice.position = Vector2(40,96)
			2:
				$lblChoice.position = Vector2(96,240)
			3:
				$lblChoice.position = Vector2(216,320)
	else:
		match choix:
			1:
				$lblChoice.position = Vector2(128,168)
			2:
				$lblChoice.position = Vector2(216,320)
				
func check():
	if vendeur == "notaire":
		match choix:
			1:
				if get_parent().get_parent().argent >= 20:
					get_parent().get_parent().finAchatTitre()
			2:
				if get_parent().get_parent().argent >= 20:
					get_parent().get_parent().finPossession("notaire")
	else:
		if choix == 1 and get_parent().get_parent().argent >= 10:
			get_parent().get_parent().finPossession("arnaqueur")

func vente(personne):
	get_parent().get_parent().get_node("player").move = false
	vendeur = personne
	choix = 1
	changePos()
	if personne == "notaire":
		$lblLake.visible = false
		$lblFarm.visible = true
		$lblNoble.visible = true
	else:
		$lblFarm.visible = false
		$lblNoble.visible = false
		$lblLake.visible = true
	
