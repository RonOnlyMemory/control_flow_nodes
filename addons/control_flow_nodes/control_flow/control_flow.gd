@icon("../img/control_flow.png")
class_name ControlFlow extends Cfn

## oposite of any
@export var all := true
## oposite of sequencial
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
	var res := State.RUNNING
	if all:
		res = _success()
	else:
		res = _failure()
	for c in get_sequence():
		match c.step():
			State.RUNNING:
				res = State.RUNNING
				if not concurrently:
					return
			State.SUCCESS:
				if not all:
					state = _success()
					return
			State.FAILURE:
				if all:
					state = _failure()
					return
	state = res
