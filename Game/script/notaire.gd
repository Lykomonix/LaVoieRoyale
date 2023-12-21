extends Node2D

func _ready():
	$pnj/sprPNJ.frame = 3

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and $pnj.player_in_chat_zone and !get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").vente("notaire")
		get_parent().get_node("HUD/vente").visible = true
		get_parent().get_node("HUD/vente").focus = true
	elif Input.is_action_just_pressed("ui_accept") and $pnj.player_in_chat_zone and get_parent().get_node("HUD/vente").visible:
		get_parent().get_node("HUD/vente").visible = false
		get_parent().get_node("HUD/vente").focus = false
		get_parent().get_node("player").move = true
