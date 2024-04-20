class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_speed: int
@export var player_sprite: AnimatedSprite2D


func _ready():
	move_speed = 75

# x axis horizontal movement
# y axis vertical movement
func _input(event: InputEvent) -> void:
	var input_axis_x = 0
	var input_axis_y = 0
	if Input.is_action_pressed("MoveLeft"):
		input_axis_x = -1
		input_axis_y = 0
		player_sprite.flip_h = true
		player_sprite.play("move")
		_move_component(input_axis_x, input_axis_y)
	elif Input.is_action_pressed("MoveRight"):
		input_axis_x = 1
		input_axis_y = 0
		player_sprite.flip_h = false
		player_sprite.play("move")
		_move_component(input_axis_x, input_axis_y)
	elif Input.is_action_pressed("MoveDown"):
		input_axis_x = 0
		input_axis_y = 1
		player_sprite.play("move")
		_move_component(input_axis_x, input_axis_y)
	elif Input.is_action_pressed("MoveUp"):
		input_axis_x = 0
		input_axis_y = -1
		player_sprite.play("move")
		_move_component(input_axis_x, input_axis_y)
	else:
		player_sprite.play("idle")
		_move_component(0, 0)

func _move_component(input_axis_x, input_axis_y) -> void:
	move_component.velocity = Vector2(input_axis_x * move_speed, input_axis_y * move_speed)
