@icon("../img/condition.png")
class_name Cfn extends Node

signal started()
signal updated(node)
signal finished()
signal reseted()

enum State {
	RUNNING,
	SUCCESS,
	FAILURE
}

var _state := State.RUNNING

var state: State:
	get:
		if active and _state == State.RUNNING:
			update()
		return _state
	set(a):
		activate()
		if not (_state == State.SUCCESS or _state == State.FAILURE) and (a == State.SUCCESS or a == State.FAILURE):
			finished.emit()
		_state = a

var active := false
func activate():
	if not active:
		active = true
		_state = State.RUNNING
		started.emit()

var is_running: bool:
	get:
		return state == State.RUNNING

var is_success: bool:
	get:
		return state == State.SUCCESS

var is_failure: bool:
	get:
		return state == State.FAILURE

var is_finished: bool:
	get:
		return state == State.SUCCESS or state == State.FAILURE

func update():
	updated.emit(self)

func reset():
	active = false
	for c in get_children():
		c.reset()
	reseted.emit(self)

var current: Cfn:
	get:
		for c in get_children():
			if c.active or c.is_running:
				var a = c.current
				return a
		if not is_running:
			return null
		return self

func step() -> State:
	activate()
	return state
