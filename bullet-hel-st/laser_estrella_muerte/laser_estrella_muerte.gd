extends Area2D
class_name LaserJefe
	
var _velocidad:float = 500.0 
var direccion:Vector2 = Vector2(-1, 0) 
		
func _process(delta):	
	position += direccion * _velocidad * delta		
					
	if position.x < -500 or position.x > 2000 or position.y < -500 or position.y > 1500:		
		queue_free()		
				
func _on_body_entered(body):
	if body is Jugador:			
		if body.has_method("_recibir_danio"):	
			body._recibir_danio(0)			
			queue_free()	
					
			
