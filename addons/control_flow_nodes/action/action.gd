@icon("../img/action.png")
class_name Action extends Cfn

func update():
	action()
	state = State.SUCCESS

func action():
	pass
