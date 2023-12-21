extends Node2D

var state = 0

var dialogue_path = "res://dialogue/mamie.json"

func _ready():
	$PNJ/sprPNJ.frame = 8
	$PNJ.set_type(2)
	$PNJ/Dialogue.	dialogue_path = dialogue_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PNJ.dialogue_index=state
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		print("state : ",state)
		if state == 0:
			print("début quête")
			$PNJ/Dialogue.next_script()
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("va faire la quete")
			get_parent().ajouteItem()
			state +=1
		else:
			$PNJ/Dialogue.next_script()
