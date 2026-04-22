extends Area2D
class_name MisilGuiado
			
var _velocidad:float = 180.0
var _tiempo_vida:float = 20.0
			
func _process(delta):		
	_tiempo_vida -= delta		
	if _tiempo_vida <= 0:		
		queue_free()		
		return	
				
	var jugador = get_parent().get_node_or_null("jugador")
	if jugador != null:		
		var direccion = (jugador.global_position - global_position).normalized()
								
		global_position += direccion * _velocidad * delta		
					
		rotation = direccion.angle()			
	
func _on_body_entered(body):		
	if body is Jugador:		
		if body.has_method("_recibir_danio"):	
			body._recibir_danio(1)	
			queue_free()	
