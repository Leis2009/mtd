extends CharacterBody3D

@export var speed = 3

@export var mouse_sensitivity = 0.0015 

var velo = Vector3.ZERO

func _physics_process(delta: float) -> void:
	
	var direction = Vector3.ZERO
	
	# In die jeweilige Richtung bewegen
	if Input.is_action_pressed("move_forwards"):
		print('nach vorne bewegen')
		direction.x +=1
	elif Input.is_action_pressed("move_backwards"):
		print('nach hinten bewegen')
		direction.x -=1
	elif Input.is_action_pressed("move_left"):
		print('nach links bewegen')
		direction.z -=1
	elif Input.is_action_pressed("move_right"):
		print('nach rechts bewegen')
		direction.z +=1
		
	# damit man nicht diagonal schneller ist
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	# Ground velocity
	velo.x = direction.x * speed
	velo.z = direction.z * speed
	
	# Spieler bewegen
	velocity = velo
	move_and_slide()

#kamera benutzen
func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
