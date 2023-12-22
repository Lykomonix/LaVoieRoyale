extends Node2D

# Path to the dialogue file for the NPC
var dialogue_path = "res://dialogue/arnaqueur.json"

# Function called when the scene is ready
func _ready():
	# Set the NPC sprite frame to 2
	$PNJ/sprPNJ.frame = 2
	# Set the dialogue path for the NPC's dialogue box
	$PNJ/Dialogue.dialogue_path = dialogue_path

# Function called every frame
func _process(_delta):
	# Check for player interaction and handle the dialogue window visibility
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and !get_parent().get_node("HUD/vente").visible:
		# Open the "vente" window for the "arnaqueur" NPC
		get_parent().get_node("HUD/vente").vente("arnaqueur")
		get_parent().get_node("HUD/vente").visible = true
		get_parent().get_node("HUD/vente").focus = true
	elif Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and get_parent().get_node("HUD/vente").visible:
		# Close the "vente" window
		get_parent().get_node("HUD/vente").visible = false
		get_parent().get_node("HUD/vente").focus = false
		get_parent().get_node("player").move = true
