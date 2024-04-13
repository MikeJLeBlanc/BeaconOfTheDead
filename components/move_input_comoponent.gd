class_name MoveInputComponent
extends Node

var move_component: MoveComponent
var move_speed: int
var ship
var ship_flames


func _ready():
	move_component = $"../MoveComponent"
	ship = $"../Anchor/Ship"
	ship_flames = $"../Anchor/FlameSprite"
	move_speed = 75


func _input(event: InputEvent) -> void:
	var input_axis
	if Input.is_action_pressed("move_left"):
		input_axis = -1
		_move_component(input_axis)
		ship.play("bank_right")
		ship_flames.play("bank_right")
	elif Input.is_action_pressed("move_right"):
		input_axis = 1
		_move_component(input_axis)
		ship.play("bank_left")
		ship_flames.play("bank_left")
	else:
		input_axis = 0
		_move_component(input_axis)
		ship.play("level")
		ship_flames.play("level")

func _move_component(input_axis) -> void:
	move_component.velocity = Vector2(input_axis * move_speed, 0)
