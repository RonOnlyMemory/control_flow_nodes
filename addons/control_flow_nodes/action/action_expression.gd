class_name ActionExpression extends Action

@export var base: Node
@export_multiline var action_expression := ""

func action():
	var e = Expression.new()
	e.parse(action_expression)
	e.execute([], base)
