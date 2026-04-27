extends Area2D
class_name Jefe
	
var _escena_tropa = preload("res://tropa/tropa.tscn")
var _escena_nodriza = preload("res://nodriza/nodriza.tscn")
var _escena_laser_jefe = preload("res://laser_estrella_muerte/laser_estrella_muerte.tscn")
var _escena_nave_inmortal = preload("res://tropa_inmortal/tropa-inmortal.tscn")
		
			
var _inmortal_creada:bool = false			
var _fase_actual:int = 1
var _formacion_creada:bool = false			
var _enemigos_activos:int = 0		
var _nodrizas_creadas:bool = false		
var _rotacion_espiral:float = 0.0
var _tiempo_sobrevivido:int = 0
			
func _on_timer_timeout():
	if _fase_actual == 1:
		_gestionar_fase_uno()
					
	elif _fase_actual == 2:
		_gestionar_fase_dos()
				
	elif _fase_actual == 3:
		_gestionar_fase_tres()
				
func _gestionar_fase_uno():
	if not _formacion_creada:
		_crear_formacion_tropas()
		_formacion_creada = true	
						
	elif _enemigos_activos <= 0:
		_fase_actual = 2
				
func _gestionar_fase_dos():
	if not _nodrizas_creadas:
		_crear_nodrizas()
		_nodrizas_creadas = true
						
	elif _enemigos_activos <= 0:
		_fase_actual = 3
					
func _crear_formacion_tropas():
	var posiciones_destino = [
		Vector2(850, 150),
		Vector2(850, 300),
		Vector2(850, 450),
		Vector2(850, 600),
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
						
func _crear_nodrizas():
	var posiciones_destino = [
		Vector2(700, 200),
		Vector2(700, 500)
	]				
						
	for i in range(posiciones_destino.size()):	
		var nueva_nodriza = _escena_nodriza.instantiate()	
			
		nueva_nodriza.global_position = Vector2(1400, posiciones_destino[i].y)	
		nueva_nodriza.posicion_destino = posiciones_destino[i]
							
		nueva_nodriza.get_node("Timer").wait_time = 3.0 + (i * 1.5)	
								
		nueva_nodriza.destruida.connect(_on_enemigo_destruido)	
		get_parent().add_child(nueva_nodriza)		
		_enemigos_activos += 1	
					
					
						
								
func _on_enemigo_destruido():	
	_enemigos_activos -= 1		
				
func _gestionar_fase_tres():
	get_tree().call_group("misiles_nodriza", "queue_free")
	if not _inmortal_creada:
		_crear_nave_inmortal_central()
		_inmortal_creada = true
				
		
	if $Timer.wait_time > 0.2:
		$Timer.wait_time = 0.08
					
	for i in range(4):
		var angulo = _rotacion_espiral + (i * (PI / 2.0))	
		var nuevo_laser = _escena_laser_jefe.instantiate()		
				
		nuevo_laser.z_index = -1
				
		nuevo_laser.global_position = $spawn.global_position
		nuevo_laser.direccion = Vector2(cos(angulo), sin(angulo))			
		nuevo_laser.rotation = angulo	
						
		get_parent().add_child(nuevo_laser)		
					
	_rotacion_espiral += 0.25		
			
	_tiempo_sobrevivido += 1		
	if _tiempo_sobrevivido == 300:
		$Timer.stop() 
		await get_tree().create_timer(3.0).timeout 
		get_tree().change_scene_to_file("res://nivel_final/nivel_boss.tscn")
					
					
		
func _crear_nave_inmortal_central():	
	var nueva_inmortal = _escena_nave_inmortal.instantiate()	
					
	nueva_inmortal.global_position = Vector2(1400, 375)	
	nueva_inmortal.posicion_destino = Vector2(850, 375)	
					
	get_parent().add_child(nueva_inmortal)
					
							
								
