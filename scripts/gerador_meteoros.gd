extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pre_meteoro = preload("res://scenes/meteoro.tscn")
var intervalo = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.
func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(0.5, 5)
		var meteoro = pre_meteoro.instance()
		meteoro.set_position(Vector2(rand_range(30, 610), -40))	
		get_owner().add_child(meteoro)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
