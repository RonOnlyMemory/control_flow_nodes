class_name RandomOrderControlFlow extends ControlFlow


@onready var sequence := get_children()

var was_init := false

func get_sequence():
	if not was_init:
		sequence = get_children()
		was_init = true
		sequence.shuffle()
	return sequence

func reset():
	super.reset()
	was_init = false
