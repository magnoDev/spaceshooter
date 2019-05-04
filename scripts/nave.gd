extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pre_tiro = preload("res://scenes/tiro.tscn")

var velocidade = 350
var intervalo = .3
var ultimo_disparo = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	var direita = 0
	var esquerda = 0
	
	if Input.is_action_pressed("direita"):
		direita = 1
	
	if Input.is_action_pressed("esquerda"):
		esquerda = -1
	
	if get_position().x > (640-45):
		direita = 0
	
	if get_position().x < 45:
		esquerda = 0
	
	set_position(get_position() + Vector2(1, 0) * velocidade * delta * (direita + esquerda))
	
	if Input.is_action_pressed("tiro"):
		if ultimo_disparo <= 0:
			
			disparo(get_node("pos_canhao_esquerdo"))
			disparo(get_node("pos_canhao_direito"))
			
			ultimo_disparo = intervalo
		pass
	
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	pass

func disparo(node):
	var tiro = pre_tiro.instance()
	tiro.set_global_position (node. get_global_position())
	get_owner().add_child(tiro)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
