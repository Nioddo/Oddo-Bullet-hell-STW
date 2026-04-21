extends Area2D
class_name Jefe
	
var _escena_tropa = preload("res://tropa/tropa.tscn")
	
var _vida:int = 30 
var _fase_actual:int = 1
var _formacion_creada:bool = false
var _enemigos_activos:int = 0
	
func _on_timer_timeout():
	if _fase_actual == 1:
		_gestionar_fase_uno()
			
				
func _gestionar_fase_uno():
	if not _formacion_creada:
				
		_crear_formacion_tropas()
		_formacion_creada = true
				
	elif _enemigos_activos <= 0:
		_fase_actual = 2
	
func _crear_formacion_tropas():
	var posiciones_destino = [
		Vector2(950, 150),	
		Vector2(950, 300),		
		Vector2(950, 450),	
		Vector2(950, 600)		
	]	
				
					
	for pos in posiciones_destino:	
		var nueva_tropa = _escena_tropa.instantiate()	
		nueva_tropa.global_position = $spawn.global_position	
		nueva_tropa.posicion_destino = pos		
		nueva_tropa.destruida.connect(_on_enemigo_destruido)				
				
		get_parent().add_child(nueva_tropa)	
		_enemigos_activos += 1	
				
func _on_enemigo_destruido():
	_enemigos_activos -= 1		
			
func _recibir_danio(cantidad:int):	
	if _fase_actual > 1:	
		_vida -= cantidad	
		if _vida <= 0:	
			queue_free()	
