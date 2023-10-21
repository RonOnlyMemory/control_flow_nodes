class_name Condition extends Cfn



func until() -> bool:
	return true

func success() -> bool:
	return true

func update():
	if not until():
		state = State.RUNNING
		return
	if success():
		state = State.SUCCESS
	else:
		state = State.FAILURE
