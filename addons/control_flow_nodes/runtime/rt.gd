@icon("../img/runtime.png")
## calls frequently the step method of all children
class_name Rt extends Node

@export var repeat := true
@export var running := true

func _process(delta):
	if not running:
		return
	step()

func step():
	for c in get_children():
		var s = c.step()
		if repeat:
			match s:
				c.State.SUCCESS:
					c.reset()
				c.State.FAILURE:
					c.reset()
