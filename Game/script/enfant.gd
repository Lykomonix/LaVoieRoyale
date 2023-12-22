extends Node2D

# Variable to track the progression of the dialogue
var state = 0

# Path to the dialogue file for the NPC
var dialogue_path = "res://dialogue/enfant.json"

# Function called when the scene is ready
func _ready():
	# Set the NPC sprite frame and type
	$PNJ/sprPNJ.frame = 4
	$PNJ.set_type(1)
	# Set the dialogue path for the NPC's dialogue box
	$PNJ/Dialogue.dialogue_path = dialogue_path

# Function called every frame.
func _process(delta):
	# Set the dialogue index for the NPC's dialogue box
	$PNJ.dialogue_index = state
	
	# Check for player interaction in the chat zone
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		print("state: ", state)
		
		# Dialogue progression based on state
		if state == 0:
			print("Début de la quête")
			$PNJ/Dialogue.next_script()
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("Va faire la quête")
			state += 1
		else:
			$PNJ/Dialogue.next_script()
			get_parent().finMaire()
