extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var shake = 0
var velocidade = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	set_offset(get_offset() + Vector2(0, -1) * velocidade * delta)
	
	if shake > 0:
		set_position(Vector2(cos(rad2deg(shake)), sin(rad2deg(shake))) * rand_range(2, 5))
		shake -= delta
	else:
		set_position(Vector2(0,0))
	pass

func _shake():
	shake = rand_range(0.3, 0.7)
	pass