extends CharacterBody2D
class_name Jugador
	
signal vida_cambiada(nueva_vida)
	
var _velocidad:float = 400.0
var _vida:int = 6	
				
var _escena_laser = preload("res://laser_Disparo/laserdisparo.tscn")
	
func _physics_process(delta):
	var direccion_x = Input.get_axis("laA", "laD")
	var direccion_y = Input.get_axis("laW", "laS")	
					
	velocity.x = direccion_x * _velocidad	
	velocity.y = direccion_y * _velocidad		
					
	move_and_slide()		
					
	if Input.is_action_just_pressed("ui_accept"):	
		_disparar()
					
func _disparar():		
	var laser_1 = _escena_laser.instantiate()
	laser_1.global_position = $disparo.global_position
	get_parent().add_child(laser_1)			
					
	var laser_2 = _escena_laser.instantiate()
	
	laser_2.global_position = $disparo2.global_position 			
	get_parent().add_child(laser_2)			
							
func _recibir_danio(cantidad:int):
	_vida -= cantidad			
	print("Vida actual del jugador: ", _vida)	
	vida_cambiada.emit(_vida)
				
	if _vida <= 0:				
		get_tree().change_scene_to_file("res://game_over/game_over.tscn")
