extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocidade = 150
var rotacao = 0
var vida = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_process(true)
	rotacao = rand_range(-3, 3)
	add_to_group(game.GRUPO_INIMIGO)
	pass # Replace with function body.

func _process(delta):
	set_position(get_position() + Vector2(0,1) * velocidade * delta)
	rotate(rotacao * delta)
	if get_position().y > 550:
		queue_free()
	pass

func _aplica_dano(valor):
	get_node("animacao").play("hit")
	vida -= valor
	if vida <= 0:
		set_process(false)
		set_z_index(10);
		remove_from_group(game.GRUPO_INIMIGO)
		get_node("animacao").play("morri")
		game.getCamera()._shake()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
