extends Area2D
class_name EspadaArrojada
	
var _velocidad:float = 900.0
var direccion:Vector2 = Vector2.ZERO
	
func _process(delta):
	position += direccion * _velocidad * delta
		
	rotation += 15.0 * delta 
		
	if position.x < -1000 or position.x > 3000 or position.y < -1000 or position.y > 3000:	
		queue_free()	
				
func _on_body_entered(body):
	if body is JugadorFinal:	
		if body.has_method("_recibir_danio"):
			body._recibir_danio(3) 	
			queue_free()	
		
