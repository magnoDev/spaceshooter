extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocidade = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	set_position(get_position() + Vector2(0,-1) * velocidade * delta)
	
	if get_position().y < -30:
		queue_free()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
