extends TextureButton

class_name Passanger

var grabbed = false

var falling = false
var fallVel = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var data: PassangerData

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_dt):
	if grabbed:
		position = get_global_mouse_position() - size/2
	elif position.y < 600:
		falling = true
	else:
		falling = false

	if falling:
		fallVel += 2000 * _dt
		position.y += fallVel * _dt
	else:
		fallVel = 0

func Grabbed():
	grabbed = true

func Dropped():
	Train.ins.TryDrop(self)
	grabbed = false
