extends ColorRect

var choix = 1  # Variable to track the choice
var focus = false  # Flag to determine focus
var vendeur  # Variable to hold the seller's name

# Called every frame
func _process(delta):
	if focus:
		# Conditionally handle key presses based on the seller
		if vendeur == "notaire":
			# Logic for key presses when interacting with 'notaire'
			# Handles up/down key presses to change 'choix'
			if Input.is_action_just_pressed("ui_up") and choix != 1:
				choix -= 1
				changePos()
			if Input.is_action_just_pressed("ui_down") and choix != 3:
				choix += 1
				changePos()
		else:
			# Logic for key presses when interacting with other sellers
			# Handles up/down key presses to change 'choix'
			if Input.is_action_just_pressed("ui_up") and choix != 1:
				choix -= 1
				changePos()
			if Input.is_action_just_pressed("ui_down") and choix != 2:
				choix += 1
				changePos()
		# Executes 'check()' when 'ui_accept' key is pressed
		if Input.is_action_just_pressed("ui_accept"):
			check()

# Function to change the position of 'lblChoice' based on 'vendeur' and 'choix'
func changePos():
	# Logic to position 'lblChoice' based on 'vendeur' and 'choix'
	# Positions are determined based on the seller
	# Updates 'lblChoice' position accordingly
	# (The actual positions are assigned based on 'vendeur' and 'choix')
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

# Function to check and perform actions based on the seller and 'choix'
func check():
	# Logic to check conditions based on 'vendeur' and 'choix'
	# Executes different actions based on the seller and 'choix'
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

# Function to initiate the selling process based on the seller
func vente(personne):
	# Initiates the selling process based on the seller ('personne')
	# Sets initial values and visibility based on the seller
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



