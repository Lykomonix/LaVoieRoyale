extends CharacterBody2D


@onready var dialogue_path
var player
var player_in_chat_zone = false
var to_start = false
var rng = RandomNumberGenerator.new()
var type = 0

var dialogue_index = 0

func _ready():
	$Dialogue.dialogue_path = dialogue_path

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_chat_zone:
		to_start = true
	if to_start:
		$Dialogue.start(dialogue_index)
		to_start = false

func _on_dialogue_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		if(type != 0):
			$sprQuest.frame = 1


func _on_dialogue_body_exited(body):
	$Dialogue/NinePatchRect.visible = false
	if body.has_method("player"):
		player_in_chat_zone = false
		if type == 1:
			$sprQuest.frame = 0
		elif type == 2:
			$sprQuest.frame = 2
		
func recompense():
	if(rng.randi_range(1, 100) < 80):
		get_parent().ajouteItem()
	else:
		get_parent().ajouteArgent()

func set_type(type = 0):
	self.type = type
	if type == 0:
		$sprQuest.visible = false
	elif type == 1:
		$sprQuest.frame = 0
	elif type == 2:
		$sprQuest.frame = 2
