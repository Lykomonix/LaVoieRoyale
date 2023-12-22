extends Node2D

# Variable to store the current window
var window

# Function called when the node is ready
func _ready():
	# Load and instantiate the start window
	window = load("res://scene/windowStart.tscn").instantiate()
	add_child(window)
		
# Function to start a new game
func nouvellePartie():
	# Free the current window
	window.queue_free()
	# Load and instantiate a new game window
	window = load("res://scene/windowTest.tscn").instantiate()
	add_child(window)

# Function to display the credits
func credits():
	# Free the current window
	window.queue_free()
	# Load and instantiate the credits window
	window = load("res://scene/windowCredits.tscn").instantiate()
	add_child(window)

# Function to go back to the main menu
func Accueil():
	# Free the current window
	window.queue_free()
	# Load and instantiate the start window
	window = load("res://scene/windowStart.tscn").instantiate()
	add_child(window)

# Function to display the win screen
func gagne(text = null):
	# Free the current window
	window.queue_free()
	# Load and instantiate the win window
	window = load("res://scene/windowWin.tscn").instantiate()
	add_child(window)
	# Display customized text if provided
	if text != null:
		$windowWin/zoneText/lblDescription.text = text
	
# Function to display the lose screen
func perdu(text = null):
	# Free the current window
	window.queue_free()
	# Load and instantiate the lose window
	window = load("res://scene/windowLose.tscn").instantiate()
	add_child(window)
	# Display customized text if provided
	if text != null:
		$windowLose/zoneText/lblDescription.text = text
