extends Area2D
class_name Tropa

var _vida:int = 2
var _velocidad:float = 250.0
var posicion_destino:Vector2
var _en_posicion:bool = false

var _escena_laser = preload("res://laser_tropa/laser_tropa.tscn")
signal destruida

func _process(delta):
	if _en_posicion == false:
		var distancia = global_position.distance_to(posicion_destino)
		
		if distancia > 5.0:
			var direccion_mov = (posicion_destino - global_position).normalized()
			global_position += direccion_mov * _velocidad * delta
		else:
			_en_posicion = true
			$Timer.start()
							
								
									
func _on_timer_timeout():	
	var jugador = get_parent().get_node_or_null("jugador")		
				
	if jugador != null:	
		for i in range(5):	
			var nuevo_laser = _escena_laser.instantiate()
						
			nuevo_laser.global_position = global_position		
			nuevo_laser.direccion = (jugador.global_position - global_position).normalized()		
			nuevo_laser.rotation = nuevo_laser.direccion.angle()	
					
			get_parent().add_child(nuevo_laser)	
								
			await get_tree().create_timer(0.0999).timeout	
			
func _recibir_danio(cantidad:int):	
	_vida -= cantidad	
	if _vida <= 0:	
		destruida.emit() 	
		queue_free()	
				
					
						
