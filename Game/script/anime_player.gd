extends CharacterBody2D

var speed = 300

func _ready():
	pass
	
func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
		$animation.play("up")
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
		$animation.play("down")
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$animation.play("right")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		$animation.play("left")
	move_and_slide()
