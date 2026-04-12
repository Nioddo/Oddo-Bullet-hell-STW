extends CharacterBody2D

var velocidad = 400

func _physics_process(delta):
	var direccion_x = 0
	var direccion_y = 0
	
	if Input.is_action_pressed("ui_right"):
		direccion_x = 1
	if Input.is_action_pressed("ui_left"):
		direccion_x = -1
		
	if Input.is_action_pressed("ui_down"):
		direccion_y = 1
	if Input.is_action_pressed("ui_up"):
		direccion_y = -1
		
	velocity.x = direccion_x * velocidad
	velocity.y = direccion_y * velocidad
	
	move_and_slide()
