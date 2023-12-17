extends CanvasLayer

func _ready():
	self.visible = true
	$item/perso/sprperso.set_texture(get_parent().get_node("player").sprite)

