extends Area2D
class_name Nodriza
	
var vida = 1
var velocidad = 200
var posicion_destino = Vector2()
var en_posicion = false
		
var escena_misil = preload("res://disparoguiado/disparoguido.tscn")
signal destruida
		
func _process(delta):		
	if en_posicion == false:			
		var distancia = global_position.distance_to(posicion_destino)		
						
		if distancia > 5:
			var direccion = (posicion_destino - global_position).normalized()	
			global_position += direccion * velocidad * delta	
					
		else:
			en_posicion = true		
			$Timer.start()	
							
func _on_timer_timeout():			
	var nuevo_misil = escena_misil.instantiate()		
							
	nuevo_misil.global_position = global_position			
	get_parent().add_child(nuevo_misil)	
							
func _recibir_danio(cantidad):
	vida -= cantidad		
	if vida <= 0:		
		destruida.emit()		
		get_tree().call_group("misiles_nodriza", "queue_free")
		queue_free()		
