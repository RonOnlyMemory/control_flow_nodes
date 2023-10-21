@icon("../img/loop.png")
class_name Loop extends Cfn



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
	state = State.RUNNING
	for c in get_sequence():
		match c.step():
			State.RUNNING:
				if not concurrently:
					return
			State.SUCCESS:
				if not all:
					reset()
					return
			State.FAILURE:
				if all:
					reset()
					return

func finish():
	state = State.SUCCESS
