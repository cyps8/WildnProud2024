extends Node2D

class_name Train

static var ins: Train

func _init():
	ins = self

@export var carriageScene: PackedScene

@export var tempLoadCarriages: Array[Carriage]

var carriages: Array[Node]

var carriagesData: Array[Carriage]

var currentCarriage = 0

func _ready():
	LoadCarriages()

func LoadCarriages():
	for carriage in tempLoadCarriages:
		AddCarriage(carriage)

func AddCarriage(carriage: Carriage):
	var newCarriage = carriageScene.instantiate()
	carriages.append(newCarriage)
	add_child(newCarriage)
	newCarriage.position = Vector2(650, 0) * carriages.size()

	carriagesData.append(carriage)

	newCarriage.mouse_entered.connect(MouseHoverCarriage.bind(carriages.size()))
	newCarriage.mouse_exited.connect(MouseExitCarriage)

func MouseHoverCarriage(num: int):
	currentCarriage = num

func MouseExitCarriage():
	currentCarriage = 0

func TryDrop(passenger: Passanger):
	if currentCarriage != 0:
		if carriagesData[currentCarriage - 1].type == passenger.data.solution:
			passenger.queue_free()
