extends CharacterBody3D

@export var move_speed: float = 10.0
@export var turn_speed: float = 3.0

func _physics_process(delta: float):
	var rotation_input = 0.0
	var vertical_velocity
	
	#move personagem
	if Input.is_action_pressed("move_right"):
		rotation_input -= 1.0
	if Input.is_action_pressed("move_left"):
		rotation_input += 1.0

	global_rotation.y += rotation_input * turn_speed * delta
	var move_vector = Vector3.ZERO
	
	#move e calcula velocidade
	if Input.is_action_pressed("move_up"):
		var forward_vector = transform.basis.z 
		move_vector = forward_vector * move_speed

	
	vertical_velocity = velocity.y
	
	vertical_velocity -= 1
	print(vertical_velocity)
	#aplicando movimentacao	
	velocity = move_vector
	velocity.y = vertical_velocity
	
	move_and_slide()
