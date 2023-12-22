extends Node2D

# Variable to track the dialogue progression
var state = 0

# Path to the NPC dialogue file
var dialogue_path = "res://dialogue/roi.json"

func _ready():
	# Set NPC's sprite frame and type
	$PNJ/sprPNJ.frame = 0
	$PNJ.set_type(1)
	# Set the dialogue path for the NPC's dialogue box
	$PNJ/Dialogue.dialogue_path = dialogue_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Set the dialogue index for the NPC's dialogue box
	$PNJ.dialogue_index = state
	
	# Check for player interaction in the chat zone
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		print("state : ", state)
		if state == 0:
			print("Starting quest")
			$PNJ/Dialogue.next_script()
			state += 1
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("Going on the quest")
			
		else:
			$PNJ/Dialogue.next_script()
			get_parent().finAlliance()  # Perform an action to end or progress the quest
