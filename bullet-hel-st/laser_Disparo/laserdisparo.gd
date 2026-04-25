extends Area2D
class_name Laser
	
var _velocidad:float = 600.0
	
func _process(delta):
			
	position += Vector2(cos(rotation), sin(rotation)) * _velocidad * delta	
			
	if position.x < -500 or position.x > 2000 or position.y < -500 or position.y > 1500:	
		queue_free()	
			
func _on_area_entered(area):
	if area.has_method("_recibir_danio"):
		area._recibir_danio(1)
		queue_free()	
					
