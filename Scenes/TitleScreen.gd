extends Node2D

@onready var http_request = $HTTPRequest
@onready var heartbeat_audio = $HeartbeatAudio
@onready var acapella_audio = $AcapellaAudio

@export var game_stats: GameStats

# Called when the node enters the scene tree for the first time.
func _ready():
	http_request.request("https://quantum-arcade.com/php/api.php")
	heartbeat_audio.play()
	acapella_audio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

func _on_request_completed(result, response_code, headers, body):
	var userId = body.get_string_from_utf8()
	if (userId != null):
		game_stats.userId = userId
