extends CharacterBody2D
class_name JugadorFinal
		
var _velocidad:float = 450.0
var _vida:int = 10
var _escena_laser = preload("res://laser_jugador_final/laser_jugador_final.tscn")
var _puede_disparar:bool = true
signal vida_cambiada(nueva_vida)
		
@onready var animacion = $Sprite2D
		
			
func _ready() -> void:
	animacion.play("default")
func _physics_process(_delta):
				
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * _velocidad		
	move_and_slide()	
				
	$pistola.look_at(get_global_mouse_position())	
			
	if Input.is_action_pressed("click_izquierdo") and _puede_disparar:
		_disparar()		
				
func _disparar():	
	_puede_disparar = false
	var laser = _escena_laser.instantiate()	
					
	laser.global_position = $pistola/PuntaArma.global_position	
	laser.direccion = Vector2(cos($pistola.rotation), sin($pistola.rotation))	
	laser.rotation = $pistola.rotation		
				
	get_parent().add_child(laser)		
					
	await get_tree().create_timer(0.2).timeout
	_puede_disparar = true	
					
func _recibir_danio(cant):
	_vida -= cant
	vida_cambiada.emit(_vida)
	print("Vida restante: ", _vida) 		
	if _vida <= 0:
		get_tree().change_scene_to_file("res://game_over/game_over.tscn")
