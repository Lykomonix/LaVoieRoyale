extends Node2D

var state = 0

var dialogue_path = "res://dialogue/paysan.json"

func _ready():
	$PNJ/sprPNJ.frame = 5
	$PNJ.set_type(2)
	$PNJ/Dialogue.	dialogue_path = dialogue_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PNJ.dialogue_index=state
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		if state == 0:
			print("début quête")
			$PNJ/Dialogue.next_script()
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("va faire la quete")
		elif state == 2:
			$PNJ/Dialogue.next_script()
			print("Merci pour les clients fidèles")
			get_parent().ajouteItem()
		else:
			$PNJ/Dialogue.next_script()
