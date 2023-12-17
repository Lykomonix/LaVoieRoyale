extends Node2D

var prestige = 0
var inventaire = []
var argent = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	$HUD/prestige.value = prestige
	$HUD/lbl_argent.text = str(argent)

func possede(item):
	for i in range(inventaire.size()):
		if(inventaire[i] == item):
			return true
	return false

func ajouteItem(item):
	inventaire.append(item)
	print("+1 %s" % item)
	prestige += 10
	match item:
		"chapeau":
			$HUD/item/sprchapeau.frame -= 1
		"chemise":
			$HUD/item/sprchemise.frame -= 1
		"pantalon":
			$HUD/item/sprpantalon.frame -= 1
		"bottes":
			$HUD/item/sprbottes.frame -= 1
		"cape":
			$HUD/item/sprcape.frame -= 1
		"épée":
			$HUD/item/sprepee.frame -= 1
	
func ajouteArgent():
	var gain = rng.randi_range(1, 10)
	print("+%d argent" % gain)
	argent += gain
