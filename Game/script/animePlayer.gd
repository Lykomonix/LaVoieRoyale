extends CharacterBody2D

@export var speed = 150
var sprite
var move

func _ready():
	sprite = load("res://images/persoBase.png")
	$sprPerso.set_texture(sprite)
	move = true
	
func _process(delta):
	if move:
		velocity = Vector2()
		if Input.is_action_pressed("ui_up"):
			velocity.y -= speed
			$animation.play("up")
		elif Input.is_action_pressed("ui_down"):
			velocity.y += speed
			$animation.play("down")
		elif Input.is_action_pressed("ui_right"):
			velocity.x += speed
			$animation.play("right")
		elif Input.is_action_pressed("ui_left"):
			velocity.x -= speed
			$animation.play("left")
		else:
			$animation.play("stay")
		move_and_slide()

func player():
	pass
