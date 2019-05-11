extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocidade = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	get_node("AudioStreamPlayer").play("tiro")
	pass # Replace with function body.

func _process(delta):
	set_position(get_position() + Vector2(0,-1) * velocidade * delta)
	
	if get_position().y < -30:
		queue_free()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_tiro_area_entered(area):
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("_aplica_dano"):
			area._aplica_dano(1)
		else:
			area.queue_free()
		queue_free()
		pass
	pass # Replace with function body.
