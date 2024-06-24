extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_dt):
	var screenSize = get_viewport_rect().size
	var mousePos = get_global_mouse_position() - position + screenSize / 2

	if mousePos.x < screenSize.x / 8:
		if position.x > screenSize.x / 2:
			var distanceToEdge = 1 - (mousePos.x / (screenSize.x / 8))
			position.x -= 2000 * _dt * distanceToEdge
		else:
			position.x = screenSize.x / 2
	elif mousePos.x > screenSize.x - (screenSize.x / 8):
		if position.x < (screenSize.x / 2) + Game.ins.levelSize: 
			var distanceToEdge = 1 - ((screenSize.x - mousePos.x) / (screenSize.x / 8))
			position.x += 2000 * _dt * distanceToEdge
		else:
			position.x = (screenSize.x / 2) + Game.ins.levelSize