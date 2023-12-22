extends Node2D

# Variable to track the dialogue progression
var state = 0

# Path to the NPC dialogue file
var dialogue_path = "res://dialogue/pecheur.json"

func _ready():
	# Set NPC's sprite frame and type
	$PNJ/sprPNJ.frame = 10
	$PNJ.set_type(2)
	# Set the dialogue path for the NPC's dialogue box
	$PNJ/Dialogue.dialogue_path = dialogue_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Set the dialogue index for the NPC's dialogue box
	$PNJ.dialogue_index = state
	
	# Check for player interaction in the chat zone
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		if state == 0:
			print("Starting quest")
			$PNJ/Dialogue.next_script()
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("Going on the quest")
		elif state == 2:
			$PNJ/Dialogue.next_script()
			print("Thanks for loyal customers")
			get_parent().ajouteItem()
		else:
			$PNJ/Dialogue.next_script()
