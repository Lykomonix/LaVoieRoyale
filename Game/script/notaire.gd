extends Node2D

# Path to the NPC dialogue file
var dialogue_path = "res://dialogue/notaire.json"

func _ready():
	# Set NPC's sprite frame and dialogue path
	$PNJ/sprPNJ.frame = 3
	$PNJ/Dialogue.dialogue_path = dialogue_path

func _process(delta):
	# Check for player interaction in the chat zone
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone:
		if !get_parent().get_node("HUD/vente").visible:
			# Perform actions when chat window is not visible
			get_parent().get_node("HUD/vente").vente("notaire")
			get_parent().get_node("HUD/vente").visible = true
			get_parent().get_node("HUD/vente").focus = true
		else:
			# Perform actions when chat window is visible
			get_parent().get_node("HUD/vente").visible = false
			get_parent().get_node("HUD/vente").focus = false
			get_parent().get_node("player").move = true
