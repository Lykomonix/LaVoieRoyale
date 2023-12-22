extends Node2D

# Variable to track the dialogue progression
var state = 0

# Path to the NPC dialogue file
var dialogue_path = "res://dialogue/maire.json"

func _ready():
	# Set NPC's sprite and type
	$PNJ/sprPNJ.frame = 9
	$PNJ.set_type(2)
	# Set the dialogue path for the NPC's dialogue box
	$PNJ/Dialogue.dialogue_path = dialogue_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Access the parent's inventory
	var inventory = get_parent().inventaire
	
	# Check if inventory size is greater than 3
	if inventory.size() > 3:
		state = 1
	
	# Set the dialogue index for the NPC's dialogue box
	$PNJ.dialogue_index = state
	
	# Check for player interaction in the chat zone
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		if state == 0:
			print("Starting quest")
			$PNJ/Dialogue.next_script()
			state -= 1  # Adjusting state for quest start
		elif state == 1:
			$PNJ/Dialogue.next_script()
			print("Going on the quest")
			get_parent().ajouteItem()  # Add item for quest completion
		else:
			$PNJ/Dialogue.next_script()
			print("Thanks for loyal customers")  # Dialogue for completed quest or conversation end
