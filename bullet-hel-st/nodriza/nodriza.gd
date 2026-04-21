extends Area2D
class_name Nodriza
			
var _vida:int = 20	
var _velocidad:float = 100.0
var posicion_destino:Vector2
var _en_posicion:bool = false
			
var _escena_misil = preload("res://disparoguiado/disparoguido.tscn")
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
	var nuevo_misil = _escena_misil.instantiate()
	nuevo_misil.global_position = global_position
						
	get_parent().add_child(nuevo_misil)
					
func _recibir_danio(cantidad:int):
	_vida -= cantidad	
	if _vida <= 0:	
		destruida.emit()	
		queue_free()	
