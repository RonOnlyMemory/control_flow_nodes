@icon("../img/condition.png")
class_name ConditionExpression extends Cfn

@export var base: Node
@export_multiline var until_expression := "true"
@export_multiline var success_expression := "true"

func update():
	state = State.RUNNING
	var e2 = Expression.new()
	e2.parse(until_expression)
	if not e2.execute([], base):
		return
	var e = Expression.new()
	e.parse(success_expression)
	if e.execute([], base):
		state = State.SUCCESS
	else:
		state = State.FAILURE
