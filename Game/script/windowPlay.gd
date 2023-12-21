extends Node2D

var prestige = 0
var inventaire = []
var argent = 0
var rng = RandomNumberGenerator.new()

func _ready():
	finNaissance()
	setPNJ()

func _process(delta):
	$HUD/prestige.value = prestige
	$HUD/lbl_argent.text = str(argent)
	if Input.is_key_pressed(KEY_A):
		get_parent().gagne()
	if Input.is_key_pressed(KEY_E):
		get_parent().perdu()

func ajouteItem():
	var item
	match inventaire.size():
		0:
			item = "épée"
			$HUD/item/sprepee.frame -= 1
		1:
			item = "pantalon"
			$HUD/item/sprpantalon.frame -= 1
			$player.sprite = load("res://images/persoPantalon.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		2:
			item = "bottes"
			$HUD/item/sprbottes.frame -= 1
			$player.sprite = load("res://images/persoBottes.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		3:
			item = "chemise"
			$HUD/item/sprchemise.frame -= 1
			$player.sprite = load("res://images/persoChemise.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		4:
			item = "cape"
			$HUD/item/sprcape.frame -= 1
			$player.sprite = load("res://images/persoCape.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		5:
			item = "chapeau"
			$HUD/item/sprchapeau.frame -= 1
			$player.sprite = load("res://images/persoChapeau.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
	if(inventaire.size() <6):
		inventaire.append(item)
		print("+1 %s" % item)
		prestige += 15
		
func ajouteArgent():
	var gain = rng.randi_range(1, 10)
	print("+%d argent" % gain)
	argent += gain

func setPNJ():
#	set image perso
	$roi/sprPNJ.frame = 0
	$princesse/sprPNJ.frame = 1
	$arnaqueur/sprPNJ.frame = 2
	$notaire/sprPNJ.frame = 3
	$enfant/sprPNJ.frame = 4
	$paysan/sprPNJ.frame = 5
	$tavernier/sprPNJ.frame = 6
	$professeur/sprPNJ.frame = 7
	$mamie/sprPNJ.frame = 8
	$maire/sprPNJ.frame = 9
	$pecheur/sprPNJ.frame = 10
#	set le type
	$roi.set_type(1)
	$princesse.set_type()
	$arnaqueur.set_type(1)
	$notaire.set_type(1)
	$enfant.set_type(1)
	$paysan.set_type(2)
	$tavernier.set_type(2)
	$professeur.set_type(2)
	$mamie.set_type(2)
	$maire.set_type(2)
	$pecheur.set_type(2)

func finAlliance():
	var ranNumber = rng.randi_range(1, 100)
	if ranNumber < prestige:
		get_parent().gagne("Vous avez eu l'autorisation d'épousez la princesse, victoire par alliance")
	else:
		get_parent().perdu("Vous avez fait peur à la princesse et le roi vous a envoyé en prison")
	
func finPossession(vendeur):
	if vendeur == "notaire":
		get_parent().gagne("Vous avez acheter la taverne, victoire par possession")
	else:

		get_parent().perdu("Vous avez acheter un lac qui n'a pas de valeur")
	
func finNaissance():
	var ranNumber = rng.randi_range(1, 100)
	if(ranNumber <= 2):
		get_parent().gagne("Vous êtes le fils ou la fille du roi, victoire par Naissance")
	elif(ranNumber <= 4):
		get_parent().perdu("Vous êtes une fille, vous ne pouvez donc pas devenir noble")
	
func finAchatTitre():
	get_parent().gagne("Vous avez acheté un titre de noblesse, victoire par Achat de titre")
		
func finMaire():
	var ranNumber = rng.randi_range(1, 100)
	if ranNumber < prestige:
		get_parent().gagne("Vous êtes le nouveau maire d'Amboise, victoire par Maire")
	else:
		get_parent().perdu("Vous avez perdu le vote, le nouveau maire vous envoie en prison")
