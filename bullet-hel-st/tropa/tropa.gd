extends Area2D
class_name Enemigo
		
var _vida:int = 2
		
func _recibir_danio(cantidad:int):	
	_vida -= cantidad	
	print("Enemigo dañado. Vida: ", _vida)	
				
	if _vida <= 0:	
		print("Enemigo destruido.")	
		queue_free()	
