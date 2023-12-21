extends Node2D


var dialogue_path = "res://dialogue/notaire.json"
func _ready():
	$PNJ/sprPNJ.frame = 3
	$PNJ/Dialogue.	dialogue_path = dialogue_path

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and !get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").vente("notaire")
		get_parent().get_node("HUD/vente").visible = true
		get_parent().get_node("HUD/vente").focus = true
	elif Input.is_action_just_pressed("ui_accept") and $PNJ.player_in_chat_zone and get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").visible = false
		get_parent().get_node("HUD/vente").focus = false
		get_parent().get_node("player").move = true
