extends Control

# Signal emitted when the dialogue is finished
signal dialogue_finished

# Variable to export and select a dialogue JSON file
@export_file("*.json") var d_file

var dialogue_path # = "res://dialogue/paysan.json" 
var dialogue = []
var current_dialogue_id = 0
var d_active = false

func _ready():
	$NinePatchRect.visible = false

# Function to start the dialogue at a specific index
func start(index):
	if d_active:
		next_script()
		return
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue(index)
	current_dialogue_id = -1
	next_script()

# Function to load dialogue content from a JSON file at a specific index
func load_dialogue(index):
	print(index)
	var file = FileAccess.open(dialogue_path, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	file.close()
	if index < len(content):
		return content[index]
	else:
		return content[-1]

# Function to handle input during the dialogue
func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		return

# Function to proceed to the next dialogue script
func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		d_active = false
		print(get_parent().get_parent().name)
		if get_parent().get_parent().state == 0 or get_parent().get_parent().state == 2 :
			get_parent().get_parent().state += 1
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		current_dialogue_id = -1
		return

	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]['text']
