extends CanvasLayer

# Function called when the scene is ready
func _ready():
	# Make this CanvasLayer visible
	self.visible = true
	# Set the texture of the sprite "sprperso" under the path "$item/perso" to the player's sprite
	$item/perso/sprperso.set_texture(get_parent().get_node("player").sprite)
