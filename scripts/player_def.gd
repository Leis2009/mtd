extends CharacterBody3D

@export var speed = 15

@export var gravity = 75

var velo = Vector3.ZERO

func _physics_process(delta: float) -> void:
	
	var direction = Vector3.ZERO
	
	# In die jeweilige Richtung bewegen
	if Input.is_action_pressed("move_forwards"):
		direction.x +=1
	elif Input.is_action_pressed("move_backwards"):
		direction.x -=1
	elif Input.is_action_pressed("move_left"):
		direction.z -=1
	elif Input.is_action_pressed("move_right"):
		direction.z +=1
		
	# damit man nicht diagonal schneller ist
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	# Ground velocity
	velo.x = direction.x * speed
	velo.z = direction.z * speed
	
	# Gravität anwenden 
	if not is_on_floor():
		velo.y -= gravity * delta
	
	# Spieler bewegen
	velocity = velo
	move_and_slide()
