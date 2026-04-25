extends Area2D
class_name LaserJugadorFinal
	
var _velocidad:float = 800.0
var direccion:Vector2 = Vector2.ZERO
	
func _process(delta):
	position += direccion * _velocidad * delta
		
	if position.x < -1000 or position.x > 3000 or position.y < -1000 or position.y > 3000:
		queue_free()
func _on_area_entered(area):
	if area.has_method("_recibir_danio") and not area is JugadorFinal:	
		area._recibir_danio(1)
		queue_free()
			
