extends Node

var AudioDict = []

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioDict.append($StormAudio)
	AudioDict.append($HeartbeatAudio)
	AudioDict.append($AcapellaAudio)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for item in AudioDict:
		if item.playing == false:
			item.play()
