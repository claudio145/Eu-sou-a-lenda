extends CharacterBody2D

const SPEED = 300.0
var direção = Vector2(1,0)
var bala = preload("res://Scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_pressed("ir_direita"):
		velocity.x = SPEED
		velocity.y = 0
		direção = Vector2(1,0)
	elif Input.is_action_pressed("ir_esquerd"):
		velocity.x = -SPEED
		velocity.y=0
		direção = Vector2(-1,0)
	else:
		velocity.x=0
	if Input.is_action_pressed("ir_frente"):
		velocity.y = -SPEED
		velocity.x = 0
		direção = Vector2(0,-1)
	elif Input.is_action_pressed("ir_tras"):
		velocity.y = SPEED
		velocity.x=0
		direção = Vector2(0,1)
	else:
		velocity.y=0
	if Input.is_action_just_pressed("atirar"):
		atirar()

	move_and_slide()

func atirar():
	var projetil = bala.instantiate()

	get_parent().add_child(projetil)

	projetil.global_position = global_position
	projetil.direction = direção
