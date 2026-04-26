extends Area2D
class_name Droide
	
var _vida:int = 15 	
var _escena_laser = preload("res://laser_tropa/laser_tropa.tscn")
	
func _on_timer_timeout():
		
	var jugador = get_parent().get_node_or_null("jugador_final")
	if jugador != null:
			
		var nuevo_laser = _escena_laser.instantiate()
		nuevo_laser.global_position = global_position
					
		nuevo_laser.direccion = (jugador.global_position - global_position).normalized()
		nuevo_laser.rotation = nuevo_laser.direccion.angle()
				
		get_parent().add_child(nuevo_laser)
		
func _recibir_danio(cantidad:int):
	_vida -= cantidad
	if _vida <= 0:
		queue_free()
		
		
