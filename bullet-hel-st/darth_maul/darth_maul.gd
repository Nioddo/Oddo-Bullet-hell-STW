extends Area2D
class_name DarthMaul
		
var _vida:int = 50
var _velocidad_giro:float = 1.0
var _atacando_con_giro:bool = true
		
signal vida_cambiada(nueva_vida)
var _pelea_iniciada:bool = false 
	
var _escena_espada_voladora = preload("res://espada_bala/espada_bala.tscn")
			
@onready var animacion = $AnimatedSprite2D
			
func _ready():
	animacion.play("default")
	
	$PivoteEspada.hide()	
	$PivoteEspada/EspadaHitbox/CollisionShape2D.set_deferred("disabled", true)
				
	await get_tree().create_timer(2.5).timeout	
					

		
	_pelea_iniciada = true	
	$PivoteEspada.show()	
	$PivoteEspada/EspadaHitbox/CollisionShape2D.set_deferred("disabled", false)	
				
func _process(delta):
						
	if _pelea_iniciada == true and _atacando_con_giro == true:
		$PivoteEspada.rotation += _velocidad_giro * delta
			
func _on_timer_timeout():	
			
	if _pelea_iniciada == false:	
		return		
				
	if _atacando_con_giro == true:	
					
		_atacando_con_giro = false	
				
		$PivoteEspada.hide() 		
		$PivoteEspada/EspadaHitbox/CollisionShape2D.set_deferred("disabled", true) 	
						
		var jugador = get_parent().get_node_or_null("jugador_final")
		
		if jugador != null:			
			for i in range(3):	
						
				var nueva_espada = _escena_espada_voladora.instantiate()	
				nueva_espada.global_position = global_position	
							
				nueva_espada.direccion = (jugador.global_position - global_position).normalized()
				get_parent().add_child(nueva_espada)		
							
				await get_tree().create_timer(0.4).timeout
					
	else:			
		_atacando_con_giro = true
						
		$PivoteEspada.show()			
		$PivoteEspada/EspadaHitbox/CollisionShape2D.set_deferred("disabled", false)		
	
		$PivoteEspada.rotation = 0
					
func _on_espada_hitbox_body_entered(body):
	if body is JugadorFinal:
		if body.has_method("_recibir_danio"):
			body._recibir_danio(10) 
					
func _recibir_danio(cantidad:int):
	_vida -= cantidad
			
	vida_cambiada.emit(_vida)
	if _vida <= 0:		
		get_tree().change_scene_to_file("res://victoria_menu/victoria.tscn")		
		queue_free()
			
		
