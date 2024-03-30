extends Node

var ambiance = []
var elapsedTime = 110.0
var twoMinuteMarker = 120
var thirtySecondTimer = 30
var isEnemyMad = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ambiance.append($GameAmbiance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for item in ambiance:
		if !item.playing:
			item.play()
