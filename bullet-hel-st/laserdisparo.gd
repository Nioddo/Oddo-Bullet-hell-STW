extends Area2D
class_name Laser
	
var _velocidad:float = 600.0
	
func _process(delta):
	
	position.x += _velocidad * delta
	
	if position.x > 2000:
		queue_free()
