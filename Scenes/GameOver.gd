extends Node2D

@export var game_stats: GameStats
var url = "http://localhost/quantum-arcade/php/addScore.php"
var dict = {}

@onready var http_request = $HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	var score = calculate_score(game_stats.totalTime, game_stats.score)
	
	if (game_stats.score > game_stats.highscore):
		game_stats.highscore = game_stats.score
		
	dict = {"userID":game_stats.userID, "gameID":game_stats.gameID,"score":score}
	_make_post_request(url, dict, false)

func _make_post_request(url, data_to_send, use_ssl):
	var query = JSON.stringify(data_to_send)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, query)

func calculate_score(time: float, kill_score: int) -> int:
	var total_score = ((time * 1.15) + (kill_score * 1.5))
	return total_score

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://scenes/MainScene.tscn")
