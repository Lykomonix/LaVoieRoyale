extends CharacterBody2D

# The path to the dialogue file
@onready var dialogue_path
# Variables to manage dialogue and player interaction
var player
var player_in_chat_zone = false
var to_start = false
# Random number generator for rewards
var rng = RandomNumberGenerator.new()
# Type of dialogue interaction
var type

# Index for dialogue progress
var dialogue_index = 0

func _ready():
	$Dialogue.dialogue_path = dialogue_path

# Process function to check player input and initiate dialogue
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_chat_zone:
		to_start = true
	if to_start:
		$Dialogue.start(dialogue_index)
		to_start = false

# Detect when the dialogue body enters the interaction zone
func _on_dialogue_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		if type != 0:
			$sprQuest.frame = 1

# Detect when the dialogue body exits the interaction zone
func _on_dialogue_body_exited(body):
	$Dialogue/NinePatchRect.visible = false
	print(type)
	if body.has_method("player"):
		player_in_chat_zone = false
		if type == 1:
			$sprQuest.frame = 0
		elif type == 2:
			$sprQuest.frame = 2

# Function to reward based on chance
func recompense():
	if(rng.randi_range(1, 100) < 80):
		get_parent().ajouteItem()  # Add an item as a reward
	else:
		get_parent().ajouteArgent()  # Add money as a reward

# Function to set the type of interaction
func set_type(type):
	self.type = type
	if type == 0:
		$sprQuest.visible = false
	elif type == 1:
		$sprQuest.frame = 0
	elif type == 2:
		$sprQuest.frame = 2
