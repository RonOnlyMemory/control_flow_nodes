@icon("../img/wait.png")
class_name Wait extends Task



@export var duration := 0.0
var time := 0.0

func update():
	if time <= duration:
		state = State.RUNNING
	else:
		state = State.SUCCESS

func _process(delta):
	if is_running:
		time += delta

func reset():
	super.reset()
	time = 0.0
