extends Node2D

var state = 0

var dialogue_path = "res://dialogue/roi.json"

func _ready():
	$PNJ/sprPNJ.frame = 0
	$PNJ.set_type(2)
	$PNJ/Dialogue.dialogue_path = dialogue_path
	
func _process(delta):
	$PNJ.dialogue_index=state
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		print("state : ",state)
		if state == 0:
			print("début quête")
			$PNJ/Dialogue.next_script()
			state += 1
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("va faire la quete")
			state +=1
		else:
			$PNJ/Dialogue.next_script()
			get_parent().finAlliance()
