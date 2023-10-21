@icon("../img/mobius_strip.png")
class_name Always extends Cfn



@export var default_state := State.RUNNING

func activate():
	if not active:
		active = true
		_state = default_state
		started.emit(self)
