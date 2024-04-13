extends Node2D

@export var game_stats: GameStats

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component = $SpawnerComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func handle_spawn(ally_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = ally_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), 240))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate)
