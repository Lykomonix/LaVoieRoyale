extends Node2D


var dialogue_path = "res://dialogue/arnaqueur.json"

func _ready():
	$PNJ/sprPNJ.frame = 2
	$PNJ/Dialogue.dialogue_path = dialogue_path
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and !get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").vente("arnaqueur")
		get_parent().get_node("HUD/vente").visible = true
		get_parent().get_node("HUD/vente").focus = true
	elif Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").visible = false
		get_parent().get_node("HUD/vente").focus = false
		get_parent().get_node("player").move = true
