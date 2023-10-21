@icon("../img/any.png")
class_name Any extends Cfn

@export var concurrently := false
@export var invert_result := false

func _success() -> State:
	if not invert_result:
		return State.SUCCESS
	else:
		return State.FAILURE

func _failure() -> State:
	if not invert_result:
		return State.FAILURE
	else:
		return State.SUCCESS

func get_sequence():
	return get_children()

func update():
	super.update()
	var res := _failure()
	for c in get_sequence():
		match c.step():
			State.RUNNING:
				res = State.RUNNING
				if not concurrently:
					return
			State.SUCCESS:
				state = _success()
				return
	state = res
