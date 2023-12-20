extends Node2D

var window

func _ready():
	window = load("res://scene/windowStart.tscn").instantiate()
	add_child(window)
		
		
func nouvellePartie():
	window.queue_free()
	window = preload("res://scene/windowPlay.tscn").instantiate()
	add_child(window)

func credits():
	window.queue_free()
	window = preload("res://scene/windowCredits.tscn").instantiate()
	add_child(window)

func Accueil():
	window.queue_free()
	window = preload("res://scene/windowStart.tscn").instantiate()
	add_child(window)

func gagne(text = null):
	window.queue_free()
	window = preload("res://scene/windowWin.tscn").instantiate()
	add_child(window)
	if(text != null):
		$windowWin/zoneText/lblDescription.text = text
	
func perdu(text = null):
	window.queue_free()
	window = preload("res://scene/windowLose.tscn").instantiate()
	add_child(window)
	if(text != null):
		$windowLose/zoneText/lblDescription.text = text
