extends Node2D

# Variable to track the dialogue progression
var state = 0

# Path to the NPC dialogue file
var dialogue_path = "res://dialogue/professeur.json"

func _ready():
	# Set NPC's sprite frame and type
	$PNJ/sprPNJ.frame = 7
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
			get_parent().recompense()  # Perform an action related to the quest
		else:
			$PNJ/Dialogue.next_script()  # Move to the next dialogue script
